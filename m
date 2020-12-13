Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C728D2D8DA6
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 14:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407076AbgLMN4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 08:56:13 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:1980 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729616AbgLMN4M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 08:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607867772; x=1639403772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=moBcdpuy4NeYf+AnACShneSMBmwdX94fTn4G4UmmMMY=;
  b=N7mJcO4rww2ofgnN88mwUl1rR36el1roU9JGFUeBOfHiZuYTianbuygX
   9y4Goyo+ImkgUsBbv16ISd8FLLP5OjuZRAtDme9MR80W3iJV5TJLFwYB6
   4dQK1M14N/RUZGkt2V04o7lk9Wzao9gIsiVV5Xv+fXkeBXZEyuY1Bv6Ta
   VGu7YMlt2bxJOHMujhoE6SK4WaF+XaiP7eLpz3OfExcAULo1WK2eLtq8g
   Bxuy8vGg0EK63P3AyyF+0Y392K84HC34YlnO9Fnqsy3H8D2iqfxkPaG+9
   PFOKlG3k1zjX7E0PyOwy28qG2sSqiiOxXJuQf3DjGlQjAKchq+SyZksq6
   g==;
IronPort-SDR: 6yU2iOxPLUVwhiEw910PPpiJAzFejnVf8zJwzWx/cm37PCqf5psxQAVWBpUBxvRvA4V1G89krG
 Ka1LygqYtODZ4ZsqGlUEkZDu9Ue1ITWrMfAh0b5hxPrvK73EsbIbIEvv9mkL++yHB9jLCoD8or
 /2hnlcb/9m+sFw2tot0hAF/cGABJhkMeIqmXV9y3Dj9azQhiDgspcd2rriYSVUbCZKT9AZB1ga
 EyS9J4DvnIgRrBKaDbe3vOfgVo2DzaF3nSTYWbzAQaOOh3C7OOdIR2RdTRYV15I/2XkqmW2i0g
 bOk=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; 
   d="scan'208";a="159494653"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:47 +0800
IronPort-SDR: H6lp42BCgm9IeoakPOIy56Y2MSia4E3gaLs6LSUTjk62kv8GdEP4Q+fpqHNHBRHVtZPa982wov
 8Lc6uhee8COLNMJs8cf4T59PVHHG42gY2hLufSBxokpow379HOT6mVWTzkiT+d15r2Q5jpP/EX
 ZidEMoBG8swrIhmv6p4cIflUTutNWt2O009Zpf+gVZb9Duby7NkwG3edwSu13yKB9dkd69USfX
 Dw/M16sl5ToxJw1m5nO9HfuTZpZqvp/kv1ayyalKavHOHLj/YjnRl49tYXDmeI2jystWdQH7GB
 acxiuTYo3PNWCz7fCVBzyFJs
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 05:35:33 -0800
IronPort-SDR: Ha+U+uwONCiXepilon25PlhE/jUzEIV95N7rsiDHl2wrn8OPVv+G5AT0yJ8WKEXY2kXZLW0fo0
 +rdlJcXP1lP6OTLuBFl5rLYMcezzU026fp9zt5IYZSJfmA3fKtNRHd7d7V2t+yxJFNa8bTHSmJ
 xYR3eocc3fLvLsRHkvICaWaA+6Me3W+wcjd4L8KUJENATYfRR4U4LP8OgozgVzi6tl+6cJnc8D
 qohjBnd1yJPgvU4xUZOMM0eC2aijqeGoislzZgCJEo2hKv1yrlaq8ikK3ZBoj6D0jbk4dteXNn
 lp4=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.197])
  by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:46 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v10 23/23] riscv: Add Canaan Kendryte K210 SD card defconfig
Date:   Sun, 13 Dec 2020 22:50:56 +0900
Message-Id: <20201213135056.24446-24-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The nommu_k210_defconfig default configuration allows booting a Canaan
Kendryte K210 SoC based boards using an embedded intramfs cpio file.
Modifying this configuration to enable support for the board SD card is
not trivial for all users. To help beginners getting started with these
boards, add the nommu_k210_sdcard_defconfig default configuration file
to set all configuration options necessary to use the board mmc-spi sd
card for the root file system.

This new configuration adds support for the block layer, the mmc-spi
driver and modifies the boot options to specify the rootfs device as
mmcblk0p1 (first partition of the sd card block device). The ext2 file
system is selected by default to encourage its use as that results in
only about 4KB added to the kernel image size. As ext2 does not have
journaling, the boot options specify a read-only mount of the file
system. Similarly to the smaller nommu_k210_defconfig, this new default
configuration disables virtual terminal support to reduce the kernel
image size.

The default device tree selected is unchanged, specifying the simple
"k210_generic" device tree file. The user must change this setting to
specify the device tree suitable for the board being used
(k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
k210_kd233).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../riscv/configs/nommu_k210_sdcard_defconfig | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig

diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
new file mode 100644
index 000000000000..a75388defd44
--- /dev/null
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -0,0 +1,93 @@
+# CONFIG_CPU_ISOLATION is not set
+CONFIG_LOG_BUF_SHIFT=13
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_FHANDLE is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+# CONFIG_KALLSYMS is not set
+CONFIG_EMBEDDED=y
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_COMPAT_BRK is not set
+CONFIG_SLOB=y
+# CONFIG_MMU is not set
+CONFIG_SOC_CANAAN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
+CONFIG_MAXPHYSMEM_2GB=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
+CONFIG_CMDLINE_FORCE=y
+# CONFIG_SECCOMP is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_BINFMT_FLAT=y
+# CONFIG_COREDUMP is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_FW_LOADER is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_BLK_DEV is not set
+# CONFIG_INPUT_LEDS is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_LDISC_AUTOLOAD is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_DEVMEM is not set
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
+# CONFIG_HWMON is not set
+# CONFIG_HID is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=y
+# CONFIG_PWRSEQ_EMMC is not set
+# CONFIG_PWRSEQ_SIMPLE is not set
+CONFIG_MMC_SPI=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_USER=y
+# CONFIG_VIRTIO_MENU is not set
+# CONFIG_VHOST_MENU is not set
+CONFIG_EXT2_FS=y
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_LSM="[]"
+CONFIG_PRINTK_TIME=y
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MISC is not set
+CONFIG_PANIC_ON_OOPS=y
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.29.2

