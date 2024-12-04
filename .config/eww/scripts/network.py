#! /usr/bin/python
import sys
import subprocess as sp
import math


def getDevice():
    return sp.getoutput("nmcli -t -f DEVICE connection show --active | head -n 1")


def getType():
    return sp.getoutput("nmcli -t -f TYPE connection show --active | head -n 1")


def getSsid():
    if ("wireless" in getType()):
        return sp.getoutput("nmcli -t -f NAME connection show --active | head -n 1")
    elif ("ethernet" in getType()):
        return "Ethernet"
    else:
        return "Not connected"


def getStrength():
    if ("wireless" in getType()):
        return int(sp.getoutput("nmcli dev wifi list | grep \\* | awk '{print($8)}'"))
    return 0


def getIcon():
    if ("ethernet" in getType()):
        return "󰈀"
    elif ("wireless" in getType()):
        icons = ["󰤯","󰤟","󰤢","󰤥","󰤨"]
        increment = (len(icons)-1)/100
        icon = icons[math.floor(getStrength()*increment)]
        return icon
    else:
        return "󰤭"


if (len(sys.argv) == 1):
    quit()
match sys.argv[1]:
    case "--get-device":
        print(getDevice())
    case "--get-type":
        print(getType())
    case "--get-ssid":
        print(getSsid())
    case "--get-strength":
        print(getStrength())
    case "--get-icon":
        print(getIcon())
        
