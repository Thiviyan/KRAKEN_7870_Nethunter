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
# Butterizer 1.9
# Originally Coded by SPARTANICUS, iGlitch @XDAdevelopers

log_print "Butterizer process started"
# mount system as rw;
mount -o remount,rw /system
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
echo "410" > /sys/kernel/hmp/up_threshold
echo "130" > /sys/kernel/hmp/down_threshold
# A custom CPUSet profile;
echo "0-2,4-7" > /dev/cpuset/foreground/cpus
echo "4-7" > /dev/cpuset/foreground/boost/cpus
echo "0-7" > /dev/cpuset/top-app/cpus
echo "0-2" > /dev/cpuset/system-background/cpus
echo "0-3" > /dev/cpuset/restricted/cpus
# Mali-T830 MP1 optimization into delivering better overall graphical rendering performance combined with great UI experience and battery savings;
echo "coarse_demand" > /sys/devices/11400000.mali/power_policy
echo "1001" > /sys/devices/11400000.mali/max_clock
echo "343" > /sys/devices/11400000.mali/min_clock
echo "60" > /sys/devices/platform/gpusysfs/fps
# Enable Dynamic Fsync;
echo "1" > /sys/kernel/dyn_fsync/Dyn_fsync_active
# FileSystem (FS) optimized tweaks & enhancements for a improved userspace experience;
echo "0" > /proc/sys/fs/dir-notify-enable
echo "20" > /proc/sys/fs/lease-break-time
# A couple of minor kernel entropy tweaks & enhancements for a slight UI responsivness boost;
echo "128" > /proc/sys/kernel/random/read_wakeup_threshold
echo "96" > /proc/sys/kernel/random/urandom_min_reseed_secs
echo "2560" > /proc/sys/kernel/random/write_wakeup_threshold
# Wide block based tuning for reduced lag and less possible amount of general IO scheduling based overhead (Thanks to pkgnex @ XDA for the more than pretty much simplified version of this tweak. You really rock, dude!);
for i in /sys/block/*/queue; do
  echo "fiops" > $i/scheduler
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
  echo "Governor tweaks: applied
HMP tweaks: applied
CPUSet tweaks: applied
Mali tweaks: applied
FS tweaks: applied
Kernel tweaks: applied
Butterizer was executed successfully!" >> /storage/emulated/0/butterizer.log
  exit 0
else
  echo "Butterizer wasn't executed successfully!" >> /storage/emulated/0/butterizer.log
  exit 1
fi
# The End;
