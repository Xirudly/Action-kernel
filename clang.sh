DATE=$(date +"%Y%m%d")
VERSION=$(git rev-parse --short HEAD)

export KERNEL_PATH=$PWD
export CLANG_PATH=~/proton-clang
export PATH=${CLANG_PATH}/bin:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export SUBARCH=arm64

echo "===================Setup Environment==================="
git clone --depth=1 https://github.com/kdrag0n/proton-clang $CLANG_PATH
sh -c "$(curl -sSL https://github.com/akhilnarang/scripts/raw/master/setup/android_build_env.sh/)"

echo "=========================Clean========================="
rm -rf $KERNEL_PATH/out/ *.zip
make mrproper && git reset --hard HEAD
