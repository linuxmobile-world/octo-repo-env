#!/bin/bash -xeu
ssh 192.168.88.15 rm -rfv /data/compose/maemomirror/data/octo
scp -r octo 192.168.88.15:/data/compose/maemomirror/data