Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B66D2D8C56
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 09:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404452AbgLMIO4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 03:14:56 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32104 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404110AbgLMIO4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 03:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607847295; x=1639383295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+/z2k3yrZphzSSBrE2sG8I+qUOzmZKRpqBGEChKvdks=;
  b=QgJLeY+cNl68XIOMYq+gE5gl7VPMn3aqvllnC/D5+tHntWK1E+0GLvSK
   5MHomTWUs2ZlcelBc5JK8RXRQ0Qm4E+KHnx21oyFL9gB9HGKD3Vwd2uSS
   oIxjSr5wpfCxh8BIUHxy7c5UDzWNXOShN6yv4Q7cAvyxJzoAUKCZaYDUU
   I1XF9dkvm95Cd+lOVGH+A7SYkUSaXSfYfJrNwUXpNuBYVdZ1cjBwfRdd3
   2cBy6IHGoGDHrUt1BPpO0ZnE83Qr86pCig7//wi3x6pclSsjFcE0Rzsmf
   hKJH5yRyxgzv3cuelzO9BmWyCIwy5i1bwh23HzG1AEG8j6ltmlGhqM+HI
   g==;
IronPort-SDR: ha1/kY4EJDCNF4ND4/AapYGBT75X3QK101zQ05ngGABbRDBp1jNT9m52Ckf77ZcFiz13Y0uHK6
 y3J0mux9mx4mCUQcAzg8NHwleLNj6Qp6+uASLLVcreYC2UZD58cVozmK8L5RNNUVAaMt94U2Uh
 rBTrQVdlQJmzdPuvTWzzXOLtxlscX7VBtDY3dMt0DsDxkDR9HWitdOTO0UUrljsNkPHNHE6KBs
 d+MHWVMX25VxWv69sDO4XLp0fJeRdIpexXrruf9ddSwsADKUPEAzrT2Vi/ZsElLxQpOZ5Kimm4
 EF0=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; 
   d="scan'208";a="265208234"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:11:03 +0800
IronPort-SDR: nsE29EyJVJKDp+IxuYZdO+gcA/m613qGC9ngaYC4mg4AcorkXxYY514T+3IIpPXaBHSfRy2J1q
 /8VgnushUB+/G5KAMI4s3pWxEs0nazA1qa7ONvml9uheoBEtzq4Ivp1zQZjkBQGsA2TIMTw545
 5TMSj6zoQ8ZHMnGh86uc8DIUbYSCsKwmt3HSWM4Bcj0WKk6w2NXDPydnGEBCxbwEExlEYGPFEo
 BQSlMiBv2RzdKUgc80XYq2qf0S0GsUzWrr1qD6q9EUThHUh1SuGuzRCata7IOmEZvYJDmDNwQM
 JBx+Ex3SUlLu5qD8BSIFAetA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2020 23:56:24 -0800
IronPort-SDR: u9u/NPJMxuIK8sYTfJTw3v3AWOjWzLc1TTiwzsUVMOmT7Iupc6UQIYyUAPHIDacanpRJObst3Q
 Y6MC2Wx7XZBmqCTQMtWtkov28uyLW4aW4veJCtkrRuWQzxz8/QWXaCQUzEuoTw+Gre8DzotBTz
 TT8G975WiD0PLsInjseyQu1pDL9IwUa6PWCtyrdKMIImxwFu0+giAHuDg24/0Zq+RWHX4HI51Q
 Dh+VwQrt2URc86W6c9iRg7pxFnm8aMxFBlDl6l1tNri4psdoQaKYgH6AY8TKHKHx7fW01w09Sy
 1QY=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:11:02 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v9 21/22] riscv: Update Canaan Kendryte K210 defconfig
Date:   Sun, 13 Dec 2020 17:10:15 +0900
Message-Id: <20201213081016.179192-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
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
2.29.2

