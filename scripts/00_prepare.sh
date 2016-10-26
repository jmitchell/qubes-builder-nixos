#!/bin/bash -e
# vim: set ts=4 sw=4 sts=4 et :
### 00_prepare.sh : Download and extract the NixOS minimal installation ISO
echo "--> NixOS 00_prepare.sh"

NIXOS_PLUGIN_DIR="${NIXOS_PLUGIN_DIR:-"${SCRIPTSDIR}/.."}"
NIXOS_ISO="nixos-minimal-16.09.841.cadc55f-x86_64-linux.iso"
NIXOS_URL="https://d3g5gsiof5omrk.cloudfront.net/nixos/16.09/nixos-16.09.841.cadc55f/${NIXOS_ISO}"

[ "$VERBOSE" -ge 2 -o "$DEBUG" -gt 0 ] && set -x

echo "  --> Downloading NixOS ISO..."
http_proxy="$REPO_PROXY" wget -N -P "$CACHEDIR" "$NIXOS_URL"
http_proxy="$REPO_PROXY" wget -N -P "$CACHEDIR" "${NIXOS_URL}.sha256"


echo "  --> Verifying ISO..."
echo "$(cat ${CACHEDIR}/${NIXOS_ISO}.sha256)  ${CACHEDIR}/${NIXOS_ISO}" | sha256sum --check || exit
## XXX: no published gpg signature


echo "  --> Hardlinking ISO to 'nixos.iso'..."
ln "${CACHEDIR}/${NIXOS_ISO}" "${CACHEDIR}/nixos.iso"
