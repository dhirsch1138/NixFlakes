#ln --backup -s /etc/nixos/hardware-configuration.nix ./helios/hardware-configuration.nix
rm ./helios/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ./helios/hardware-configuration.nix
