#!/bin/bash
duplicity \
    --file-to-restore bbb/ \
    file://testing-field/backups testing-field/restored-data
