Return-Path: <linux-gpio+bounces-1489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D029813528
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 16:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5EED2824B0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 15:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE55B5D901;
	Thu, 14 Dec 2023 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTW7CPu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F58121;
	Thu, 14 Dec 2023 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702568830; x=1734104830;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fUbeEhjgmcl8lOIX38zf52BZMqE0KEFJ4lBnSwk8NmA=;
  b=bTW7CPu8PHQd5HpL8ctKADrvyNxUIeqxSzoDx3+5UplHK+LftjCooPMP
   tJlxAg7k00sdJ6zyBDGNOOaW87FlHd6yq1yrtalNHNCZB+hityj6a/FHu
   hbUf84YheyEBbiqpkiBdrX6BJ75xuzvSbqp263c5VE6ds+ZUdfHZ4RBBT
   ThVl/p0giO9y9czZb0ezqv2gP8pktBl/6X84CGzn40bWdY52xalZsCqmp
   cxK43hLmndQH67F8tUU0jo9h42NxsKEW2tCo7/KjzGhmjpbpziePV+GuE
   A+2/r5TLer83ZeYcYsjtN2GeJnIYHeO7S+fGprFwbyUXQ6c2PKCmNPWp9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459458353"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="459458353"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:47:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="808621106"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="808621106"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2023 07:46:57 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C6BD63AE; Thu, 14 Dec 2023 17:46:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Add Intel Meteor Point pin controller and GPIO support
Date: Thu, 14 Dec 2023 17:46:53 +0200
Message-ID: <20231214154653.1087747-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver supports pinctrl/GPIO hardware found on Intel Meteor Point
(a Meteor Lake PCH) providing users a pinctrl and GPIO interfaces
including GPIO interrupts.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig               |   9 +
 drivers/pinctrl/intel/Makefile              |   1 +
 drivers/pinctrl/intel/pinctrl-meteorpoint.c | 465 ++++++++++++++++++++
 3 files changed, 475 insertions(+)
 create mode 100644 drivers/pinctrl/intel/pinctrl-meteorpoint.c

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index d9bdd0e0e8a2..2101d30bd66c 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -138,6 +138,15 @@ config PINCTRL_METEORLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Meteor Lake pins and using them as GPIOs.
 
+config PINCTRL_METEORPOINT
+	tristate "Intel Meteor Point pinctrl and GPIO driver"
+	depends on ACPI
+	select PINCTRL_INTEL
+	help
+	  Meteor Point is the PCH of Intel Meteor Lake. This pinctrl driver
+	  provides an interface that allows configuring of PCH pins and
+	  using them as GPIOs.
+
 config PINCTRL_SUNRISEPOINT
 	tristate "Intel Sunrisepoint pinctrl and GPIO driver"
 	select PINCTRL_INTEL
diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index 96c93ed4bd58..d0d868c9a622 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -22,5 +22,6 @@ obj-$(CONFIG_PINCTRL_JASPERLAKE)	+= pinctrl-jasperlake.o
 obj-$(CONFIG_PINCTRL_LAKEFIELD)		+= pinctrl-lakefield.o
 obj-$(CONFIG_PINCTRL_LEWISBURG)		+= pinctrl-lewisburg.o
 obj-$(CONFIG_PINCTRL_METEORLAKE)	+= pinctrl-meteorlake.o
+obj-$(CONFIG_PINCTRL_METEORPOINT)	+= pinctrl-meteorpoint.o
 obj-$(CONFIG_PINCTRL_SUNRISEPOINT)	+= pinctrl-sunrisepoint.o
 obj-$(CONFIG_PINCTRL_TIGERLAKE)		+= pinctrl-tigerlake.o
