Some scripts contain some AI cause writing bash should be legally classified as a torture.

# Repos needed to build repo

### Core

prs - https://github.com/linuxmobile-world/mp-harmattan-pr - mp-harmattan packages
repoinstaller - https://github.com/linuxmobile-world/octo-repo-installer - installs apt.linuxmobile.world/MeeGo/octo


### Dev stuff

sdk-connectivity-tool - https://github.com/linuxmobile-world/sdk-connectivity-tool - sdk-connectivity-tool which swaps openssh for dropbear - EXTRA SETUP NEEDED: DOWNLOAD https://apt.linuxmobile.world/MeeGo/n9mirror/tools/sdk-connectivity-tool_0.4.21%2B0m6_armel.deb
developer-mode - https://github.com/linuxmobile-world/developer-mode - developer-mode that requires newer sdk-connectivity-tool - EXTRA SETUP NEEDED: DOWNLOAD https://apt.linuxmobile.world/MeeGo/n9mirror/tools/developer-mode_1.48%2B0m6_armel.deb
dropbear - https://github.com/linuxmobile-world/dropbear-for-n9 - new ssh server

### Fixes

packmanui-hack - https://github.com/linuxmobile-world/package-manager-ui-hack/ - hacks package manager ui not to prompt about uncertified sources, needs for updates from settings to work
tlsfix - https://github.com/linuxmobile-world/tlsfix-n9 - tlsfix, contains prebuilt debs - FYI - Git LFS required
3rdparty - https://github.com/linuxmobile-world/prebuilts - prebuilt debs, including modified package manager to always set AEGIS_FIXED_ORIGIN - FYI - Git LFS required

### Misc

chrony - https://github.com/linuxmobile-world/chrony-for-n9 - chrony ntp sync thing
grob-frogfind-search - https://github.com/OctoNezd/grob-frogfriend-search - FrogFind search for built-in browser


# Build
Just hit ./build_all.sh

# TODO

Debloat script

GitHub actions + pages?


