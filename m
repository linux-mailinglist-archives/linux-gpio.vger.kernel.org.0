Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7CE2C1D13
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 05:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgKXEiQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 23:38:16 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:36189 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgKXEiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 23:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1606192695; x=1637728695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dr60Dd5w6mhOffnaoMhKIVWagEomMPZTmljzPR2qAVg=;
  b=SgP3RP43s6oyQHyYZ4C1CIg4DmFKIsSie7Dm7iBc35k4JsFBxtmFmgQE
   umid+GepQsfnJvMyjm5coBbLmC3gRF5+w2ChRyiUJ1J72AvKb6iGWIY3A
   KCwdHYCuZL48eBcz4UHlE0/t294fIHBazIyQAKx0l6UI0tVkOmoN05bPv
   3wiubPF7798xG+giSLp3fQQhURnO8tpNQDJ5PLsxHXB+gQ1RqzmQU4Chb
   pOsWq9EoIB79r23AGzaB0q/oskq/2yv0+ZfiXv+Z922eBl/bmiossWG4D
   FJif/Y9BuND4ORfeqW96Vn/fqn3hk99nRn5RA4LWt/xrlCqhXiqy7000j
   A==;
IronPort-SDR: 1D+bQYAA1Cc7S6br/L7UlUBEljrUiuRMPjN2sOZQtU5Jjn+LrqzuTw00Vnjcz2d+IGysIvdYd3
 Maq7KhVJmqKDWxmwUXncjTXXo5KHUrKNlhLpUiHCQfI7LeRkE5yy0NuvoZBRCMXlLiJP1v9oJC
 jOKFe661pZRZl9PVMam4f3wjJ2bQGBr99NHzfasmRwVA4FH+v84e/zP13VacJtK7mzM3hIPFCv
 lanmMun49SH4nmoZri0HKVpz/fVLdYQrIZdxSOw79PoSk+Ytr1SDYMJbdpvuY8fSaFcqmkSceJ
 0kI=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; 
   d="scan'208";a="154498218"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:38:15 +0800
IronPort-SDR: 2CzvQqHvKpnIjjH9noXeow9G+vvBhWSlJGD/b20C0yWj5VuwzNHt5ZkhRB+IIZh7bm38IRD3Qo
 e9uB0QSTAGaYDWdBEyR3rByq4fQdkymfY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 20:23:59 -0800
IronPort-SDR: OKMwJnqI3CivFmdAi2nKsXaw9v2HbAqaZQuRZZcMNz+hlVCgIV8BvaiKEifgVD3TbdYOO0sURX
 QorA1R0nxVsw==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.71.163])
  by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:38:12 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v2 21/21] riscv: Add Canaan Kendryte K210 SD card defconfig
Date:   Tue, 24 Nov 2020 13:37:28 +0900
Message-Id: <20201124043728.199852-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The nommu_k210_defconfig default configuration allows booting a K210
SoC based board using an embedded intramfs cpio file. Modifying this
configuration to enable support for the board SD card is not
trivial for all users. To help beginners getting started with this
board, add the nommu_k210_sdcard_defconfig default configuration file
to set all configuration options necessary to use the board mmc-spi
sd card for the root file system. This configuration adds support for
the block layer, the mmc-spi driver and modifies the boot options to
specify the rootfs device as mmcblk0p1 (first partition of the sd card
block device). The ext2 file system is selected by default to encourage
its use as that results in only about 4KB added to the kernel image
size. The default device tree compiled in is unchanged and must be
replaced by the user with the device tree suitable for the board being
used (k210_maix_bit, k210_maix_dock, k210_maix_go, k210_maixduino or
k210_kd233).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../riscv/configs/nommu_k210_sdcard_defconfig | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 arch/riscv/configs/nommu_k210_sdcard_defconfig

diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
new file mode 100644
index 000000000000..3d2cb4747e7f
--- /dev/null
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -0,0 +1,90 @@
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
+CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 rw"
+CONFIG_CMDLINE_FORCE=y
+# CONFIG_SECCOMP is not set
+# CONFIG_STACKPROTECTOR is not set
+# CONFIG_BLK_DEV_BSG is not set
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
+CONFIG_GPIO_SYSFS=y
+# CONFIG_GPIO_CDEV_V1 is not set
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_SIFIVE=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
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
2.28.0

