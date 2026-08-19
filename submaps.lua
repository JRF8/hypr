local S = {}

function S.setup(mainMod, keybinds)
  local BAR_NAME = "Main Bar"

  -- --- passthrough submap - allow guest to grab keyboard ---

  -- 1. Enter submap AND hide the dankbar
  hl.bind(mainMod .. " + code:35", function()
    hl.dispatch(hl.dsp.submap("passthrough"))
    hl.dispatch(hl.dsp.exec_cmd("dms ipc call bar hide name '" .. BAR_NAME .. "'"))
  end)

  hl.define_submap("passthrough", function()
    -- Let's allow media keys inside the passthrough to still go to the host
    keybinds.setup_mediakeys(mainMod)

    -- 2. Exit path A (code:34) AND reveal the dankbar
    hl.bind(mainMod .. " + code:34", function()
      hl.dispatch(hl.dsp.submap("reset"))
      hl.dispatch(hl.dsp.exec_cmd("dms ipc call bar reveal name '" .. BAR_NAME .. "'"))
    end)

    -- 3. Exit path B (code:66) AND reveal the dankbar
    hl.bind(mainMod .. " + code:66", function()
      hl.dispatch(hl.dsp.submap("reset"))
      hl.dispatch(hl.dsp.exec_cmd("dms ipc call bar reveal name '" .. BAR_NAME .. "'"))
    end)
  end)
  -- window resize submap

  hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

  hl.define_submap("resize", function()
    hl.bind(mainMod .. " + H", function()
      hl.dispatch(hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
    end)
    hl.bind(mainMod .. " + J", function()
      hl.dispatch(hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
    end)
    hl.bind(mainMod .. " + K", function()
      hl.dispatch(hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
    end)
    hl.bind(mainMod .. " + L", function()
      hl.dispatch(hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
    end)

    hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("reset"))
    hl.bind(mainMod .. " + code:66", hl.dsp.submap("reset"))
  end)
end

return S
