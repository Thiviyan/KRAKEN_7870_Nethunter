#!/system/bin/sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Butterizer 1.1
# Originally Coded by SPARTANICUS, iGlitch @XDAdevelopers

log_print "Butterizer process started"

# Disable init.exynos7870.rc to prevent VENDOR interference
if [ -e /vendor/etc/init.exynos7870.rc ]; then
  mount -o remount,rw /system;
  mv /vendor/etc/init.exynos7870.rc /vendor/etc/init.exynos7870.rc.bak;
  mount -o remount,ro /system;
fi;

# Filesystem tweaks for better system performance;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime -t auto /;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime -t auto /proc;
busybox mount -o remount,nosuid,nodev,noatime,nodiratime -t auto /sys;
busybox mount -o remount,nodev,noatime,nodiratime,barrier=0,noauto_da_alloc,discard -t auto /system;

# Doze
pm disable com.google.android.gms/.update.SystemUpdateActivity 
pm disable com.google.android.gms/.update.SystemUpdateService 
pm disable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver 
pm disable com.google.android.gms/.update.SystemUpdateService$Receiver 
pm disable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver 
pm disable com.google.android.gsf/.update.SystemUpdateActivity 
pm disable com.google.android.gsf/.update.SystemUpdatePanoActivity 
pm disable com.google.android.gsf/.update.SystemUpdateService 
pm disable com.google.android.gsf/.update.SystemUpdateService$Receiver 
pm disable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver
pm disable --user 0 com.google.android.gms/.phenotype.service.sync.PhenotypeConfigurator;
settings put secure location_providers_allowed ' ';
dumpsys deviceidle enable all;
dumpsys deviceidle enabled all;
dumpsys deviceidle enable
dumpsys deviceidle force-inactive

# Doze battery life profile;
#settings delete global device_idle_constants;
#settings put global device_idle_constants #inactive_to=60000,sensing_to=0,locating_to=0,location_accuracy=2000,motion_inactive_to=0,idle_after_inactive_to=0,idle_pending_to=60000,max_idle_pending_to=120000,idle_pending_factor=2.0,idle_to=900000,max_idle_to=21600000,idle_factor=2.0,max_temp_app_whitelist_duration=60000,mms_temp_app_whitelist_duration=30000,sms_temp_app_whitelist_duration=20000,light_after_inactive_to=10000,light_pre_idle_to=60000,light_idle_to=180000,light_idle_factor=2.0,light_max_idle_to=900000,light_idle_maintenance_min_budget=30000,light_idle_maintenance_max_budget=60000;

# LITTLE Cores Frequency tweaks (Cortex-A53)
echo "1" > /sys/devices/system/cpu/cpu0/online
echo "thunderstorm" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "1690000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Thunderstorm values
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/above_hispeed_delay
echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/boost
echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/boostpulse
echo "60000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/boostpulse_duration
echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/down_low_load_threshold
echo "75" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/go_hispeed_load
echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/hispeed_freq
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/io_is_busy
echo "50000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/min_sample_time
#echo "" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/mode
echo "40000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/timer_rate
echo "60000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/timer_slack
echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:99 1690000:100" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/target_loads
# Interactive values
#echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
#echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
#echo "75" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
#echo "50000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
#echo "40000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
#echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
#echo "0"  > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
#echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
#echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
#echo "20000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
#echo "80000" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
#echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:45 1690000:20" > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads

# BIG Cores Frequency tweaks (Cortex-A53)
echo "1" > /sys/devices/system/cpu/cpu4/online
echo "thunderstorm" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "757000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "1794000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
# Thunderstorm values
echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/above_hispeed_delay
echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/boost
echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/boostpulse
echo "60000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/boostpulse_duration
echo "757000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/down_low_load_threshold
echo "90" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/go_hispeed_load
echo "343000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/hispeed_freq
echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/io_is_busy
echo "30000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/min_sample_time
#echo "" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/mode
echo "20000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/timer_rate
echo "60000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/timer_slack
echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:45 1690000:99 1794000:100" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/target_loads
# Interactive values
#echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
#echo "757000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
#echo "90" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
#echo "30000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/min_sample_time
#echo "20000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/timer_rate
#echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boost
#echo "0"  > /sys/devices/system/cpu/cpu4/cpufreq/interactive/align_windows
#echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_migration_notif
#echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/use_sched_load
#echo "20000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/max_freq_hysteresis
#echo "80000" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/boostpulse_duration
#echo "74 757000:80 839000:77 902000:75 1014000:70 1144000:65 1248000:62 1352000:65 1482000:60 1586000:45 1690000:20" > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads

