# Copyright 2019 The Android Open Source Project
# Copyright 2019 Paranoid Android
# Copyright 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/raphael

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Assert
TARGET_OTA_ASSERT_DEVICE := raphael,raphaelin

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msmnile
TARGET_NO_BOOTLOADER := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Camera
MALLOC_SVELTE_FOR_LIBC32 := true
MALLOC_SVELTE := true

# Display
BOARD_USES_ADRENO := true
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_GRALLOC4 := true
TARGET_USES_HWC2 := true
TARGET_DISABLED_UBWC := true
TARGET_SCREEN_DENSITY := 440
TARGET_USES_ION := true
TARGET_USES_QCOM_DISPLAY_BSP := true
TARGET_USES_QTI_MAPPER_2_0 := true
TARGET_USES_QTI_MAPPER_EXTENSIONS_1_1 := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# FOD
TARGET_INPUTDISPATCHER_SKIP_EVENT_KEY := 338
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(DEVICE_PATH):libudfps_extension.raphael
TARGET_USES_FOD_ZPOS := true

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := \
    $(DEVICE_PATH)/vintf/framework_manifest.xml

DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml

DEVICE_MATRIX_FILE := \
    $(DEVICE_PATH)/vintf/compatibility_matrix.xml

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml

ODM_MANIFEST_FILES += \
    $(DEVICE_PATH)/vintf/manifest-qva.xml

ODM_MANIFEST_SKUS += raphael
ODM_MANIFEST_RAPHAEL_FILES := $(DEVICE_PATH)/vintf/manifest_nfc.xml

# Kernel
BOARD_KERNEL_CMDLINE += console=null
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += kpti=off
BOARD_KERNEL_CMDLINE += swiotlb=1
BOARD_KERNEL_CMDLINE += cgroup_disable=pressure
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CLANG_COMPILE := true
BOARD_RAMDISK_USE_LZ4 := true
TARGET_KERNEL_CLANG_VERSION := boolx-clang
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(TARGET_KERNEL_CLANG_PATH)/bin/aarch64-linux-gnu-
TARGET_KERNEL_CROSS_COMPILE_ARM32_PREFIX := $(TARGET_KERNEL_CLANG_PATH)/bin/arm-linux-gnueabi-
TARGET_KERNEL_ADDITIONAL_FLAGS := AS=llvm-as AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip
KERNEL_LD := LD=ld.lld
TARGET_KERNEL_SOURCE := kernel/xiaomi/raphael
TARGET_KERNEL_CONFIG := raphael_defconfig

TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Keystore
TARGET_PROVIDES_KEYMASTER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# Partition (Boot)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_FLASH_BLOCK_SIZE := 262144 #(BOARD_KERNEL_PAGESIZE * 64)

# Partition (Cache)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition (Dtbo)
BOARD_DTBOIMG_PARTITION_SIZE := 0x0800000

# Partition (Recovery)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

# Partition (System)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

# Partition (Userdata)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57453555712

# Partition (Vendor)
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Partition (SystemAsRoot, Metadata)
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_METADATA_PARTITION := true

# Partition (Userimages)
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Platform
TARGET_BOARD_PLATFORM := msmnile

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 120

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_raphael
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security
VENDOR_SECURITY_PATCH := 2023-02-01

# Sepolicy
include device/qcom/sepolicy_vndr-legacy-um/SEPolicy.mk
include device/xiaomi/raphael/sepolicy/sepolicy.mk

# Vendor init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_raphael
TARGET_RECOVERY_DEVICE_MODULES := libinit_raphael

# USB
TARGET_QTI_USB_SUPPORTS_AUDIO_ACCESSORY := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_PRIVATE_LIB_EVENT := "ON"
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
DISABLE_EAP_PROXY := true
PRODUCT_VENDOR_MOVE_ENABLED := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := false
WIFI_FEATURE_HOSTAPD_11AX := true
CONFIG_IEEE80211AX := true
CONFIG_IEEE80211AC := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
include vendor/xiaomi/raphael/BoardConfigVendor.mk

