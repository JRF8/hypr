local M = {}

function M.setup()
  hl.monitor({
    -- Default config
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
  })

  hl.monitor({
    -- Main Thinkpad Screen
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
  })

  hl.monitor({
    -- Downstairs Left
    output = "desc:LG Electronics LG FULL HD 0x0101010",
    mode = "preferred",
    position = "-960x-1080",
  })

  hl.monitor({
    -- Downstairs Right
    output = "desc:Acer Technologies KA242Y 72380FE9C3W0",
    mode = "preferred",
    position = "960x-1080",
  })

  hl.monitor({
    -- Work
    output = "desc:Acer Technologies V226HQL LY7AA015858",
    mode = "preferred",
    position = "-1920x0",
  })

  hl.monitor({
    -- Upstairs
    output = "desc:Samsung Electric Company Odyssey G40B HCJW60013",
    mode = "preferred",
    position = "1920x0",
  })
end

return M
