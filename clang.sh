DATE=$(date +"%Y%m%d")
VERSION=$(git rev-parse --short HEAD)
KERNEL_NAME=Evasi0nKernel-cepheus-"$DATE"

export KERNEL_PATH=$PWD
export ANYKERNEL_PATH=~/Anykernel3
export CLANG_PATH=~/proton-clang
export PATH=${CLANG_PATH}/bin:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export SUBARCH=arm64

echo "===================Setup Environment==================="
git clone --depth=1 https://github.com/kdrag0n/proton-clang $CLANG_PATH
git clone https://github.com/osm0sis/AnyKernel3 $ANYKERNEL_PATH
sh -c "$(curl -sSL https://github.com/akhilnarang/scripts/raw/master/setup/android_build_env.sh/)"

echo "=========================Clean========================="
rm -rf $KERNEL_PATH/out/ *.zip
make mrproper && git reset --hard HEAD
