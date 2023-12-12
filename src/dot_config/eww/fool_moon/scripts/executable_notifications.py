#!/usr/bin/python

import os
import json
import subprocess
from datetime import datetime
import sys

HOME = os.getenv("HOME")
EWW_PATH = f"{HOME}/.config/eww/fool_moon/windows/side-menu"


def get_notifications():
    result = subprocess.run(["eww", "-c", EWW_PATH, "get", "notifications-list"], capture_output=True)
    return json.loads(result.stdout)


def add_notification():
    notifications = get_notifications()

    id = len(notifications) + 1

    new_notification = {
        "id": str(id),
        "urgency": os.getenv("DUNST_URGENCY"),
        "summary": os.getenv("DUNST_SUMMARY"),
        "body": os.getenv("DUNST_BODY"),
        "app": os.getenv("DUNST_APP_NAME"),
        "icon": os.getenv("DUNST_ICON_PATH"),
        "time": datetime.now().strftime("%I:%M")
    }

    notifications.append(new_notification)
    update_notifications(notifications)


def update_notifications(notifications):
    subprocess.run(["eww", "-c", EWW_PATH, "update", f"notifications-list={json.dumps(notifications)}"])

def get_notification_count():
    return len(get_notifications())

def remove_notification(id):
    notifications = get_notifications()
    new_notifications = [n for n in notifications if n["id"] != id]
    update_notifications(new_notifications)

def get_icon():
    paused = subprocess.run(["dunstctl", "is-paused"], capture_output=True, text=True)
    if paused.stdout == "true\n":
        return ""
    notifications = get_notifications()
    if len(notifications) > 0:
        return ""
    return ""

def clear():
    update_notifications([])

if __name__ == "__main__":
    match sys.argv[1]:
        case "icon":
            print(get_icon())
        case "count":
            print(get_notification_count())
        case "remove":
            remove_notification(sys.argv[2])
        case "clear":
            clear()
        case _:
            add_notification()

