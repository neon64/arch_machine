#!/bin/sh

XDG_SESSION_TYPE=wayland MOZ_ENABLE_WAYLAND=1 GTK_CSD=1 exec dbus-run-session gnome-session
