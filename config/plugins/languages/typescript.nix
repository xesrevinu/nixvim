{
  plugins.lsp.servers = {
    biome = {
      enable = true;
      rootDir =
        # lua
        ''
          function() 
            return require("lspconfig.util").root_pattern("biome.json")
          end
        '';
      settings.extraConfig = {
        single_file_support = false;
      };
    };

    eslint = {
      enable = true;
    };

    ts_ls = {
      enable = true;
      settings = {
        maxTsServerMemory = 12288;
        typescript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
            includeInlayVariableTypeHintsWhenTypeMatchesName = true;
          };
        };
        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true;
            includeInlayFunctionLikeReturnTypeHints = true;
            includeInlayFunctionParameterTypeHints = true;
            includeInlayParameterNameHints = "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true;
            includeInlayPropertyDeclarationTypeHints = true;
            includeInlayVariableTypeHints = true;
            includeInlayVariableTypeHintsWhenTypeMatchesName = true;
          };
        };
      };
    };
  };
}
