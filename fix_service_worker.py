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

    # Update existing hashes if present (use replacement function to avoid
    # re interpreting \1 + "8" as invalid group ref \18 when hash starts with 8)
    updated = False
    if '"assets/AssetManifest.json"' in sw_content:
        def repl_assets(m):
            return m.group(1) + manifest_hash + m.group(2)
        sw_content = re.sub(
            r'("assets/AssetManifest\.json":\s*")[^"]+(")',
            repl_assets,
            sw_content
        )
        updated = True
    if '"AssetManifest.json"' in sw_content:
        def repl_plain(m):
            return m.group(1) + manifest_hash + m.group(2)
        sw_content = re.sub(
            r'("AssetManifest\.json":\s*")[^"]+(")',
            repl_plain,
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
    # Use replacement function so \1 + hash never looks like \18 when hash starts with 8
    pattern = r'("assets/AssetManifest\.bin\.json":\s*"[^"]+",)'
    def repl_add(m):
        return (
            m.group(1) + '\n"assets/AssetManifest.json": "' + manifest_hash + '",'
            + '\n"AssetManifest.json": "' + manifest_hash + '",'
        )
    new_content = re.sub(pattern, repl_add, sw_content)
    
    if new_content != sw_content:
        with open(sw_file, 'w') as f:
            f.write(new_content)
        print(f"Added AssetManifest.json to service worker with hash {manifest_hash}")
        return True
    else:
        print("Could not find insertion point in service worker")
        # Try alternative pattern
        pattern2 = r'("assets/FontManifest\.json":\s*"[^"]+",)'
        def repl_add2(m):
            return (
                m.group(1) + '\n"assets/AssetManifest.json": "' + manifest_hash + '",'
                + '\n"AssetManifest.json": "' + manifest_hash + '",'
            )
        new_content = re.sub(pattern2, repl_add2, sw_content)
        
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
