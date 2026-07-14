-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "DP-1",
	mode = "3840x1600@144",
	position = "0x0",
	scale = "1.0",
})
hl.monitor({
	output = "DP-2",
	mode = "3440x1440@143.97",
	position = "auto-up",
	scale = "1.0",
})
hl.monitor({
	output = "DP-3",
	mode = "1920x1080@165",
	position = "3840x0",
	scale = "1.0",
    transform = 1,
})
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local devTerminal = "kitty --title 'DEV'"
local fileManager = "kitty --title 'FB' -e ranger"
local menu = "wmenu-run"
local browser = "firefox"
local taskBar = "waybar" 
--local musicPlayer = "flatpak run com.github.th_ch.youtube_music"
-------------------
---- AUTOSTART ----
-------------class-

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("waybar & hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("fcitx5")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
-- cursor appearance
hl.env("XCURSOR_THEME", "everforest-cursors")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "everforest-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
--hl.env("HYPRSHOT_DIR", "/home/selrak/Images")
hl.env("RANGER_LOAD_DEFAULT_RC", "false")
hl.env("TERM", "kitty")
hl.env("SAL_USE_VCLPLUGIN", "gtk3")
--hl.env("GTK_THEME", "TwoStepsBack")
--japanese typing
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("INPUT_METHOD", "fcitx")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 1,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})
hl.config({
	general = {
		col = {
			active_border = "rgba(44464f77)",
			inactive_border = "rgba(1a1b2033)",
		},
	},
	misc = {
		background_color = "rgba(121318FF)",
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "8", layout = "monocle" })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "slave",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------
hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

hl.config({
	misc = {
		force_default_wallpaper = -1, 		
        disable_hyprland_logo = true, 
		disable_splash_rendering = true,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local logout = "wlogout"
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(logout))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(devTerminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
--hl.bind(
--	mainMod .. " + M",
--	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
--)

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("kitty --title 'BT_UTILITY' -e bluetui"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("kitty --title 'CALENDER' -e calcurse"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("kitty --title 'WIFI' -e impala"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("kitty --title 'USAGE' -e btop"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("virt-manager"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("kitty --title 'SOUND' -e wiremix"))
--hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(musicPlayer, { workspace = "4" }))
hl.bind(mainMod .. " + T", hl.dsp.layout("swapwithmaster"))

hl.bind(mainMod .. " + N", hl.dsp.window.float({ action = "toggle" }))
--hl.bind(mainMod .. " + S", hl.dsp.window.pseudo())
--hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
-- Screenshots
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("screenshot"))
--hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m window"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
--hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
--hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "terminal opacity",
	match = {
		class = "kitty",
	},
	opacity = "1.0 override 0.5 override 0.8 override",
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
    layout = "master",
    default = true,
})
hl.workspace_rule({
    workspace = "2",
    monitor = "DP-2",
    default = true,
})
hl.workspace_rule({
    workspace = "3",
    monitor = "DP-1",
    default = true,
    layout = "scrolling",
})
hl.workspace_rule({
    workspace = "4",
    monitor = "DP-1",
    default = true,
    layout = "scrolling",
})
hl.workspace_rule({
    workspace = "5",
    monitor = "DP-3",
    default = true,
    layout = "scrolling",
})
hl.workspace_rule({
    workspace = "9",
    monitor = "DP-2",
    default = true,
})
hl.workspace_rule({
    workspace = "10",
    monitor = "DP-2",
    default = true,
    layout = "scrolling",
})
local browserWS = "2"
local terminalWS = "1"
local fileBrowserWS = "3"
local documentWS = "4"
local funWS = "5"
local virtualManagerWS = "9"
local utilityWS = "10"
hl.window_rule({
	name = "browser",
	match = {
		class = "firefox",
	},
	workspace = browserWS,
})

hl.window_rule({
	name = "work-terminal",
	match = {
		title = "^DEV$",
	},
	workspace = terminalWS,
})
hl.window_rule({
	name = "canticle-ranger",
	match = {
		title = "^DEV_RANGER$",
	},
	workspace = terminalWS,
})

hl.window_rule({
	name = "canticle-tmux",
	match = {
		title = "^DEV_TMUX$",
	},
	workspace = terminalWS,
})
hl.window_rule({
	name = "file-browser",
	match = {
		title = "^FB$",
	},
	workspace = fileBrowserWS,
})

hl.window_rule({
	name = "youtube-music",
	match = {
		class = "com.github.th-ch.youtube-music",
	},
	workspace = funWS,
})
hl.window_rule({
	name = "reader",
	match = {
		class = "org.pwmt.zathura",
	},
	workspace = documentWS,
})
hl.window_rule({
	name = "image viewer",
	match = {
		class = "Nsxiv",
	},
	workspace = documentWS,
})
hl.window_rule({
	name = "discord",
	match = {
		class = "vesktop",
	},
	workspace = funWS,
})

hl.window_rule({
	name = "bt-utility",
	match = {
		title = "^BT_UTILITY$",
	},
	workspace = utilityWS,
})

hl.window_rule({
	name = "calender-utility",
	match = {
		title = "^CALENDER$",
	},
	workspace = utilityWS,
})

hl.window_rule({
	name = "network-utility",
	match = {
		title = "^WIFI$",
	},
	workspace = utilityWS,
})
hl.window_rule({
	name = "system-utility",
	match = {
		title = "^USAGE$",
	},
	workspace = utilityWS,
})
hl.window_rule({
	name = "sound-utility",
	match = {
		title = "^SOUND$",
	},
	workspace = utilityWS,
})
hl.window_rule({
	name = "virtual1",
	match = {
		class = "virt-manager",
	},
	workspace = virtualManagerWS,
})
