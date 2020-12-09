Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B282D3B00
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 06:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgLIFkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 00:40:15 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:15290 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727473AbgLIFkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 00:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607492414; x=1639028414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebjHG3E42Zd5Tmi97Xiocqj07Wczhf9NVnm3CYDtPR8=;
  b=QbQF7pKrKuQ6VRiKIfBQbcbLEjpU2pkmcaGL4nu8HelqsItIWcjV8BjF
   /XtIIdkEUQ4Xzcbe7mzBBy/1+BeKELPfSTyCaIrEZN+WsJY66DaFK1Bcd
   kzWYu7jdv6LYPXF0y9E2JXwWwOcd93Ld1lXIxfnWwSzMHRMJyC9rml0sv
   OsjtxRgh8myBgSrqSnwqoASo1+ahNWJnbtAgVcxXaz5x70MZ18iH8aclY
   7WAmDenXC1qVzc7QXEtZMj60MmkUjdcwqq1ql61akJ/5Qo0pxAbmUgGop
   sAY8xYjgyCEBnA2l19/9BuQDRhK88teyhLK0opHyyP0fOkXL1o5UJB6+d
   g==;
IronPort-SDR: 1SeNDaT1aeSF74eOwPCv20xZ/C5lCsaWAb/kXybB90JOHFAsd2tIWLA2zyk5VjrlTNrF93H6U8
 5TZSX3Qabg2KWNHipr/SzrKfwD3pRaexUF/CKXoKsRjaMI21vL3nrSCbi0zGD3/D4+7BtDO25j
 4egSTO0KfP9QyFL5rMCLLsSS5GHjJ3Er29x2EknMAEr6whPHfnZKhCk1JcQwKIyn35A20v7b6e
 wAQ+eeNYPS2jylB2atrxQfmkaSffkAAzROfWqnKXcX0u/MyO/ODxEJt0NenwS+JiVBKJZgEc5p
 cyo=
X-IronPort-AV: E=Sophos;i="5.78,404,1599494400"; 
   d="scan'208";a="154735954"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2020 13:35:55 +0800
IronPort-SDR: CIkh+3PG9sTO/Wq7H18RbrzovmBUJYJemefPF4/yDUEGEL53Z4TFrhUPFxH6jsJtq0MarhG5b3
 y8rYFYxwRx/ouGjtGdmMFQFLisPgJ2DS0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 21:21:22 -0800
IronPort-SDR: aMBgGgKXHrbWCcOkEitJ2+glmPADuYSfBRxsctzyZzcuXiEPuCilOlfrfAFqme0crNbv0KfH5o
 5vdks2095lug==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 08 Dec 2020 21:35:54 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v6 22/22] riscv: Add Canaan Kendryte K210 SD card defconfig
Date:   Wed,  9 Dec 2020 14:35:06 +0900
Message-Id: <20201209053506.122582-23-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201209053506.122582-1-damien.lemoal@wdc.com>
References: <20201209053506.122582-1-damien.lemoal@wdc.com>
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
2.28.0

