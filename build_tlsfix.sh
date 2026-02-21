#!/bin/bash
cd tlsfix/tlsfix
bash ../../create_digsums.sh | tee DEBIAN/digsigsums
cd ..
dpkg-deb -Zgzip --root-owner-group --build tlsfix
mv *.deb ..