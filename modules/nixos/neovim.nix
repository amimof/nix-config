{ ... }:
{
    dotfiles.checkoutPath = "/home/amir/Projects/github.com/amimof/dotfiles";
	dotfiles.links.".config/nvim" = {
    source =  "/nvim/dot-config/nvim";
    mutable = true;
  };
}
