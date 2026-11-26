local P = {}

-- Plugin Definitions
local HYMISSION_SO = "/run/current-system/sw/lib/libhymission.so"

function P.hymission(mainMod)
	hl.gesture({
		fingers = 3,
		direction = "up",
		action = function()
			hl.plugin.hymission.open()
		end,
	})

	hl.gesture({
		fingers = 3,
		direction = "down",
		action = function()
			hl.plugin.hymission.close()
		end,
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

function P.load_plugins(lib)
	hl.on("hyprland.start", function()
		local is_nixos = lib.file_exists("/etc/NIXOS")
		if is_nixos then
			hl.exec_cmd("hyprctl plugin load " .. HYMISSION_SO)
		else
			hl.exec_cmd("hyprpm reload")
		end
	end)
end

return P
