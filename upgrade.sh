echo upgrading $(hostname) as flake
sudo nixos-rebuild switch --flake ./#$(hostname)
