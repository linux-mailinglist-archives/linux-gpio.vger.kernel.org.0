Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6C42222AA
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 14:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgGPMmv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 08:42:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:64259 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726863AbgGPMmu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jul 2020 08:42:50 -0400
IronPort-SDR: +mfpJWcpTpDScEAGJwNbaLbZKauJ49+6+NOuk7SL0tJ9x3SV0GXRddRLD5TPpljNrTq3CgKLQt
 EogbF0jKBcrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="210897493"
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; 
   d="scan'208";a="210897493"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 05:42:48 -0700
IronPort-SDR: 9LYjQqrZj8Pyueg5kwXiDyXNAtLR8kRg397N4t7NDhUK/zeJ5Y1tNFVsywDHchBC/qsXavx2F/
 HZ0ahXycnnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,359,1589266800"; 
   d="scan'208";a="391085489"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2020 05:42:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 59E6916B; Thu, 16 Jul 2020 15:42:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Add Intel Emmitsburg pin controller support
Date:   Thu, 16 Jul 2020 15:42:44 +0300
Message-Id: <20200716124244.50797-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds pinctrl/GPIO support for Intel Emmitsburg PCH. The
GPIO controller is based on the next generation GPIO hardware but still
compatible with the one supported by the Intel core pinctrl/GPIO driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig              |   8 +
 drivers/pinctrl/intel/Makefile             |   1 +
 drivers/pinctrl/intel/pinctrl-emmitsburg.c | 387 +++++++++++++++++++++
 3 files changed, 396 insertions(+)
 create mode 100644 drivers/pinctrl/intel/pinctrl-emmitsburg.c

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 787833e343a4..b3e6060db52d 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -95,6 +95,14 @@ config PINCTRL_DENVERTON
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Denverton SoC pins and using them as GPIOs.
 
+config PINCTRL_EMMITSBURG
+	tristate "Intel Emmitsburg pinctrl and GPIO driver"
+	depends on ACPI
+	select PINCTRL_INTEL
+	help
+	  This pinctrl driver provides an interface that allows configuring
+	  of Intel Emmitsburg pins and using them as GPIOs.
+
 config PINCTRL_GEMINILAKE
 	tristate "Intel Gemini Lake SoC pinctrl and GPIO driver"
 	depends on ACPI
diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index f6f63eb8100f..1c1c316f98b9 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_BROXTON)		+= pinctrl-broxton.o
 obj-$(CONFIG_PINCTRL_CANNONLAKE)	+= pinctrl-cannonlake.o
 obj-$(CONFIG_PINCTRL_CEDARFORK)		+= pinctrl-cedarfork.o
 obj-$(CONFIG_PINCTRL_DENVERTON)		+= pinctrl-denverton.o
+obj-$(CONFIG_PINCTRL_EMMITSBURG)	+= pinctrl-emmitsburg.o
 obj-$(CONFIG_PINCTRL_GEMINILAKE)	+= pinctrl-geminilake.o
 obj-$(CONFIG_PINCTRL_ICELAKE)		+= pinctrl-icelake.o
 obj-$(CONFIG_PINCTRL_JASPERLAKE)	+= pinctrl-jasperlake.o
