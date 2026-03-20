#!/bin/bash
set -e

TEMP_BUILD_DIR="build_tmp_linux"
OUTPUT_DIR="Builds/LinuxBuild"

rm -rf "$TEMP_BUILD_DIR"
rm -rf "$OUTPUT_DIR"

cmake -S . -B "$TEMP_BUILD_DIR"
cmake --build "$TEMP_BUILD_DIR"

mkdir -p "$OUTPUT_DIR"

find "$TEMP_BUILD_DIR" -type f -name "test_vlastnich_lib" -exec cp {} "$OUTPUT_DIR/" \;
find "$TEMP_BUILD_DIR" -type f -name "*.so" -exec cp {} "$OUTPUT_DIR/" \;

rm -rf "$TEMP_BUILD_DIR"

echo "DONE"
echo "Output:"
ls -la "$OUTPUT_DIR"