#
# hua.shao@mediatek.com
#
# MTK Property Software.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=regs
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/kernel.mk

define Package/regs
  SECTION:=MTK Properties
  CATEGORY:=MTK Properties
  TITLE:=an program to read/write from/to a pci device from userspace.
  SUBMENU:=Applications
  DEPENDS:=@(KERNEL_DEVMEM||TARGET_mediatek_filogic_mtk_feeds_a73_6_6)
endef

define Package/regs/description
  Simple program to read/write from/to a pci device from userspace.
endef

define Build/Configure
endef

define Package/regs/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/regs $(1)/usr/bin
endef


$(eval $(call BuildPackage,regs))

