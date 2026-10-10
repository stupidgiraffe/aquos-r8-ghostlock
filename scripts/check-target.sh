#!/system/bin/sh
set -eu

EXPECTED_MODEL="SH-R80"
EXPECTED_FINGERPRINT="SHARP/SH-R80/FaYuiry:16/SC525/04.00.00:user/release-keys"
EXPECTED_RELEASE="5.15.178-android13-8-00025-g7feb0b0b7cd8-ab14134651"
EXPECTED_BUILD="04.00.00"
EXPECTED_SPL="2026-01-01"

model="$(getprop ro.product.model)"
fingerprint="$(getprop ro.build.fingerprint)"
release="$(uname -r)"
build="$(getprop ro.build.display.id)"
spl="$(getprop ro.build.version.security_patch)"

failed=0
check_one() {
  label="$1"
  got="$2"
  expected="$3"
  if [ "$got" = "$expected" ]; then
    printf '[OK]   %s: %s\n' "$label" "$got"
  else
    printf '[FAIL] %s\n       got:      %s\n       expected: %s\n' "$label" "$got" "$expected"
    failed=1
  fi
}

check_one "model" "$model" "$EXPECTED_MODEL"
check_one "fingerprint" "$fingerprint" "$EXPECTED_FINGERPRINT"
check_one "kernel" "$release" "$EXPECTED_RELEASE"
check_one "build" "$build" "$EXPECTED_BUILD"
check_one "security patch" "$spl" "$EXPECTED_SPL"

if [ "$failed" -ne 0 ]; then
  echo
  echo "TARGET MISMATCH — do not use the bundled GhostLock profile."
  exit 1
fi

echo
echo "Exact verified SH-R80 target matched."
