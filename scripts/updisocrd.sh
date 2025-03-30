#! /bin/bash
# 0.2v
if [ $(whoami) != 'root' ]; then
        echo "Please use 'sudo' to run me!"
        exit -1;
fi

#NEED_PKGS
NPKGS=("wget" "tar")
NF_PKG="" #NOT FOUND PKG

# ${MYVAR#pattern}     # delete shortest match of pattern from the beginning
# ${MYVAR##pattern}    # delete longest match of pattern from the beginning
# ${MYVAR%pattern}     # delete shortest match of pattern from the end
# ${MYVAR%%pattern}    # delete longest match of pattern from the end

if ! pacman -Q ${NPKGS[0]} &>/dev/null; then
	NF_PKG=${NPKGS[0]}
fi

if ! pacman -Q ${NPKGS[1]} &>/dev/null; then
        NF_PKG=${NPKGS[1]}
fi

if [ "$NF_PKG" != "" ]; then
	echo "ERROR:"
	echo "I need the following package: $NF_PKG"
	exit -2
fi

# default values
CLEAR_AFTER=false
BACKUP=false

# parse command-line options
while getopts "cb" opt; do
    case "$opt" in
        c) CLEAR_AFTER=true ;;
        b) BACKUP=true ;;
    esac
done

API="https://discord.com/api/download/stable?platform=linux&format=tar.gz"
DIR_SAVE="/tmp"
FILENAME="discord.tar.gz"
DIR_OPT="/opt"

# dowland new version
echo "Downloading Discord..."
wget -O "${DIR_SAVE}/${FILENAME}" $API

# unzip .tar.gz
echo "Extracting Discord..."
sudo tar -xvzf "${DIR_SAVE}/${FILENAME}" -C "${DIR_SAVE}"

# rename
echo "...Renaming 'Discord' to 'discord'..."
mv "${DIR_SAVE}/Discord" "${DIR_SAVE}/discord"

# update
echo "Moving Discord to /opt..."
sudo cp -rf "${DIR_SAVE}/${FILENAME%%.*}" /opt/

# Cleanup if -c is set
if [ "$CLEAR_AFTER" = true ]; then
    echo "Cleaning up temporary files..."
    sudo rm -rf "${DIR_SAVE}/${FILENAME}"
    sudo rm -rf "${DIR_SAVE}/${FILENAME%%.*}"
fi

# Ok
echo "Installation completed successfully!"
exit 0

