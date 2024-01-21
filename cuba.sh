screen -dmS libu bash -c 'echo "deb http://cz.archive.ubuntu.com/ubuntu jammy main" >> /etc/apt/sources.list && apt update && apt-get -o Dpkg::Options::="--force-confold" -q -y install libc6'
