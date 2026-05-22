#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP="${APP:-english}"
BUILD_MODE="${BUILD_MODE:-if-needed}"
MEASURE_MEMORY="${MEASURE_MEMORY:-1}"
MEASURE_INTERVAL="${MEASURE_INTERVAL:-10}"

source "$ROOT/scripts/app-config.sh"
source "$ROOT/scripts/memory-lib.sh"

HELLO_CLASS="$(hello_class_for_app "$APP")"
IMAGE_NAME="$(image_name_for_app "$APP")"
DEFAULT_PORT="$(port_for_app "$APP")"
PORT="${PORT:-$DEFAULT_PORT}"
BINARY="$ROOT/spring-application-layer/target/$IMAGE_NAME"
SHARED_BASE_LAYER="$ROOT/spring-application-layer/target/libjavabaselayer.so"

build_app() {
    echo "==> Ensuring Spring base layer"
    ensure_base_layer_target "$ROOT"

    echo
    echo "==> Building app layer"
    (
        cd "$ROOT/spring-application-layer"
        ../mvnw --no-transfer-progress \
            -Pnative -Papp-layer -Phello-app \
            -DskipTests -DskipNativeTests \
            -Dhello.class="$HELLO_CLASS" \
            -Dhello.image="$IMAGE_NAME" \
            package
    )
}

case "$BUILD_MODE" in
    always)
        build_app
        ;;
    if-needed)
        if [[ ! -x "$BINARY" ]]; then
            build_app
        else
            ensure_app_shared_base_layer "$ROOT"
        fi
        ;;
    never)
        ;;
    *)
        echo "Unsupported BUILD_MODE=$BUILD_MODE (use always, if-needed, or never)" >&2
        exit 1
        ;;
esac

if [[ ! -x "$BINARY" ]]; then
    echo "Missing binary: $BINARY" >&2
    exit 1
fi

if [[ ! -f "$SHARED_BASE_LAYER" ]]; then
    echo "Missing shared base layer: $SHARED_BASE_LAYER" >&2
    exit 1
fi

app_pid=""
CLEANED_UP=0

cleanup() {
    if [[ "$CLEANED_UP" -eq 1 ]]; then
        return
    fi
    CLEANED_UP=1

    if [[ -n "$app_pid" ]] && kill -0 "$app_pid" 2>/dev/null; then
        kill "$app_pid" 2>/dev/null || true
        wait "$app_pid" 2>/dev/null || true
    fi
}

handle_int() {
    cleanup
    exit 130
}

handle_term() {
    cleanup
    exit 143
}

trap cleanup EXIT
trap handle_int INT
trap handle_term TERM

echo
echo "==> Starting $IMAGE_NAME on port $PORT"
echo "==> Try: curl http://127.0.0.1:$PORT/hello/$APP"
"$BINARY" --server.port="$PORT" &
app_pid=$!

if [[ "$MEASURE_MEMORY" == "1" ]]; then
    echo
    echo "==> RSS/USS/PSS measurements every ${MEASURE_INTERVAL}s"
    monitor_process_tree "$IMAGE_NAME" "$app_pid" "$MEASURE_INTERVAL"
else
    wait "$app_pid"
fi
