{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        autopairs.enable = true;
        indent.enable = true;
        highlight.enable = true;
        incremental_selection.enable = true;
        auto_install = true;
        ensure_installed = [
          "bash"
          "c"
          "html"
          "css"
          "javascript"
          "jsdoc"
          "json"
          "lua"
          "luadoc"
          "luap"
          "nix"
          "rust"
          "java"
          "markdown"
          "markdown_inline"
          "python"
          "query"
          "regex"
          "tsx"
          "typescript"
          "vim"
          "vimdoc"
          "toml"
          "yaml"
        ];
      };
    };

    ts-autotag = {
      enable = true;
    };

    ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ii" = "@conditional.inner";
          "ai" = "@conditional.outer";
          "il" = "@loop.inner";
          "al" = "@loop.outer";
          "at" = "@comment.outer";
        };
      };
      move = {
        enable = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };
    };
  };
}
