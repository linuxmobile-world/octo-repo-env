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
cd prs
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-009-pr
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-001-pr
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-shared-pr
dpkg-deb -Zgzip --root-owner-group --build mp-harmattan-community-pr
cp *.deb ../
cd ..
rsync -av --exclude=".*" repoinstaller/ build-area/
dpkg-deb -Zgzip --root-owner-group --build build-area repoinstaller.deb
rm -rf build-area

rsync -av --exclude=".*" grob-frogfind-search/ build-area/
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

cd sdk-connectivity-tool
./repack.sh
cd ..
cd developer-mode
./repack.sh
cd ..
cd dropbear
./build.sh
./package.sh
cd ..

cp *.deb octo
cp -v packman-hack/*.deb octo/
cd octo 
dpkg-scanpackages --multiversion . /dev/null | gzip -9c > dists/meego/main/binary-armel/Packages.gz
cd ..
./sign.sh
