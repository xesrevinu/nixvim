{
  autoCmd = [
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
