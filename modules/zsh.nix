{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.cranchan = {
    shell = pkgs.zsh;
  };

  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.cranchan = {    
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
      };    

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      initExtra = ''
        source ${../assets/p10k.zsh}
      '';
    };

    home.file.".p10k.zsh".source = ../assets/p10k.zsh;
  };
}
