{
  lib,
  pkgs,
  ...
}:
{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      log_level = "debug";

      notify_on_error = false;

      formatters = {
        prettier = {
          require_cwd = true;
          cwd = {
            __raw =
              # lua
              ''
                require("conform.util").root_file({
                  -- https://prettier.io/docs/en/configuration.html
                  ".prettierrc",
                  ".prettierrc.json",
                  ".prettierrc.yml",
                  ".prettierrc.yaml",
                  ".prettierrc.json5",
                  ".prettierrc.js",
                  ".prettierrc.cjs",
                  ".prettierrc.mjs",
                  ".prettierrc.toml",
                  "prettier.config.js",
                  "prettier.config.cjs",
                  "prettier.config.mjs",
                })
              '';
          };
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
      };

      formatters_by_ft =
        let
          js_common = {
            __unkeyed-1 = "biome";
            __unkeyed-2 = "prettierd";
            __unkeyed-3 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          };
        in
        {
          javascript = js_common;
          javascriptreact = js_common;
          lua = [ "stylua" ];
          typescript = js_common;
          typescriptreact = js_common;
        };

      format_after_save =
        # lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            return { async = true, lsp_format = "prefer", stop_after_first = true }
          end
        '';
    };
  };
}
