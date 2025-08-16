import argparse
import base
import json
import typing


# might matter where called from
SCRATCH_FILE = '.scratch.json'
SCRATCH_WS = 'scratch'
TRANSITION_MS = 250

"""
wait. does this even need a memory? can't it just get a list of the scratch windows every time?
yea if we want ordered

could also just stack them
"""

#def filter_unscratched(scratch_contents: typing.List[int]) -> typing.List[int]:   



def send_to_scratch(follow=False):
    fw = base.get_focused_window()['id']
    follow_str = 'true' if follow else 'false'
    base.niri_post(base.Command.ACTION, 'do-screen-transition', '-d', TRANSITION_MS)
    base.niri_post(base.Command.ACTION, 'move-window-to-tiling')
    base.niri_post(base.Command.ACTION, 'move-window-to-workspace', '--window-id', fw, '--focus', follow_str, SCRATCH_WS)


def toggle():
    floating = base.get_focused_window()['is_floating']
    if (not floating):
        summon_from_scratch()
    else:
        send_to_scratch()


def get_next():
    if is_scratch_focused(): return
    floating = base.get_focused_window()['is_floating']
    if (not floating):
        summon_from_scratch()
        return
    base.niri_post(base.Command.ACTION, 'set-workspace-name', "~whatever~")
    base.niri_post(base.Command.ACTION, 'do-screen-transition', '-d', TRANSITION_MS)
    send_to_scratch(follow=True)
    base.niri_post(base.Command.ACTION, 'move-window-to-tiling')
    base.niri_post(base.Command.ACTION, 'move-column-to-first')
    base.niri_post(base.Command.ACTION, 'focus-workspace', SCRATCH_WS)
    summon_from_scratch()
    base.niri_post(base.Command.ACTION, 'unset-workspace-name')


def is_scratch_empty():
    workspaces = base.niri_get(base.Command.WORKSPACES)
    for ws in workspaces:
        if ws['name'] == SCRATCH_WS:
            return ws['active_window_id'] is None
    return True


def is_scratch_focused():
    workspaces = base.niri_get(base.Command.WORKSPACES)
    for ws in workspaces:
        if ws['name'] == SCRATCH_WS:
            return ws['is_focused']
    return False

def print_scratch_windows():
    if is_scratch_empty(): return
    base.niri_post(base.Command.ACTION, 'set-workspace-name', "~whatever~")
    base.niri_post(base.Command.ACTION, 'focus-workspace', SCRATCH_WS)
    s_id = base.get_focused_window()['workspace_id']
    sws = []
    for w in base.get_windows():
        if w['workspace_id'] == s_id:
            sws.append(w)
    for w in sws:
        print(f"{w['id']}) {w['title']}")
    base.niri_post(base.Command.ACTION, 'focus-workspace', "~whatever~")
    base.niri_post(base.Command.ACTION, 'unset-workspace-name')

def summon_from_scratch():
    if is_scratch_empty() or is_scratch_focused(): return
    base.niri_post(base.Command.ACTION, 'do-screen-transition', '-d', TRANSITION_MS) 
    base.niri_post(base.Command.ACTION, 'set-workspace-name', "~whatever~")
    base.niri_post(base.Command.ACTION, 'focus-workspace', SCRATCH_WS)
    base.niri_post(base.Command.ACTION, 'focus-column-last')
    base.niri_post(base.Command.ACTION, 'move-window-to-floating')
    base.niri_post(base.Command.ACTION, 'move-window-to-workspace', "~whatever~")
    base.niri_post(base.Command.ACTION, 'center-window')
    base.niri_post(base.Command.ACTION, 'unset-workspace-name')
    

def main(action):
    match action:
        case "toggle":
            toggle()
        case "next":
            get_next()
        case "send":
            send_to_scratch()
        case "summon":
            summon_from_scratch()
        case "show_scratch":
            print_scratch_windows()



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("action")
    main(parser.parse_args().action)

"""
    sws = {'in_scratch': []}
    with open(SCRATCH_FILE, 'r') as sf:
        sws = json.loads(sf.read())
    sws['in_scratch'].append(fw)
    sws['last_opened'] = -1
    with open(SCRATCH_FILE, 'w') as sf:
        sf.write(json.dumps(sws))

sws = {}v
    fw = base.get_focused_window()
    sws['in_scratch'] = [fw]
    with open(SCRATCH_FILE, 'w') as sf:
        sf.write(json.dumps(sws))
niri msg action do-screen-transition -d 150 && niri msg action focus-workspace scratch && niri msg action focus-column-last && niri msg action move-window-to-workspace current
"""
