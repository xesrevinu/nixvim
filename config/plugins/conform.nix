{
  lib,
  pkgs,
  ...
}:
{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      notify_on_error = false;

      formatters = {
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
      };

      formatters_by_ft = {
        lua = [ "stylua" ];
        javascript = {
          __unkeyed-1 = "biome";
          __unkeyed-2 = "prettierd";
          __unkeyed-3 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        "_" = [
          "trim_whitespace"
          "trim_newlines"
        ];
      };

      format_after_save =
        # lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            return { async = true, lsp_fallback = true, stop_after_first = true }
          end
        '';
    };
  };
}
