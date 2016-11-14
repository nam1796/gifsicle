LOCAL_PATH := $(call my-dir)


##############################
## libgifsicle
##############################
include $(CLEAR_VARS)

LOCAL_MODULE := libgifsicle
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_SRC_FILES := \
    src/clp.c \
    src/fmalloc.c \
    src/giffunc.c \
    src/gifread.c \
    src/gifsicle.c \
    src/gifunopt.c \
    src/gifwrite.c \
    src/merge.c \
    src/optimize.c \
    src/quantize.c \
    src/support.c \
    src/xform.c
LOCAL_CFLAGS := -DHAVE_CONFIG_H -Dmain=gifsicle

include $(BUILD_SHARED_LIBRARY)


##############################
## libgifsicle_executable_legacy or libgifsicle_executable
##############################
include $(CLEAR_VARS)

ifeq ($(APP_PLATFORM),android-9)
  LOCAL_MODULE := libgifsicle_executable_legacy
else ifeq ($(APP_PLATFORM),android-16)
  LOCAL_MODULE := libgifsicle_executable
endif
LOCAL_C_INCLUDES := $(LOCAL_PATH)/wrap
LOCAL_SRC_FILES := wrap/wrap.c
LOCAL_SHARED_LIBRARIES := libgifsicle

include $(BUILD_EXECUTABLE)
