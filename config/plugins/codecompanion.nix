{
  plugins.codecompanion = {
    enable = true;

    settings = {
      adapters = {
        openai = {
          __raw =
            # lua
            ''
              function()
                return require("codecompanion.adapters").extend("openai", {
                  env = {
                    api_key = "cmd:op read 'op://Private/OpenAI API Key/credential' --no-newline",
                  },
                })
              end
            '';
        };
      };
      strategies = {
        chat = {
          adapter = "openai";
        };
        cmd = {
          adapter = "openai";
        };
        inline = {
          adapter = "openai";
        };
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ac";
      action = "<cmd>CodeCompanionActions<cr>";
      options = {
        desc = "Show CodeCompanion actions";
      };
    }
  ];
}
