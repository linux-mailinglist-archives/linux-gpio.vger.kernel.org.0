Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373062D24BA
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 08:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgLHHi7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 02:38:59 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:58686 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgLHHi7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 02:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1607413139; x=1638949139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebjHG3E42Zd5Tmi97Xiocqj07Wczhf9NVnm3CYDtPR8=;
  b=fLIwFmuobxHubMqpjs1GSld9ON0tYnL38lOhH3/EXFTvZgaDeMY6ySQy
   AbDkOm4KcFaNejYSmMnZETnazXvcQuPtSIUOTV6wFycejEpw/b7Ll/F8j
   3MAXdg9/9KXowd2u25aNv4kY8pI4lt5VoW40sOJrUQphIEtgGQIf2gS6e
   OkIWzBD3nN4js/bl5BEZmtC5FfeBXrgPbEqo0qnZ4inkVO3nKyjYJs/BN
   XMDuJr5Wxdp433KYS/9gchNvS6JPSzkeHxUv2a9JHDO9vVmqdhpzCdZpN
   FOi8ZjO4/ESZqiEA9xGSovHOmO/7vaLxJoV/goPdhFRPQjCbzBQBOqTZ6
   w==;
IronPort-SDR: ytJUbkl15I7Zy/4SZWZ+oNsDo1yWHWWcqB/5Cr6sKfHWDm3A4DQBCf56NltSGFyKydExKNi/9V
 h2V+17r81LtCXwhQUE4oCatB+p6hkS9ZVJogJVcqMXZkwPVOPwaBQAzIk/Uqbyi4xtRzdGMhE7
 hi2Lucgaj33VbrMjqUdRSq6wYN5876DE7BvWiqYXlGwkceRpJcCxoiBvM0zo4U5Hjd5SC4mSqA
 vMsosi68fgqrAGw1X93HKgm7/1P+RzN6Fq4C+D/Fuxn4RCxjMY+Si49DRlZA/zjkrI5KCkaZ4L
 wCI=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="155876694"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:43 +0800
IronPort-SDR: ClMk7J8oqskX3/slYbQLY3I1iPv2meCHu1ni0aZL2xSn5FcXAhv6Q0nXVyJzRm9kx6RrCyQ6W6
 eapgG+W/Pxy2h5AaoM6vu0WLRa7Tl4hJ0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 23:18:44 -0800
IronPort-SDR: LrV/27JucSw6TXzYLwkOuIz7Jc8ERDV/78EIfUeOXTpO0A8+DXo8LE1ME0fW35Z5aJ6i/YAfT0
 3h5QySeSPP7A==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com) ([10.84.71.173])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:41 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sean Anderson <seanga2@gmail.com>
Subject: [PATCH v5 21/21] riscv: Add Canaan Kendryte K210 SD card defconfig
Date:   Tue,  8 Dec 2020 16:33:55 +0900
Message-Id: <20201208073355.40828-22-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
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

