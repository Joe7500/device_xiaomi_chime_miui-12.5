# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1


# Clone kernel
git clone https://github.com/itsHanibee/kernel_xiaomi_chime -b hani kernel/xiaomi/chime

# Clone vendor
git clone https://gitlab.com/chimeoss/vendor_xiaomi_chime -b lineage-20 vendor/xiaomi/chime
git clone https://gitlab.com/chimeoss/vendor_xiaomi_citrus -b lineage-20 vendor/xiaomi/citrus
git clone https://gitlab.com/chimeoss/vendor_xiaomi_lime -b lineage-20 vendor/xiaomi/lime

# Hardware
rm -rf hardware/xiaomi
git clone https://github.com/itsHanibee/hardware_xiaomi -b thirteen hardware/xiaomi
