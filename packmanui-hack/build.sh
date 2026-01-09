#!/bin/bash -xeu
rm packman.deb -f
cd ./data
rm -r DEBIAN
bash ../../create_digsums.sh | tee ../DEBIAN/digsigsums
cp ../DEBIAN . -r
# tar czf ../data.tar.gz . --owner=0 --group=0
# cd ..
# cd DEBIAN
# tar czvf ../control.tar.gz . --owner=0 --group=0
# cd ..
# ar rvs packman.deb control.tar.gz data.tar.gz _aegis debian-binary 
cd ..
dpkg-deb -Zgzip --root-owner-group --build data
mv data.deb packman.deb
ar r packman.deb _aegis
dpkg --info ./packman.deb
