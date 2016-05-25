#!/bin/bash

DEVICE_NAME=y580
BACKUP_FRESHNESS=4M2W
BACKUP_LOCATION=file:///media/czers/EXTDATA/Backups

source sensitive.sh
export PASSPHRASE=$BACKUP_PASSPHRASE

function backup () {
    local dir_name=$1
    local symbolic_name=$2

    echo Backing up $dir_name as $symbolic_name

    duplicity --full-if-older-than $BACKUP_FRESHNESS \
        --name "$DEVICE_NAME-$symbolic_name" "$dir_name" \
        "$BACKUP_LOCATION/$DEVICE_NAME/$symbolic_name"
}

backup /mnt/SDATA/Dokumenty Dokumenty
backup /mnt/SDATA/Zdjecia Zdjecia
backup /mnt/SDATA/Sprzet Sprzet
backup /mnt/SDATA/Studia Studia
backup /mnt/SDATA/Ksiazki Ksiazki
backup /mnt/SDATA/Muzyka Muzyka
backup /mnt/SDATA/Manga Manga
backup /mnt/SDATA/Obrazki Obrazki
backup "/mnt/VDATA/Muzyka CD" "Muzyka CD"
backup /mnt/SDATA/Misc Misc

