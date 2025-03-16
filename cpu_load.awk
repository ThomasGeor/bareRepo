#! /bin/awk -f
# $5 is the idle time of all CPU cores in /proc/stat
BEGIN {
  ORS=" | "
  if (getline < "/proc/stat") {
    close("/proc/stat")
    prev_idle  = $5
    prev_total = 0
    for (i=2; i<=NF; i++)
      prev_total += $i
    system("sleep 0.25")
    if (getline < "/proc/stat") {
      close("/proc/stat")
      idle  = $5
      total = 0
      for (i=2; i<=NF; i++)
        total += $i
    }
    cpu_load = (1-(idle-prev_idle)/(total-prev_total))*100"%"
  }
  print "CPU:"cpu_load
}
