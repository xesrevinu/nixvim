{
  autoCmd = [
    # Language Servers
    {
      desc = "Fix all Biome linting errors";
      event = [ "LspAttach" ];
      callback = {
        __raw =
          # lua
          ''
            function(args) 
              local client = vim.lsp.get_client_by_id(args.data.client_id)

              if not client then
                return
              end

              -- When the client is Biome, add an automatic event on save that
              -- runs Biome's "source.fixAll.biome" code action.
              if client.name == "biome" then
                vim.api.nvim_create_autocmd("BufWritePost", {
                  group = vim.api.nvim_create_augroup("BiomeFixAll", {
                    clear = true
                  }),
                  callback = function() 
                    -- Get diagnostics for the current buffer
                    local diagnostics = vim.diagnostic.get(0, {
                      namespace = vim.lsp.diagnostic.get_namespace(client.id)
                    })

                    -- Only run fixAll if there are diagnostics to fix
                    if #diagnostics > 0 then
                      vim.lsp.buf.code_action({
                        context = {
                          diagnostics = {},
                          only = { "source.fixAll.biome" },
                        },
                        apply = true,
                      })

                      -- TODO: this is a hack
                      -- Save the file after a delay to allow the code action to complete
                      vim.defer_fn(function()
                        if vim.api.nvim_buf_get_option(0, "modified") then
                          vim.cmd("silent write")
                        end
                      end, 100)
                    end
                  end,
                })
              end
            end
          '';
      };

    }

    # Miscellaneous
    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      callback = {
        __raw =
          # lua
          ''
            function()
              vim.highlight.on_yank()
            end
          '';
      };
    }
    {
      desc = "Automatically close quickfix window on selection";
      event = [ "FileType" ];
      pattern = [ "qf" ];
      command = "nnoremap <buffer> <CR> <CR>:cclose<CR>";
    }
  ];
}
