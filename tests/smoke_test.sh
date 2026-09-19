#!/usr/bin/env bash
# Smoke test for DK_SMPGM, added by repocurator (generation 2).
#
# The repository has no test of any kind: no test directory, no test
# framework in any CMakeLists.txt, and the previous CI step was a bare
# `echo "No tests yet."`. This is the least that can honestly be asserted
# about a project whose main() body is entirely commented out:
#
#   1. the linked executable actually starts and exits 0;
#   2. the two functions in src/Game that are NOT commented out --
#      module1_hello() and module2_hello() -- still compile against their
#      headers, link against the static libraries CMake produced, and print
#      the fixed line they have always printed.
#
# Both are real assertions: either can fail (a crash, a non-zero exit, a
# link error, or the expected text going missing), and if either does this
# script exits 1.

set -euo pipefail

BUILD_DIR="${1:-build}"

# 1. The main executable must run and exit 0.
if ! "$BUILD_DIR/Bin/V4_DK_SMPGM"; then
  status=$?
  echo "smoke test failed: $BUILD_DIR/Bin/V4_DK_SMPGM exited $status" >&2
  exit 1
fi

# 2. module1_hello() and module2_hello() must still compile, link and print
#    their fixed message. This is real project code, just never called from
#    main(); the smoke test is what actually calls it.
work="$BUILD_DIR/smoke"
mkdir -p "$work"
cat > "$work/smoke_modules.cpp" <<'EOF'
#include <module1.h>
#include <module2.h>

int main() {
    module1_hello();
    module2_hello();
    return 0;
}
EOF

g++ -std=c++11 \
  -I src/Game/module1/include -I src/Game/module2/include \
  "$work/smoke_modules.cpp" \
  "$BUILD_DIR/Lib/libmodule1.a" "$BUILD_DIR/Lib/libmodule2.a" \
  -o "$work/smoke_modules"

output="$("$work/smoke_modules")"
echo "$output"

if ! grep -q "moule1_hello" <<<"$output"; then
  echo "smoke test failed: module1_hello() did not print its expected line" >&2
  exit 1
fi
if ! grep -q "moule2_hello" <<<"$output"; then
  echo "smoke test failed: module2_hello() did not print its expected line" >&2
  exit 1
fi

echo "smoke test passed"
