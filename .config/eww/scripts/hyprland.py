#! /usr/bin/python
import subprocess as sp
import os
import sys
import json


def getWorkspaces():
    workspaces = json.loads(sp.getoutput("hyprctl -j workspaces"))
    workspaces = sorted(workspaces, key=lambda x: x['id'])
    return json.dumps(workspaces)


def getActiveWorkspace():
    return sp.getoutput("hyprctl -j activeworkspace")


def getActiveWindow():
    activeWindow = json.loads(sp.getoutput("hyprctl -j activewindow"))
    if (activeWindow.get("title") is None):
        activeWindow["title"] = ""
    return json.dumps(activeWindow)


def toWorkspace(id):
    os.system("hyprctl dispatch workspace " + id)


if (len(sys.argv) == 1):
    quit()
match sys.argv[1]:
    case "--get-workspaces":
        print(getWorkspaces())
    case "--get-active-workspace":
        print(getActiveWorkspace())
    case "--get-active-window":
        print(getActiveWindow())
    case "--to-workspace":
        toWorkspace(sys.argv[2])
