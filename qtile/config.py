import os
import subprocess
from typing import List  # noqa: F401
from libqtile import layout, bar, hook
from libqtile import widget
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from datetime import datetime as dt

### gruvbox colors ###

COLS = {
    "dark_0": "#1d2021",
    "dark_1": "#282828",
    "dark_2": "#32302f",
    "dark_3": "#3c3836",
    "dark_4": "#504945",
    "dark_5": "#665c54",
    "dark_6": "#7c6f64",
    "gray_0": "#928374",
    "light_0": "#f9f5d7",
    "light_1": "#fbf1c7",
    "light_2": "#f2e5bc",
    "light_3": "#ebdbb2",
    "light_4": "#d5c4a1",
    "light_5": "#bdae93",
    "light_6": "#a89984",
    "red_0": "#fb4934",
    "red_1": "#cc241d",
    "red_2": "#9d0006",
    "green_0": "#b8bb26",
    "green_1": "#98971a",
    "green_2": "#79740e",
    "yellow_0": "#fabd2f",
    "yellow_1": "#d79921",
    "yellow_2": "#b57614",
    "blue_0": "#83a598",
    "blue_1": "#458588",
    "blue_2": "#076678",
    "purple_0": "#d3869b",
    "purple_1": "#b16286",
    "purple_2": "#8f3f71",
    "aqua_0": "#8ec07c",
    "aqua_1": "#689d6a",
    "aqua_2": "#427b58",
    "orange_0": "#fe8019",
    "orange_1": "#d65d0e",
    "orange_2": "#af3a03",
    # Additional related colors from the deus colorscheme
    'deus_1': '#2C323B',
    'deus_2': '#646D7A',
    'deus_3': '#48505D',
    'deus_4': '#1A222F',
    'deus_5': '#101A28',
}

### FUNCTIONS ###

def suffix(d):
    return 'th' if 11<=13 else {1:'st', 2:'nd', 3:'rd'}.get(d%10, 'th')

def custom_strftime(format, t):
    return t.strftime(format).replace('{S}', str(t.day) + suffix(t.day))

def custom_date():
    return custom_strftime('%A, {S} %B', dt.now())

### KEYS ###

mod = "mod4"
altgr = "mod5"
terminal = "alacritty"

keys = [

    # LAYOUT BINDINGS #
    Key([mod], "plus", lazy.layout.grow()),
    Key([mod], "minus", lazy.layout.shrink()),
    Key([mod], "n", lazy.layout.normalize()),

    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "control"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate(),
        desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.spawn("rofi -modi run,drun -show drun -columns 1 -width 24 -lines 8 -padding 45 -hide-scrollbar -show-icons -drun-icon-theme 'Papirus'")),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Pulse Audio controls
    Key([], "XF86AudioMute", lazy.spawn("/usr/bin/pactl set-sink-mute alsa_output.pci-0000_00_1b.0.analog-stereo toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("/usr/bin/pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("/usr/bin/pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo +5%")),
]

### GROUPS ###

groups = [Group(i) for i in ["   ", "   " , "   ", "   ", "   "]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),

        # send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
        ])

### LAYOUTS ###
layout_theme = {
        "border_width": 4,
        "margin": 10,
        "border_focus": COLS["dark_0"],
        "border_normal": COLS["dark_0"]
        }

layouts = [

    #layout.Max(), #layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix

    layout.MonadTall(
        **layout_theme
    ),

    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

### WIDGET ###

widget_defaults = dict(
    font='Hack Nerd Font',
    fontsize=15,
    foreground=COLS["light_3"],
)
extension_defaults = widget_defaults.copy()

def init_screens_original():
    [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(
                        other_current_screen_border=COLS["orange_0"],
                        this_current_screen_border=COLS["blue_0"],
                        other_screen_border=COLS["orange_0"],
                        this_screen_border=COLS["blue_0"],
                        highlight_color=COLS["blue_0"],
                        urgent_border=COLS["red_1"],
                        background=COLS["dark_4"],
                        highlight_method="line",
                        inactive=COLS["dark_2"],
                        active=COLS["light_2"],
                        disable_drag=True,
                        borderwidth=2,
                        **widget_defaults),
                    widget.Spacer(length = 10),
                    widget.WindowName(
                        **widget_defaults,
                        emoji = True
                        ),
                    widget.Prompt(
                        **widget_defaults
                    ),
                    widget.Volume(
                        **widget_defaults
                    ),
                    widget.Systray(),
                    widget.Spacer(length = 10),
                    widget.Clock(
                        **widget_defaults,
                        format='%d/%m/%Y - %H:%M'
                    )
                ],
                25, background=COLS["dark_2"], opacity=0.9, margin = [10, 10, 0, 10]
            ),
        ),
    ]


screens = [
    Screen(top = bar.Gap(size = 32))
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
# wmname = "LG3D"
wmname = "qtile"
