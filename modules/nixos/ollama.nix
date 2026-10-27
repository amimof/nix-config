{ pkgs, ... }:

{
  services.ollama = {
    enable = true;

    # Experimental GPU acceleration through Vulkan
    package = pkgs.ollama-vulkan;

  };
}
