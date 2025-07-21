#!/bin/bash

# Output directory
BASE_DIR="/data/amof-cam-11"

#---Define some variables to ensure the filename complies with the AMOF image standard. 
CAM_NAME="ncas-cam-11"
LOCATION="sterzing"
VER="photo_v1.0"
# Create base directory if it doesn't exist
mkdir -p "$BASE_DIR"

while true; do
    # Get current date and time
    DATE=$(date +"%Y%m%d")
    TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

    # Create daily folder if it doesn't exist
    DAY_DIR="$BASE_DIR/$DATE"
    mkdir -p "$DAY_DIR"

    # Set image filename in the form ncas-cam-11_locationname_20220801-155809_photo_v1.0.jpg
     IMAGE_FILE="$DAY_DIR"/"$CAM_NAME"_"$LOCATION"_"$TIMESTAMP"_"$VER".jpg
    
    #echo "$DAY_DIR"/"$CAM_NAME"_"$LOCATION"_"$TIMESTAMP"_"$VER".jpg
    echo $IMAGE_FILE
    # Capture image
    
    gphoto2 --capture-image-and-download --filename "$IMAGE_FILE"
    chown -R root:lecjlg /data/amof-cam-11
    chmod -R g+wr /data/amof-cam-11

    echo "Captured: $IMAGE_FILE"

    # Wait time in seconds
    sleep 60
done

