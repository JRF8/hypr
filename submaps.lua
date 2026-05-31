local S = {}

function S.setup(mainMod, media_keys)
  -- passthrough submap - allow guest to grab keyboard

  hl.bind(mainMod .. " + code:35", hl.dsp.submap("passthrough"))

  hl.define_submap("passthrough", function()
    -- Let's allow media keys inside the passthrough to still go to the host
    media_keys.setup(mainMod)
    -- Reset to break out of passthrough
    hl.bind(mainMod .. " + code:34", hl.dsp.submap("reset"))
    hl.bind(mainMod .. " + code:66", hl.dsp.submap("reset"))
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
