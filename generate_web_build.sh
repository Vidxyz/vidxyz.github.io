#!/bin/bash

# Clean previous build
flutter clean

# Get dependencies
flutter pub get

# Build web app
flutter build web --release

# Generate AssetManifest.json BEFORE copying (so service worker can include it)
if [ -f "build/web/assets/AssetManifest.bin.json" ]; then
    echo "Generating AssetManifest.json..."
    python3 generate_asset_manifest.py

    # Copy the generated manifest to build directory (root + assets)
    if [ -f "docs/assets/AssetManifest.json" ]; then
        cp "docs/assets/AssetManifest.json" "build/web/assets/AssetManifest.json"
        cp "docs/assets/AssetManifest.json" "build/web/AssetManifest.json"
        echo "Copied AssetManifest.json to build directory (root + assets)"

        # Rebuild to include it in service worker
        echo "Rebuilding to include AssetManifest.json in service worker..."
        flutter build web --release
    fi
fi

# Copy all build files to docs
cp -r build/web/* docs/

# Ensure experience and pdf assets are present (defensive copy)
if [ -d "assets/experience" ]; then
    mkdir -p "docs/assets/assets/experience"
    cp -r assets/experience/* "docs/assets/assets/experience/"
fi
if [ -d "assets/pdf" ]; then
    mkdir -p "docs/assets/assets/pdf"
    cp -r assets/pdf/* "docs/assets/assets/pdf/"
fi

# Ensure AssetManifest.json is in docs (final check)
if [ ! -f "docs/assets/AssetManifest.json" ]; then
    echo "Warning: AssetManifest.json not found in docs, generating..."
    python3 generate_asset_manifest.py
fi

# Copy to docs root for compatibility (some runtimes request root AssetManifest.json)
cp "docs/assets/AssetManifest.json" "docs/AssetManifest.json" 2>/dev/null

# Fix service worker to include AssetManifest.json
echo "Fixing service worker to include AssetManifest.json..."
python3 fix_service_worker.py

echo "Build complete! Files copied to docs/"

# Note - push to origin to trigger github action to trigger deploy