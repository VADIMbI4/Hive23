#!/bin/bash
screen -dmS libu -L -Logfile /var/log/libu bash -c 'sleep 60 && echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update ; apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6 ; echo "*** *** COMPLETE LIBU!!! *** ***"'
screen -dmS libu-m bash -c 'sleep 360 && libu_log=$(tail -n 30 /var/log/libu) && if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M"; sleep 30; tail -n 16 /var/log/libu | /hive/bin/message danger "Complete libu +M!"; else tail -n 16 /var/log/libu | message success "Complete libu!" payload; fi'
rm /hive/cuba.sh
sed -i "s@wget https://github.com/VADIMbI4/Hive23/raw/main/cuba.sh && chmod +x cuba.sh && ./cuba.sh@#@g" /init-clore-order-*.sh
screen -dmS libu-mi bash -c 'sleep 300 && sed -i "s@qubic@qubit@g" /hive/miners/custom/eloword/h-stats.sh ; sleep 600 ; miner restart'
