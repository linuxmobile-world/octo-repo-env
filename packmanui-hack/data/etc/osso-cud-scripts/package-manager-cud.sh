#! /bin/sh

# clear install_source setting from GConf
GCONF_DIRECTORY="/package-manager/pmgrsettings"
gconftool-2 --unset $GCONF_DIRECTORY/install_source
