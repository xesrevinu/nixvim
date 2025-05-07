{ config, lib, ... }:
{
  plugins.lsp.servers = {
    biome = {
      enable = true;
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

  plugins.lsp-format = lib.mkIf config.plugins.lsp-format.enable {
    settings = {
      typescript = {
        tab_width = {
          __raw = ''
            function()
              return vim.opt.shiftwidth:get()
            end'';
        };
      };
    };
  };
}
