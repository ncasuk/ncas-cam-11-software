#!/bin/bash

# Output directory
BASE_DIR="/data/amof-cam-1"

# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

while true; do
    # Get current date and time
    DATE=$(date +"%Y%m%d")
    TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

    # Create daily folder if it doesn't exist
    DAY_DIR="$BASE_DIR/$DATE"
    mkdir -p "$DAY_DIR"

    # Set image filename in the form ncas-cam-11_locationname_20220801-155809_photo_v1.0.jpg
    IMAGE_FILE="$DAY_DIR/$TIMESTAMP-amof-cam-1.jpg"

    # Capture image
    gphoto2 --capture-image-and-download --filename "$IMAGE_FILE"
    chown -R root:lecjlg /data/amof-cam-1
    chmod -R g+wr /data/amof-cam-1

    echo "Captured: $IMAGE_FILE"

    # Wait time in seconds
    sleep 60
done
