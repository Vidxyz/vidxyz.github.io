#!/usr/bin/env python3
"""
Generate AssetManifest.json for Flutter web compatibility.
Creates it from the actual assets in the build directory.
"""
import json
import os
from pathlib import Path

def generate_asset_manifest():
    build_assets_dir = "build/web/assets"
    source_assets_dir = "assets"
    docs_manifest = "docs/assets/AssetManifest.json"
    docs_root_manifest = "docs/AssetManifest.json"
    root_manifest = "AssetManifest.json"
    use_build_assets = os.path.exists(build_assets_dir)
    if not use_build_assets:
        print(f"Warning: {build_assets_dir} not found. Falling back to {source_assets_dir}.")
    
    # Build manifest from actual assets
    manifest = {}
    
    if use_build_assets:
        # Add assets from build assets/ directory
        assets_path = os.path.join(build_assets_dir, "assets")
        if os.path.exists(assets_path):
            for root, dirs, files in os.walk(assets_path):
                for file in files:
                    rel_path = os.path.relpath(os.path.join(root, file), build_assets_dir)
                    rel_path = rel_path.replace('\\', '/')  # Use forward slashes
                    manifest[rel_path] = [rel_path]

    # Always add assets from source assets/ directory (covers nested assets not in build)
    if os.path.exists(source_assets_dir):
        for root, dirs, files in os.walk(source_assets_dir):
            for file in files:
                rel_path = os.path.relpath(os.path.join(root, file), ".")
                rel_path = rel_path.replace('\\', '/')  # Use forward slashes
                manifest[rel_path] = [rel_path]
    
    # Add packages (build output only)
    if use_build_assets:
        packages_path = os.path.join(build_assets_dir, "packages")
        if os.path.exists(packages_path):
            for root, dirs, files in os.walk(packages_path):
                for file in files:
                    rel_path = os.path.relpath(os.path.join(root, file), build_assets_dir)
                    rel_path = rel_path.replace('\\', '/')  # Use forward slashes
                    manifest[rel_path] = [rel_path]
    
    # Add fonts (build output only)
    if use_build_assets:
        fonts_path = os.path.join(build_assets_dir, "fonts")
        if os.path.exists(fonts_path):
            for root, dirs, files in os.walk(fonts_path):
                for file in files:
                    rel_path = os.path.relpath(os.path.join(root, file), build_assets_dir)
                    rel_path = rel_path.replace('\\', '/')  # Use forward slashes
                    manifest[rel_path] = [rel_path]
    
    # Write manifests (docs assets + docs root + project root)
    os.makedirs(os.path.dirname(docs_manifest), exist_ok=True)
    with open(docs_manifest, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False, sort_keys=True)
    with open(docs_root_manifest, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False, sort_keys=True)
    with open(root_manifest, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2, ensure_ascii=False, sort_keys=True)
    
    # Verify it's valid JSON
    try:
        with open(docs_manifest, 'r', encoding='utf-8') as f:
            json.load(f)
        print(f"Successfully generated AssetManifest.json with {len(manifest)} assets")
        return True
    except json.JSONDecodeError as e:
        print(f"Error: Generated invalid JSON: {e}")
        return False

if __name__ == "__main__":
    import sys
    success = generate_asset_manifest()
    sys.exit(0 if success else 1)
