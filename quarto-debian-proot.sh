#!/data/data/com.termux/files/usr/bin/bash
exec proot-distro login debian --work-dir "$PWD" -- quarto "$@"
