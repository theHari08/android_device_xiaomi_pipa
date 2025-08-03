#!/bin/bash

# Function to clone if directory doesn't exist
clone_if_missing() {
    local repo_url=$1
    local branch=$2
    local target_dir=$3

    if [ ! -d "$target_dir" ]; then
        echo "Cloning $repo_url to $target_dir"
        git clone "$repo_url" -b "$branch" "$target_dir"
    else
        echo "$target_dir already exists, skipping clone"
    fi
}

# Additional LineageOS repositories
clone_if_missing "https://github.com/LineageOS/android_hardware_xiaomi" "lineage-22.2" "hardware/xiaomi"
clone_if_missing "https://github.com/LineageOS/android_hardware_lineage_compat" "lineage-22.2" "hardware/lineage/compat"
clone_if_missing "https://github.com/LineageOS/android_hardware_lineage_interfaces" "lineage-22.2" "hardware/lineage/interfaces"
clone_if_missing "https://github.com/LineageOS/android_hardware_lineage_livedisplay" "lineage-22.2" "hardware/lineage/livedisplay"

# Main script execution starts here
ROOT_DIR=$(pwd)
DEVICE_PATH="${ROOT_DIR}/device/xiaomi/pipa"

# Check if the device repository exists
if [ ! -d "$DEVICE_PATH" ]; then
    echo "Error: Device directory not found at ${DEVICE_PATH}"
    echo "Please ensure all repositories are properly cloned"
    exit 1
fi

echo "==== Clone complete ===="
