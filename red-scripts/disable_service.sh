#!/bin/bash

SERVICE_NAME="sshd" #CHANGE ME

disable_service() {
    echo "Attempting to disable ${SERVICE_NAME}..."
    sudo systemctl stop "$SERVICE_NAME"
    sudo systemctl disable "$SERVICE_NAME"
}

while true; do
    if systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "${SERVICE_NAME} is still active. Disabling..."
        disable_service
    else
        echo "${SERVICE_NAME} is disabled."
    fi
    sleep 5
done

