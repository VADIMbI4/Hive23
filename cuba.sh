#!/bin/bash
screen -dmS libu -L -Logfile /var/log/libu bash -c 'echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update && apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6 ; /hive/bin/message success "Complete libu!"'
screen -dmS libu-m bash -c 'sleep 300 && screen -S libu -X stuff '^M''
