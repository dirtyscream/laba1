#!/bin/bash
set -e

SRC_DIR="/Users/danil/program/laba1/laba1-trtpo/src/demo"
TEST_DIR="/Users/danil/program/laba1/laba1-trtpo/src/test"
OUT_DIR="out"
MAIN_CLASS="demo.parallel.Main"

JAVAFX_LIB="/Users/danil/program/laba1/javafx-sdk-24.0.2/lib"
JUNIT_JAR="/Users/danil/program/laba1/junit-platform-console-standalone-1.10.2.jar"

MODE=$1

if [[ -z "$MODE" ]]; then
  echo "Использование: $0 [run|test]"
  exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

echo ">>> Компиляция..."
javac \
  --module-path "$JAVAFX_LIB" \
  --add-modules javafx.controls,javafx.fxml \
  -d "$OUT_DIR" \
  $(find "$SRC_DIR" -name "*.java")

cp "$SRC_DIR/parallel/controlPane.css"  "$OUT_DIR/demo/parallel/controlPane.css" 


if [[ "$MODE" == "run" ]]; then
  echo ">>> Запуск..."
  java \
    --module-path "$JAVAFX_LIB" \
    --add-modules javafx.controls,javafx.fxml \
    -cp "$OUT_DIR" \
    "$MAIN_CLASS"

elif [[ "$MODE" == "test" ]]; then
  echo ">>> Компиляция тестов..." 
  javac -cp "$OUT_DIR:$JUNIT_JAR" -d "$OUT_DIR" $(find "$TEST_DIR" -name "*.java")

  echo ">>> Запуск JUnit тестов..."
  java -jar "$JUNIT_JAR" execute --class-path "$OUT_DIR" --scan-class-path

else
  echo "Неизвестный режим: $MODE"
  echo "Использование: $0 [run|test]"
  exit 1
fi
