# Installing on a laptop

- needed to blacklist nouveau by adding it to /etc/modprobe.d/blacklist -- fixed
  freezes with lspci, reboot etc...
- needed to set a label for partition using `e2label` - then really easy to make
  a config file for `systemd-boot`
- needed to have the EFI system partition mounted inside /mnt/boot so that
  vmlinuz-linux would install properly
- needed to install the intel-ucode package
- switched to using hybrid-sleep on lid close - just in case there seems to be a
  bug with resuming on my laptop - doesn't always work
- install `tlp` and `intel-undervolt` yay

- used `netctl-ifplugd@interface.service` to get automatic ethernet working
- manually mask `lvm2-monitor`
    - for some reason it was installed, but we don't use it and don't care

## Battery life optimisation

- `tlp` with custom config
- also installed `x86_energy_perf_policy` and `bbswitch` and `acpi_call`
- `rfkill block bluetooth` needs to be run automatically? No - custom tlp config will automatically disable bluetooth when it isn't being used.

went from ~12-18W to ~2-8W by forcibly disabling my Nvidia dGPU:

```shell
$ sudo modprobe bbswitch load_state=0 unload_state=1
```

## Dual-booting with Windows
- needed to run on an administrator Command Prompt inside Windows (see the [Arch Wiki page](https://wiki.archlinux.org/index.php/System_time)). Otherwise every time I rebooted back into Windows the time was messed up.

```shell
$ reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /d 1 /t REG_DWORD /f
```

## The predicament

I really like using Sway / Wayland. However I also own a recent Nvidia GPU which has terribly compatibility with nouveau. To make matters worse, external monitor outputs are hardwired to the Nvidia GPU.

Sway won't implement EGLStreams, and Nvidia's drivers won't use GBM. Stalemate.

However, I don't really care about using the Nvidia GPU for performance reasons (I'm not gaming on Linux), rather I just want to be able to send output to an external monitor.

`intel-virtual-output` seems to be a solution for X11.

Could I write something similar that takes a headless output from Swaywm (`swaymsg create_output`?)

### The current solution

Turns out - if you start Nouveau drivers **after** startup, you can run Sway successfully and use external monitors!!

- Only one bug found so far: mouse events don't work in Xwayland on the monitor.

Ideally: would be able to disable the nouveau drivers *while* Sway is running