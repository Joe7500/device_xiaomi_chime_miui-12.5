# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1

# Clone kernel
git clone https://github.com/BootleggersROM-Devices/kernel_xiaomi_chime -b main kernel/xiaomi/chime

# Clone vendor
git clone https://gitlab.com/itsHanibee/vendor_xiaomi_chime -b lineage-20 vendor/xiaomi/chime
git clone https://gitlab.com/itsHanibee/vendor_xiaomi_citrus -b lineage-20 vendor/xiaomi/citrus
git clone https://gitlab.com/itsHanibee/vendor_xiaomi_lime -b lineage-20 vendor/xiaomi/lime

# Hardware
rm -rf hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_xiaomi -b lineage-20 hardware/xiaomi

# AOSP Clang 17
CLANGDIR=$PWD/prebuilts/clang/host/linux-x86
if [ ! -d "${CLANGDIR}/clang-r487747" ]
then
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "${GREEN}Downloading clang 17.0.0${NC}"
    mkdir ${CLANGDIR}/clang-r487747
    wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/master/clang-r487747.tar.gz -P ${CLANGDIR}
    tar -C "${CLANGDIR}"/clang-r487747/ -zxf "${CLANGDIR}"/clang-r487747.tar.gz
    rm ${CLANGDIR}/clang-r487747.tar.gz
fi 
