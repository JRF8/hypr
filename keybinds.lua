local K = {}

function K.setup_keybinds(mainMod)
  -- set up commands
  local terminal       = "kitty"
  local fileManager    = "dolphin"
  local launcher       = "rofi -show drun -show-icons"
  local screenshot     = "hyprshot -m region --clipboard-only"
  local chrome         = "google-chrome-stable --user-data-dir=$HOME/.config/google-chrome --class=google-chrome"
  local youtube        =
  "google-chrome-stable --new-window --user-data-dir=$HOME/.config/google-chrome-youtube --class=youtube --app=https://youtube.com"
  local wallpaper      = "$HOME/.local/bin/wallpaper.sh"
  local profile_switch = "$HOME/.config/hypr/profile-picker.sh"

  -- set up keybinds
  hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
  hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(launcher))
  hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(profile_switch))
  hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(screenshot))
  hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(wallpaper))
  local closeWindowBind = hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
  -- closeWindowBind:set_enabled(false)
  hl.bind(mainMod .. " + SHIFT + Q",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
  hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
  hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

  -- Move focus with mainMod + vim keys
  hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
  hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
  hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
  hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

  -- Chrome and youtube
  hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(chrome))
  hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(youtube))

  -- Switch workspaces with mainMod + [0-9]
  -- Move active window to a workspace with mainMod + SHIFT + [0-9]
  for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
  end

  -- Example special workspace (scratchpad)
  hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
  hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

  -- Scroll through existing workspaces with mainMod + scroll
  hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
  hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

  -- Move/resize windows with mainMod + LMB/RMB and dragging
  hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
  hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
end

function K.setup_mediakeys(mainMod)
  -- Laptop multimedia keys for volume and LCD brightness
  hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
  hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
  hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
  hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
  hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
  hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

  -- Requires playerctl
  hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
  hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
  hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
  hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

  -- Alternate playerctl commands
  hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("playerctl next"), { locked = true })
  hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("playerctl play"), { locked = true })
  hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("playerctl pause"), { locked = true })
  hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

  -- Alternate volume keys
  hl.bind(mainMod .. " + code:21", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
  hl.bind(mainMod .. " + code:20", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
  hl.bind(mainMod .. " + SHIFT + code:20", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
end

return K
