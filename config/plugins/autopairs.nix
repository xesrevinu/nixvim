{
  plugins.nvim-autopairs = {
    enable = true;
  };

  extraConfigLua =
    # lua
    ''
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    '';
}
