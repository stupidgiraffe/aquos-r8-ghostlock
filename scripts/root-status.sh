#!/system/bin/sh
echo "== kernel =="
uname -a
echo
echo "== SELinux =="
getenforce 2>/dev/null || true
echo
echo "== KernelSU module =="
grep -i kernelsu /proc/modules 2>/dev/null || echo "No kernelsu entry visible in /proc/modules"
echo
echo "== root =="
if command -v su >/dev/null 2>&1; then
  su -c id
else
  echo "su command not found"
fi
