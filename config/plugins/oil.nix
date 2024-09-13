{
  plugins.oil = {
    enable = true;
    settings = {
      use_default_keymaps = false;

      preview = {
        border = "rounded";
      };

      view_options = {
        show_hidden = true;
      };

      float = {
        padding = 2;
        maxWidth = 0;
        maxHeight = 0;
        border = "rounded";
        winOptions = {
          winblend = 0;
        };
      };

      keymaps = {
        "g?" = "actions.show_help";
        "<CR>" = "actions.select";
        "<C-j>" = "actions.select_split";
        "<C-l>" = "actions.select_vsplit";
        "<C-t>" = "actions.select_tab";
        "<C-p>" = "actions.preview";
        "<C-c>" = "actions.close";
        "<C-r>" = "actions.refresh";
        "-" = "actions.parent";
        "_" = "actions.open_cwd";
        "`" = "actions.cd";
        "~" = "actions.tcd";
        "gs" = "actions.change_sort";
        "gx" = "actions.open_external";
        "g." = "actions.toggle_hidden";
        "q" = "actions.close";
      };
    };
  };
}
