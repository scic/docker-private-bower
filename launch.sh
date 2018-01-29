#!/bin/bash

chmod -R 600 /root/.ssh

if [ ! -z "$ADDRESS" ]; then
	sed -i "s/<address>/$ADDRESS/g" /home/private-bower/bowerConfig.json
fi

if [ -f "/data/bowerConfig.json" ]; then
    private-bower --config /data/bowerConfig.json
else
    private-bower --config /home/private-bower/bowerConfig.json
fi
