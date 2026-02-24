{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.walker.homeManagerModules.default ];

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "custom";
      placeholders."default" = { input = "Search"; list = "Example"; };
      
      providers.prefixes = [
        {provider = "websearch"; prefix = "+";}
        {provider = "providerlist"; prefix = "_";}
      ];

      providers.applications = { format = "{name}"; };

      keybinds.quick_activate = ["F1" "F2" "F3"];
    };
    
    # Check out the default layouts for examples https://github.com/abenz1267/walker/tree/master/resources/themes/default
    #    layouts = {
    #      "layout" = " <!-- xml --> ";
    #      "item_calc" = " <!-- xml --> ";
    #      # other provider layouts
    #    };
  };
}
