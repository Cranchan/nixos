{ pkgs, user, ... }:

{
  programs.zsh.enable = true;

  users.users.${user}.shell = pkgs.zsh;

  environment.pathsToLink = [ "/share/zsh" ];

  home-manager.users.${user} = {
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

      initContent = ''
        source ${../assets/p10k.zsh}
      '';
    };

    home.file.".p10k.zsh".source = ../assets/p10k.zsh;

    programs.fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        logo = {};
        display = {
          separator = " ──► ";
        };
        modules = [
          {
            type = "custom";
            format = "┌─────────────────────────────── System Information ───────────────────────────────┐";
          }
          "break"
          { type = "os"; key = "{#36}󰘚 SYSTEM   {#keys}"; }
          { type = "host"; key = "{#36}󰌢 HARDWARE {#keys}"; }
          "break"
          { type = "kernel"; key = "{#32}󰔚 KERNEL   {#keys}"; }
          { type = "uptime"; key = "{#32}󱎫 UPTIME   {#keys}"; }
          { type = "packages"; key = "{#32}󰏖 PACKAGES {#keys}"; }
          "break"
          { type = "shell"; key = "{#33}󰞷 SHELL    {#keys}"; }
          { type = "terminal"; key = "{#33} TERM      {#keys}"; }
          { type = "de"; key = "{#33}󰧨 DE/WM    {#keys}"; }
          "break"
          { type = "display"; key = "{#34}󰍹 DISPLAY  {#keys}"; }
          { type = "cpu"; key = "{#34}󰻠 CPU      {#keys}"; }
          { type = "gpu"; key = "{#34}󰢮 GPU      {#keys}"; }
          "break"
          { type = "memory"; key = "{#35}󰍛 MEMORY   {#keys}"; }
          { type = "swap"; key = "{#35}󰓡 SWAP     {#keys}"; }
          { type = "disk"; key = "{#35}󰋊 DISK     {#keys}"; }
          "break"
          { type = "localip"; key = "{#31}󰩟 LOCAL IP {#keys}"; }
          { type = "battery"; key = "{#31}󰁹 BATTERY  {#keys}"; }
          "break"
          {
            type = "custom";
            format = "└──────────────────────────────────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "colors";
            symbol = "circle";
            paddingLeft = 30;
          }
        ];
      };
    };
  };
}
