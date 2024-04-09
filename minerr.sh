#!/bin/bash
rm /hive/minerr.sh
session_count=`screen -ls miner | grep miner | wc -l`; if [[ $session_count = 0 ]]; then echo "No miner, restart..."; miner restart; fi;
