#!/bin/bash
#!/bin/bash
set -e
cd octo/dists/meego
do_hash() {
    HASH_NAME=$1
    HASH_CMD=$2
    echo "${HASH_NAME}:"
    for f in $(find -type f); do
        f=$(echo $f | cut -c3-) # remove ./ prefix
        if [ "$f" = "Release" ]; then
            continue
        fi
        echo " $(${HASH_CMD} ${f}  | cut -d" " -f1) $(wc -c $f)"
    done
}

cat << EOF
Origin: octonezd.me
Label: Octonezd Repository
Suite: meego
Codename: meego
Date: Sun, 30 Nov 2024 19:55:00 UTC
Architectures: armel
Components: main
Description: Repository for octonezd
EOF
do_hash "MD5Sum" "md5sum"
do_hash "SHA1" "sha1sum"
do_hash "SHA256" "sha256sum"