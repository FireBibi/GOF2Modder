TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = RootHelper

RootHelper_FILES = main.m
RootHelper_CFLAGS = -fobjc-arc
RootHelper_CODESIGN_FLAGS = -S../entitlements.plist
RootHelper_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
