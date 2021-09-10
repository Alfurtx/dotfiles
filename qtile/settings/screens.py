from Xlib import display as xdisplay
from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger
from .widgets import main_widgets
from .theme import colors
import subprocess

def status_bar( widgets ):
    return bar.Bar( widgets, 20, background = colors['bg'] )

screens = [
    Screen( top = status_bar( main_widgets ) ),
    Screen( top = status_bar( main_widgets ) ),
    Screen( top = status_bar( main_widgets ) ),
]
