#!/bin/bash

SERVICE_NAME="sshd" #CHANGE ME

disable_service() {
    sudo systemctl stop "$SERVICE_NAME"
    sudo systemctl disable "$SERVICE_NAME"
}

while true; do
    if systemctl is-active --quiet "$SERVICE_NAME"; then
        disable_service
    fi
    sleep 5
done

