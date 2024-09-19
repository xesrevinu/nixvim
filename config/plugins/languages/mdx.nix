{
  extraFiles = {
    "after/queries/markdown/injections.scm" = builtins.readFile ./queries/markdown/injections.scm;
    "after/queries/markdown/highlights.scm" = builtins.readFile ./queries/markdown/highlights.scm;
    "after/queries/markdown/textobjects.scm" = builtins.readFile ./queries/markdown/textobjects.scm;
  };

  filetype = {
    extension = {
      mdx = "mdx";
    };
  };

  plugins.treesitter.languageRegister = {
    "markdown" = "mdx";
  };
}
