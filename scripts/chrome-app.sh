#!/bin/bash

# Check if a URL and optionally a profile name are provided as arguments
if [ -z "$1" ]; then
    echo "Usage: $0 <url> [profile_name]"
    exit 1
fi

# URL passed as an argument
URL="$1"

# Profile name (if provided)
PROFILE_NAME="$2"

# Check if a browser with the given URL is running
BROWSER=$(xdotool search --classname "$(basename $URL)")

if [ -n "$BROWSER" ]; then
    # Focus the existing browser tab
    xdotool windowactivate "$BROWSER"
else
    # Open a new browser tab with the specified profile
    if [ -n "$PROFILE_NAME" ]; then
        google-chrome-stable --profile-directory="$PROFILE_NAME" --app="$NOTION_URL" &
    else
        google-chrome-stable --app="$URL" &
    fi
fi