{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.xserver.xkb.uz-enhanced;
in {
  options.services.xserver.xkb.uz-enhanced = {
    enable = mkEnableOption "Enhanced uzbek keyboard layout";

    layout = mkOption {
      type = types.str;
      default = "uz,us";
      description = "Uzbek";
    };
  };

  config = mkIf cfg.enable {
    services.xserver.xkb.extraLayouts = {
      uz = {
        description = "Uzbek";
        languages = ["uzb"];
        symbolsFile = ./uz;
      };
      uz-latin = {
        description = "Uzbek (Latin)";
        languages = ["uzb"];
        symbolsFile = ./uz_latin;
      };
      uz-us = {
        description = "Uzbek (US)";
        languages = ["uzb"];
        symbolsFile = ./uz_us;
      };
      uz-2023 = {
        description = "Uzbek (2023)";
        languages = ["uzb"];
        symbolsFile = ./uz_2023;
      };
      uz-cyrillic = {
        description = "Uzbek (Cyrillic)";
        languages = ["uzb"];
        symbolsFile = ./uz_cyrillic;
      };
    };

    services.xserver.xkb.layout = cfg.layout;
  };
}
