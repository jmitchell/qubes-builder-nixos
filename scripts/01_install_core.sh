#!/bin/bash -e
# vim: set ts=4 sw=4 sts=4 et :
### 01_install_core.sh : Create install of NixOS
echo "--> NixOS 01_install_core.sh"

NIXOS_PLUGIN_DIR="${NIXOS_PLUGIN_DIR:-"${SCRIPTSDIR}/.."}"

set -e
[ "$VERBOSE" -ge 2 -o "$DEBUG" -gt 0 ] && set -x

"${NIXOS_PLUGIN_DIR}/prepare-chroot-base" "$INSTALLDIR" "$DIST"
