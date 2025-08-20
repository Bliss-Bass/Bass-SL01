# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2020 Roman Stratiienko (r.stratiienko@gmail.com)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

PRODUCT_BOARD_PLATFORM := broadcom
PRODUCT_NAME := gd_rpi4
PRODUCT_DEVICE := gd_rpi4
PRODUCT_BRAND := RaspberryPI
PRODUCT_MODEL := rpi4
PRODUCT_MANUFACTURER := RaspberryPiFoundation

UBOOT_DEFCONFIG := rpi_4_defconfig
ATF_PLAT        := rpi4

KERNEL_SRC       := glodroid/kernel/broadcom
KERNEL_DEFCONFIG := $(KERNEL_SRC)/arch/arm64/configs/android_rpi4_defconfig

KERNEL_FRAGMENTS := \
    $(LOCAL_PATH)/kernel.config \

KERNEL_DTB_FILE := broadcom/bcm2711-rpi-4-b.dtb

SYSFS_MMC0_PATH := emmc2bus/fe340000.mmc

RPI_CONFIG := $(LOCAL_PATH)/boot/config.txt
RPI_CMDLINE := $(LOCAL_PATH)/boot/cmdline.txt

GD_NO_DEFAULT_MODEM := false
GD_EG25_MODEM := false
GD_BUILD_QUECTEL_GPS := false

PRODUCT_PACKAGES += cromite-webview

PRODUCT_PROPERTY_OVERRIDES += \
    hw.nophone=no \
    ro.boot.noril=no \
    ro.radio.noril=no \
    ro.telephony.default_network=10 \
    keyguard.no_require_sim=true \
    ril.function.dataonly=0 \
    ril.subscription.types=SIM \
    persist.telephony.support.ipv6=1 \
    persist.telephony.support.ipv4=1 \
    telephony.lteOnGsmDevice=1 \
    telephony.lteOnCdmaDevice=1 \
    ro.telephony.call_ring.delay=0 \
    ro.ril.enable.amr.wideband=1 \
    ring.delay=0 \
    ro.config.vc_call_steps=20 \
    persist.cust.tel.eons=1 \
    ro.config.hw_fast_dormancy=1 \
    ro.radio.networkmode=enable \
    persist.audio.fluence.voicecall=false \
    ro.com.android.dataroaming=true \
    ro.telephony.get_imsi_from_sim=true \
    ro.telephony.ril.config=simactivation \
    ro.factory.hasGPS=true


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    $(LOCAL_PATH)/cellular/vendor/etc/ql-ril.conf:$(TARGET_COPY_OUT_VENDOR)/etc/ql-ril.conf


$(call inherit-product, $(LOCAL_PATH)/device.mk)
