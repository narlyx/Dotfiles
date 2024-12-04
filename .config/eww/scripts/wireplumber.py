#! /usr/bin/python
import sys
import subprocess as sp
import os


def getPercent():
    percent = sp.getoutput("wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print($2)}'")
    percent = int(float(percent)*100)
    muted = sp.getoutput("wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print($3)}'") != ""
    if (muted):
        percent = 0
    return percent


def getIcon():
    percent = getPercent()
    if (percent >= 65):
        return ""
    elif (percent >= 35):
        return ""
    elif (percent >= 1):
        return ""
    else:
        return ""


def setPercent(percent):
    os.system("wpctl set-volume @DEFAULT_AUDIO_SINK@ "+percent+"%")


if (len(sys.argv) == 1):
    quit()
match sys.argv[1]:
    case "--set-percent":
        setPercent(sys.argv[2])
    case "--get-percent":
        print(getPercent())
    case "--get-icon":
        print(getIcon())
