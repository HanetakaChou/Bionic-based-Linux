# https://developer.android.com/ndk/guides/android_mk

LOCAL_PATH:= $(call my-dir)

# vksmoketest

include $(CLEAR_VARS)

LOCAL_MODULE := vksmoketest

LOCAL_SRC_FILES := \
	Main.cpp \
	HelpersDispatchTable.cpp \
	Smoke.cpp \
	Simulation.cpp \
	ShellXcb.cpp \
	Shell.cpp \
	Meshes.cpp \
	Game.cpp

LOCAL_C_INCLUDES += /system/include

LOCAL_CFLAGS += -DVK_USE_PLATFORM_XCB_KHR
LOCAL_CFLAGS += -DGLM_FORCE_RADIANS

LOCAL_CPP_FEATURES := exceptions

LOCAL_LDFLAGS += -Wl,--enable-new-dtags ### the linker can't recognize the old dtags
LOCAL_LDFLAGS += -Wl,-rpath,/XXXXXX ### chrpath can only make path shorter

LOCAL_LDFLAGS += -lvulkan

ifeq (x86_64,$(TARGET_ARCH))
LOCAL_LDFLAGS += -L/system/lib64
endif

ifeq (x86,$(TARGET_ARCH))
LOCAL_LDFLAGS += -L/system/lib
endif

LOCAL_LDFLAGS += -lxcb

include $(BUILD_EXECUTABLE)