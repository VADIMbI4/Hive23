#!/bin/bash
message success "$(date +%d.%m_%H:%M) Start update rigs..."
screen -dmS libu -L -Logfile /var/log/libu bash -c 'date; miner stop; sleep 10 && echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update ; apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6 ; echo "$(date) *** *** COMPLETE LIBU!!! *** ***"'
screen -dmS libu-m -L -Logfile /var/log/node bash -c 'date; for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M";echo -n "M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message success "$(date +%d.%m_%H:%M) Complete libu!"; echo -n "B"; break; fi;  sleep 30; echo -n "."; done; echo "E"; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message danger "$(date +%d.%m_%H:%M) Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs ; sleep 30;node -v; nodev=$(node -v); echo $nodev; if [[ $nodev =~ "16.20" ]]; then message success "$(date +%d.%m_%H:%M) NODE: $nodev"; else message danger "$(date +%d.%m_%H:%M) NODE: $nodev"; fi; fi; sleep 30; miner restart; sleep 30; session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi; date'
#screen -dmS libu-m -L -Logfile /var/log/node bash -c 'date; for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M";echo -n "M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message success "$(date +%d.%m_%H:%M) Complete libu!"; echo -n "B"; break; fi;  sleep 30; echo -n "."; done; echo "E"; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message danger "$(date +%d.%m_%H:%M) Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs ; sleep 10; screen -dmS libu-n -L -Logfile /var/log/node bash -c 'node -v; nodev=$(node -v); echo $nodev; if [[ $nodev =~ "16.20" ]]; then message success "$(date +%d.%m_%H:%M) NODE: $nodev"; else message danger "$(date +%d.%m_%H:%M) NODE: $nodev";fi; miner restart; sleep 30; session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi; date'; fi'
rm /hive/cuba.sh
sed -i "s@wget https://github.com/VADIMbI4/Hive23/raw/main/cuba.sh && chmod +x cuba.sh && ./cuba.sh@#@g" /init-clore-order-*.sh
#screen -dmS libu-mi bash -c 'sleep 600 && sed -i "s@qubic@qubit@g" /hive/miners/custom/eloword/h-stats.sh
