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
      "org.gimp.GIMP"
      "org.libreoffice.LibreOffice"
      "org.prismlauncher.PrismLauncher"
      "com.adamcake.Bolt"
      "com.github.tchx84.Flatseal"
    ];
    };
  }
