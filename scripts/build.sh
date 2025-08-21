#!/usr/bin/env bash
set -euo pipefail

GO_VERSION="${1:-1.22.2}"
NDK_VERSION="r28c"
NDK_ZIP="android-ndk-${NDK_VERSION}-linux.zip"
NDK_DIR="android-ndk-${NDK_VERSION}"

# Install NDK
mkdir -p android && cd android
if [ ! -d "$NDK_DIR" ]; then
    wget -q "https://dl.google.com/android/repository/$NDK_ZIP"
    unzip -q "$NDK_ZIP"
fi
export ANDROID_NDK_HOME="$PWD/$NDK_DIR"
cd ..

# Install Go (bootstrap)
wget -q "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz"
sudo tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz"
export PATH="/usr/local/go/bin:$PATH"

# Clone Go source
git clone https://go.googlesource.com/go
cd go
git checkout "go${GO_VERSION}"

# Build Go for Android/ARM64
cd src
export GOOS=android
export GOARCH=arm64
export CGO_ENABLED=1
export CC="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android21-clang"

./make.bash
