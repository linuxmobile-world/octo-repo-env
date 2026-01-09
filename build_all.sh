#!/bin/bash -xeu
rm -rf octo
rm -f *.deb *.dsc *.buildinfo *.changes *.tar.gz
cd tzdata
git clean -dfX
dpkg-buildpackage -us -uc
cd ..
cd repoinstaller
bash ../create_digsums.sh | tee DEBIAN/digsigsums
cd ..
./build_tlsfix.sh
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-009-pr
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-001-pr
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-shared-pr
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-community-pr

rsync -av --exclude=".*" repoinstaller/ build-area/
dpkg-deb -Zgzip --root-owner-group --build build-area repoinstaller.deb
rm -rf build-area

rsync -av --exclude=".*" repoinstaller/ build-area/
dpkg-deb -Zgzip --root-owner-group --build build-area grob-frogfind-search.deb
rm -rf build-area

mkdir -p octo/dists/meego/main/binary-armel/
cd packmanui-hack
./build.sh
cd ..
mv packmanui-hack/packman.deb octo/packmanui.deb
cd chrony
./build.sh
./package.sh
cd ..
cp *.deb octo
cp -v packman-hack/*.deb octo/
cd octo 
dpkg-scanpackages --multiversion . /dev/null | gzip -9c > dists/meego/main/binary-armel/Packages.gz
cd ..
./sign.sh
