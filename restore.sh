#!/bin/sh

set -e
set -x

# script to backup ssh and gnupg keys to onedrive

GPG="$1"
SSH="$2"

RESTORE=$HOME/tmp/restore

cd $HOME

if [ ! -f "$GPG" -o ! -f "$SSH" ]; then
    echo need full paths to gpg and ssh archives as arguments
    exit
fi

if [ -e .gnupg ]; then
    echo gnupg directory exists
    exit
fi

if [ -e .ssh ]; then
    echo ssh directory exists
    exit
fi

mkdir -p $RESTORE
cd $RESTORE

tar zxvf "$GPG"
gpg --import secret.asc
gpg --import keys.asc
gpg --import-ownertrust trust.asc
rm secret.asc keys.asc trust.asc

echo 'gpg --edit-key <keyname> and run "trust"'

gpg -d $SSH | tar zxvf -
mv .ssh $HOME/