diff --git a/drivers/pinctrl/intel/pinctrl-meteorpoint.c b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
new file mode 100644
index 000000000000..77e97775a60b
--- /dev/null
+++ b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Meteor Point PCH pinctrl/GPIO driver
+ *
+ * Copyright (C) 2022-2023, Intel Corporation
+ * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-intel.h"
+
+#define MTP_PAD_OWN	0x0b0
+#define MTP_PADCFGLOCK	0x110
+#define MTP_HOSTSW_OWN	0x150
+#define MTP_GPI_IS	0x200
+#define MTP_GPI_IE	0x220
+
+#define MTP_GPP(r, s, e, g)				\
+	{						\
+		.reg_num = (r),				\
+		.base = (s),				\
+		.size = ((e) - (s) + 1),		\
+		.gpio_base = (g),			\
+	}
+
+#define MTP_COMMUNITY(b, s, e, g)			\
+	INTEL_COMMUNITY_GPPS(b, s, e, g, MTP)
+
+/* Meteor Point-S */
+static const struct pinctrl_pin_desc mtps_pins[] = {
+	/* GPP_D */
+	PINCTRL_PIN(0, "GPP_D_0"),
+	PINCTRL_PIN(1, "GPP_D_1"),
+	PINCTRL_PIN(2, "GPP_D_2"),
+	PINCTRL_PIN(3, "GPP_D_3"),
+	PINCTRL_PIN(4, "GPP_D_4"),
+	PINCTRL_PIN(5, "CNV_RF_RESET_B"),
+	PINCTRL_PIN(6, "CRF_CLKREQ"),
+	PINCTRL_PIN(7, "GPP_D_7"),
+	PINCTRL_PIN(8, "GPP_D_8"),
+	PINCTRL_PIN(9, "SML0CLK"),
+	PINCTRL_PIN(10, "SML0DATA"),
+	PINCTRL_PIN(11, "GPP_D_11"),
+	PINCTRL_PIN(12, "GPP_D_12"),
+	PINCTRL_PIN(13, "GPP_D_13"),
+	PINCTRL_PIN(14, "GPP_D_14"),
+	PINCTRL_PIN(15, "GPP_D_15"),
+	PINCTRL_PIN(16, "GPP_D_16"),
+	PINCTRL_PIN(17, "GPP_D_17"),
+	PINCTRL_PIN(18, "GPP_D_18"),
+	PINCTRL_PIN(19, "GPP_D_19"),
+	PINCTRL_PIN(20, "GPP_D_20"),
+	PINCTRL_PIN(21, "GPP_D_21"),
+	PINCTRL_PIN(22, "GPP_D_22"),
+	PINCTRL_PIN(23, "GPP_D_23"),
+	PINCTRL_PIN(24, "GSPI3_CLK_LOOPBK"),
+	/* GPP_R */
+	PINCTRL_PIN(25, "HDA_BCLK"),
+	PINCTRL_PIN(26, "HDA_SYNC"),
+	PINCTRL_PIN(27, "HDA_SDO"),
+	PINCTRL_PIN(28, "HDA_SDI_0"),
+	PINCTRL_PIN(29, "HDA_RSTB"),
+	PINCTRL_PIN(30, "GPP_R_5"),
+	PINCTRL_PIN(31, "GPP_R_6"),
+	PINCTRL_PIN(32, "GPP_R_7"),
+	PINCTRL_PIN(33, "GPP_R_8"),
+	PINCTRL_PIN(34, "GPP_R_9"),
+	PINCTRL_PIN(35, "GPP_R_10"),
+	PINCTRL_PIN(36, "GPP_R_11"),
+	PINCTRL_PIN(37, "GPP_R_12"),
+	PINCTRL_PIN(38, "GSPI2_CLK_LOOPBK"),
+	/* GPP_J */
+	PINCTRL_PIN(39, "GPP_J_0"),
+	PINCTRL_PIN(40, "CNV_BRI_DT"),
+	PINCTRL_PIN(41, "CNV_BRI_RSP"),
+	PINCTRL_PIN(42, "CNV_RGI_DT"),
+	PINCTRL_PIN(43, "CNV_RGI_RSP"),
+	PINCTRL_PIN(44, "GPP_J_5"),
+	PINCTRL_PIN(45, "GPP_J_6"),
+	PINCTRL_PIN(46, "BOOTHALT_B"),
+	PINCTRL_PIN(47, "RTCCLKOUT"),
+	PINCTRL_PIN(48, "BPKI3C_SDA"),
+	PINCTRL_PIN(49, "BPKI3C_SCL"),
+	PINCTRL_PIN(50, "DAM"),
+	PINCTRL_PIN(51, "HDACPU_SDI"),
+	PINCTRL_PIN(52, "HDACPU_SDO"),
+	PINCTRL_PIN(53, "HDACPU_BCLK"),
+	PINCTRL_PIN(54, "AUX_PWRGD"),
+	PINCTRL_PIN(55, "GLB_RST_WARN_B"),
+	PINCTRL_PIN(56, "RESET_SYNCB"),
+	/* vGPIO */
+	PINCTRL_PIN(57, "CNV_BTEN"),
+	PINCTRL_PIN(58, "CNV_BT_HOST_WAKEB"),
+	PINCTRL_PIN(59, "CNV_BT_IF_SELECT"),
+	PINCTRL_PIN(60, "vCNV_BT_UART_TXD"),
+	PINCTRL_PIN(61, "vCNV_BT_UART_RXD"),
+	PINCTRL_PIN(62, "vCNV_BT_UART_CTS_B"),
+	PINCTRL_PIN(63, "vCNV_BT_UART_RTS_B"),
+	PINCTRL_PIN(64, "vCNV_MFUART1_TXD"),
+	PINCTRL_PIN(65, "vCNV_MFUART1_RXD"),
+	PINCTRL_PIN(66, "vCNV_MFUART1_CTS_B"),
+	PINCTRL_PIN(67, "vCNV_MFUART1_RTS_B"),
+	PINCTRL_PIN(68, "vUART0_TXD"),
+	PINCTRL_PIN(69, "vUART0_RXD"),
+	PINCTRL_PIN(70, "vUART0_CTS_B"),
+	PINCTRL_PIN(71, "vUART0_RTS_B"),
+	PINCTRL_PIN(72, "vISH_UART0_TXD"),
+	PINCTRL_PIN(73, "vISH_UART0_RXD"),
+	PINCTRL_PIN(74, "vISH_UART0_CTS_B"),
+	PINCTRL_PIN(75, "vISH_UART0_RTS_B"),
+	PINCTRL_PIN(76, "vCNV_BT_I2S_BCLK"),
+	PINCTRL_PIN(77, "vCNV_BT_I2S_WS_SYNC"),
+	PINCTRL_PIN(78, "vCNV_BT_I2S_SDO"),
+	PINCTRL_PIN(79, "vCNV_BT_I2S_SDI"),
+	PINCTRL_PIN(80, "vI2S2_SCLK"),
+	PINCTRL_PIN(81, "vI2S2_SFRM"),
+	PINCTRL_PIN(82, "vI2S2_TXD"),
+	PINCTRL_PIN(83, "vI2S2_RXD"),
+	PINCTRL_PIN(84, "THC0_WOT_INT"),
+	PINCTRL_PIN(85, "THC1_WOT_INT"),
+	PINCTRL_PIN(86, "THC0_WHC_INT"),
+	PINCTRL_PIN(87, "THC1_WHC_INT"),
+	/* GPP_A */
+	PINCTRL_PIN(88, "ESPI_IO_0"),
+	PINCTRL_PIN(89, "ESPI_IO_1"),
+	PINCTRL_PIN(90, "ESPI_IO_2"),
+	PINCTRL_PIN(91, "ESPI_IO_3"),
+	PINCTRL_PIN(92, "ESPI_CS0B"),
+	PINCTRL_PIN(93, "ESPI_CLK"),
+	PINCTRL_PIN(94, "ESPI_RESETB"),
+	PINCTRL_PIN(95, "ESPI_CS1B"),
+	PINCTRL_PIN(96, "ESPI_CS2B"),
+	PINCTRL_PIN(97, "ESPI_CS3B"),
+	PINCTRL_PIN(98, "ESPI_ALERT0B"),
+	PINCTRL_PIN(99, "ESPI_ALERT1B"),
+	PINCTRL_PIN(100, "ESPI_ALERT2B"),
+	PINCTRL_PIN(101, "ESPI_ALERT3B"),
+	PINCTRL_PIN(102, "ESPI_CLK_LOOPBK"),
+	/* DIR_ESPI */
+	PINCTRL_PIN(103, "PWRBTNB_OUT"),
+	PINCTRL_PIN(104, "DMI_PERSTB"),
+	PINCTRL_PIN(105, "DMI_CLKREQB"),
+	PINCTRL_PIN(106, "DIR_ESPI_IO_0"),
+	PINCTRL_PIN(107, "DIR_ESPI_IO_1"),
+	PINCTRL_PIN(108, "DIR_ESPI_IO_2"),
+	PINCTRL_PIN(109, "DIR_ESPI_IO_3"),
+	PINCTRL_PIN(110, "DIR_ESPI_CSB"),
+	PINCTRL_PIN(111, "DIR_ESPI_RESETB"),
+	PINCTRL_PIN(112, "DIR_ESPI_CLK"),
+	PINCTRL_PIN(113, "DIR_ESPI_RCLK"),
+	PINCTRL_PIN(114, "DIR_ESPI_ALERTB"),
+	/* GPP_B */
+	PINCTRL_PIN(115, "GPP_B_0"),
+	PINCTRL_PIN(116, "GPP_B_1"),
+	PINCTRL_PIN(117, "GPP_B_2"),
+	PINCTRL_PIN(118, "GPP_B_3"),
+	PINCTRL_PIN(119, "GPP_B_4"),
+	PINCTRL_PIN(120, "GPP_B_5"),
+	PINCTRL_PIN(121, "CLKOUT_48"),
+	PINCTRL_PIN(122, "GPP_B_7"),
+	PINCTRL_PIN(123, "GPP_B_8"),
+	PINCTRL_PIN(124, "GPP_B_9"),
+	PINCTRL_PIN(125, "GPP_B_10"),
+	PINCTRL_PIN(126, "GPP_B_11"),
+	PINCTRL_PIN(127, "SLP_S0B"),
+	PINCTRL_PIN(128, "PLTRSTB"),
+	PINCTRL_PIN(129, "GPP_B_14"),
+	PINCTRL_PIN(130, "GPP_B_15"),
+	PINCTRL_PIN(131, "GPP_B_16"),
+	PINCTRL_PIN(132, "GPP_B_17"),
+	PINCTRL_PIN(133, "GPP_B_18"),
+	PINCTRL_PIN(134, "FUSA_DIAGTEST_EN"),
+	PINCTRL_PIN(135, "FUSA_DIAGTEST_MODE"),
+	PINCTRL_PIN(136, "GPP_B_21"),
+	/* SPI0 */
+	PINCTRL_PIN(137, "SPI0_IO_2"),
+	PINCTRL_PIN(138, "SPI0_IO_3"),
+	PINCTRL_PIN(139, "SPI0_MOSI_IO_0"),
+	PINCTRL_PIN(140, "SPI0_MISO_IO_1"),
+	PINCTRL_PIN(141, "SPI0_TPM_CSB"),
+	PINCTRL_PIN(142, "SPI0_FLASH_0_CSB"),
+	PINCTRL_PIN(143, "SPI0_FLASH_1_CSB"),
+	PINCTRL_PIN(144, "SPI0_CLK"),
+	PINCTRL_PIN(145, "SPI0_CLK_LOOPBK"),
+	/* GPP_C */
+	PINCTRL_PIN(146, "SMBCLK"),
+	PINCTRL_PIN(147, "SMBDATA"),
+	PINCTRL_PIN(148, "SMBALERTB"),
+	PINCTRL_PIN(149, "GPP_C_3"),
+	PINCTRL_PIN(150, "GPP_C_4"),
+	PINCTRL_PIN(151, "GPP_C_5"),
+	PINCTRL_PIN(152, "GPP_C_6"),
+	PINCTRL_PIN(153, "GPP_C_7"),
+	PINCTRL_PIN(154, "GPP_C_8"),
+	PINCTRL_PIN(155, "GPP_C_9"),
+	PINCTRL_PIN(156, "GPP_C_10"),
+	PINCTRL_PIN(157, "GPP_C_11"),
+	PINCTRL_PIN(158, "GPP_C_12"),
+	PINCTRL_PIN(159, "GPP_C_13"),
+	PINCTRL_PIN(160, "GPP_C_14"),
+	PINCTRL_PIN(161, "GPP_C_15"),
+	PINCTRL_PIN(162, "GPP_C_16"),
+	PINCTRL_PIN(163, "GPP_C_17"),
+	PINCTRL_PIN(164, "GPP_C_18"),
+	PINCTRL_PIN(165, "GPP_C_19"),
+	PINCTRL_PIN(166, "GPP_C_20"),
+	PINCTRL_PIN(167, "GPP_C_21"),
+	PINCTRL_PIN(168, "GPP_C_22"),
+	PINCTRL_PIN(169, "GPP_C_23"),
+	/* GPP_H */
+	PINCTRL_PIN(170, "GPP_H_0"),
+	PINCTRL_PIN(171, "GPP_H_1"),
+	PINCTRL_PIN(172, "GPP_H_2"),
+	PINCTRL_PIN(173, "GPP_H_3"),
+	PINCTRL_PIN(174, "GPP_H_4"),
+	PINCTRL_PIN(175, "GPP_H_5"),
+	PINCTRL_PIN(176, "GPP_H_6"),
+	PINCTRL_PIN(177, "GPP_H_7"),
+	PINCTRL_PIN(178, "GPP_H_8"),
+	PINCTRL_PIN(179, "GPP_H_9"),
+	PINCTRL_PIN(180, "GPP_H_10"),
+	PINCTRL_PIN(181, "GPP_H_11"),
+	PINCTRL_PIN(182, "GPP_H_12"),
+	PINCTRL_PIN(183, "GPP_H_13"),
+	PINCTRL_PIN(184, "GPP_H_14"),
+	PINCTRL_PIN(185, "GPP_H_15"),
+	PINCTRL_PIN(186, "GPP_H_16"),
+	PINCTRL_PIN(187, "GPP_H_17"),
+	PINCTRL_PIN(188, "GPP_H_18"),
+	PINCTRL_PIN(189, "GPP_H_19"),
+	/* vGPIO_3 */
+	PINCTRL_PIN(190, "CPU_PCIE_LNK_DN_0"),
+	PINCTRL_PIN(191, "CPU_PCIE_LNK_DN_1"),
+	PINCTRL_PIN(192, "CPU_PCIE_LNK_DN_2"),
+	PINCTRL_PIN(193, "CPU_PCIE_LNK_DN_3"),
+	/* vGPIO_0 */
+	PINCTRL_PIN(194, "ESPI_USB_OCB_0"),
+	PINCTRL_PIN(195, "ESPI_USB_OCB_1"),
+	PINCTRL_PIN(196, "ESPI_USB_OCB_2"),
+	PINCTRL_PIN(197, "ESPI_USB_OCB_3"),
+	PINCTRL_PIN(198, "USB_CPU_OCB_0"),
+	PINCTRL_PIN(199, "USB_CPU_OCB_1"),
+	PINCTRL_PIN(200, "USB_CPU_OCB_2"),
+	PINCTRL_PIN(201, "USB_CPU_OCB_3"),
+	/* vGPIO_4 */
+	PINCTRL_PIN(202, "ESPI_ISCLK_XTAL_CLKREQ"),
+	PINCTRL_PIN(203, "ISCLK_ESPI_XTAL_CLKACK"),
+	PINCTRL_PIN(204, "ME_SLPC_FTPM_ENABLE"),
+	PINCTRL_PIN(205, "GP_SLPC_DTFUS_CORE_SPITPM_DIS"),
+	PINCTRL_PIN(206, "GP_SLPC_SPI_STRAP_TOS"),
+	PINCTRL_PIN(207, "GP_SLPC_DTFUS_CORE_SPITPM_DIS_L01"),
+	PINCTRL_PIN(208, "GP_SLPC_SPI_STRAP_TOS_L01"),
+	PINCTRL_PIN(209, "LPC_PRR_TS_OVR"),
+	PINCTRL_PIN(210, "ITSS_KU1_SHTDWN"),
+	PINCTRL_PIN(211, "vGPIO_SPARE_0"),
+	PINCTRL_PIN(212, "vGPIO_SPARE_1"),
+	PINCTRL_PIN(213, "vGPIO_SPARE_2"),
+	PINCTRL_PIN(214, "vGPIO_SPARE_3"),
+	PINCTRL_PIN(215, "vGPIO_SPARE_4"),
+	PINCTRL_PIN(216, "vGPIO_SPARE_5"),
+	PINCTRL_PIN(217, "vGPIO_SPARE_6"),
+	PINCTRL_PIN(218, "vGPIO_SPARE_7"),
+	PINCTRL_PIN(219, "vGPIO_SPARE_8"),
+	PINCTRL_PIN(220, "vGPIO_SPARE_9"),
+	PINCTRL_PIN(221, "vGPIO_SPARE_10"),
+	PINCTRL_PIN(222, "vGPIO_SPARE_11"),
+	PINCTRL_PIN(223, "vGPIO_SPARE_12"),
+	PINCTRL_PIN(224, "vGPIO_SPARE_13"),
+	PINCTRL_PIN(225, "vGPIO_SPARE_14"),
+	PINCTRL_PIN(226, "vGPIO_SPARE_15"),
+	PINCTRL_PIN(227, "vGPIO_SPARE_16"),
+	PINCTRL_PIN(228, "vGPIO_SPARE_17"),
+	PINCTRL_PIN(229, "vGPIO_SPARE_18"),
+	PINCTRL_PIN(230, "vGPIO_SPARE_19"),
+	PINCTRL_PIN(231, "vGPIO_SPARE_20"),
+	PINCTRL_PIN(232, "vGPIO_SPARE_21"),
+	/* GPP_S */
+	PINCTRL_PIN(233, "GPP_S_0"),
+	PINCTRL_PIN(234, "GPP_S_1"),
+	PINCTRL_PIN(235, "GPP_S_2"),
+	PINCTRL_PIN(236, "GPP_S_3"),
+	PINCTRL_PIN(237, "GPP_S_4"),
+	PINCTRL_PIN(238, "GPP_S_5"),
+	PINCTRL_PIN(239, "GPP_S_6"),
+	PINCTRL_PIN(240, "GPP_S_7"),
+	/* GPP_E */
+	PINCTRL_PIN(241, "GPP_E_0"),
+	PINCTRL_PIN(242, "GPP_E_1"),
+	PINCTRL_PIN(243, "GPP_E_2"),
+	PINCTRL_PIN(244, "GPP_E_3"),
+	PINCTRL_PIN(245, "GPP_E_4"),
+	PINCTRL_PIN(246, "GPP_E_5"),
+	PINCTRL_PIN(247, "GPP_E_6"),
+	PINCTRL_PIN(248, "GPP_E_7"),
+	PINCTRL_PIN(249, "GPP_E_8"),
+	PINCTRL_PIN(250, "GPP_E_9"),
+	PINCTRL_PIN(251, "GPP_E_10"),
+	PINCTRL_PIN(252, "GPP_E_11"),
+	PINCTRL_PIN(253, "GPP_E_12"),
+	PINCTRL_PIN(254, "GPP_E_13"),
+	PINCTRL_PIN(255, "GPP_E_14"),
+	PINCTRL_PIN(256, "GPP_E_15"),
+	PINCTRL_PIN(257, "GPP_E_16"),
+	PINCTRL_PIN(258, "GPP_E_17"),
+	PINCTRL_PIN(259, "GPP_E_18"),
+	PINCTRL_PIN(260, "GPP_E_19"),
+	PINCTRL_PIN(261, "GPP_E_20"),
+	PINCTRL_PIN(262, "GPP_E_21"),
+	PINCTRL_PIN(263, "SPI1_CLK_LOOPBK"),
+	/* GPP_K */
+	PINCTRL_PIN(264, "GPP_K_0"),
+	PINCTRL_PIN(265, "GPP_K_1"),
+	PINCTRL_PIN(266, "GPP_K_2"),
+	PINCTRL_PIN(267, "GPP_K_3"),
+	PINCTRL_PIN(268, "GPP_K_4"),
+	PINCTRL_PIN(269, "GPP_K_5"),
+	PINCTRL_PIN(270, "FUSE_SORT_BUMP_0"),
+	PINCTRL_PIN(271, "FUSE_SORT_BUMP_1"),
+	PINCTRL_PIN(272, "CORE_VID_0"),
+	PINCTRL_PIN(273, "CORE_VID_1"),
+	PINCTRL_PIN(274, "FUSE_SORT_BUMP_2"),
+	PINCTRL_PIN(275, "MISC_SPARE"),
+	PINCTRL_PIN(276, "SYS_RESETB"),
+	PINCTRL_PIN(277, "MLK_RSTB"),
+	/* GPP_F */
+	PINCTRL_PIN(278, "SATAXPCIE_3"),
+	PINCTRL_PIN(279, "SATAXPCIE_4"),
+	PINCTRL_PIN(280, "SATAXPCIE_5"),
+	PINCTRL_PIN(281, "SATAXPCIE_6"),
+	PINCTRL_PIN(282, "SATAXPCIE_7"),
+	PINCTRL_PIN(283, "SATA_DEVSLP_3"),
+	PINCTRL_PIN(284, "SATA_DEVSLP_4"),
+	PINCTRL_PIN(285, "SATA_DEVSLP_5"),
+	PINCTRL_PIN(286, "SATA_DEVSLP_6"),
+	PINCTRL_PIN(287, "GPP_F_9"),
+	PINCTRL_PIN(288, "GPP_F_10"),
+	PINCTRL_PIN(289, "GPP_F_11"),
+	PINCTRL_PIN(290, "GPP_F_12"),
+	PINCTRL_PIN(291, "GPP_F_13"),
+	PINCTRL_PIN(292, "GPP_F_14"),
+	PINCTRL_PIN(293, "GPP_F_15"),
+	PINCTRL_PIN(294, "GPP_F_16"),
+	PINCTRL_PIN(295, "GPP_F_17"),
+	PINCTRL_PIN(296, "GPP_F_18"),
+	PINCTRL_PIN(297, "DNX_FORCE_RELOAD"),
+	PINCTRL_PIN(298, "GPP_F_20"),
+	PINCTRL_PIN(299, "GPP_F_21"),
+	PINCTRL_PIN(300, "GPP_F_22"),
+	PINCTRL_PIN(301, "GPP_F_23"),
+	/* GPP_I */
+	PINCTRL_PIN(302, "GPP_I_0"),
+	PINCTRL_PIN(303, "GPP_I_1"),
+	PINCTRL_PIN(304, "GPP_I_2"),
+	PINCTRL_PIN(305, "GPP_I_3"),
+	PINCTRL_PIN(306, "GPP_I_4"),
+	PINCTRL_PIN(307, "GPP_I_5"),
+	PINCTRL_PIN(308, "GPP_I_6"),
+	PINCTRL_PIN(309, "GPP_I_7"),
+	PINCTRL_PIN(310, "GPP_I_8"),
+	PINCTRL_PIN(311, "GPP_I_9"),
+	PINCTRL_PIN(312, "GPP_I_10"),
+	PINCTRL_PIN(313, "GPP_I_11"),
+	PINCTRL_PIN(314, "GPP_I_12"),
+	PINCTRL_PIN(315, "GPP_I_13"),
+	PINCTRL_PIN(316, "GPP_I_14"),
+	PINCTRL_PIN(317, "GPP_I_15"),
+	PINCTRL_PIN(318, "GPP_I_16"),
+	PINCTRL_PIN(319, "GSPI0_CLK_LOOPBK"),
+	PINCTRL_PIN(320, "GSPI1_CLK_LOOPBK"),
+	PINCTRL_PIN(321, "ISH_I3C0_CLK_LOOPBK"),
+	PINCTRL_PIN(322, "I3C0_CLK_LOOPBK"),
+	/* JTAG_CPU */
+	PINCTRL_PIN(323, "JTAG_TDO"),
+	PINCTRL_PIN(324, "JTAGX"),
+	PINCTRL_PIN(325, "PRDYB"),
+	PINCTRL_PIN(326, "PREQB"),
+	PINCTRL_PIN(327, "JTAG_TDI"),
+	PINCTRL_PIN(328, "JTAG_TMS"),
+	PINCTRL_PIN(329, "JTAG_TCK"),
+	PINCTRL_PIN(330, "DBG_PMODE"),
+	PINCTRL_PIN(331, "CPU_TRSTB"),
+	PINCTRL_PIN(332, "CPUPWRGD"),
+	PINCTRL_PIN(333, "PM_SPARE0"),
+	PINCTRL_PIN(334, "PM_SPARE1"),
+	PINCTRL_PIN(335, "CRASHLOG_TRIG_N"),
+	PINCTRL_PIN(336, "TRIGGER_IN"),
+	PINCTRL_PIN(337, "TRIGGER_OUT"),
+	PINCTRL_PIN(338, "FBRK_OUT_N"),
+};
+
+static const struct intel_padgroup mtps_community0_gpps[] = {
+	MTP_GPP(0, 0, 24, 0),		/* GPP_D */
+	MTP_GPP(1, 25, 38, 32),		/* GPP_R */
+	MTP_GPP(2, 39, 56, 64),		/* GPP_J */
+	MTP_GPP(3, 57, 87, 96),		/* vGPIO */
+};
+
+static const struct intel_padgroup mtps_community1_gpps[] = {
+	MTP_GPP(0, 88, 102, 128),	/* GPP_A */
+	MTP_GPP(1, 103, 114, 160),	/* DIR_ESPI */
+	MTP_GPP(2, 115, 136, 192),	/* GPP_B */
+};
+
+static const struct intel_padgroup mtps_community3_gpps[] = {
+	MTP_GPP(0, 137, 145, 224),	/* SPI0 */
+	MTP_GPP(1, 146, 169, 256),	/* GPP_C */
+	MTP_GPP(2, 170, 189, 288),	/* GPP_H */
+	MTP_GPP(3, 190, 193, 320),	/* vGPIO_3 */
+	MTP_GPP(4, 194, 201, 352),	/* vGPIO_0 */
+	MTP_GPP(5, 202, 232, 384),	/* vGPIO_4 */
+};
+
+static const struct intel_padgroup mtps_community4_gpps[] = {
+	MTP_GPP(0, 233, 240, 416),	/* GPP_S */
+	MTP_GPP(1, 241, 263, 448),	/* GPP_E */
+	MTP_GPP(2, 264, 277, 480),	/* GPP_K */
+	MTP_GPP(3, 278, 301, 512),	/* GPP_F */
+};
+
+static const struct intel_padgroup mtps_community5_gpps[] = {
+	MTP_GPP(0, 302, 322, 544),	/* GPP_I */
+	MTP_GPP(1, 323, 338, 576),	/* JTAG_CPU */
+};
+
+static const struct intel_community mtps_communities[] = {
+	MTP_COMMUNITY(0, 0, 87, mtps_community0_gpps),
+	MTP_COMMUNITY(1, 88, 136, mtps_community1_gpps),
+	MTP_COMMUNITY(2, 137, 232, mtps_community3_gpps),
+	MTP_COMMUNITY(3, 233, 301, mtps_community4_gpps),
+	MTP_COMMUNITY(4, 302, 338, mtps_community5_gpps),
+};
+
+static const struct intel_pinctrl_soc_data mtps_soc_data = {
+	.pins = mtps_pins,
+	.npins = ARRAY_SIZE(mtps_pins),
+	.communities = mtps_communities,
+	.ncommunities = ARRAY_SIZE(mtps_communities),
+};
+
+static const struct acpi_device_id mtp_pinctrl_acpi_match[] = {
+	{ "INTC1084", (kernel_ulong_t)&mtps_soc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, mtp_pinctrl_acpi_match);
+
+static struct platform_driver mtp_pinctrl_driver = {
+	.probe = intel_pinctrl_probe_by_hid,
+	.driver = {
+		.name = "meteorpoint-pinctrl",
+		.acpi_match_table = mtp_pinctrl_acpi_match,
+		.pm = pm_sleep_ptr(&intel_pinctrl_pm_ops),
+	},
+};
+module_platform_driver(mtp_pinctrl_driver);
+
+MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Meteor Point PCH pinctrl/GPIO driver");
+MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(PINCTRL_INTEL);
-- 
2.43.0.rc1.1.gbec44491f096


