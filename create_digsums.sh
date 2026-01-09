#!/bin/bash -xeu
while IFS= LC_ALL=C read -r -d '' -u 9 file
do
  echo S 15 com.nokia.maemo H 40 `sha1sum "$file" | cut -c -40` R `expr length "${file:2}"` ${file:2}
done 9< <( find . -type f -not -path '*/.*' -not -path "./DEBIAN/*" -exec printf '%s\0' {} + )