# Spring Native Layers Demo

This repository demonstrates a layered GraalVM native build for Spring Boot. A shared native base layer is built once in `base-layer/`, then reused by 10 small Spring application binaries in `spring-application-layer/`.

The main native artifacts are:

- `base-layer/target/base-layer.nil`
- `base-layer/target/libjavabaselayer.so`
- `spring-application-layer/target/hello-*`

Each native app exposes:

- `/`
- `/hello/<language>`

Supported languages are `english`, `french`, `german`, `spanish`, `italian`, `japanese`, `ukrainian`, `portuguese`, `korean`, and `swiss`.

## Prerequisites

- Linux
- GraalVM 25.x with Native Image available in `JAVA_HOME`
- `curl`

Set `JAVA_HOME` before building:

```bash
export JAVA_HOME=/path/to/graalvm
./mvnw -version
"$JAVA_HOME/bin/native-image" --version
```

`base-layer/pom.xml` reads `native-image-base.jar` from `$JAVA_HOME/lib/svm/builder`, so a standard JDK is not enough.

The helper scripts also read RSS, USS, and PSS from `/proc`, so they are intended for Linux hosts.

## Build The Shared Native Base Layer

Build the base layer first if you want the repo to be self-contained:

```bash
cd base-layer
../mvnw --no-transfer-progress \
  -DskipTests -DskipNativeTests \
  install
```

This produces:

- `base-layer/target/base-layer.nil`
- `base-layer/target/libjavabaselayer.so`

`spring-application-layer` uses `base-layer.nil` at build time and `libjavabaselayer.so` at runtime.

## Build One Layered Native App

Example: build the English app.

```bash
cd spring-application-layer
../mvnw --no-transfer-progress \
  -Pnative -Papp-layer -Phello-app \
  -DskipTests -DskipNativeTests \
  -Dhello.class=HelloEnglish \
  -Dhello.image=hello-english \
  package
```

This produces:

- `spring-application-layer/target/hello-english`
- `spring-application-layer/target/libjavabaselayer.so`

## Build All Layered Native Apps

From the repository root:

```bash
./build-all-apps.sh
```

This loops through all 10 language variants and writes the binaries into `spring-application-layer/target/`.

## Run One Native App

Run the binary directly:

```bash
cd spring-application-layer
./target/hello-english --server.port=8080
```

In another shell:

```bash
curl http://127.0.0.1:8080/
curl http://127.0.0.1:8080/hello/english
```

You can also use the helper script from the repository root:

```bash
./run.sh
APP=japanese ./run.sh
APP=swiss PORT=8090 ./run.sh
```

`run.sh` defaults to:

- `APP=english`
- `BUILD_MODE=if-needed`
- `MEASURE_MEMORY=1`
- `MEASURE_INTERVAL=10`

Set `BUILD_MODE=always` to force a rebuild before launch, or `BUILD_MODE=never` to skip building and only run an existing binary.

## Run All Native Apps

From the repository root:

```bash
./run-all.sh
```

This starts all 10 native binaries on ports `8080` through `8089`, waits for each `/hello/<language>` endpoint to respond, and then prints live RSS/USS/PSS totals while they run.

## Repo Layout

- `base-layer/`: shared native base layer definition and `LayerCreate` configuration
- `spring-application-layer/`: Spring Boot application binaries built with `LayerUse=../base-layer/target/base-layer.nil`
- `scripts/`: app name mapping, default ports, and memory-reporting helpers

## Notes

- The layered native path above is the main workflow for this repository.
- A `standalone` native profile still exists in `spring-application-layer/pom.xml`, but it is secondary to the layered build flow.
- Some helper logic can fall back to a machine-specific reference base layer from `scripts/app-config.sh` if `base-layer/target/` is missing. Building `base-layer` locally avoids that dependency.
