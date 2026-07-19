#!/bin/bash -xeu
ssh 192.168.88.15 rm -rfv /data/compose/maemomirror/data/octo/dists /data/compose/maemomirror/data/octo/pool /data/compose/maemomirror/data/octo/repo.gpg
rsync -av --delete --exclude='db/' --exclude='conf/' --exclude='.stfolder/' octo/ 192.168.88.15:/data/compose/maemomirror/data/octo/
