{ ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableLsColors = true;
  };
	dotfiles.links.".zshrc" = "/zsh/dot-zshrc";
	dotfiles.links.".zsh" = "/zsh/dot-zsh";
}
