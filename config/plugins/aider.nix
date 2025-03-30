{ pkgs, ... }:
let
  nvim-aider = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-aider";
    version = "2025-03-25";
    src = pkgs.fetchFromGitHub {
      owner = "GeorgesAlkhouri";
      repo = "nvim-aider";
      rev = "7604b46dc02b5f74cddac13d3922ee89dda69ba1";
      hash = "sha256-zdFaY/ikdFA7jxuCkN++PAOsVt1S8TgTs+FWdrRw3+o=";
    };
  };
in
{
  extraPlugins = [ nvim-aider ];

  extraConfigLua =
    # lua
    ''
      require("nvim_aider").setup({
        args = {
          "--analytics-disable",
          "--architect",
          "--model=gemini-2.5-pro",
          "--pretty",
          "--stream",
        },
      })
    '';
}
