{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      log_level = "debug";
      notify_on_error = false;
      notify_no_formatters = false;
      format_after_save = {
        lsp_format = "prefer";
        stop_after_first = true;
        timeout_ms = 500;
        async = true;
      };
      formatters_by_ft =
        let
          js_common = {
            __unkeyed-1 = "biome";
            stop_after_first = true;
          };
        in
        {
          javascript = js_common;
          javascriptreact = js_common;
          typescript = js_common;
        };
    };
  };
}
