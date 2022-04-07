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
    Key( [mod, "shift"], "Return", lazy.spawn("rofi -show run -modi run -location 1 -width 100 -l 1 -line-margin 0 -line-padding 1 -separator-style none -font \"mono 10\" -columns 9 -bw 0 -disable-history -hide-scrollbar -color-window \"#222222, #222222, #b1b4b3\" -color-normal \"#222222, #b1b4b3, #222222, #005577, #b1b4b3\" -color-active \"#222222, #b1b4b3, #222222, #007763, #b1b4b3\" -color-urgent \"#222222, #b1b4b3, #222222, #77003d, #b1b4b3\" -kb-row-select \"Tab\" -kb-row-tab \"\"") ),

    # spawn neovide
    Key( [mod], "n", lazy.spawn("neovide") ),
]
