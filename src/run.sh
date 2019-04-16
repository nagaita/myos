#!/usr/bin/env bash
set -Ceuo pipefail

cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

../z_tools/nask.exe helloos.nas helloos.img && qemu-system-i386 -drive file=helloos.img,format=raw,index=0,media=disk

exit 0