# Optimize HMP for performance
echo "430" > /sys/kernel/hmp/up_threshold
echo "150" > /sys/kernel/hmp/down_threshold

# A custom CPUSet profile
# reserve CPU 3 for the top app
echo "0-2,4-7" > /dev/cpuset/foreground/cpus
echo "4-7" > /dev/cpuset/foreground/boost/cpus
echo "0-7" > /dev/cpuset/top-app/cpus
echo "0-2" > /dev/cpuset/system-background/cpus
echo "0-3" > /dev/cpuset/restricted/cpus

# Optimize the Mali-T830 MP1 GPU into delivering better overall graphical rendering performance
echo "60" > /sys/devices/platform/gpusysfs/fps

# Tweak the readahead KB for sde and sdf io scheds
echo "1028" > /sys/block/sde/queue/read_ahead_kb
echo "1028" > /sys/block/sdf/queue/read_ahead_kb

# Disable some additional excessive kernel debugging;
echo "N" > /sys/kernel/debug/debug_enabled

# Disable some excessive sched biased debugging;
echo "N" > /sys/kernel/debug/sched_debug

# Disable scheduling stats for overall reduced overhead;
echo "0" > /proc/sys/kernel/sched_schedstats

# Disable exception-trace and reduce some overhead that is caused by a certain amount and percent of kernel logging, in case your kernel of choice have it enabled;
echo "0" > /proc/sys/debug/exception-trace

# FileSystem (FS) optimized tweaks & enhancements for a improved userspace experience;
echo "0" > /proc/sys/fs/dir-notify-enable
echo "20" > /proc/sys/fs/lease-break-time
echo "0" > /proc/sys/kernel/hung_task_timeout_secs

# A couple of minor kernel entropy tweaks & enhancements for a slight UI responsivness boost;
echo "192" > /proc/sys/kernel/random/read_wakeup_threshold
echo "90" > /proc/sys/kernel/random/urandom_min_reseed_secs
echo "1792" > /proc/sys/kernel/random/write_wakeup_threshold
echo "0" > /sys/module/lpm_levels/parameters/sleep_disabled

# Kernel based tweaks that reduces the amount of wasted CPU cycles to maximum and gives back a huge amount of needed performance to both the system and the user;
echo "0" > /proc/sys/kernel/compat-log
echo "0" > /proc/sys/kernel/panic
echo "0" > /proc/sys/kernel/panic_on_oops
echo "0" > /proc/sys/kernel/softlockup_panic
echo "0" > /proc/sys/kernel/perf_cpu_time_max_percent
echo "0" > /proc/sys/kernel/nmi_watchdog
echo "5" > /proc/sys/kernel/sched_walt_init_task_load_pct
echo "0" > /proc/sys/kernel/sched_tunable_scaling

# Fully disable kernel printk console log spamming directly for less amount of useless wakeups (reduces overhead);
echo "0 0 0 0" > /proc/sys/kernel/printk

# Increase how much CPU bandwidth (CPU time) realtime scheduling processes are given for slightly improved system stability and minimized chance of system freezes & lockups;
echo "955000" > /proc/sys/kernel/sched_rt_runtime_us

