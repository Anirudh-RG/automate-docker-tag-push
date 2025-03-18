#!/bin/bash

CONFIG_FILE="$HOME/.rundocker_config"

setup_config() {
  echo "Setting up Docker registry owner..."
  read -p "Enter your Docker registry owner name (e.g., anirudh0090): " OWNER
  echo "OWNER=$OWNER" > "$CONFIG_FILE"
  echo "Configuration saved to $CONFIG_FILE"
}

# Check if config exists
if [ ! -f "$CONFIG_FILE" ]; then
  setup_config
fi

source "$CONFIG_FILE"

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: rundocker.sh <image_name[:tag]> <repository_name>"
  echo "CONFIG file location - $CONFIG_FILE"
  exit 1
fi

IMAGENAME_WITH_TAG="$1"
REPOSITORY_NAME="$2"

FULL_IMAGE_NAME="${OWNER}/${REPOSITORY_NAME}"

echo "Building Docker image: $IMAGENAME_WITH_TAG & using called dir to obtain dockerfile"
docker build -t "$IMAGENAME_WITH_TAG" .

echo "Tagging image as: ${FULL_IMAGE_NAME}"
docker tag "$IMAGENAME_WITH_TAG" "$FULL_IMAGE_NAME"

echo "Pushing image: ${FULL_IMAGE_NAME}"
docker push "$FULL_IMAGE_NAME"


echo "Docker build, tag, and push complete."
