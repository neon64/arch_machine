#!/bin/sh

# https://wiki.archlinux.org/title/GNOME/Keyring
# need to complete the gnome keyring setup here
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

env _JAVA_AWT_WM_NONREPARENTING=1 MOZ_ENABLE_WAYLAND=1 XDG_SESSION_TYPE=wayland XDG_CURRENT_DESKTOP=sway XDG_SESSION_DESKTOP=sway systemd-cat -t sway sway
