import os
import subprocess
from typing import List  # noqa: F401
from libqtile import layout, bar, hook
from libqtile import widget
from libqtile.config import Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy

### COLORSCHEME ###

colors = {
    'bg':      '#282c34',
    'fg':      '#bbc2cf',
    'black':   '#282c34',
    'red':     '#ff6c6b',
    'green':   '#98be65',
    'yellow':  '#ecbe7b',
    'blue':    '#51afef',
    'magenta': '#c678dd',
    'cyan':    '#46d9ff',
    'white':   '#bbc2cf',
}

### KEYS ###

mod = "mod4"
altgr = "mod5"
terminal = "alacritty"

keys = [
    # LAYOUT BINDINGS #
    Key([mod], "plus", lazy.layout.grow()),
    Key([mod], "minus", lazy.layout.shrink()),
    # Key([mod], "n", lazy.layout.normalize()),

    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),

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
    # Key([mod, "shift"], "Return", lazy.spawn("rofi -show run -modi run -matching normal -location 1 -width 100 -l 1 -line-margin 0 -line-padding 1 -separator-style none -font \"mono 10\" -columns 9 -bw 0 -disable-history -hide-scrollbar -color-window \"#222222, #222222, #b1b4b3\" -color-normal \"#222222, #b1b4b3, #222222, #005577, #b1b4b3\" -color-active \"#222222, #b1b4b3, #222222, #007763, #b1b4b3\" -color-urgent \"#222222, #b1b4b3, #222222, #77003d, #b1b4b3\" -kb-row-select \"Tab\" -kb-row-tab \"\"") ),
    Key([mod, "shift"], "Return", lazy.spawn("rofi -show run -modi run -matching normal -location 1 -width 100 -l 1 -line-margin 0 -line-padding 1 -separator-style none -font \"mono 10\" -columns 9 -bw 0 -disable-history -hide-scrollbar -kb-row-select \"Tab\" -kb-row-tab \"\"") ),
    Key([mod], "n", lazy.spawn("neovide")),
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
    Key([], "XF86AudioLowerVolume", lazy.spawn("/usr/bin/pactl set-sink-volume alsa_output.usb-Kingston_HyperX_Cloud_Flight_Wireless_Headset-00.analog-stereo -2%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("/usr/bin/pactl set-sink-volume alsa_output.usb-Kingston_HyperX_Cloud_Flight_Wireless_Headset-00.analog-stereo +2%")),
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

layout_theme = { "border_width": 0, "margin": 5, }

layouts = [ layout.MonadTall( **layout_theme ) ]

### WIDGET ###

font_settings = dict(
    font = 'Hack Nerd Font Bold',
    fontsize = 13,
)

widget_defaults = dict(
    **font_settings,
    foreground = colors['fg'],
    padding = 1
)

extension_defaults = widget_defaults.copy()

# powerline separator for rounded finishes on widgets
def powerline(fg = 'fg', bg = 'bg'):
    return widget.TextBox(
        text = ' ',
        background = colors[bg],
        foreground = colors[fg],
        fontsize = 27,
        padding = -2
    )

def powerline_right(fg = 'fg', bg = 'bg'):
    return widget.TextBox(
        text = ' ',
        background = colors[bg],
        foreground = colors[fg],
        fontsize = 27,
        padding = -2
    )

def ini_widget():
    wid_list = [
            widget.Spacer( length = 15, background = colors['green'] ),
            widget.AGroupBox(
                **font_settings,
                borderwidth = 0,
                background = colors['green'],
                foreground = colors['black']
            ),
            powerline_right('green', 'yellow'),
            widget.Mpd2(
                **font_settings,
                color_progress = colors['blue'],
                idle_format = '{idle_message}',
                idle_message = ' no playlist selected',
                max_chars = 100,
                no_connection = 'no connection to server',
                play_states = { 'pause': '', 'play': '', 'stop': '' },
                status_format = '{play_status} {artist} ~ {title} [{repeat}{random}{single}{consume}{updating_db}]',
                background = colors['yellow'],
                foreground = colors['black'],
                padding = 5
            ),
            powerline_right('yellow', 'bg'),
            widget.Spacer(),
            widget.WindowName(
                **widget_defaults,
                max_chars = 50,
                format = '{name}',
            ),
            widget.Spacer(),
            powerline('white', 'bg'),
            widget.Clock(
                **font_settings,
                background = colors['white'],
                foreground = colors['bg'],
                format = '%H:%M:%S - %d/%m/%Y',
                timezone = 'Europe/Madrid'
            ),
            powerline('cyan', 'white'),
            widget.Spacer(length = 2, background = colors['cyan']),
            widget.CheckUpdates(
                **font_settings,
                max_chars = 15,
                colour_have_updates = colors['red'],
                colour_no_updates = colors['green'],
                display_format = ' {updates} updates',
                no_update_string = 'all up to date!',
                custom_command = 'checkupdates',
                background = colors['cyan']
            ),
            powerline('blue', 'cyan'),
            widget.Spacer(length = 2, background = colors['blue']),
            widget.Volume(
                **font_settings,
                background = colors['blue'],
                padding = 5,
                foreground = colors['white'],
                fmt = '  {}'
            ),
            # widget.Bluetooth(
            #     **widget_defaults,
            #     max_chars = 20
            # ),
            powerline('magenta', 'blue'),
            widget.Spacer(length = 2, background = colors['magenta']),
            widget.Net(
                **font_settings,
                format = '直 {interface}',
                background = colors['magenta'],
                interface = 'enp7s0',
                foreground = colors['white']
            ),
            # widget.Backlight(
            #     **font_settings,
            # ),
            # widget.Spacer( length = 15 ),
            #     widget.Battery(
            #     **widget_defaults
            # ),
            powerline('red', 'magenta'),
            widget.Spacer(length = 2, background = colors['red']),
            widget.QuickExit(
                **font_settings,
                default_text = '襤',
                countdown_format = '襤 {}',
                background = colors['red'],
                padding = 5
            ),
            widget.Spacer( length = 20, background = colors['red'] )
    ]
    return wid_list

screens = [
    Screen( top = bar.Bar( widgets = ini_widget(), size = 25, background = colors['bg'] ) ),
    Screen( top = bar.Bar( widgets = ini_widget(), size = 25, background = colors['bg'] ) ),
    Screen( top = bar.Bar( widgets = ini_widget(), size = 25, background = colors['bg'] ) ),
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
floating_layout = layout.Floating()
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

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
