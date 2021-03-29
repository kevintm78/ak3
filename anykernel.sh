# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=trltevzw_kernel
do.devicecheck=1
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=trlte
device.name2=trltetmo
device.name3=trltespr
device.name4=trltevzw
supported.versions=6.0 - 6.1
'; } # end properties

# shell variables
block=/dev/block/platform/msm_sdcc.1/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;

# begin ramdisk changes

### default.prop
backup_file default.prop;
#patch_prop default.prop ro.secure 0;
#patch_prop default.prop ro.debuggable 1;
#patch_prop default.prop ro.adb.secure 0;
patch_prop default.prop persist.sys.usb.config mtp,adb;
append_file default.prop persist.sys.usb.config default-mods;

# end ramdisk changes

write_boot;
## end install

