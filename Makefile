###############################################################################
#
# Copyright...
#
#
###############################################################################

SHELL = /bin/bash

###############################################################################
# Build configuration variables
###############################################################################
BOOTLOADER=virtual/bootloader
KERNEL=virtual/kernel
ROOTFS=core-image-minimal

SETUP_BUILDTOOLS=TEMPLATECONF=sources/meta-duke-beagle/conf . sources/poky/oe-init-build-env
RUN_BUILD=bitbake

###############################################################################
# Core make targets
###############################################################################
all: bootloader kernel rootfs

.PHONY : bootloader
bootloader:
	${PRINT} "Building kernel..."
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
