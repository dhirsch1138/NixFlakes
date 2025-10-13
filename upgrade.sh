workingCd=$(pwd)
hs=$(hostname)
# this might need to change depending on implementation
nixflakepath=~/nixos
cd $nixflakepath
echo upgrading $hs as flake
sudo nixos-rebuild switch --flake $nixflakepath#$hs
cd $workingCd
