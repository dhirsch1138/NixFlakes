hs=$(hostname)
echo Hello, I am $hs
echo I need to setup some device specific files before I can do nixxy stuff.
echo
echo I will:
echo - delete the existing hardware *.nix files in ./$hs
echo -- hardware-configuration.nix
echo -- cryptDevices.nix
echo - copy the current hardware-configuration.nix from /etc/nixos to ./$hs
echo - extract the crypt device from /etc/nixos/configuration.nix and use it to build ./$hs/cryptDevices.nix
rm ./$hs/hardware-configuration.nix
rm ./$hs/cryptDevices.nix
cp /etc/nixos/hardware-configuration.nix ./$hs/hardware-configuration.nix
touch ./$hs/cryptDevices.nix
echo { config, pkgs, ... }: >> ./$hs/cryptDevices.nix
echo { >> ./$hs/cryptDevices.nix
cat /etc/nixos/configuration.nix | grep boot.initrd.luks.devices >> ./$hs/cryptDevices.nix
echo } >> ./$hs/cryptDevices.nix
