{
  config,
  lib,
  pkgs,
  ...
}:
let
  isEnabled = config.plugins.snacks.enable && lib.hasAttr "lazygit" config.plugins.snacks.settings;
in
{
  extraPackages = with pkgs; [
    lazygit
  ];

  plugins.snacks.settings.lazygit = {
    configure = true;

    config = {
      os = {
        editPreset = "nvim-remote";
      };
      gui = {
        nerdFontsVersion = "3";
      };
    };

    win = {
      style = "lazygit";
    };
  };

  keymaps = lib.mkIf isEnabled [
    {
      mode = "n";
      key = "<leader>lg";
      action = ''<cmd>lua Snacks.lazygit.open()<cr>'';
      options = {
        desc = "Open LazyGit";
      };
    }
  ];
}
