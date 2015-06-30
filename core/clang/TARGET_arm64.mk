
include $(BUILD_SYSTEM)/clang/arm64.mk

CLANG_CONFIG_arm64_TARGET_TRIPLE := aarch64-linux-android
CLANG_CONFIG_arm64_TARGET_TOOLCHAIN_PREFIX := \
  $(TARGET_TOOLCHAIN_ROOT)/$(CLANG_CONFIG_arm64_TARGET_TRIPLE)/bin

CLANG_CONFIG_arm64_TARGET_EXTRA_ASFLAGS := \
  $(CLANG_CONFIG_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_arm64_EXTRA_ASFLAGS) \
  -target $(CLANG_CONFIG_arm64_TARGET_TRIPLE) \
  -B$(CLANG_CONFIG_arm64_TARGET_TOOLCHAIN_PREFIX)

CLANG_CONFIG_arm64_TARGET_EXTRA_CFLAGS := \
  $(CLANG_CONFIG_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_arm64_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_arm64_TARGET_EXTRA_ASFLAGS)

CLANG_CONFIG_arm64_TARGET_EXTRA_CONLYFLAGS := \
  $(CLANG_CONFIG_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_arm64_EXTRA_CONLYFLAGS)

CLANG_CONFIG_arm64_TARGET_EXTRA_CPPFLAGS := \
  $(CLANG_CONFIG_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_arm64_EXTRA_CPPFLAGS) \

CLANG_CONFIG_arm64_TARGET_EXTRA_LDFLAGS := \
  $(CLANG_CONFIG_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_arm64_EXTRA_LDFLAGS) \
  -target $(CLANG_CONFIG_arm64_TARGET_TRIPLE) \
  -B$(CLANG_CONFIG_arm64_TARGET_TOOLCHAIN_PREFIX)


define convert-to-clang-flags
  $(strip \
  $(call subst-clang-incompatible-arm64-flags,\
  $(filter-out $(CLANG_CONFIG_arm64_UNKNOWN_CFLAGS),\
  $(1))))
endef

CLANG_TARGET_GLOBAL_CFLAGS := \
  $(call convert-to-clang-flags,$(TARGET_GLOBAL_CFLAGS)) \
  $(CLANG_CONFIG_arm64_TARGET_EXTRA_CFLAGS)

CLANG_TARGET_GLOBAL_CONLYFLAGS := \
  $(call convert-to-clang-flags,$(TARGET_GLOBAL_CONLYFLAGS)) \
  $(CLANG_CONFIG_arm64_TARGET_EXTRA_CONLYFLAGS)

CLANG_TARGET_GLOBAL_CPPFLAGS := \
  $(call convert-to-clang-flags,$(TARGET_GLOBAL_CPPFLAGS)) \
  $(CLANG_CONFIG_arm64_TARGET_EXTRA_CPPFLAGS)

CLANG_TARGET_GLOBAL_LDFLAGS := \
  $(call convert-to-clang-flags,$(TARGET_GLOBAL_LDFLAGS)) \
  $(CLANG_CONFIG_arm64_TARGET_EXTRA_LDFLAGS)

RS_TRIPLE := aarch64-linux-android
RS_TRIPLE_CFLAGS :=
RS_COMPAT_TRIPLE := aarch64-linux-android

TARGET_LIBPROFILE_RT := $(LLVM_RTLIB_PATH)/libclang_rt.profile-aarch64-android.a

# Address sanitizer clang config
ADDRESS_SANITIZER_RUNTIME_LIBRARY := libclang_rt.asan-arm64-android
ADDRESS_SANITIZER_RPATH := /data/vendor/lib64:/$(TARGET_COPY_OUT_VENDOR)/lib64:/data/lib64
