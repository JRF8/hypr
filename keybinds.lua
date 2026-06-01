local K = {}

function K.setup(mainMod)
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

return K
