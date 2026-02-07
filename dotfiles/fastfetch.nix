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
		{"key": "{#36}MU/TH/UR : 180924609{#keys}", "type": "custom"},
                {"key": "{#36}--------------------{#keys}", "type": "custom"},
		//"title",
		//"separator",
		{"key": "{#31}SYSTEM{#keys}", "type": "custom"},
		{"key": "OPS", "type": "os"},
		{"key": "KRN", "type": "kernel"},
		"break",
		{"key": "{#31}SOFTWARE{#keys}", "type": "custom"},
		{"key": "DSK", "type": "de"},
		{"key": "PKG", "type": "packages"},
		{"key": "TER", "type": "terminal"},
		{"key": "SHL", "type": "shell"},
		"break",
		{"key": "{#31}HARDWARE{#keys}", "type": "custom"},
		{"key": "HST", "type": "host"},
		{"key": "CPU", "type": "cpu"},
		{"key": "RAM", "type": "memory"},
		{"key": "UPT", "type": "uptime"},
		"break",
		{"key": "HEX", "type": "colors", "symbol": "circle",}
	]
    }
    '';
    force = true;
  };
}
