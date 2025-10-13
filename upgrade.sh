hs=$(hostname)
# this might need to change depending on implementation
nixflakepath=~/nixos
echo upgrading $hs as flake
sudo nixos-rebuild switch --flake $nixflakepath#$hs
