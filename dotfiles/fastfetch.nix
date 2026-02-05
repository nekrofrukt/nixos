{ config, pkgs, ... }:

{
  home.file.".config/fastfetch/config.jsonc" = {
    text = ''
    {
	"$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json",
	"display": {
		"separator": " "
  	},
	"modules": [
		"title",
		"separator",
		{"type": "custom", "key": "LINUX"},
		"os",
		"kernel",
		"uptime",
		"break",
		{"type": "custom", "key": "SOFTWARE"},
		"de",
		"packages",
		"terminal",
		"shell",
		"break",
		{"type": "custom", "key": "HARDWARE"},
		"host",
		"cpu",
		"memory",
		"disk",
		"uptime",
		"break",
		{
		"key": "Colors",
		"type": "colors",
		"symbol": "circle",
		}
	]
    }
    '';
    force = true;
  };
}
