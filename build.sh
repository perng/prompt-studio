#!/bin/bash
# Vercel build script for Flutter Web
echo "Starting Vercel Build..."

# 1. Download Flutter
echo "Downloading Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 2. Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Enable Web support (just in case)
flutter config --enable-web

# 4. Install dependencies
echo "Getting packages..."
flutter pub get

# 5. Build for web
echo "Building Flutter web..."
flutter build web --release --web-renderer canvaskit

echo "Build complete."
