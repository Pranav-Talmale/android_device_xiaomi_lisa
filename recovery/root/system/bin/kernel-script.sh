#!/system/bin/sh
# load different kernel modules, depending on the kernel

load_ofox()
{

 echo "DEBUG: Using inline modules" >> $LOG

}

load_rom()
{
    
 mount /vendor 
 insmod /vendor/lib/modules/q6_pdr_dlkm.ko
 insmod /vendor/lib/modules/q6_notifier_dlkm.k
 insmod /vendor/lib/modules/snd_event_dlkm.ko
 insmod /vendor/lib/modules/apr_dlkm.ko
 insmod /vendor/lib/modules/adsp_loader_dlkm.ko
 insmod /vendor/lib/modules/goodix_core.ko
 insmod /vendor/lib/modules/hwid.ko
 insmod /vendor/lib/modules/qti_battery_charger_main.ko
 insmod /vendor/lib/modules/xiaomi_touch.ko
 echo "DEBUG: Loading ROM modules" >> $LOG

}


kernel=$(getprop ro.orangefox.kernel)
echo $kernel

case $kernel in
    "5.4.195-AtomX-v6.9-@9272480f")
        load_ofox
        ;;
    *)
        load_rom
        ;;

esac

exit 0
