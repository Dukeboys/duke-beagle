###############################################################################
#
# Copyright...
#
#
###############################################################################

SHELL = /bin/bash
PRINT = echo
.ONESHELL:

###############################################################################
# Build configuration variables
###############################################################################
BOOTLOADER=virtual/bootloader
KERNEL=virtual/kernel
ROOTFS=core-image-minimal
TOOLCHAIN= -c populate_sdk ${ROOTFS}

SETUP_BUILDTOOLS=TEMPLATECONF=../sources/meta-duke-beagle/conf . sources/poky/oe-init-build-env
RUN_BUILD=bitbake

###############################################################################
# Core make targets
###############################################################################
all: image toolchain

.PHONY : image
image: bootloader kernel rootfs

.PHONY : bootloader
bootloader:
	${PRINT} "Building bootloader..."
	${SETUP_BUILDTOOLS}
	${RUN_BUILD} ${BOOTLOADER}

.PHONY : kernel
kernel:
	${PRINT} "Building kernel..."
	${SETUP_BUILDTOOLS}
	${RUN_BUILD} ${KERNEL}

.PHONY : rootfs
rootfs:
	${PRINT} "Building rootfs..."
	${SETUP_BUILDTOOLS}
	${RUN_BUILD} ${ROOTFS}

.PHONY : toolchain
toolchain:
	${PRINT} "Building toolchain..."
	${SETUP_BUILDTOOLS}
	${RUN_BUILD} ${TOOLCHAIN}

.PHONY : setup-toolchain
setup-toolchain: toolchain
	${PRINT} "Seting Up toolchain..."
	./build/tmp/deploy/sdk/*.sh -y
