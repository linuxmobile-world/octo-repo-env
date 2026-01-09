#!/bin/bash
gunzip -kf ./octo/dists/meego/main/binary-armel/Packages.gz
apt-ftparchive -c ./release.conf release ./octo/dists/meego/ > octo/dists/meego/Release
rm -f octo/repo.gpg octo/dists/meego/Release.gpg
gpg --export 18DAB35F6871CF3176CFCF4BD631B37FACF7425E > octo/repo.gpg
gpg -abs -u 18DAB35F6871CF3176CFCF4BD631B37FACF7425E -o octo/dists/meego/Release.gpg octo/dists/meego/Release