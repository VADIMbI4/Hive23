#!/bin/bash
rm /hive/minerr.sh
#session_count=`session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then 
miner restart | message success "$(date +%d.%m_%H:%M) Miner restart..." payload
#; fi;
