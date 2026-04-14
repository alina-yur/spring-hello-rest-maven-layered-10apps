#!/usr/bin/env bash

LANGUAGES=(
  english
  french
  german
  spanish
  italian
  japanese
  ukrainian
  portuguese
  korean
  swiss
)

HELLO_CLASSES=(
  HelloEnglish
  HelloFrench
  HelloGerman
  HelloSpanish
  HelloItalian
  HelloJapanese
  HelloUkrainian
  HelloPortuguese
  HelloKorean
  HelloSwiss
)

IMAGE_NAMES=(
  hello-english
  hello-french
  hello-german
  hello-spanish
  hello-italian
  hello-japanese
  hello-ukrainian
  hello-portuguese
  hello-korean
  hello-swiss
)

PORTS=(8080 8081 8082 8083 8084 8085 8086 8087 8088 8089)
REFERENCE_BASE_TARGET="/home/opc/demo-central/spring-io-2026/spring-hello-rest-maven-layered-upstream-exp/base-layer/target"

app_index() {
    local app="$1"
    local i
    for i in "${!LANGUAGES[@]}"; do
        if [[ "${LANGUAGES[$i]}" == "$app" ]]; then
            echo "$i"
            return 0
        fi
    done

    echo "Unsupported APP=$app" >&2
    echo "Supported values: ${LANGUAGES[*]}" >&2
    return 1
}

hello_class_for_app() {
    local index
    index="$(app_index "$1")" || return 1
    echo "${HELLO_CLASSES[$index]}"
}

image_name_for_app() {
    local index
    index="$(app_index "$1")" || return 1
    echo "${IMAGE_NAMES[$index]}"
}

port_for_app() {
    local index
    index="$(app_index "$1")" || return 1
    echo "${PORTS[$index]}"
}

ensure_base_layer_target() {
    local root="$1"
    local local_target="$root/base-layer/target"

    if [[ -f "$local_target/base-layer.nil" && -f "$local_target/libjavabaselayer.so" ]]; then
        return 0
    fi

    if [[ ! -f "$REFERENCE_BASE_TARGET/base-layer.nil" || ! -f "$REFERENCE_BASE_TARGET/libjavabaselayer.so" ]]; then
        echo "Missing reference base-layer artifacts in $REFERENCE_BASE_TARGET" >&2
        return 1
    fi

    rm -rf "$local_target"
    ln -s "$REFERENCE_BASE_TARGET" "$local_target"
}
