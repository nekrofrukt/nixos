{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.walker.homeManagerModules.default ];

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "custom";
      placeholders."default" = { input = "Search"; list = "Example"; };
      
      providers = {
      #  max_results = 20;

        prefixes = [
          {provider = "websearch"; prefix = "+";}
          {provider = "providerlist"; prefix = "_";}
        ];
      };

      keybinds.quick_activate = [ ];
      #keybinds.quick_activate = ["F1" "F2" "F3" "F4" "F5"];
    };

    themes = {
      "custom" = {
        style = builtins.readFile ./themes/custom/style.css;
        layouts = {
          layout = builtins.readFile ./themes/custom/layout.xml;
          item = builtins.readFile ./themes/custom/item.xml;
          item_providerlist = builtins.readFile ./themes/custom/item_providerlist.xml;
        };
      };
    };
  };
}


# default config: https://github.com/abenz1267/walker/blob/master/resources/config.toml
# default layouts https://github.com/abenz1267/walker/tree/master/resources/themes/default


    #    layouts = {
    #      "layout" = " <!-- xml --> ";
    #      "item_calc" = " <!-- xml --> ";
    #      # other provider layouts
    #    };
