{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "catppuccin";
        globalstatus = true;
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "█";
          right = "█";
        };
      };
      sections = {
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
            fmt = {
              __raw =
                # lua
                ''
                  function (branch)
                    if not branch or branch == "" then
                      return ""
                    end
                    -- Match the branch name to the specified format
                    local user, team, ticket_number = string.match(branch, "^(%w+)/(%w+)%-(%d+)")
                    -- If the branch name matches the format, display 
                    -- `{user}/{team}-{ticket_number}`, otherwise display 
                    -- the full branch name
                    if ticket_number then
                      return user .. "/" .. team .. "-" .. ticket_number
                    else
                      return branch
                    end
                  end
                '';
            };
          }
          "diff"
          "diagnostics"

        ];
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            path = 1;
          }
        ];
        lualine_x = [
          "filetype"
        ];
      };
    };
  };
}
