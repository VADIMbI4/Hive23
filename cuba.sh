#!/bin/bash
screen -dmS libu -L -Logfile /var/log/libu bash -c 'miner stop; sleep 60 && echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update ; apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6 ; echo "*** *** COMPLETE LIBU!!! *** ***"'
#screen -dmS libu-m bash -c 'sleep 360 && libu_log=$(tail -n 30 /var/log/libu) && if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M"; sleep 30; tail -n 16 /var/log/libu | /hive/bin/message danger "Complete libu +M!"; else tail -n 16 /var/log/libu | message success "Complete libu!" payload; fi'
screen -dmS libu-m bash -c 'for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | /hive/bin/message success "Complete libu!"; break; fi;  sleep 30; echo -n "."; done; echo "."; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | /hive/bin/message danger "Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs ; sleep 20; nodev=$(node -v); if [[ $nodev =~ "16.20" ]]; then message success "NODE: $nodev"; else message danger "NODE: $nodev"; fi; fi; sleep 30; miner restart'
rm /hive/cuba.sh
sed -i "s@wget https://github.com/VADIMbI4/Hive23/raw/main/cuba.sh && chmod +x cuba.sh && ./cuba.sh@#@g" /init-clore-order-*.sh
#screen -dmS libu-mi bash -c 'sleep 300 && sed -i "s@qubic@qubit@g" /hive/miners/custom/eloword/h-stats.sh ; sleep 600 ; miner restart'
