{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    nodejs_24
  ];

  plugins.lsp.servers = {
    biome = {
      enable = true;
    };

    eslint = {
      enable = true;
    };
  };

  plugins.typescript-tools = {
    enable = true;
    settings = {
      separate_diagnostic_server = true;
      publish_diagnostic_on = "insert_leave";
      complete_function_calls = true;
      include_completions_with_insert_text = true;
      code_lens = "off";
      disable_member_code_lens = true;
      jsx_close_tag = {
        enable = true;
        filetypes = [
          "javascriptreact"
          "typescriptreact"
        ];
      };

      # Tsserver Settings
      tsserver_max_memory = 12288;
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = true;
        includeInlayVariableTypeHints = true;
        includeInlayVariableTypeHintsWhenTypeMatchesName = true;
        includeInlayPropertyDeclarationTypeHints = true;
        includeInlayFunctionParameterTypeHints = true;
        includeInlayEnumMemberValueHints = true;
        includeInlayFunctionLikeReturnTypeHints = true;
      };
      tsserver_format_options = {
        insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true;
        semicolons = "ignore";
      };

      # Disable auto-formatting through the Typescript LSP
      on_attach = {
        __raw =
          # lua
          ''
            function(client)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          '';
      };
    };
  };
}
