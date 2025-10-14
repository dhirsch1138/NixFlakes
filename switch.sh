hs=$(hostname)
echo upgrading $hs as flake
sudo nixos-rebuild switch --flake ./#$hs
