#!/bin/bash

# Function to show usage
show_usage() {
    echo "Usage: $0 <new_app_id>"
    echo "Example: $0 com.mycompany.myapp"
    exit 1
}

# Check if new app ID is provided
if [ $# -ne 1 ]; then
    show_usage
fi

NEW_APP_ID=$1

# Validate app ID format
if [[ ! $NEW_APP_ID =~ ^[a-z][a-z0-9_]*(\.[a-z0-9_]+)*$ ]]; then
    echo "Error: Invalid app ID format. Must be in format like 'com.example.app'"
    exit 1
fi

echo "Changing app ID to: $NEW_APP_ID"

# Update Android applicationId
GRADLE_FILE="android/app/build.gradle"
if [ -f "$GRADLE_FILE" ]; then
    echo "Updating Android configuration..."
    # Update prod flavor
    sed -i "s/applicationId \".*\"/applicationId \"$NEW_APP_ID\"/" "$GRADLE_FILE"
    # Update dev flavor
    sed -i "s/applicationId \".*\.dev\"/applicationId \"$NEW_APP_ID.dev\"/" "$GRADLE_FILE"
    # Update stg flavor
    sed -i "s/applicationId \".*\.stg\"/applicationId \"$NEW_APP_ID.stg\"/" "$GRADLE_FILE"
fi

# Update iOS bundle ID in pubspec.yaml
PUBSPEC_FILE="pubspec.yaml"
if [ -f "$PUBSPEC_FILE" ]; then
    echo "Updating iOS configuration..."
    # Update prod flavor
    sed -i "s/bundleId: \".*\"/bundleId: \"$NEW_APP_ID\"/" "$PUBSPEC_FILE"
    # Update dev flavor
    sed -i "s/bundleId: \".*\.dev\"/bundleId: \"$NEW_APP_ID.dev\"/" "$PUBSPEC_FILE"
    # Update stg flavor
    sed -i "s/bundleId: \".*\.stg\"/bundleId: \"$NEW_APP_ID.stg\"/" "$PUBSPEC_FILE"
fi

# Make script executable
chmod +x change_app_id.sh

echo "App ID has been updated successfully!"
echo "New app IDs:"
echo "Production: $NEW_APP_ID"
echo "Staging: $NEW_APP_ID.stg"
echo "Development: $NEW_APP_ID.dev"
