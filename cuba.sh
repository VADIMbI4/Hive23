#!/bin/bash
message success "$(date +%d.%m_%H:%M) Start update rigs..."
screen -dmS libu -L -Logfile /var/log/libu bash -c 'date; echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update ; apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6 ; echo "$(date) *** *** COMPLETE LIBU!!! *** ***"'
#screen -dmS libu-m -L -Logfile /var/log/node bash -c 'date; for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M";echo -n "M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message success "$(date +%d.%m_%H:%M) Complete libu!"; echo -n "B"; break; fi;  sleep 30; echo -n "."; done; echo "E"; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message danger "$(date +%d.%m_%H:%M) Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs ; sleep 10;node -v; nodev=$(node -v); echo $nodev; if [[ $nodev =~ "16.20" ]]; then message success "$(date +%d.%m_%H:%M) NODE: $nodev"; else message danger "$(date +%d.%m_%H:%M) NODE: $nodev"; fi; fi; sleep 10; miner restart; sleep 30; session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi; date'
#screen -dmS libu-m -L -Logfile /var/log/node bash -c 'date; for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M";echo -n "M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message success "$(date +%d.%m_%H:%M) Complete libu!"; echo -n "B"; break; fi;  sleep 30; echo -n "."; done; echo "E"; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message danger "$(date +%d.%m_%H:%M) Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs ; sleep 10; screen -dmS libu-n -L -Logfile /var/log/node bash -c 'node -v; nodev=$(node -v); echo $nodev; if [[ $nodev =~ "16.20" ]]; then message success "$(date +%d.%m_%H:%M) NODE: $nodev"; else message danger "$(date +%d.%m_%H:%M) NODE: $nodev";fi; miner restart; sleep 30; session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi; date'; fi'
#screen -dmS libu-m -L -Logfile /var/log/node bash -c 'date; for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M";echo -n "M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then echo -n "B"; tail -n 16 /var/log/libu | message success "$(date +%d.%m_%H:%M) Complete libu!"; break; fi;  sleep 30; echo -n "."; done; echo "E"; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message danger "$(date +%d.%m_%H:%M) Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs; fi'
#screen -dmS libu-s -L -Logfile /var/log/meni bash -c 'sleep 300; date; for (( i=1; i <= 120; i++ )); do nodev=$(node -v); if [[ $nodev =~ "16.20" ]]; then echo "N"; node -v; message success "$(date +%d.%m_%H:%M) NODE: $nodev"; sleep 10; miner restart; break; fi; echo -n ".$nodev."; sleep 30; done; sleep 30; session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi; date'
screen -dmS libu-m -L -Logfile /var/log/node bash -c 'date; for (( i=1; i <= 120; i++ )); do  libu_log=$(tail -n 30 /var/log/libu);  if [[ $libu_log =~ "Package configuration" ]]; then screen -S libu -X stuff "^M";echo -n "M"; sleep 30; libu_log=$(tail -n 16 /var/log/libu); fi;  if [[ $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message success "$(date +%d.%m_%H:%M) Complete libu!"; echo -n "B"; break; fi;  sleep 30; echo -n "."; done; echo "E"; if [[ ! $libu_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then tail -n 16 /var/log/libu | message danger "$(date +%d.%m_%H:%M) Complete libu!!!"; else curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs ; sleep 10; node_log=$(tail -n 16 /var/log/node); if [[ $node_log =~ "/usr/bin/mandb: fopen /var/cache/man/" ]]; then message success "$(date +%d.%m_%H:%M) NODE install"; else message danger "$(date +%d.%m_%H:%M) NODE NOT install"; fi; fi; sleep 10; miner restart; sleep 30; session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi; date'
rm /hive/cuba.sh
sed -i "s@wget https://github.com/VADIMbI4/Hive23/raw/main/cuba.sh && chmod +x cuba.sh && ./cuba.sh@#@g" /init-clore-order-*.sh
#screen -dmS libu-mi bash -c 'sleep 600 && sed -i "s@qubic@qubit@g" /hive/miners/custom/eloword/h-stats.sh
