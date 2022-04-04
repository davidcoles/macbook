#!/bin/sh
set -e
set -x

# script to backup ssh and gnupg keys to onedrive

USER="$1"

if [ "$USER" == "" ]; then
    echo user name need
    exit
fi

TMPDIR=$HOME/tmp/backup
DATE=$(date +'%Y%m%d')
ONEDRIVE=$HOME/onedrive
BACKUP=$ONEDRIVE/backup

SSH=ssh-$DATE.tar.gz.gpg
GPG=gpg-$DATE.tar.gz

if [ ! -h $ONEDRIVE ]; then
    echo $ONEDRIVE should be a symlink to your OneDrive folder
    echo eg.: 'ln -s "$HOME/OneDrive - Whatever" $HOME/onedrive'
    exit
fi

echo test | gpg -ear "$USER" >/dev/null

mkdir -p $BACKUP

cd $HOME
tar zcvf - .ssh | gpg -ear "$USER" > $TMPDIR/$SSH

cd $TMPDIR
gpg -a --export-ownertrust > trust.asc
gpg -a --export-secret-keys > secret.asc
gpg -a --export > keys.asc

tar zcvf $GPG trust.asc secret.asc keys.asc
rm trust.asc secret.asc keys.asc

mv $GPG $SSH  $ONEDRIVE/backup
