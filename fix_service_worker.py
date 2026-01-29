#!/usr/bin/env python3
"""
Add AssetManifest.json to Flutter service worker if it's missing.
This fixes the issue where Flutter tries to load AssetManifest.json
but it's not in the service worker cache.
"""
import re
import hashlib
import os
import sys

def fix_service_worker():
    sw_file = "docs/flutter_service_worker.js"
    manifest_file = "docs/assets/AssetManifest.json"
    
    if not os.path.exists(sw_file):
        print(f"Error: {sw_file} not found")
        return False
    
    if not os.path.exists(manifest_file):
        print(f"Error: {manifest_file} not found. Run generate_asset_manifest.py first.")
        return False
    
    # Read service worker
    with open(sw_file, 'r') as f:
        sw_content = f.read()
    
    # Calculate hash of the manifest file (Flutter uses MD5, first 32 chars)
    with open(manifest_file, 'rb') as f:
        manifest_hash = hashlib.md5(f.read()).hexdigest()[:32]

    # Update existing hashes if present
    updated = False
    if '"assets/AssetManifest.json"' in sw_content:
        sw_content = re.sub(
            r'("assets/AssetManifest\.json":\s*")[^"]+(")',
            r'\1' + manifest_hash + r'\2',
            sw_content
        )
        updated = True
    if '"AssetManifest.json"' in sw_content:
        sw_content = re.sub(
            r'("AssetManifest\.json":\s*")[^"]+(")',
            r'\1' + manifest_hash + r'\2',
            sw_content
        )
        updated = True
    if updated:
        with open(sw_file, 'w') as f:
            f.write(sw_content)
        print(f"Updated AssetManifest.json hash in service worker to {manifest_hash}")
        return True
    
    print("AssetManifest.json not found in service worker, adding it...")
    
    # Find the RESOURCES object and add the entry after AssetManifest.bin.json
    pattern = r'("assets/AssetManifest\.bin\.json":\s*"[^"]+",)'
    replacement = (
        r'\1\n"assets/AssetManifest.json": "' + manifest_hash + '",'
        + r'\n"AssetManifest.json": "' + manifest_hash + '",'
    )
    
    new_content = re.sub(pattern, replacement, sw_content)
    
    if new_content != sw_content:
        with open(sw_file, 'w') as f:
            f.write(new_content)
        print(f"Added AssetManifest.json to service worker with hash {manifest_hash}")
        return True
    else:
        print("Could not find insertion point in service worker")
        # Try alternative pattern
        pattern2 = r'("assets/FontManifest\.json":\s*"[^"]+",)'
        replacement2 = (
            r'\1\n"assets/AssetManifest.json": "' + manifest_hash + '",'
            + r'\n"AssetManifest.json": "' + manifest_hash + '",'
        )
        new_content = re.sub(pattern2, replacement2, sw_content)
        
        if new_content != sw_content:
            with open(sw_file, 'w') as f:
                f.write(new_content)
            print(f"Added AssetManifest.json to service worker (alternative method)")
            return True
        else:
            print("Error: Could not modify service worker")
            return False

if __name__ == "__main__":
    success = fix_service_worker()
    sys.exit(0 if success else 1)
