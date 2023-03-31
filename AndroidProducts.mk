#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/bootleg_citrus.mk \
    $(LOCAL_DIR)/bootleg_lime.mk

COMMON_LUNCH_CHOICES := \
    bootleg_citrus-user \
    bootleg_citrus-userdebug \
    bootleg_citrus-eng \
    bootleg_lime-user \
    bootleg_lime-userdebug \
    bootleg_lime-eng
