local W = {}

function W.setup()
  hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
  hl.workspace_rule({ workspace = "2", monitor = "eDP-1" })
  hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
  hl.workspace_rule({ workspace = "4", monitor = "eDP-1" })
  hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
  hl.workspace_rule({ workspace = "6", monitor = "eDP-1" })
  hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })


  hl.workspace_rule({ workspace = "8", monitor = "desc:Acer Technologies V226HQL LY7AA015858" })
  hl.workspace_rule({ workspace = "9", monitor = "desc:Acer Technologies V226HQL LY7AA015858" })
  hl.workspace_rule({ workspace = "10", monitor = "desc:Acer Technologies V226HQL LY7AA015858" })

  hl.workspace_rule({ workspace = "8", monitor = "desc:Samsung Electric Company Odyssey G40B HCJW60013" })
  hl.workspace_rule({ workspace = "9", monitor = "desc:Samsung Electric Company Odyssey G40B HCJW60013" })
  hl.workspace_rule({ workspace = "10", monitor = "desc:Samsung Electric Company Odyssey G40B HCJW60013" })


  hl.workspace_rule({ workspace = "8", monitor = "desc:LG Electronics LG FULL HD 0x0101010" })
  hl.workspace_rule({ workspace = "9", monitor = "desc:Acer Technologies KA242Y 72380FE9C3W0" })
  hl.workspace_rule({ workspace = "10", monitor = "desc:Acer Technologies KA242Y 72380FE9C3W0" })
end

return W