diff --git a/drivers/pinctrl/intel/pinctrl-emmitsburg.c b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
new file mode 100644
index 000000000000..f6114dbf7520
--- /dev/null
+++ b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Emmitsburg PCH pinctrl/GPIO driver
+ *
+ * Copyright (C) 2020, Intel Corporation
+ * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-intel.h"
+
+#define EBG_PAD_OWN	0x0a0
+#define EBG_PADCFGLOCK	0x100
+#define EBG_HOSTSW_OWN	0x130
+#define EBG_GPI_IS	0x200
+#define EBG_GPI_IE	0x210
+
+#define EBG_GPP(r, s, e)				\
+	{						\
+		.reg_num = (r),				\
+		.base = (s),				\
+		.size = ((e) - (s) + 1),		\
+	}
+
+#define EBG_COMMUNITY(b, s, e, g)			\
+	{						\
+		.barno = (b),				\
+		.padown_offset = EBG_PAD_OWN,		\
+		.padcfglock_offset = EBG_PADCFGLOCK,	\
+		.hostown_offset = EBG_HOSTSW_OWN,	\
+		.is_offset = EBG_GPI_IS,		\
+		.ie_offset = EBG_GPI_IE,		\
+		.pin_base = (s),			\
+		.npins = ((e) - (s) + 1),		\
+		.gpps = (g),				\
+		.ngpps = ARRAY_SIZE(g),			\
+	}
+
+/* Emmitsburg */
+static const struct pinctrl_pin_desc ebg_pins[] = {
+	/* GPP_A */
+	PINCTRL_PIN(0, "ESPI_ALERT0B"),
+	PINCTRL_PIN(1, "ESPI_ALERT1B"),
+	PINCTRL_PIN(2, "ESPI_IO_0"),
+	PINCTRL_PIN(3, "ESPI_IO_1"),
+	PINCTRL_PIN(4, "ESPI_IO_2"),
+	PINCTRL_PIN(5, "ESPI_IO_3"),
+	PINCTRL_PIN(6, "ESPI_CS0B"),
+	PINCTRL_PIN(7, "ESPI_CS1B"),
+	PINCTRL_PIN(8, "ESPI_RESETB"),
+	PINCTRL_PIN(9, "ESPI_CLK"),
+	PINCTRL_PIN(10, "SRCCLKREQB_0"),
+	PINCTRL_PIN(11, "SRCCLKREQB_1"),
+	PINCTRL_PIN(12, "SRCCLKREQB_2"),
+	PINCTRL_PIN(13, "SRCCLKREQB_3"),
+	PINCTRL_PIN(14, "SRCCLKREQB_4"),
+	PINCTRL_PIN(15, "SRCCLKREQB_5"),
+	PINCTRL_PIN(16, "SRCCLKREQB_6"),
+	PINCTRL_PIN(17, "SRCCLKREQB_7"),
+	PINCTRL_PIN(18, "SRCCLKREQB_8"),
+	PINCTRL_PIN(19, "SRCCLKREQB_9"),
+	PINCTRL_PIN(20, "ESPI_CLK_LOOPBK"),
+	/* GPP_B */
+	PINCTRL_PIN(21, "GSXDOUT"),
+	PINCTRL_PIN(22, "GSXSLOAD"),
+	PINCTRL_PIN(23, "GSXDIN"),
+	PINCTRL_PIN(24, "GSXSRESETB"),
+	PINCTRL_PIN(25, "GSXCLK"),
+	PINCTRL_PIN(26, "USB2_OCB_0"),
+	PINCTRL_PIN(27, "USB2_OCB_1"),
+	PINCTRL_PIN(28, "USB2_OCB_2"),
+	PINCTRL_PIN(29, "USB2_OCB_3"),
+	PINCTRL_PIN(30, "USB2_OCB_4"),
+	PINCTRL_PIN(31, "USB2_OCB_5"),
+	PINCTRL_PIN(32, "USB2_OCB_6"),
+	PINCTRL_PIN(33, "HS_UART0_RXD"),
+	PINCTRL_PIN(34, "HS_UART0_TXD"),
+	PINCTRL_PIN(35, "HS_UART0_RTSB"),
+	PINCTRL_PIN(36, "HS_UART0_CTSB"),
+	PINCTRL_PIN(37, "HS_UART1_RXD"),
+	PINCTRL_PIN(38, "HS_UART1_TXD"),
+	PINCTRL_PIN(39, "HS_UART1_RTSB"),
+	PINCTRL_PIN(40, "HS_UART1_CTSB"),
+	PINCTRL_PIN(41, "GPPC_B_20"),
+	PINCTRL_PIN(42, "GPPC_B_21"),
+	PINCTRL_PIN(43, "GPPC_B_22"),
+	PINCTRL_PIN(44, "PS_ONB"),
+	/* SPI */
+	PINCTRL_PIN(45, "SPI0_IO_2"),
+	PINCTRL_PIN(46, "SPI0_IO_3"),
+	PINCTRL_PIN(47, "SPI0_MOSI_IO_0"),
+	PINCTRL_PIN(48, "SPI0_MISO_IO_1"),
+	PINCTRL_PIN(49, "SPI0_TPM_CSB"),
+	PINCTRL_PIN(50, "SPI0_FLASH_0_CSB"),
+	PINCTRL_PIN(51, "SPI0_FLASH_1_CSB"),
+	PINCTRL_PIN(52, "SPI0_CLK"),
+	PINCTRL_PIN(53, "TIME_SYNC_0"),
+	PINCTRL_PIN(54, "SPKR"),
+	PINCTRL_PIN(55, "CPU_GP_0"),
+	PINCTRL_PIN(56, "CPU_GP_1"),
+	PINCTRL_PIN(57, "CPU_GP_2"),
+	PINCTRL_PIN(58, "CPU_GP_3"),
+	PINCTRL_PIN(59, "SUSWARNB_SUSPWRDNACK"),
+	PINCTRL_PIN(60, "SUSACKB"),
+	PINCTRL_PIN(61, "NMIB"),
+	PINCTRL_PIN(62, "SMIB"),
+	PINCTRL_PIN(63, "GPPC_S_10"),
+	PINCTRL_PIN(64, "GPPC_S_11"),
+	PINCTRL_PIN(65, "SPI_CLK_LOOPBK"),
+	/* GPP_C */
+	PINCTRL_PIN(66, "ME_SML0CLK"),
+	PINCTRL_PIN(67, "ME_SML0DATA"),
+	PINCTRL_PIN(68, "ME_SML0ALERTB"),
+	PINCTRL_PIN(69, "ME_SML0BDATA"),
+	PINCTRL_PIN(70, "ME_SML0BCLK"),
+	PINCTRL_PIN(71, "ME_SML0BALERTB"),
+	PINCTRL_PIN(72, "ME_SML1CLK"),
+	PINCTRL_PIN(73, "ME_SML1DATA"),
+	PINCTRL_PIN(74, "ME_SML1ALERTB"),
+	PINCTRL_PIN(75, "ME_SML2CLK"),
+	PINCTRL_PIN(76, "ME_SML2DATA"),
+	PINCTRL_PIN(77, "ME_SML2ALERTB"),
+	PINCTRL_PIN(78, "ME_SML3CLK"),
+	PINCTRL_PIN(79, "ME_SML3DATA"),
+	PINCTRL_PIN(80, "ME_SML3ALERTB"),
+	PINCTRL_PIN(81, "ME_SML4CLK"),
+	PINCTRL_PIN(82, "ME_SML4DATA"),
+	PINCTRL_PIN(83, "ME_SML4ALERTB"),
+	PINCTRL_PIN(84, "GPPC_C_18"),
+	PINCTRL_PIN(85, "MC_SMBCLK"),
+	PINCTRL_PIN(86, "MC_SMBDATA"),
+	PINCTRL_PIN(87, "MC_SMBALERTB"),
+	/* GPP_D */
+	PINCTRL_PIN(88, "HS_SMBCLK"),
+	PINCTRL_PIN(89, "HS_SMBDATA"),
+	PINCTRL_PIN(90, "HS_SMBALERTB"),
+	PINCTRL_PIN(91, "GBE_SMB_ALRT_N"),
+	PINCTRL_PIN(92, "GBE_SMB_CLK"),
+	PINCTRL_PIN(93, "GBE_SMB_DATA"),
+	PINCTRL_PIN(94, "GBE_GPIO10"),
+	PINCTRL_PIN(95, "GBE_GPIO11"),
+	PINCTRL_PIN(96, "CRASHLOG_TRIG_N"),
+	PINCTRL_PIN(97, "PMEB"),
+	PINCTRL_PIN(98, "BM_BUSYB"),
+	PINCTRL_PIN(99, "PLTRSTB"),
+	PINCTRL_PIN(100, "PCHHOTB"),
+	PINCTRL_PIN(101, "ADR_COMPLETE"),
+	PINCTRL_PIN(102, "ADR_TRIGGER_N"),
+	PINCTRL_PIN(103, "VRALERTB"),
+	PINCTRL_PIN(104, "ADR_ACK"),
+	PINCTRL_PIN(105, "THERMTRIP_N"),
+	PINCTRL_PIN(106, "MEMTRIP_N"),
+	PINCTRL_PIN(107, "MSMI_N"),
+	PINCTRL_PIN(108, "CATERR_N"),
+	PINCTRL_PIN(109, "GLB_RST_WARN_B"),
+	PINCTRL_PIN(110, "USB2_OCB_7"),
+	PINCTRL_PIN(111, "GPP_D_23"),
+	/* GPP_E */
+	PINCTRL_PIN(112, "SATA1_XPCIE_0"),
+	PINCTRL_PIN(113, "SATA1_XPCIE_1"),
+	PINCTRL_PIN(114, "SATA1_XPCIE_2"),
+	PINCTRL_PIN(115, "SATA1_XPCIE_3"),
+	PINCTRL_PIN(116, "SATA0_XPCIE_2"),
+	PINCTRL_PIN(117, "SATA0_XPCIE_3"),
+	PINCTRL_PIN(118, "SATA0_USB3_XPCIE_0"),
+	PINCTRL_PIN(119, "SATA0_USB3_XPCIE_1"),
+	PINCTRL_PIN(120, "SATA0_SCLOCK"),
+	PINCTRL_PIN(121, "SATA0_SLOAD"),
+	PINCTRL_PIN(122, "SATA0_SDATAOUT"),
+	PINCTRL_PIN(123, "SATA1_SCLOCK"),
+	PINCTRL_PIN(124, "SATA1_SLOAD"),
+	PINCTRL_PIN(125, "SATA1_SDATAOUT"),
+	PINCTRL_PIN(126, "SATA2_SCLOCK"),
+	PINCTRL_PIN(127, "SATA2_SLOAD"),
+	PINCTRL_PIN(128, "SATA2_SDATAOUT"),
+	PINCTRL_PIN(129, "ERR0_N"),
+	PINCTRL_PIN(130, "ERR1_N"),
+	PINCTRL_PIN(131, "ERR2_N"),
+	PINCTRL_PIN(132, "GBE_UART_RXD"),
+	PINCTRL_PIN(133, "GBE_UART_TXD"),
+	PINCTRL_PIN(134, "GBE_UART_RTSB"),
+	PINCTRL_PIN(135, "GBE_UART_CTSB"),
+	/* JTAG */
+	PINCTRL_PIN(136, "JTAG_TDO"),
+	PINCTRL_PIN(137, "JTAG_TDI"),
+	PINCTRL_PIN(138, "JTAG_TCK"),
+	PINCTRL_PIN(139, "JTAG_TMS"),
+	PINCTRL_PIN(140, "JTAGX"),
+	PINCTRL_PIN(141, "PRDYB"),
+	PINCTRL_PIN(142, "PREQB"),
+	PINCTRL_PIN(143, "GLB_PC_DISABLE"),
+	PINCTRL_PIN(144, "DBG_PMODE"),
+	PINCTRL_PIN(145, "GLB_EXT_ACC_DISABLE"),
+	/* GPP_H */
+	PINCTRL_PIN(146, "GBE_GPIO12"),
+	PINCTRL_PIN(147, "GBE_GPIO13"),
+	PINCTRL_PIN(148, "GBE_SDP_TIMESYNC0_S2N"),
+	PINCTRL_PIN(149, "GBE_SDP_TIMESYNC1_S2N"),
+	PINCTRL_PIN(150, "GBE_SDP_TIMESYNC2_S2N"),
+	PINCTRL_PIN(151, "GBE_SDP_TIMESYNC3_S2N"),
+	PINCTRL_PIN(152, "GPPC_H_6"),
+	PINCTRL_PIN(153, "GPPC_H_7"),
+	PINCTRL_PIN(154, "NCSI_CLK_IN"),
+	PINCTRL_PIN(155, "NCSI_CRS_DV"),
+	PINCTRL_PIN(156, "NCSI_RXD0"),
+	PINCTRL_PIN(157, "NCSI_RXD1"),
+	PINCTRL_PIN(158, "NCSI_TX_EN"),
+	PINCTRL_PIN(159, "NCSI_TXD0"),
+	PINCTRL_PIN(160, "NCSI_TXD1"),
+	PINCTRL_PIN(161, "NAC_NCSI_CLK_OUT_0"),
+	PINCTRL_PIN(162, "NAC_NCSI_CLK_OUT_1"),
+	PINCTRL_PIN(163, "NAC_NCSI_CLK_OUT_2"),
+	PINCTRL_PIN(164, "PMCALERTB"),
+	PINCTRL_PIN(165, "GPPC_H_19"),
+	/* GPP_J */
+	PINCTRL_PIN(166, "CPUPWRGD"),
+	PINCTRL_PIN(167, "CPU_THRMTRIP_N"),
+	PINCTRL_PIN(168, "PLTRST_CPUB"),
+	PINCTRL_PIN(169, "TRIGGER0_N"),
+	PINCTRL_PIN(170, "TRIGGER1_N"),
+	PINCTRL_PIN(171, "CPU_PWR_DEBUG_N"),
+	PINCTRL_PIN(172, "CPU_MEMTRIP_N"),
+	PINCTRL_PIN(173, "CPU_MSMI_N"),
+	PINCTRL_PIN(174, "ME_PECI"),
+	PINCTRL_PIN(175, "NAC_SPARE0"),
+	PINCTRL_PIN(176, "NAC_SPARE1"),
+	PINCTRL_PIN(177, "NAC_SPARE2"),
+	PINCTRL_PIN(178, "CPU_ERR0_N"),
+	PINCTRL_PIN(179, "CPU_CATERR_N"),
+	PINCTRL_PIN(180, "CPU_ERR1_N"),
+	PINCTRL_PIN(181, "CPU_ERR2_N"),
+	PINCTRL_PIN(182, "GPP_J_16"),
+	PINCTRL_PIN(183, "GPP_J_17"),
+	/* GPP_I */
+	PINCTRL_PIN(184, "GBE_GPIO4"),
+	PINCTRL_PIN(185, "GBE_GPIO5"),
+	PINCTRL_PIN(186, "GBE_GPIO6"),
+	PINCTRL_PIN(187, "GBE_GPIO7"),
+	PINCTRL_PIN(188, "GBE1_LED1"),
+	PINCTRL_PIN(189, "GBE1_LED2"),
+	PINCTRL_PIN(190, "GBE2_LED0"),
+	PINCTRL_PIN(191, "GBE2_LED1"),
+	PINCTRL_PIN(192, "GBE2_LED2"),
+	PINCTRL_PIN(193, "GBE3_LED0"),
+	PINCTRL_PIN(194, "GBE3_LED1"),
+	PINCTRL_PIN(195, "GBE3_LED2"),
+	PINCTRL_PIN(196, "GBE0_I2C_CLK"),
+	PINCTRL_PIN(197, "GBE0_I2C_DATA"),
+	PINCTRL_PIN(198, "GBE1_I2C_CLK"),
+	PINCTRL_PIN(199, "GBE1_I2C_DATA"),
+	PINCTRL_PIN(200, "GBE2_I2C_CLK"),
+	PINCTRL_PIN(201, "GBE2_I2C_DATA"),
+	PINCTRL_PIN(202, "GBE3_I2C_CLK"),
+	PINCTRL_PIN(203, "GBE3_I2C_DATA"),
+	PINCTRL_PIN(204, "GBE4_I2C_CLK"),
+	PINCTRL_PIN(205, "GBE4_I2C_DATA"),
+	PINCTRL_PIN(206, "GBE_GPIO8"),
+	PINCTRL_PIN(207, "GBE_GPIO9"),
+	/* GPP_L */
+	PINCTRL_PIN(208, "PM_SYNC_0"),
+	PINCTRL_PIN(209, "PM_DOWN_0"),
+	PINCTRL_PIN(210, "PM_SYNC_CLK_0"),
+	PINCTRL_PIN(211, "GPP_L_3"),
+	PINCTRL_PIN(212, "GPP_L_4"),
+	PINCTRL_PIN(213, "GPP_L_5"),
+	PINCTRL_PIN(214, "GPP_L_6"),
+	PINCTRL_PIN(215, "GPP_L_7"),
+	PINCTRL_PIN(216, "GPP_L_8"),
+	PINCTRL_PIN(217, "NAC_GBE_GPIO0_S2N"),
+	PINCTRL_PIN(218, "NAC_GBE_GPIO1_S2N"),
+	PINCTRL_PIN(219, "NAC_GBE_GPIO2_S2N"),
+	PINCTRL_PIN(220, "NAC_GBE_GPIO3_S2N"),
+	PINCTRL_PIN(221, "NAC_GBE_SMB_DATA_IN"),
+	PINCTRL_PIN(222, "NAC_GBE_SMB_DATA_OUT"),
+	PINCTRL_PIN(223, "NAC_GBE_SMB_ALRT_N"),
+	PINCTRL_PIN(224, "NAC_GBE_SMB_CLK_IN"),
+	PINCTRL_PIN(225, "NAC_GBE_SMB_CLK_OUT"),
+	/* GPP_M */
+	PINCTRL_PIN(226, "GPP_M_0"),
+	PINCTRL_PIN(227, "GPP_M_1"),
+	PINCTRL_PIN(228, "GPP_M_2"),
+	PINCTRL_PIN(229, "GPP_M_3"),
+	PINCTRL_PIN(230, "NAC_WAKE_N"),
+	PINCTRL_PIN(231, "GPP_M_5"),
+	PINCTRL_PIN(232, "GPP_M_6"),
+	PINCTRL_PIN(233, "GPP_M_7"),
+	PINCTRL_PIN(234, "GPP_M_8"),
+	PINCTRL_PIN(235, "NAC_SBLINK_S2N"),
+	PINCTRL_PIN(236, "NAC_SBLINK_N2S"),
+	PINCTRL_PIN(237, "NAC_SBLINK_CLK_N2S"),
+	PINCTRL_PIN(238, "NAC_SBLINK_CLK_S2N"),
+	PINCTRL_PIN(239, "NAC_XTAL_VALID"),
+	PINCTRL_PIN(240, "NAC_RESET_NAC_N"),
+	PINCTRL_PIN(241, "GPP_M_15"),
+	PINCTRL_PIN(242, "GPP_M_16"),
+	PINCTRL_PIN(243, "GPP_M_17"),
+	/* GPP_N */
+	PINCTRL_PIN(244, "GPP_N_0"),
+	PINCTRL_PIN(245, "NAC_NCSI_TXD0"),
+	PINCTRL_PIN(246, "GPP_N_2"),
+	PINCTRL_PIN(247, "GPP_N_3"),
+	PINCTRL_PIN(248, "NAC_NCSI_REFCLK_IN"),
+	PINCTRL_PIN(249, "GPP_N_5"),
+	PINCTRL_PIN(250, "GPP_N_6"),
+	PINCTRL_PIN(251, "GPP_N_7"),
+	PINCTRL_PIN(252, "NAC_NCSI_RXD0"),
+	PINCTRL_PIN(253, "NAC_NCSI_RXD1"),
+	PINCTRL_PIN(254, "NAC_NCSI_CRS_DV"),
+	PINCTRL_PIN(255, "NAC_NCSI_CLK_IN"),
+	PINCTRL_PIN(256, "NAC_NCSI_REFCLK_OUT"),
+	PINCTRL_PIN(257, "NAC_NCSI_TX_EN"),
+	PINCTRL_PIN(258, "NAC_NCSI_TXD1"),
+	PINCTRL_PIN(259, "NAC_NCSI_OE_N"),
+	PINCTRL_PIN(260, "NAC_GR_N"),
+	PINCTRL_PIN(261, "NAC_INIT_SX_WAKE_N"),
+};
+
+static const struct intel_padgroup ebg_community0_gpps[] = {
+	EBG_GPP(0, 0, 20),	/* GPP_A */
+	EBG_GPP(1, 21, 44),	/* GPP_B */
+	EBG_GPP(2, 45, 65),	/* SPI */
+};
+
+static const struct intel_padgroup ebg_community1_gpps[] = {
+	EBG_GPP(0, 66, 87),	/* GPP_C */
+	EBG_GPP(1, 88, 111),	/* GPP_D */
+};
+
+static const struct intel_padgroup ebg_community3_gpps[] = {
+	EBG_GPP(0, 112, 135),	/* GPP_E */
+	EBG_GPP(1, 136, 145),	/* JTAG */
+};
+
+static const struct intel_padgroup ebg_community4_gpps[] = {
+	EBG_GPP(0, 146, 165),	/* GPP_H */
+	EBG_GPP(1, 166, 183),	/* GPP_J */
+};
+
+static const struct intel_padgroup ebg_community5_gpps[] = {
+	EBG_GPP(0, 184, 207),	/* GPP_I */
+	EBG_GPP(1, 208, 225),	/* GPP_L */
+	EBG_GPP(2, 226, 243),	/* GPP_M */
+	EBG_GPP(3, 244, 261),	/* GPP_N */
+};
+
+static const struct intel_community ebg_communities[] = {
+	EBG_COMMUNITY(0, 0, 65, ebg_community0_gpps),
+	EBG_COMMUNITY(1, 66, 111, ebg_community1_gpps),
+	EBG_COMMUNITY(2, 112, 145, ebg_community3_gpps),
+	EBG_COMMUNITY(3, 146, 183, ebg_community4_gpps),
+	EBG_COMMUNITY(4, 184, 261, ebg_community5_gpps),
+};
+
+static const struct intel_pinctrl_soc_data ebg_soc_data = {
+	.pins = ebg_pins,
+	.npins = ARRAY_SIZE(ebg_pins),
+	.communities = ebg_communities,
+	.ncommunities = ARRAY_SIZE(ebg_communities),
+};
+
+static const struct acpi_device_id ebg_pinctrl_acpi_match[] = {
+	{ "INTC1071", (kernel_ulong_t)&ebg_soc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ebg_pinctrl_acpi_match);
+
+static INTEL_PINCTRL_PM_OPS(ebg_pinctrl_pm_ops);
+
+static struct platform_driver ebg_pinctrl_driver = {
+	.probe = intel_pinctrl_probe_by_hid,
+	.driver = {
+		.name = "emmitsburg-pinctrl",
+		.acpi_match_table = ebg_pinctrl_acpi_match,
+		.pm = &ebg_pinctrl_pm_ops,
+	},
+};
+
+module_platform_driver(ebg_pinctrl_driver);
+
+MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Emmitsburg PCH pinctrl/GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

