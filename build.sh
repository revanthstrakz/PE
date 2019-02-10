#!/bin/bash

git clone --depth=1 https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 gcc

export ARCH=arm64
# Export SUBARCH <arm, arm64, x86, x86_64>
export SUBARCH=arm64
# Set kernal name

# Export Username
export KBUILD_BUILD_USER=ReVaNtH
# Export Machine name
export KBUILD_BUILD_HOST=StRaKz
# Compiler String
CC=~/kernel/clang/clang-r344140b/bin/clang
export KBUILD_COMPILER_STRING="$(${CC} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')"
# Make and Clean

# Make <defconfig>
make strakz_defconfig
# Build Kernel
make ARCH=arm64 CROSS_COMPILE=~/PE/gcc/bin/aarch64-linux-android- -j4
# Make kernel zip
mkdir ~/zip
KERNEL_DIR="~/PE"
ZIP_DIR="~/PE/zip"
cp $KERNEL_DIR/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-mido-nontreble.dtb $ZIP_DIR/treble-unsupported/
cp $KERNEL_DIR/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-mido-treble.dtb $ZIP_DIR/treble-supported/
cp $KERNEL_DIR/arch/arm64/boot/Image.gz $ZIP_DIR/kernel/
