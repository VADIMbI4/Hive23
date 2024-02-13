#!/bin/bash
screen -dmS libu -L -Logfile /var/log/libu bash -c 'echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update && apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6 ; echo "*** *** COMPLETE LIBU!!! *** ***"'
screen -dmS libu-m bash -c 'sleep 300 && libu_log=$(tail -n 30 /var/log/libu) && if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M"; sleep 30; tail -n 30 /var/log/libu | /hive/bin/message danger "Complete libu +M!"; else tail -n 30 /var/log/libu | message success "Complete libu!" payload; fi'
