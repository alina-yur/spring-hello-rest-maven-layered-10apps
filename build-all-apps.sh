#!/usr/bin/env bash

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$ROOT/scripts/app-config.sh"

echo "==> Reusing reference base layer"
ensure_base_layer_target "$ROOT"

for app in "${LANGUAGES[@]}"; do
    hello_class="$(hello_class_for_app "$app")"
    image_name="$(image_name_for_app "$app")"

    echo
    echo "==> Building $image_name"
    (
        cd "$ROOT/spring-application-layer"
        ../mvnw --no-transfer-progress \
            -Pnative -Papp-layer -Phello-app \
            -DskipTests -DskipNativeTests \
            -Dhello.class="$hello_class" \
            -Dhello.image="$image_name" \
            package
    )
done
