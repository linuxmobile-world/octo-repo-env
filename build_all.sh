#!/bin/bash -xeu
CURRENT_UID=$(id -u):$(id -g)
rm -rf octo
mkdir -p octo/conf octo/pool
cp conf/distributions octo/conf/distributions
cp conf/options octo/conf/options
rm -f *.deb *.dsc *.buildinfo *.changes *.tar.gz

cd tzdata
git clean -dfX
docker run --rm -it -u $CURRENT_UID -v ../:/repo -w /repo/tzdata ghcr.io/linuxmobile-world/meego_docker:latest fakeroot make -f debian/rules binary
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

cd about
python3 contents_prod_generator.py
dpkg-deb -Zgzip --root-owner-group --build about-contents-prod
cp *.deb ..
cd ..

rsync -av --exclude=".*" repoinstaller/ build-area/
dpkg-deb -Zgzip --root-owner-group --build build-area repoinstaller.deb
rm -rf build-area

rsync -av --exclude=".*" grob-frogfind-search/ build-area/
dpkg-deb -Zgzip --root-owner-group --build build-area grob-frogfind-search.deb
rm -rf build-area

cd packmanui-hack
./build.sh
cd ..
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

echo Our:
cp *.deb octo/pool

echo 3rdparty:
cp -v 3rdparty/*.deb octo/pool

reprepro -b octo includedeb meego octo/pool/*.deb
rm -f octo/pool/*.deb
gpg --export 725C41EA5A34167F82BA09AE91557563AEF90696 > octo/repo.gpg
cp octo/pool/main/o/octorepo/* octo/repoinstaller.deb

rm *.deb