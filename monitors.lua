local M = {}

function M.setup()
  hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
  })

  hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
  })

  hl.monitor({
    output = "DP-2",
    mode = "preferred",
    position = "-960x-1080",
  })

  hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "960x-1080",
  })

  hl.monitor({
    output = "desc:Acer Technologies V226HQL LY7AA015858",
    mode = "preferred",
    position = "-1920x0",
  })

  hl.monitor({
    output = "desc:Samsung Electric Company Odyssey G40B HCJW60013",
    mode = "preferred",
    position = "1920x0",
  })
end

return M
