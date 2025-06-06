#!/usr/bin/env bash

BACKUP_DIR_PATH='/backups'
if [[ ! -d "${BACKUP_DIR_PATH}" ]]; then
    mkdir -p "${BACKUP_DIR_PATH}"
fi
BACKUP_FILE_PREFIX='backup'
