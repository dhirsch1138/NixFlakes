rm ./helios/hardware-configuration.nix
rm ./helios/cryptDevices.nix
cp /etc/nixos/hardware-configuration.nix ./helios/hardware-configuration.nix
touch ./helios/cryptDevices.nix
echo { config, pkgs, ... }: >> ./helios/cryptDevices.nix
echo { >> ./helios/cryptDevices.nix
cat /etc/nixos/configuration.nix | grep boot.initrd.luks.devices >> ./helios/cryptDevices.nix
echo } >> ./helios/cryptDevices.nix
