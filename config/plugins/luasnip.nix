{
  plugins.luasnip = {
    enable = true;
    fromLua = [
      { }
      { paths = ./snippets; }
    ];
    settings = {
      # Update dynamic snippets while typing
      updateevents = "TextChanged,TextChangedI";
    };
  };
}
