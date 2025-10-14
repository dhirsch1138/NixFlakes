{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "david";
  home.homeDirectory = "/home/david";

  programs.git = {
    enable = true;
    userName = "David Hirsch";
    userEmail = "dhirsch1138@gmail.com";
  };

  programs.firefox.enable = true;

  programs.fish = {
    enable = true;
    shellAliases = {
    };
  };

  # because fish is fishy (har har) it isn't POSIX compliant, meaning using it as
  # the actual shell 'may' break stuff. this is a hack to keep bash as the shell but have it
  # jump into fish for our userEmail
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  home.packages = with pkgs; [
      ffmpeg-full
      gimp-with-plugins
      kdePackages.kate
      kphotoalbum
      vorta # borgbackup
    #  thunderbird
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
