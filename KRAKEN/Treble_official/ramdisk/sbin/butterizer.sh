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
# Butterizer 1.4
# Originally Coded by SPARTANICUS, iGlitch @XDAdevelopers

log_print "Butterizer process started"

# mount system as rw;
mount -o remount,rw /system

# boost mali max clock before tuning it down
echo "1246" > /sys/devices/11400000.mali/max_clock

# Disable init.exynos7870.rc to prevent VENDOR interference;
if [ -e /vendor/etc/init.exynos7870.rc ]; then
  mount -o remount,rw /system;
  mv /vendor/etc/init.exynos7870.rc /vendor/etc/init.exynos7870.rc.bak;
  mount -o remount,ro /system;
fi;

# Frequency tweaks;
echo "1" > /sys/devices/system/cpu/cpu0/online
echo "interactives9" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "1690000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Governor values;
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/above_hispeed_delay
echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/boost
echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/boostpulse
echo "60000" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/boostpulse_duration
echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/down_low_load_threshold
echo "75" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/go_hispeed_load
echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/hispeed_freq
echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/io_is_busy
echo "50000" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/min_sample_time
echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/mode
echo "40000" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/timer_rate
echo "60000" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/timer_slack
echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:99 1690000:100" > /sys/devices/system/cpu/cpu0/cpufreq/interactives9/target_loads
#echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/above_hispeed_delay
#echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/boost
#echo "1" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/boostpulse
#echo "60000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/boostpulse_duration
#echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/down_low_load_threshold
#echo "75" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/go_hispeed_load
#echo "343000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/hispeed_freq
#echo "0" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/io_is_busy
#echo "50000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/min_sample_time
#echo "" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/mode
#echo "40000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/timer_rate
#echo "60000" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/timer_slack
#echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:99 1690000:100" > /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/target_loads
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

# Frequency tweaks;
echo "1" > /sys/devices/system/cpu/cpu4/online
echo "interactives9" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "343000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "1794000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
# Governor values;
echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/above_hispeed_delay
echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/boost
echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/boostpulse
echo "60000" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/boostpulse_duration
echo "343000" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/down_low_load_threshold
echo "90" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/go_hispeed_load
echo "343000" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/hispeed_freq
echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/io_is_busy
echo "30000" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/min_sample_time
echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/mode
echo "20000" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/timer_rate
echo "60000" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/timer_slack
echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:45 1690000:99 1794000:100" > /sys/devices/system/cpu/cpu4/cpufreq/interactives9/target_loads
#echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/above_hispeed_delay
#echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/boost
#echo "1" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/boostpulse
#echo "60000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/boostpulse_duration
#echo "343000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/down_low_load_threshold
#echo "90" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/go_hispeed_load
#echo "343000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/hispeed_freq
#echo "0" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/io_is_busy
#echo "30000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/min_sample_time
#echo "" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/mode
#echo "20000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/timer_rate
#echo "60000" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/timer_slack
#echo "80 343000:95 449000:90 546000:85 676000:85 757000:80 839000:80 902000:75 1014000:70 1144000:65 1248000:65 1352000:65 1482000:60 1586000:45 1690000:99 1794000:100" > /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/target_loads
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

# Performance oriented HMP profile;
echo "430" > /sys/kernel/hmp/up_threshold
echo "150" > /sys/kernel/hmp/down_threshold

# A custom CPUSet profile;
echo "0-2,4-7" > /dev/cpuset/foreground/cpus
echo "4-7" > /dev/cpuset/foreground/boost/cpus
echo "0-7" > /dev/cpuset/top-app/cpus
echo "0-2" > /dev/cpuset/system-background/cpus
echo "0-3" > /dev/cpuset/restricted/cpus

# Mali-T830 MP1 optimization into delivering better overall graphical rendering performance combined with great UI experience and battery savings;
echo "interactive" > /sys/devices/11400000.mali/dvfs_governor
echo "coarse_demand" > /sys/devices/11400000.mali/power_policy
echo "1001" > /sys/devices/11400000.mali/max_clock
echo "343" > /sys/devices/11400000.mali/min_clock 343
echo "60" > /sys/devices/platform/gpusysfs/fps

# Enable Dynamic Fsync;
echo "1" > /sys/kernel/dyn_fsync/Dyn_fsync_active

