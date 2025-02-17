{
  plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = true;
    settings = {
      appearance = {
        nerd_font_variant = "mono";
      };
      completion = {
        list = {
          selection = {
            preselect = false;
          };
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 100;
        };
        trigger = {
          show_in_snippet = false;
        };
      };
      keymap = {
        preset = "default";
        "<CR>" = [
          "accept"
          "fallback"
        ];
        "<C-j>" = [
          "scroll_documentation_down"
          "fallback"
        ];
        "<C-k>" = [
          "scroll_documentation_up"
          "fallback"
        ];
        "<Tab>" = [
          {
            __raw =
              # lua
              ''
                function(cmp)
                  if cmp.snippet_active() then
                    return cmp.accept()
                  end
                  return false
                end
              '';
          }
          "snippet_forward"
          "select_next"
          "fallback"
        ];
        "<S-Tab>" = [
          "snippet_backward"
          "select_prev"
          "fallback"
        ];
      };
      signature = {
        enabled = true;
      };
      snippets = {
        preset = "luasnip";
      };
      sources = {
        providers = {
          lsp = {
            score_offset = 5;
          };
          snippets = {
            score_offset = 4;
            should_show_items = {
              __raw =
                # lua
                ''
                  function(ctx)
                    return not (
                      ctx.trigger.initial_kind == "manual" or 
                      ctx.trigger.initial_kind == "trigger_character" 
                    )
                  end
                '';
            };
          };
        };
      };
    };
  };
}
