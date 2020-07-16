# https://developer.android.com/ndk/guides/android_mk

LOCAL_PATH:= $(call my-dir)

# vkcube

include $(CLEAR_VARS)

LOCAL_MODULE := vkcube

LOCAL_SRC_FILES := \
	main.cpp \
	TextureLoader.cpp \
	DDS/TextureLoader_DDS.cpp \
	PVR/TextureLoader_PVR.cpp \
	VK/TextureLoader_VK.cpp \
	VK/StagingBuffer.cpp \
	asset.cpp

LOCAL_LDFLAGS += -Wl,--enable-new-dtags ### the linker can't recognize the old dtags
LOCAL_LDFLAGS += -Wl,-rpath,/XXXXXX ### chrpath can only make path shorter

LOCAL_LDFLAGS += -lvulkan

LOCAL_C_INCLUDES += /system/include

ifeq (x86_64,$(TARGET_ARCH))
LOCAL_LDFLAGS += -L/system/lib64
endif

ifeq (x86,$(TARGET_ARCH))
LOCAL_LDFLAGS += -L/system/lib
endif

LOCAL_LDFLAGS += -lxcb

include $(BUILD_EXECUTABLE)