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

LOCAL_CFLAGS += -fvisibility=hidden

LOCAL_LDFLAGS += -finput-charset=UTF-8 -fexec-charset=UTF-8

LOCAL_LDFLAGS += -lvulkan
LOCAL_LDFLAGS += -lxcb

include $(BUILD_EXECUTABLE)