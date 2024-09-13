{
  plugins.lspkind = {
    enable = true;

    cmp = {
      enable = true;
      maxWidth = 50;
      ellipsisChar = "...";
      menu = {
        nvim_lsp = "[Lsp]";
        buffer = "[Buffer]";
        path = "[Path]";
        luasnip = "[LuaSnip]";
      };
    };
  };
}
