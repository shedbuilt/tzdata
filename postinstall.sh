#!/bin/bash
if [ ! -L /etc/localtime ]; then
    ln -sfv /usr/share/zoneinfo/America/New_York /etc/localtime
fi
