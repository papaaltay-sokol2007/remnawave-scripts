#!/usr/bin/env bash
# Runs every suite; exits non-zero if any suite fails.
TESTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
cd "$TESTS_DIR" || exit 1
rc=0
for suite in "$TESTS_DIR"/test-*.sh; do
    "${BASH:-bash}" "$suite" || rc=1
    echo
done
if [ "$rc" -eq 0 ]; then
    printf '\033[1;32mAll suites passed\033[0m\n'
else
    printf '\033[1;31mSome suites failed\033[0m\n'
fi
exit "$rc"
