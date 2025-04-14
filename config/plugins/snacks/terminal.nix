{ config, lib, ... }:
{
  plugins.snacks.settings.terminal = {
    enabled = true;
    win = {
      style = "terminal";
      keys = {
        term_normal = {
          __raw =
            # lua
            ''
              {
                "j",
                function(self)
                  self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
                  if self.esc_timer:is_active() then
                    self.esc_timer:stop()
                    vim.cmd("stopinsert")
                  else
                    self.esc_timer:start(200, 0, function() end)
                    return "<esc>"
                  end
                end,
                mode = "t",
                expr = true,
                desc = "Double 'j' to normal mode",
              }
            '';
        };
      };
    };
  };

  keymaps =
    lib.mkIf (config.plugins.snacks.enable && (lib.hasAttr "terminal" config.plugins.snacks.settings))
      [
        {
          mode = "n";
          key = "<leader>tt";
          action = ''<cmd>lua Snacks.terminal.toggle()<cr>'';
          options = {
            desc = "Toggle terminal";
          };
        }
        {
          mode = "t";
          key = "<leader>tt";
          action = ''<cmd>lua Snacks.terminal.toggle()<cr>'';
          options = {
            desc = "Toggle terminal";
          };
        }
        {
          mode = "n";
          key = "<leader>to";
          action = ''<cmd>lua Snacks.terminal.open()<cr>'';
          options = {
            desc = "Open terminal";
          };
        }
        {
          mode = "n";
          key = "<leader>tc";
          action = ''<cmd>lua Snacks.terminal.close()<cr>'';
          options = {
            desc = "Open terminal";
          };
        }
      ];
}
