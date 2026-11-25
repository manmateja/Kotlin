#!/bin/sh
set -eu

if command -v gradle >/dev/null 2>&1; then
    exec gradle "$@"
fi

for gradle_home in "${GRADLE_HOME:-}" "${HOME:-}/.sdkman/candidates/gradle/current" "/usr/local/opt/gradle/libexec"; do
    if [ -n "$gradle_home" ] && [ -x "$gradle_home/bin/gradle" ]; then
        exec "$gradle_home/bin/gradle" "$@"
    fi
done

if [ -x "/usr/local/bin/gradle" ]; then
    exec "/usr/local/bin/gradle" "$@"
fi

echo "ERROR: Gradle is not installed or not on PATH. Please install Gradle or set GRADLE_HOME." >&2
exit 1
