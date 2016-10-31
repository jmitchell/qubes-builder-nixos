set -e
set -x

export PATH=/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$PATH

cat <<EOF > /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

nix-env -i git
git clone https://github.com/jmitchell/nixpkgs.git /tmp/nixpkgs
cd /tmp/nixpkgs
git checkout qubes

# TODO: address `undefined variable rpm at .../qubes-gui-vm/default.nix:51:36
nix-env -f . -i qubes-utils
# TODO: install all the other qubes packages as well
