#!/bin/bash

DEVICE_NAME=y580
BACKUP_LOCATION=file:///media/czers/EXTDATA/Backups

source sensitive.sh
export PASSPHRASE=$BACKUP_PASSPHRASE

function restore () {
    local symbolic_name=$1
    local dir_name=$2

    # The following will most probably throw lots of errors related to
    # restoring ownership
    duplicity --name "$DEVICE_NAME-$symbolic_name" \
        $BACKUP_LOCATION/$DEVICE_NAME/$symbolic_name $dir_name
}

restore Dokumenty "~/restoring-test"

# sudo may be required for restoring ownership metadata:
# sudo -E \
#     duplicity --name "$DEVICE_NAME-$symbolic_name" \
#     $BACKUP_LOCATION/$DEVICE_NAME/$symbolic_name $dir_name

# Narrowed-down restore example:
# duplicity \
#     --file-to-restore bbb/ \
#     file://testing-field/backups testing-field/restored-data
