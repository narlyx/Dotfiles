#! /usr/bin/python
import sys
import subprocess as sp
import math

currentBattery = sp.getoutput("ls /sys/class/power_supply | grep BAT | head -n 1")


def getPercent():
    return int(sp.getoutput("cat /sys/class/power_supply/"+currentBattery+"/capacity"))


def getStatus():
    return sp.getoutput("cat /sys/class/power_supply/"+currentBattery+"/status")


def getIcon():
    dischargeIcons = ["󰂎","󰁺","󰁻","󰁼","󰁽","󰁾","󰁿","󰂀","󰂁","󰂂","󰁹"]
    chargeIcons    = ["󰢟","󰢜","󰂆","󰂇","󰂈","󰢝","󰂉","󰢞","󰂊","󰂋","󰂅"]
    targetList = None
    if (getStatus() == "Discharging"):
        targetList = dischargeIcons
    else:
        targetList = chargeIcons
    increment = (len(targetList)-1)/100
    icon = targetList[math.floor(getPercent()*increment)]
    return icon


if (len(sys.argv) == 1):
    quit()
match sys.argv[1]:
    case "--get-icon":
        print(getIcon())
    case "--get-percent":
        print(getPercent())
    case "--get-status":
        print(getStatus())
