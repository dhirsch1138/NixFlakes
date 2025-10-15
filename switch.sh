hs=$(hostname)
nix-shell -p banner lolcat --run "banner NIX Switch! | lolcat"
echo Sleeping for 10 seconds, Control+C to abort.
sleep 10
echo ---------
echo Performing full system switch for $hs using its flake
echo ---------
sudo nixos-rebuild switch --flake ./#$hs
