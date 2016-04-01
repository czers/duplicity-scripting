#!/bin/bash

rsync /media/czers/EXTDATA/Backups/ teapot@teapot.czers.pl:/fileshare/backups \
	--verbose \
	--stats \
	--compress \
	--recursive \
	--times \
	--human-readable \
	--progress \
	--append-verify
	#--itemize-changes \
	#--dry-run \

