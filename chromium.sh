#!/bin/bash

# Install the latest Chromium mac nightly build, but only
# if it's different from the currently installed version.

build_url="http://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac"
install_dir="/Applications/Chromium.app"

# Determine the currently installed chromium build number
if [ -d $install_dir ]; then
    current=$(defaults read "$install_dir/Contents/Info" SVNRevision)
else
    current=0
fi

# Most recent version build available from Google
latest=$(curl -s "$build_url/LAST_CHANGE")

if [ $current != $latest ]; then
    echo "==> Fetching Chromium build $latest" >&2

    # setup a temp dir to do some work
    tmpdir=$(mktemp -d -t "$(basename "$0").XXX"); cd "$tmpdir"

    trap "cd && rm -rf $tmpdir" INT TERM EXIT

    # fetch it
    curl -# -L -O "$build_url/$latest/chrome-mac.zip"

    printf "\n==> Extracting...\n" 1>&2
    unzip -q chrome-mac.zip

    rm -rf "$install_dir"

    # move the new one into place
    mv "chrome-mac/Chromium.app" "$install_dir"
    echo "==> Chromium upgraded to build $latest (from $current)."
else
    echo "==> You already have build $latest." 1>&2
fi
