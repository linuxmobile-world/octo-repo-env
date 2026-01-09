Version: 0.0.2 (09.12.2025)

Note: use either aegis-dpkg or AEGIS_FIXED_ORIGIN=com.nokia.maemo if on OpenMode!
Order of installing IS IMPORTANT.

YOU MUST BE ON PR 1.3

1. Install wunderw-perl-opt_5.38.0-1_armel.deb
2. Install openssl-local_1.0.2u_armel.deb
3. Install packages/*.deb
4. (optionally) Reboot

Technical info: package contains OpenSSL 1.0.2u from 20 Dec 2019, and all packages in packages folder are rebuilt against its libraries. Includes certificates from February 2024 from Ubuntu repositories.

How to uninstall (not tested)

1. aegis-apt-get install --reinstall libsignoncrypto-qt libsasl2-modules libsasl2-2 libqt4-network libcryptsetup0 libaegis-crypto1 libaegis-certman0 libaccounts-glib0 libaccounts-glib-tools cryptsetup aegis-crypto-tools aegis-certman-tools aegis-certman-common-ca
2. Reboot
3. apt-get remove openssl-local
4. rm -r /usr/local/ssl