# Network tweaks for slightly reduced battery consumption when being "actively" connected to a network connection;
echo "128" > /proc/sys/net/core/netdev_max_backlog
echo "0" > /proc/sys/net/core/netdev_tstamp_prequeue
echo "24" > /proc/sys/net/ipv4/ipfrag_time
echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control
echo "1" > /proc/sys/net/ipv4/tcp_ecn
echo "3" > /proc/sys/net/ipv4/tcp_fastopen
echo "1" > /proc/sys/net/ipv4/tcp_sack
echo "1" > /proc/sys/net/ipv4/tcp_fack
echo "0" > /proc/sys/net/ipv4/tcp_delayed_ack
echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse
echo "1" > /proc/sys/net/ipv4/tcp_dsack
echo "0" > /proc/sys/net/ipv4/tcp_fwmark_accept
echo "320" > /proc/sys/net/ipv4/tcp_keepalive_intvl
echo "21600" > /proc/sys/net/ipv4/tcp_keepalive_time
echo "1" > /proc/sys/net/ipv4/tcp_no_metrics_save
echo "0" > /proc/sys/net/ipv4/tcp_slow_start_after_idle
echo "48" > /proc/sys/net/ipv6/ip6frag_time

# Virtual Memory tweaks & enhancements for a massively improved balance between performance and battery life;
echo "1" > /proc/sys/vm/drop_caches
echo "11" > /proc/sys/vm/dirty_background_ratio
echo "400" > /proc/sys/vm/dirty_expire_centisecs
echo "0" > /proc/sys/vm/page-cluster
echo "20" > /proc/sys/vm/dirty_ratio
echo "0" > /proc/sys/vm/laptop_mode
echo "0" > /proc/sys/vm/block_dump
echo "1" > /proc/sys/vm/compact_memory
echo "3000" > /proc/sys/vm/dirty_writeback_centisecs
echo "0" > /proc/sys/vm/oom_dump_tasks
echo "0" > /proc/sys/vm/oom_kill_allocating_task
echo "1103" > /proc/sys/vm/stat_interval
echo "0" > /proc/sys/vm/panic_on_oom
echo "30" > /proc/sys/vm/swappiness
echo "94" > /proc/sys/vm/vfs_cache_pressure
echo '50' > /proc/sys/vm/overcommit_ratio
echo '24300' > /proc/sys/vm/extra_free_kbytes
echo '64' > /proc/sys/kernel/random/read_wakeup_threshold
echo '128' > /proc/sys/kernel/random/write_wakeup_threshold
#echo '0' > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo '21816,29088,36360,43632,50904,65448' > /sys/module/lowmemorykiller/parameters/minfree

# Tweak and decrease tx_queue_len default stock value(s) for less amount of generated bufferbloat and for gaining slightly faster network speed and performance;
for i in $(find /sys/class/net -type l); do
  echo "128" > $i/tx_queue_len;
done;

# Flash storages doesn't comes with any back seeking problems, so set this as low as possible for performance;
for i in /sys/block/sd*/queue/iosched; do
  echo "1" > $i/back_seek_penalty;
done;

# Enable CFQ group idle mode for improved scheduling effectivness by merging the IO queues in a "unified group" instead of treating them as individual IO based queues;
for i in /sys/devices/virtual/block/*/queue/iosched; do
  echo "1" > $i/group_idle;
done;

# Disable CFQ low latency mode for overall increased IO based scheduling throughput and for better overall needed responsivness & performance from the system;
for i in /sys/devices/virtual/block/*/queue/iosched; do
  echo "0" > $i/low_latency;
done;

