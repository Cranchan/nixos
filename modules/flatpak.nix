{ ... }:

{
  services.flatpak = {
    enable = true;
    update.auto.enable = true;
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];
    packages = [
      "io.github.swordpuffin.rewaita"
      "io.github.swordpuffin.wardrobe"
      "org.mozilla.firefox"
      "dev.vencord.Vesktop"
      "com.spotify.Client"
      "org.gimp.GIMP"
      "org.libreoffice.LibreOffice"
      "org.prismlauncher.PrismLauncher"
      "com.adamcake.Bolt"
    ];
    overrides = {
      "com.spotify.Client".Context.sockets = [ "x11" "!wayland" "!fallback-x11" ];
    };
  };
}
