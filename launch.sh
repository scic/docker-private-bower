#!/bin/bash

chmod -R 600 /root/.ssh

# convert DOS to Unix line endings due to https://github.com/Hacklone/private-bower/issues/272
sed -i $'s/\r$//' /usr/local/lib/node_modules/private-bower/bin/private-bower

if [ ! -z "$ADDRESS" ]; then
	sed -i "s/<address>/$ADDRESS/g" /home/private-bower/bowerConfig.json
fi

if [ -f "/data/bowerConfig.json" ]; then
    private-bower --config /data/bowerConfig.json
else
    private-bower --config /home/private-bower/bowerConfig.json
fi
