from libqtile import widget
from .theme import colors

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

main_widgets = [
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
        format = '%d/%m/%Y - %H:%M ',
        background = colors['white'],
        foreground = colors['black']
    ),
    powerline('cyan', 'white'),
    widget.Spacer(length = 2, background = colors['cyan']),
    widget.CheckUpdates(
        **font_settings,
        max_chars = 15,
        colour_have_updates = colors['red'],
        colour_no_updates = colors['black'],
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
    powerline('magenta', 'blue'),
    widget.Spacer(length = 2, background = colors['magenta']),
    widget.Net(
        **font_settings,
        format = '直 {interface}',
        background = colors['magenta'],
        interface = 'enp7s0',
        foreground = colors['white']
    ),
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
