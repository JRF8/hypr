local P = {}

function P.hymission(mainMod)
  hl.gesture({
    fingers = 3,
    direction = "up",
    action = function()
      hl.plugin.hymission.open()
    end
  })

  hl.gesture({
    fingers = 3,
    direction = "down",
    action = function()
      hl.plugin.hymission.close()
    end
  })

  hl.bind("SUPER + TAB", hl.plugin.hymission.toggle)

  hl.config({
    plugin = {
      hymission = {
        toggle_switch_mode = 1,
        switch_toggle_auto_next = 1,
        switch_release_key = "Super_L",
      },
    },
  })
end

function P.load_plugins()
  hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload")
  end)
end

return P
