# Copyright (C) 2011-2014 The Android-x86 Open Source Project

ifeq ($(strip $(BOARD_HAS_GPS_HARDWARE)),true)
LOCAL_PATH := $(call my-dir)

# HAL module implemenation, not prelinked and stored in
# hw/<OVERLAY_HARDWARE_MODULE_ID>.<ro.product.board>.so
include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := gps.default
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += \
        -Wno-constant-conversion \
        -Wno-unused-function \
        -Wno-unused-parameter \
        -Wno-unused-variable

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := gps.c
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_MODULE := gps.huawei
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += \
        -Wno-constant-conversion \
        -Wno-invalid-source-encoding \
        -Wno-missing-field-initializers \
        -Wno-unused-function \
        -Wno-unused-parameter \
        -Wno-unused-variable

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := gps_huawei.c
include $(BUILD_SHARED_LIBRARY)
endif
