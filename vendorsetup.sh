# Kernel
#git clone --depth=1 https://github.com/Joe7500/kernel_xiaomi_chime -b android kernel/xiaomi/chime
#cd kernel/xiaomi/chime
#git pull
#cd ../../../

# Vendor tree
git clone https://github.com/Joe7500/vendor_xiaomi_chime -b lineage-21 vendor/xiaomi/chime 
cd vendor/xiaomi/chime
git pull
cd ../../../

# Xiaomi hardware
git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi
cd hardware/xiaomi
git pull
cd ../../

# GCC and symlink. Needed to build hanikrnl kernel. Weird thing is, this compiles just fine outside of YAAP without GCC.
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.git prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 --depth=1

echo
for x in $(find prebuilts/clang -type l | grep "/bin/as$") ; do rm -vf $x ; done

ln -s $(pwd)/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/arm-linux-androideabi/bin/as prebuilts/clang/host/linux-x86/clang-r487747c/bin/as
echo

ls -l --color prebuilts/clang/host/linux-x86/clang-r487747c/bin/as
echo

./prebuilts/clang/host/linux-x86/clang-r487747c/bin/as --version
if [ $? -eq 0 ]; then
	echo
	echo "             GCC assembler setup success!"
	echo
else
        echo
        echo -e "          GCC assembler setup \033[0;31m  FAILED! \033[0m "
        echo
	echo -e "\\a"
fi

# Environment variables to enable building GAPPS.
export YAAP_BUILDTYPE=Urshanabi
export TARGET_BUILD_GAPPS=true