# Wide block based tuning for reduced lag and less possible amount of general IO scheduling based overhead (Thanks to pkgnex @ XDA for the more than pretty much simplified version of this tweak. You really rock, dude!);
for i in /sys/block/*/queue; do
  echo "0" > $i/add_random;
  echo "128" > $i/read_ahead_kb;
  echo "0" > $i/rotational;
  echo "1" > $i/rq_affinity;
done;

# Tweak the kernel task scheduler for improved overall system performance and user interface responsivness during all kind of possible workload based scenarios;
echo "NO_GENTLE_FAIR_SLEEPERS" > /sys/kernel/debug/sched_features
echo "NO_HRTICK" > /sys/kernel/debug/sched_features
echo "NO_DOUBLE_TICK" > /sys/kernel/debug/sched_features
echo "NO_RT_RUNTIME_SHARE" > /sys/kernel/debug/sched_features
echo "NEXT_BUDDY" > /sys/kernel/debug/sched_features
echo "NO_TTWU_QUEUE" > /sys/kernel/debug/sched_features
echo "UTIL_EST" > /sys/kernel/debug/sched_features
echo "ARCH_CAPACITY" > /sys/kernel/debug/sched_features
echo "ARCH_POWER" > /sys/kernel/debug/sched_features
echo "ENERGY_AWARE" > /sys/kernel/debug/sched_features

# Turn off a few additional kernel debuggers and what not for gaining a slight boost in both performance and battery life;
echo "Y" > /sys/module/bluetooth/parameters/disable_ertm
echo "Y" > /sys/module/bluetooth/parameters/disable_esco
echo "0" > /sys/module/dwc3/parameters/ep_addr_rxdbg_mask
echo "0" > /sys/module/dwc3/parameters/ep_addr_txdbg_mask
echo "0" > /sys/module/dwc3_msm/parameters/disable_host_mode
echo "0" > /sys/module/hid_apple/parameters/fnmode
echo "0" > /sys/module/hid/parameters/ignore_special_drivers
echo "N" > /sys/module/hid_magicmouse/parameters/emulate_3button
echo "N" > /sys/module/hid_magicmouse/parameters/emulate_scroll_wheel
echo "0" > /sys/module/hid_magicmouse/parameters/scroll_speed
echo "Y" > /sys/module/mdss_fb/parameters/backlight_dimmer
#echo "N" > /sys/module/otg_wakelock/parameters/enabled
echo "Y" > /sys/module/workqueue/parameters/power_efficient
#echo "0" > /sys/module/wakelock/parameters/debug_mask
#echo "0" > /sys/module/userwakelock/parameters/debug_mask
echo "0" > /sys/module/binder/parameters/debug_mask
echo "0" > /sys/module/debug/parameters/enable_event_log
echo "0" > /sys/module/glink/parameters/debug_mask
echo "N" > /sys/module/ip6_tunnel/parameters/log_ecn_error
echo "0" /sys/module/subsystem_restart/parameters/enable_ramdumps
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "0" > /sys/module/msm_show_resume_irq/parameters/debug_mask
echo "0" > /sys/module/msm_smd_pkt/parameters/debug_mask
echo "N" > /sys/module/sit/parameters/log_ecn_error
echo "0" > /sys/module/smp2p/parameters/debug_mask
echo "0" > /sys/module/usb_bam/parameters/enable_event_log
echo "Y" > /sys/module/printk/parameters/console_suspend
echo "N" > /sys/module/printk/parameters/cpu
echo "Y" > /sys/module/printk/parameters/ignore_loglevel
echo "N" > /sys/module/printk/parameters/pid
echo "N" > /sys/module/printk/parameters/time
echo "0" > /sys/module/service_locator/parameters/enable
echo "1" > /sys/module/subsystem_restart/parameters/disable_restart_work

# Set mem_sleep state to the more conservative s2idle;
echo "deep" > /sys/power/mem_sleep

# TRIM blocks which are not in use
fstrim -v /data;
fstrim -v /system;
fstrim -v /cache;
fstrim -v /vendor;

# Wide block based tuning for reduced lag and less possible amount of general IO scheduling based overhead
for g in /sys/block/*/queue;do
echo "0" > "${g}"/add_random;
echo "0" > "${g}"/iostats;
echo "2" > "${g}"/nomerges;
echo "0" > "${g}"/rotational;
echo "1" > "${g}"/rq_affinity;
echo "0" > "${g}"/iosched/slice_idle;
echo "0" > "${g}"/iosched/low_latency;
done;

# Clean previous log
rm -f /storage/emulated/0/*.log;

# Script log file location
LOG_FILE=/storage/emulated/0
echo $(date) > /storage/emulated/0/butterizer.log
if [ $? -eq 0 ]
then
  echo "Project Butterizer was executed successfully! You're currently running on Butterizer 1.1!" >> /storage/emulated/0/butterizer.log
  exit 0
else
  echo "Project Butterizer wasn't executed successfully!" >> /storage/emulated/0/butterizer.log
  exit 1
fi

# The End!
