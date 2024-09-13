{pkgs, ...}: {
  extraPackages = with pkgs; [
    nixfmt-rfc-style
  ];

  plugins = {
    nix.enable = true;
    nix-develop.enable = true;

    lsp.servers = {
      nil-ls = {
        enable = true;
        settings = {
          formatting = {
            command = ["nixfmt"];
          };
        };
      };
    };
  };
}
