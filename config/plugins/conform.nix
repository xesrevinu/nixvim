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
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
      };

      formatters_by_ft = {
        # json = ["jq"];
        lua = [ "stylua" ];
        "_" = [
          "squeeze_blanks"
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
