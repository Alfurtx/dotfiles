from libqtile.config import Key
from libqtile.command import lazy

mod = "mod4"
terminal = "alacritty"

keys = [ 

    # switch between windows
    Key( [mod], "j", lazy.layout.down() ),
    Key( [mod], "k", lazy.layout.up() ),
    Key( [mod], "h", lazy.layout.left() ),
    Key( [mod], "l", lazy.layout.right() ),

    # change window sizes
    Key( [mod, "control"], "l", lazy.layout.grow() ),
    Key( [mod, "control"], "h", lazy.layout.shrink() ),

    # move windows in stack
    Key( [mod, "control"], "j", lazy.layout.shuffle_down() ),
    Key( [mod, "control"], "k", lazy.layout.shuffle_up() ),

    # kill window
    Key( [mod], "w", lazy.window.kill() ),

    # switch focus of monitors
    Key( [mod], "period", lazy.next_screen() ),
    Key( [mod], "comma", lazy.prev_screen() ),

    # restart qtile
    Key( [mod, "control"], "r", lazy.restart() ),
    Key( [mod, "control"], "q", lazy.shutdown() ),

    # spawn terminal
    Key( [mod], "Return", lazy.spawn("alacritty") ),

    # spawn rofi
    Key( [mod, "shift"], "Return", lazy.spawn("rofi -modi run,drun -show drun -columns 1 -width 24 -lines 8 -padding 45 -hide-scrollbar -show-icons -drun-icon-theme 'Papirus'") ),
]