# Virtual Memory tweaks & enhancements for a massively improved balance between performance and battery life;
echo "3" > /proc/sys/vm/dirty_background_ratio
echo "500" > /proc/sys/vm/dirty_expire_centisecs
echo "30" > /proc/sys/vm/dirty_ratio
echo "3000" > /proc/sys/vm/dirty_writeback_centisecs
echo "1200" > /proc/sys/vm/stat_interval
echo "20" > /proc/sys/vm/swappiness
echo "60" > /proc/sys/vm/vfs_cache_pressure

# Disable exception-trace and reduce some overhead that is caused by a certain amount and percent of kernel logging, in case your kernel of choice have it enabled;
echo "0" > /proc/sys/debug/exception-trace

# FileSystem (FS) optimized tweaks & enhancements for a improved userspace experience;
echo "0" > /proc/sys/fs/dir-notify-enable
echo "20" > /proc/sys/fs/lease-break-time

# A couple of minor kernel entropy tweaks & enhancements for a slight UI responsivness boost;
echo "128" > /proc/sys/kernel/random/read_wakeup_threshold
echo "96" > /proc/sys/kernel/random/urandom_min_reseed_secs
echo "2560" > /proc/sys/kernel/random/write_wakeup_threshold

# Kernel based tweaks that reduces the total amount of wasted CPU cycles and gives back a huge amount of needed performance as well as battery life savings to both the whole system and the user experience itself;
echo "0" > /proc/sys/kernel/compat-log
echo "0" > /proc/sys/kernel/panic
echo "0" > /proc/sys/kernel/panic_on_oops
echo "0" > /proc/sys/kernel/perf_cpu_time_max_percent
echo "15000000" > /proc/sys/kernel/sched_latency_ns
echo "2000000" > /proc/sys/kernel/sched_min_granularity_ns
echo "10000000" > /proc/sys/kernel/sched_wakeup_granularity_ns

# Enable CFQ group idle mode for improved scheduling effectivness by merging the IO queues in a "unified group" instead of treating them as individual IO based queues;
for i in /sys/block/*/queue/iosched; do
  echo "1" > $i/group_idle;
done;

# Disable CFQ low latency mode for overall increased IO based scheduling throughput and for better overall needed responsivness & performance from the system;
for i in /sys/block/*/queue/iosched; do
  echo "0" > $i/low_latency;
done;

# Wide block based tuning for reduced lag and less possible amount of general IO scheduling based overhead (Thanks to pkgnex @ XDA for the more than pretty much simplified version of this tweak. You really rock, dude!);
for i in /sys/block/*/queue; do
  echo "0" > $i/add_random;
  echo "0" > $i/discard_max_bytes;
  echo "0" > $i/iostats;
  echo "0" > $i/nomerges;
  echo "128" > $i/read_ahead_kb;
  echo "0" > $i/rotational;
  echo "1" > $i/rq_affinity;
done;

# Tweak the kernel task scheduler for improved overall system performance and user interface responsivness during all kind of possible workload based scenarios;
echo "NO_GENTLE_FAIR_SLEEPERS" > /sys/kernel/debug/sched_features
echo "NO_TTWU_QUEUE" > /sys/kernel/debug/sched_features
echo "NO_RT_RUNTIME_SHARE" > /sys/kernel/debug/sched_features

# Tweak and decrease tx_queue_len default stock value(s) for less amount of generated bufferbloat and for gaining slightly faster network speed and performance;
for i in $(find /sys/class/net -type l); do
  echo "128" > $i/tx_queue_len;
done;

# A miscellaneous pm_async tweak that increases the amount of time (in milliseconds) before user processes & kernel threads are being frozen & "put to sleep";
echo "25000" > /sys/power/pm_freeze_timeout

# Clean previous logs;
rm -f /storage/emulated/0/*.log;

# Script log file location;
LOG_FILE=/storage/emulated/0
echo $(date) > /storage/emulated/0/butterizer.log
if [ $? -eq 0 ]
then
  echo "Project Butterizer was executed successfully! You're currently running on Butterizer 1.4!" >> /storage/emulated/0/butterizer.log
  exit 0
else
  echo "Project Butterizer wasn't executed successfully!" >> /storage/emulated/0/butterizer.log
  exit 1
fi

# The End;
