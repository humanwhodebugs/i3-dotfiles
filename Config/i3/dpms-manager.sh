#!/bin/bash

set_dpms() {
    if [ "$(cat /sys/class/power_supply/AC/online)" -eq "1" ]; then
        # Jika laptop sedang charging
        xset dpms 0 0 0  # Nonaktifkan timeout
        xset s off        # Nonaktifkan screensaver
    else
        # Jika laptop sedang discharging
        xset dpms 600 600 600  # Timeout 600 detik
        xset s 600             # Screensaver 600 detik
    fi
}

while true; do
    set_dpms
    sleep 10  # Cek status setiap 10 detik
done