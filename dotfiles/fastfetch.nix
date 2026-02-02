{ config, pkgs, ... }:

{
  home.file.".config/fastfetch/config.jsonc" = {
    text = ''
  
  {
	"$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
	"logo": {
	// "source": "~/.config/fastfetch/logos/samurai.png",
	"source": "nixos",
	"type": "auto",
	"padding": {
	"top": 1,
	"right": 4,
	"left": 4,
	},
	//"width": 20,
	//"height": 10
  	},
	"display": {
    		"separator": " "
	},
	"modules": [
		{
      			"key": "╭──────╮",
      			"type": "custom"
		},
    		{
      		"key": "│ {#31}usr{#keys}  │",
      		"type": "title",
      		"format": "{user-name}@nixpad"
    		},
    		{
      		"key": "│ {#31}os {#keys}  │",
     		 "type": "os"
    		},
    		{
      		"key": "│ {#31}ker{#keys}  │",
      		"type": "kernel"
    		},
    		{
      		"key": "│ {#31}sh {#keys}  │",
      		"type": "shell"
    		},
    		{
      		"key": "│ {#31}wm {#keys}  │",
      		"type": "wm"
    		},
    		{
      		"key": "{#36}desktop {#keys}",
      		"type": "de"
    		},
    		{
      		"type": "terminal",
      		"key": "{#31}term    {#keys}",
      		"format": "ghostty"
    		},
    		{
      		"key": "│ {#31}apt{#keys}  │",
      		"type": "packages"
    		},
    		{
      		"key": "│ {#31}cpu{#keys}  │",
      		"type": "cpu",
      		"format": "{name} ({cores-physical}C/{cores-logical}T) @ {freq-max}"
    		},
    		{
      		"key": "│ {#31}ram{#keys}  │",
     	 	"type": "memory"
    		},
    		{
      		"key": "│ {#31}dsk{#keys}  │",
      		"type": "disk",
      		"folders": "/"
   		 },
  		  {
      		"key": "│ {#31}up {#keys}  │",
      		"type": "uptime"
    		},
    		/*{
      		"key": "{#31}age    {#keys}",
      		"type": "command",
      		"text": "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days"
    		},*/
    		{
      		"key": "╰──────╯",
      		"type": "custom"
   		},
    		{
      		"key": "        {#39}colors {#keys}",
      		"type": "colors",
      		"symbol": "circle"
    		},
    		{
      		"key": " ",
      		"type": "custom"
    		}
  		]
	}
    '';
    force = true;
  };
}
