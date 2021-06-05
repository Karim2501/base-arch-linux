import os, re, socket, subprocess
from typing import List  # noqa: F401
from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
mod1 = "alt"
myTerm = "alacritty"

keys = [

    #Layout Keys
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
   
    # Windows Keys
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),
    
    # System Keys
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Apps Keys
    Key([mod], "g", lazy.spawn("google-chrome-stable"), desc="Launch Google-browser"),
    Key([mod], "Return", lazy.spawn(myTerm), desc="Launch terminal"),
    Key([mod], "r", lazy.spawn("rofi -show run"), desc="Launch Rofi"),
    Key([mod], "t", lazy.spawn("telegram-desktop"), desc="Launch Telegram"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name)),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name)),
    ])

layout_theme = {"margin" : 3,
                "border_width" : 2,
                "border_focus" : "#a1b4db",
                "border_normal" : "#3a4251",
               }

layouts = [
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    #layout.Bsp(**layout_theme),
    #layout.Tile(**layout_theme),
    #layout.Zoomy(**layout_theme),
    #layout.Matrix(**layout_theme),
    layout.Columns(**layout_theme),
    #layout.TreeTab(**layout_theme),
    layout.Floating(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.RatioTile(**layout_theme),
    #layout.MonadTall(**layout_theme),
    #layout.MonadWide(**layout_theme),
    #layout.VerticalTile(**layout_theme),
]

colors = [["#2b2b2b", "#2b2b2b"], # 0. panel backgorund
          ["#a1b1ce", "#a1b1ce"], # 1. background for current screen tab
          ["#ffffff", "#ffffff"], # 2. font color for groub names
          ["#00abff", "#00abff"], # 3. border line color current tab
          ["#1730b0", "#1730b0"], # 4. border line color for other tab
          ["#4f76c7", "#4f76c7"], # 5. color for the even widget
          ["#78f48d", "#78f48d"], # 6. window name
          ["#f2ff84", "#f2ff84"], # 7. background for inactive screen
         ]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    font = 'sans',
    fontsize = 12,
    padding = 2,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                    filename = "~/.config/qtile/Pictures/terminal_icons.png", 
                    scale = True, 
                    mouse_callbacks = {"Button1" : lambda: qtile.cmd_spawn(myTerm)},
                    ),
                widget.GroupBox(disable_drag = True),
                widget.WindowName(foreground = colors[6]),
                widget.Systray(background = colors[0], icon_size = 18),
                widget.CheckUpdates(
                    distro = 'Arch',
                    update_interval = 600,
                    foreground = colors[2],
                    background = colors[0],
                    display_format = "{updates} Updates",
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
                    ),
                widget.Sep(linewidth = 0, padding = 2, background = colors[0]),
                widget.Net(
                    update_interval = 2,
                    interface = "wlp3s0",
                    foreground = colors[2],
                    background = colors[0],
                    format = '{up} ↑↓ {down}',
                    mouse_callbacks = {"Button1" : lambda: qtile.cmd_spawn(myTerm + " -e nmtui")},
                    ),
                widget.Sep(linewidth = 0, padding = 2, background = colors[0]),
                widget.Battery(
                    update_interval = 30,
                    foreground = colors[2],
                    background = colors[0],
                    format = "{char} {percent:2.0%} {hour:d}:{min:02d}",
                    ),
                widget.Sep(linewidth = 0, padding = 2, background = colors[0]),
                widget.CPU(
                    update_interval = 4,
                    foreground = colors[2],
                    background = colors[0],
                    format = '{load_percent}% ',
                    mouse_callbacks = {"Button 1" : lambda : qtile.cmd_spawn(myTerm + " -e htop")},
                    ),
                widget.Sep(linewidth = 0, padding = 2, background = colors[0]),
                widget.Memory(
                    update_interval = 3,
                    foreground = colors[2],
                    background = colors[0],
                    format = '{MemUsed}M',
                    ),
                widget.Sep(linewidth = 0, padding = 2, background = colors[0]),
                widget.Volume(
                    update_interval = 5, 
                    foreground = colors[2],
                    background = colors[0],
                    mouse_callbacks = {"Button1" : lambda : qtile.cmd_spawn("pavucontrol")},
                    ),
                widget.Sep(linewidth = 0, padding = 2, background = colors[0]),
                widget.Clock(format = '%I:%M %p, %a %d-%m-%y', foreground = colors[2], background = colors[0]),
                widget.CurrentLayoutIcon(scale = 0.61, foreground = colors[2], background = colors[0]),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
focus_on_window_activation = "smart"
auto_fullscreen = True
extentions=[]
wmname = "QTILE"

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

@hook.subscribe.startup_once
def start_once():
        home = os.path.expanduser('~')
        subprocess.call([home + '/.config/qtile/autostart.sh'])
