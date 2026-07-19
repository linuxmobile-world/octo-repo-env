#!/bin/bash -xeu
PACKAGE=$(grep "^Package:" DEBIAN/control | sed 's/^Package: *//')

while IFS= LC_ALL=C read -r -d '' -u 9 file
do
  echo S 15 com.nokia.maemo H 40 `sha1sum "$file" | cut -c -40` R `expr length "${file:2}"` ${file:2}
done 9< <( find . -type f -not -path '*/.*' -not -path "./DEBIAN/*" -exec printf '%s\0' {} + )

# Also hash maintainer scripts in DEBIAN/ with dpkg info path format
for f in DEBIAN/postinst DEBIAN/preinst DEBIAN/postrm DEBIAN/prerm DEBIAN/config DEBIAN/templates; do
  if [ -f "$f" ]; then
    basename=$(basename "$f")
    dpkg_path="var/lib/dpkg/info/${PACKAGE}.${basename}"
    echo S 15 com.nokia.maemo H 40 `sha1sum "$f" | cut -c -40` R `expr length "${dpkg_path}"` ${dpkg_path}
  fi
done