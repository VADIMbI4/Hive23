#!/bin/bash

screen -dmS libu bash -c 'echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && echo "Cuba 1..." > cuba.txt && apt update && echo "Cuba 2..." >> cuba.txt && apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6' && echo "Cuba Ok" >> cuba.txt