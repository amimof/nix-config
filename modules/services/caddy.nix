{ ... }:

{
  virtualisation.oci-containers.containers.caddy = {
    image = "docker.io/library/caddy:2";
    autoStart = true;

    ports = [
      "80:80"
      "443:443"
    ];

    volumes = [
      "/srv/caddy/data:/data"
      "/srv/caddy/config:/config"
      "/srv/caddy/Caddyfile:/etc/caddy/Caddyfile:ro"
    ];

    environment = {
      TZ = "Europe/Stockholm";
    };
  };
}
