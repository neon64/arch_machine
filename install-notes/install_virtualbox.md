# Installing inside a virtual machine

Follow the instructions on the [Arch Wiki](https://wiki.archlinux.org/index.php/VirtualBox#Set_optimal_framebuffer_resolution) in order to get a full HD screen working nicely. Update: Arch Wiki doesn't seem to help - try these instead:
 - setting GRUB_GFX_MODE inside `/etc/default/grub` works if I'm booting through VirtualBox with BIOS and Grub, however I can't use that with systemd-boot and UEFI boot.
 - for UEFI and VMSVGA graphics, the solution was to run the    following
    in order to get Full HD screen inside a VM.

    ```bash
    $ VBoxManage setextradata "name_of_vm" VBoxInternal2/EfiGraphicsResolution 1920x1080
    ```

## Raw disk access

I'm currently using [raw disk access](https://www.virtualbox.org/manual/ch09.html#rawdisk) to use a dual-booted Arch installation from Windows.

It works well except there's no read access to the EFI system partition (presumably because Windows is using it).

 - this caused me much grief once when I updated the Linux kernel while inside the VirtualBox host
    1. pacman tried to write to `/boot`, which silently failed because VirtualBox only has read-only access to the EFI system partition.
    2. Then my kernel version was out of sync with everyting else in the system (e.g.: kernel modules) and everything broke down
    3. I couldn't boot, mounting `/boot` failed, unknown filesystem type `vfat`, no Intel graphics drivers??.
    4. Booting from the `archiso` and reinstalling `linux` fixed everything though.

Also don't boot up Linux on real hardware, while it is currently in a hibernated state inside a hibernated Windows partition. *Bad Things* will happen!

 - Linux doesn't know it is still technically running.
 - nearly broke my file system - very scary errors on boot
 - fortunately removing certain corrupt inodes with fsck seems to have done the trick