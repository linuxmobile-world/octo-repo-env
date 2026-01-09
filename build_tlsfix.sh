#!/bin/bash
cd tlsfix
bash ../create_digsums.sh | tee DEBIAN/digsigsums
cd ..
dpkg-deb -Zgzip --root-owner-group --build tlsfix
