DTS_DIR := $(DTS_DIR)/mediatek
define Device/tplink_tl-7dr7299-v1
  DEVICE_VENDOR := TP-Link
  DEVICE_MODEL := TL-7DR7299
  DEVICE_VARIANT := v1
  DEVICE_DTS := mt7988a-tplink-tl-7dr7299-v1
  DEVICE_DTS_DIR := ../dts
  DEVICE_DTS_LOADADDR := 0x47f00000
  DEVICE_PACKAGES := mt798x-2p5g-phy-firmware-internal \
	mt7988-wo-firmware kmod-mt798x-2p5g-phy kmod-phy-rtl8261d \
	kmod-switch-rtl837x swconfig kmod-sfp kmod-usb3 automount \
	datconf datconf-lua kvcedit libkvcutil wireless-regdb wifi-dats wifi-scripts \
	luci-app-mtwifi-cfg luci-i18n-mtwifi-cfg-zh-cn mtwifi-cfg \
	kmod-mediatek_hnat kmod-warp kmod-mt_wifi_cmn kmod-mt_wifi7 \
	kmod-mt_hwifi kmod-mtk_pci kmod-mtk_wed kmod-connac_if \
	kmod-mt7992 kmod-mt799a luci-app-eqos-mtk luci-i18n-eqos-mtk-zh-cn \
	luci-app-turboacc-mtk -luci-app-turboacc \
	-wpad-openssl -hostapd-common -kmod-mac80211 -kmod-mt76 \
	-kmod-mt7992_dbg -kmod-mt7996e -kmod-mt7996-firmware -kmod-mt7992-firmware \
	-kmod-mt7992-23-firmware -kmod-mt7990-firmware
  KERNEL_LOADADDR := 0x48000000
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  KERNEL_IN_UBI := 1
  UBOOTENV_IN_UBI := 1
  IMAGES := factory.bin sysupgrade.bin sysupgrade.itb
  KERNEL_INITRAMFS_SUFFIX := -recovery.itb
  KERNEL := kernel-bin | gzip
  KERNEL_INITRAMFS := kernel-bin | lzma | \
	fit lzma $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb with-initrd | pad-to 64k
  IMAGE/factory.bin := append-kernel | \
	fit gzip $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb | \
	pad-to 64k | append-rootfs | pad-rootfs
  IMAGE/sysupgrade.bin := append-kernel | \
	fit gzip $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb | \
	sysupgrade-tar kernel=$$$$@ | append-metadata
  IMAGE/sysupgrade.itb := append-kernel | \
	fit gzip $$(KDIR)/image-$$(firstword $$(DEVICE_DTS)).dtb external-with-rootfs | \
	pad-rootfs | append-metadata
endef
TARGET_DEVICES += tplink_tl-7dr7299-v1
