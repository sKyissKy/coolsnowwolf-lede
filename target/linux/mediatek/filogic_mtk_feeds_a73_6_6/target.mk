ARCH:=aarch64
SUBTARGET:=filogic_mtk_feeds_a73_6_6
BOARDNAME:=Filogic MT7988 (mtk-feeds A73, kernel 6.6)
KERNEL_PATCHVER:=6.6
CPU_TYPE:=generic
CPU_SUBTYPE:=cortex-a73
ARCH_PACKAGES:=aarch64_cortex-a53
CFLAGS:=-O2 -pipe -march=armv8-a+crypto+crc -mtune=cortex-a73
DEFAULT_PACKAGES += fitblk kmod-phy-aquantia kmod-crypto-hw-safexcel uboot-envtools kmod-mt798x-2p5g-phy mtkhqos_util mii_mgr mtk-smp switch
KERNELNAME:=Image dtbs

define Target/Description
	Build firmware images for MediaTek Filogic ARM based boards.
endef
