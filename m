Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEFD2D3AFD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgLIFkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:40:08 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15280 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgLIFkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492408; x=1639028408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vqr+7vJYBCj54xYtLqEK91uVNHh1uEBFvkgHxdpzGS8=;
  b=kVUDXULxd2PYdYp3ph4flZYI6yKvAfbIe/Yb8/BgInUHUTqvksCp/VBi
   89TmdIaceDA80gLG9kNm05NG7hXrg2z5XmZshx5Ovan5pdE23S3Rugw7r
   6aEsgzRpD3zsvSJGfwO6GnQ3gzjtwBUZy0/X+sa9nizLI1iUsGQMUt241
   KX7i0BJknvI8Z4pj7FC8ccGtpOWztDjN8wGEIob/R892xar2Y4+95H2bO
   QINd9g6fCyK5ensPkUGX15oKaCSGDBTkW3Sq3pRZm5Jh6SSBr/qMlgV9Z
   bTSlRADk0mM6IgBJIlmq4Ci/bhQKWsqiM797vdDVlyE1ISCBESy+9neAf
   Q==;
IronPort-SDR: CSRfNMCSDo9LONptUY/PU05XP9NfFhbT0X3QugWhlVNyOTgwUCGE9p7EfJ23eMRVDfOfiKYWOk
 3PWm9NbfVw9dfTXw3BxCDLGrnM0Rsz1KdeIeOJ/Z7oCO47wHd4h82qhDIXFZPrHWCj7TiIvLuG
 HB7kXTtpFSWfsmJ674n5WgHAUMcy/uHzP6wYSmURjbGlBou+BiN+4qwIaHG0nKtvSYoigvcJvV
 hbQT5qWRZSIbfJ81OwLBC/5Z7g/xMzXi3N3JBGwzwm5+Uxvvfz2hofHHfj3eG4UMxePYzZ97An
 U68=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735949"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:53 +0800
IronPort-SDR: 3D6z4SB8qBiUlPILKp09TZdFyokOijxs97B0fb11Pfe7fZAFccm+YTm2UfZg/x7o3DMaEVv9eG
 7nCEWF3lYrkcSLh7ZoxBZ0iq3djoA66Ys=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:21:20 -0800
IronPort-SDR: 2XgEKbnGGRuu/3zQabjFP4qdWDv9vDC4MzcYuF2THB6COThhJAy6DEa3L+pm/yjSH2tmEUE5k+
 5upxYtB3YmWw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:52 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 21/22] riscv: Update Canaan Kendryte K210 defconfig
Date:   Wed,  9 Dec 2020 14:35:05 +0900
Message-Id: <20201209053506.122582-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the Kendryte k210 nommu default configuration file
(nommu_k210_defconfig) to include device drivers for reset, reboot,
I2C, SPI, gpio and LEDs support. Virtual Terminal support is also
disabled as no terminal devices are supported and enabled. Disabling
CONFIG_VT (removing the no longer needed override for
CONFIG_VGA_CONSOLE) reduces the kernel image size by about 65 KB.

This default configuration remains suitable for a system using an
initramfs cpio file linked into the kernel image.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 37 +++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 368a28cf1467..a099c29b4b14 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -1,17 +1,19 @@
 # CONFIG_CPU_ISOLATION is not set
-CONFIG_LOG_BUF_SHIFT=15
+CONFIG_LOG_BUF_SHIFT=13
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_FORCE=y
+# CONFIG_RD_GZIP is not set
 # CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
+# CONFIG_RD_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
 # CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
 # CONFIG_TIMERFD is not set
@@ -25,15 +27,16 @@ CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
-# CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
 CONFIG_CMDLINE_FORCE=y
-CONFIG_JUMP_LABEL=y
+# CONFIG_SECCOMP is not set
+# CONFIG_STACKPROTECTOR is not set
 # CONFIG_BLOCK is not set
 CONFIG_BINFMT_FLAT=y
 # CONFIG_COREDUMP is not set
@@ -41,23 +44,47 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_INPUT_LEDS is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_LDISC_AUTOLOAD is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_DEVMEM is not set
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+# CONFIG_I2C_HELPER_AUTO is not set
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_SPI=y
+# CONFIG_SPI_MEM is not set
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_DW_MMIO=y
+# CONFIG_GPIO_SYSFS is not set
+# CONFIG_GPIO_CDEV_V1 is not set
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
 # CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_USER=y
 # CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+# CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
 # CONFIG_MISC_FILESYSTEMS is not set
 CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
 # CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.28.0

