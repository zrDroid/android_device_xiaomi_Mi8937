#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from upper BoardConfig.mk
include device/xiaomi/Mi8937/BoardConfig.mk

# Compress the read-only Android partitions on the standard 4.19 product.
# Keep the Lindroid variant's existing filesystem configuration.
ifneq ($(MITHORIUM_INTEGRATE_LINDROID),true)
$(foreach p, $(call to-upper, $(SSI_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs) \
    $(eval BOARD_$(p)IMAGE_EXTFS_INODE_COUNT :=) \
    $(eval BOARD_$(p)IMAGE_PARTITION_RESERVED_SIZE := 0))
endif

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/Mi8937_4_19/vendor.prop
