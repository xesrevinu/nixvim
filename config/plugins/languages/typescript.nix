{
  plugins.lsp.servers = {
    biome = {
      enable = true;
    };

    eslint = {
      enable = true;
    };

    vtsls = {
      enable = true;
      settings =
        let
          inlayHints = {
            enumMemberValues = {
              enabled = true;
            };
            functionLikeReturnTypes = {
              enabled = true;
            };
            functionParameterTypes = {
              enabled = true;
            };
            parameterNames = {
              enabled = "all";
            };
            parameterNameWhenArgumentMatchesNames = {
              enabled = true;
            };
            propertyDeclarationTypes = {
              enabled = true;
            };
            variableTypes = {
              enabled = true;
            };
            variableTypeWhenTypeMatchesNames = {
              enabled = true;
            };
          };

        in
        {
          complete_function_calls = true;
          vtsls = {
            autoUseWorkspaceTsdk = true;
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true;
              };
            };

            typescript = {
              inherit inlayHints;
              updateImportOnFileMove = {
                enabled = "always";
              };
              suggest = {
                completeFunctionCalls = true;
              };
              tsserver = {
                maxTsServerMemory = 12288;
              };
            };
            javascript = {
              inherit inlayHints;
            };
          };
        };
    };
    # ts_ls = {
    #   enable = true;
    #   settings = {
    #     maxTsServerMemory = 12288;
    #     typescript = {
    #       inlayHints = {
    #         includeInlayEnumMemberValueHints = true;
    #         includeInlayFunctionLikeReturnTypeHints = true;
    #         includeInlayFunctionParameterTypeHints = true;
    #         includeInlayParameterNameHints = "all";
    #         includeInlayParameterNameHintsWhenArgumentMatchesName = true;
    #         includeInlayPropertyDeclarationTypeHints = true;
    #         includeInlayVariableTypeHints = true;
    #         includeInlayVariableTypeHintsWhenTypeMatchesName = true;
    #       };
    #     };
    #     javascript = {
    #       inlayHints = {
    #         includeInlayEnumMemberValueHints = true;
    #         includeInlayFunctionLikeReturnTypeHints = true;
    #         includeInlayFunctionParameterTypeHints = true;
    #         includeInlayParameterNameHints = "all";
    #         includeInlayParameterNameHintsWhenArgumentMatchesName = true;
    #         includeInlayPropertyDeclarationTypeHints = true;
    #         includeInlayVariableTypeHints = true;
    #         includeInlayVariableTypeHintsWhenTypeMatchesName = true;
    #       };
    #     };
    #   };
    # };
  };
}
