{ config, pkgs, ... }:

{
  # ZSH configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };    
  };

  # Initialize zsh as shell
  users.users.cranchan = {
    shell = pkgs.zsh;
  };
}
