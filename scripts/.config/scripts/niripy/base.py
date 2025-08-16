import typing
import json
from enum import Enum
import sh

niri = sh.Command('niri')

Command = Enum('Command', ['ACTION', 'WINDOWS', 'FOCUSED_WINDOW', 'WORKSPACES'])

cmd_to_str = {
    Command.ACTION: "action",
    Command.WINDOWS: "windows",
    Command.WORKSPACES: "workspaces",
    Command.FOCUSED_WINDOW: "focused-window",
}


def niri_post(cmd: Command, *args):
    niri('msg', cmd_to_str[cmd], *args)


def niri_get(cmd: Command, *args, as_json=True):
    if as_json:
        return json.loads(niri('msg', '-j', cmd_to_str[cmd], *args))
        
    return niri('msg', cmd_to_str[cmd], *args)


def get_windows(as_json=True):
    return niri_get(Command.WINDOWS, as_json=as_json)


def get_focused_window(as_json=True):
    return niri_get(Command.FOCUSED_WINDOW, as_json=as_json)
