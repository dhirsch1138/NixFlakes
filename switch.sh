hs=$(hostname)
nix-shell -p banner --run "banner NIX Switch!"
echo Sleeping for 10 seconds, Control+C to abort.
sleep 10
echo ---------
echo Performing full system switch for $hs using its flake
echo ---------
sudo nixos-rebuild switch --flake ./#$hs
