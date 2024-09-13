{
  plugins.luasnip = {
    enable = true;
    fromVscode = [
      { }
      { paths = ./snippets; }
    ];
    settings = {
      # Update dynamic snippets while typing
      updateevents = "TextChanged,TextChangedI";
    };
  };
}
