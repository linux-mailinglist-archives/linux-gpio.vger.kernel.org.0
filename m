Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CE929EA41
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 12:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbgJ2LNT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 07:13:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:28609 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727535AbgJ2LNS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 07:13:18 -0400
IronPort-SDR: K6uw4M6/1aiMorZwaYRti2z7IhrsdLGqmFDjCMxIBadqcTYMb4j1QDkfMvAUIUDI1IGkkQrGDe
 VxiI8VHAPLIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="167633332"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="167633332"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 04:13:18 -0700
IronPort-SDR: vtwSnKJDaNXBHkz20ZXOW0hRGdaRr6Mck6mOARo06LvePpI/mr2olOPfjLowsWOadvQd9oj9DF
 JXXH8e5DJDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="525474359"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2020 04:13:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 00AB54E1; Thu, 29 Oct 2020 13:13:15 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] pinctrl: intel: Add Intel Alder Lake-S pin controller support
Date:   Thu, 29 Oct 2020 13:13:15 +0200
Message-Id: <20201029111315.66602-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds pinctrl/GPIO support for Intel Alder Lake-S SoC. The
GPIO controller is based on the next generation GPIO hardware but still
compatible with the one supported by the Intel core pinctrl/GPIO driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: dropped unrelated change (Mika), added -S (Mika)
 drivers/pinctrl/intel/Kconfig             |   8 +
 drivers/pinctrl/intel/Makefile            |   1 +
 drivers/pinctrl/intel/pinctrl-alderlake.c | 437 ++++++++++++++++++++++
 3 files changed, 446 insertions(+)
 create mode 100644 drivers/pinctrl/intel/pinctrl-alderlake.c

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 24a6fbcfbfc1..4d046242408d 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -55,6 +55,14 @@ config PINCTRL_INTEL
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 
+config PINCTRL_ALDERLAKE
+	tristate "Intel Alder Lake pinctrl and GPIO driver"
+	depends on ACPI
+	select PINCTRL_INTEL
+	help
+	  This pinctrl driver provides an interface that allows configuring
+	  of Intel Alder Lake PCH pins and using them as GPIOs.
+
 config PINCTRL_BROXTON
 	tristate "Intel Broxton pinctrl and GPIO driver"
 	depends on ACPI
diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index 1ddfddecd3de..60d3f6d88236 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_CHERRYVIEW)	+= pinctrl-cherryview.o
 obj-$(CONFIG_PINCTRL_LYNXPOINT)		+= pinctrl-lynxpoint.o
 obj-$(CONFIG_PINCTRL_MERRIFIELD)	+= pinctrl-merrifield.o
 obj-$(CONFIG_PINCTRL_INTEL)		+= pinctrl-intel.o
+obj-$(CONFIG_PINCTRL_ALDERLAKE)		+= pinctrl-alderlake.o
 obj-$(CONFIG_PINCTRL_BROXTON)		+= pinctrl-broxton.o
 obj-$(CONFIG_PINCTRL_CANNONLAKE)	+= pinctrl-cannonlake.o
 obj-$(CONFIG_PINCTRL_CEDARFORK)		+= pinctrl-cedarfork.o
diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
new file mode 100644
index 000000000000..efb664f12b5d
--- /dev/null
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Alder Lake PCH pinctrl/GPIO driver
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
+#define ADL_PAD_OWN	0x0a0
+#define ADL_PADCFGLOCK	0x110
+#define ADL_HOSTSW_OWN	0x150
+#define ADL_GPI_IS	0x200
+#define ADL_GPI_IE	0x220
+
+#define ADL_GPP(r, s, e, g)				\
+	{						\
+		.reg_num = (r),				\
+		.base = (s),				\
+		.size = ((e) - (s) + 1),		\
+		.gpio_base = (g),			\
+	}
+
+#define ADL_COMMUNITY(b, s, e, g)			\
+	{						\
+		.barno = (b),				\
+		.padown_offset = ADL_PAD_OWN,		\
+		.padcfglock_offset = ADL_PADCFGLOCK,	\
+		.hostown_offset = ADL_HOSTSW_OWN,	\
+		.is_offset = ADL_GPI_IS,		\
+		.ie_offset = ADL_GPI_IE,		\
+		.pin_base = (s),			\
+		.npins = ((e) - (s) + 1),		\
+		.gpps = (g),				\
+		.ngpps = ARRAY_SIZE(g),			\
+	}
+
+/* Alder Lake-S */
+static const struct pinctrl_pin_desc adls_pins[] = {
+	/* GPP_I */
+	PINCTRL_PIN(0, "EXT_PWR_GATEB"),
+	PINCTRL_PIN(1, "DDSP_HPD_1"),
+	PINCTRL_PIN(2, "DDSP_HPD_2"),
+	PINCTRL_PIN(3, "DDSP_HPD_3"),
+	PINCTRL_PIN(4, "DDSP_HPD_4"),
+	PINCTRL_PIN(5, "DDPB_CTRLCLK"),
+	PINCTRL_PIN(6, "DDPB_CTRLDATA"),
+	PINCTRL_PIN(7, "DDPC_CTRLCLK"),
+	PINCTRL_PIN(8, "DDPC_CTRLDATA"),
+	PINCTRL_PIN(9, "GSPI0_CS1B"),
+	PINCTRL_PIN(10, "GSPI1_CS1B"),
+	PINCTRL_PIN(11, "USB2_OCB_4"),
+	PINCTRL_PIN(12, "USB2_OCB_5"),
+	PINCTRL_PIN(13, "USB2_OCB_6"),
+	PINCTRL_PIN(14, "USB2_OCB_7"),
+	PINCTRL_PIN(15, "GSPI0_CS0B"),
+	PINCTRL_PIN(16, "GSPI0_CLK"),
+	PINCTRL_PIN(17, "GSPI0_MISO"),
+	PINCTRL_PIN(18, "GSPI0_MOSI"),
+	PINCTRL_PIN(19, "GSPI1_CS0B"),
+	PINCTRL_PIN(20, "GSPI1_CLK"),
+	PINCTRL_PIN(21, "GSPI1_MISO"),
+	PINCTRL_PIN(22, "GSPI1_MOSI"),
+	PINCTRL_PIN(23, "GSPI0_CLK_LOOPBK"),
+	PINCTRL_PIN(24, "GSPI1_CLK_LOOPBK"),
+	/* GPP_R */
+	PINCTRL_PIN(25, "HDA_BCLK"),
+	PINCTRL_PIN(26, "HDA_SYNC"),
+	PINCTRL_PIN(27, "HDA_SDO"),
+	PINCTRL_PIN(28, "HDA_SDI_0"),
+	PINCTRL_PIN(29, "HDA_RSTB"),
+	PINCTRL_PIN(30, "HDA_SDI_1"),
+	PINCTRL_PIN(31, "GPP_R_6"),
+	PINCTRL_PIN(32, "GPP_R_7"),
+	PINCTRL_PIN(33, "GPP_R_8"),
+	PINCTRL_PIN(34, "DDSP_HPD_A"),
+	PINCTRL_PIN(35, "DDSP_HPD_B"),
+	PINCTRL_PIN(36, "DDSP_HPD_C"),
+	PINCTRL_PIN(37, "ISH_SPI_CSB"),
+	PINCTRL_PIN(38, "ISH_SPI_CLK"),
+	PINCTRL_PIN(39, "ISH_SPI_MISO"),
+	PINCTRL_PIN(40, "ISH_SPI_MOSI"),
+	PINCTRL_PIN(41, "DDP1_CTRLCLK"),
+	PINCTRL_PIN(42, "DDP1_CTRLDATA"),
+	PINCTRL_PIN(43, "DDP2_CTRLCLK"),
+	PINCTRL_PIN(44, "DDP2_CTRLDATA"),
+	PINCTRL_PIN(45, "DDPA_CTRLCLK"),
+	PINCTRL_PIN(46, "DDPA_CTRLDATA"),
+	PINCTRL_PIN(47, "GSPI2_CLK_LOOPBK"),
+	/* GPP_J */
+	PINCTRL_PIN(48, "CNV_PA_BLANKING"),
+	PINCTRL_PIN(49, "CPU_C10_GATEB"),
+	PINCTRL_PIN(50, "CNV_BRI_DT"),
+	PINCTRL_PIN(51, "CNV_BRI_RSP"),
+	PINCTRL_PIN(52, "CNV_RGI_DT"),
+	PINCTRL_PIN(53, "CNV_RGI_RSP"),
+	PINCTRL_PIN(54, "CNV_MFUART2_RXD"),
+	PINCTRL_PIN(55, "CNV_MFUART2_TXD"),
+	PINCTRL_PIN(56, "SRCCLKREQB_16"),
+	PINCTRL_PIN(57, "SRCCLKREQB_17"),
+	PINCTRL_PIN(58, "BSSB_LS_RX"),
+	PINCTRL_PIN(59, "BSSB_LS_TX"),
+	/* vGPIO */
+	PINCTRL_PIN(60, "CNV_BTEN"),
+	PINCTRL_PIN(61, "CNV_BT_HOST_WAKEB"),
+	PINCTRL_PIN(62, "CNV_BT_IF_SELECT"),
+	PINCTRL_PIN(63, "vCNV_BT_UART_TXD"),
+	PINCTRL_PIN(64, "vCNV_BT_UART_RXD"),
+	PINCTRL_PIN(65, "vCNV_BT_UART_CTS_B"),
+	PINCTRL_PIN(66, "vCNV_BT_UART_RTS_B"),
+	PINCTRL_PIN(67, "vCNV_MFUART1_TXD"),
+	PINCTRL_PIN(68, "vCNV_MFUART1_RXD"),
+	PINCTRL_PIN(69, "vCNV_MFUART1_CTS_B"),
+	PINCTRL_PIN(70, "vCNV_MFUART1_RTS_B"),
+	PINCTRL_PIN(71, "vUART0_TXD"),
+	PINCTRL_PIN(72, "vUART0_RXD"),
+	PINCTRL_PIN(73, "vUART0_CTS_B"),
+	PINCTRL_PIN(74, "vUART0_RTS_B"),
+	PINCTRL_PIN(75, "vISH_UART0_TXD"),
+	PINCTRL_PIN(76, "vISH_UART0_RXD"),
+	PINCTRL_PIN(77, "vISH_UART0_CTS_B"),
+	PINCTRL_PIN(78, "vISH_UART0_RTS_B"),
+	PINCTRL_PIN(79, "vCNV_BT_I2S_BCLK"),
+	PINCTRL_PIN(80, "vCNV_BT_I2S_WS_SYNC"),
+	PINCTRL_PIN(81, "vCNV_BT_I2S_SDO"),
+	PINCTRL_PIN(82, "vCNV_BT_I2S_SDI"),
+	PINCTRL_PIN(83, "vI2S2_SCLK"),
+	PINCTRL_PIN(84, "vI2S2_SFRM"),
+	PINCTRL_PIN(85, "vI2S2_TXD"),
+	PINCTRL_PIN(86, "vI2S2_RXD"),
+	/* vGPIO_0 */
+	PINCTRL_PIN(87, "ESPI_USB_OCB_0"),
+	PINCTRL_PIN(88, "ESPI_USB_OCB_1"),
+	PINCTRL_PIN(89, "ESPI_USB_OCB_2"),
+	PINCTRL_PIN(90, "ESPI_USB_OCB_3"),
+	PINCTRL_PIN(91, "USB_CPU_OCB_0"),
+	PINCTRL_PIN(92, "USB_CPU_OCB_1"),
+	PINCTRL_PIN(93, "USB_CPU_OCB_2"),
+	PINCTRL_PIN(94, "USB_CPU_OCB_3"),
+	/* GPP_B */
+	PINCTRL_PIN(95, "PCIE_LNK_DOWN"),
+	PINCTRL_PIN(96, "ISH_UART0_RTSB"),
+	PINCTRL_PIN(97, "VRALERTB"),
+	PINCTRL_PIN(98, "CPU_GP_2"),
+	PINCTRL_PIN(99, "CPU_GP_3"),
+	PINCTRL_PIN(100, "SX_EXIT_HOLDOFFB"),
+	PINCTRL_PIN(101, "CLKOUT_48"),
+	PINCTRL_PIN(102, "ISH_GP_7"),
+	PINCTRL_PIN(103, "ISH_GP_0"),
+	PINCTRL_PIN(104, "ISH_GP_1"),
+	PINCTRL_PIN(105, "ISH_GP_2"),
+	PINCTRL_PIN(106, "I2S_MCLK"),
+	PINCTRL_PIN(107, "SLP_S0B"),
+	PINCTRL_PIN(108, "PLTRSTB"),
+	PINCTRL_PIN(109, "SPKR"),
+	PINCTRL_PIN(110, "ISH_GP_3"),
+	PINCTRL_PIN(111, "ISH_GP_4"),
+	PINCTRL_PIN(112, "ISH_GP_5"),
+	PINCTRL_PIN(113, "PMCALERTB"),
+	PINCTRL_PIN(114, "FUSA_DIAGTEST_EN"),
+	PINCTRL_PIN(115, "FUSA_DIAGTEST_MODE"),
+	PINCTRL_PIN(116, "GPP_B_21"),
+	PINCTRL_PIN(117, "GPP_B_22"),
+	PINCTRL_PIN(118, "SML1ALERTB"),
+	/* GPP_G */
+	PINCTRL_PIN(119, "GPP_G_0"),
+	PINCTRL_PIN(120, "GPP_G_1"),
+	PINCTRL_PIN(121, "DNX_FORCE_RELOAD"),
+	PINCTRL_PIN(122, "GMII_MDC_0"),
+	PINCTRL_PIN(123, "GMII_MDIO_0"),
+	PINCTRL_PIN(124, "SLP_DRAMB"),
+	PINCTRL_PIN(125, "GPP_G_6"),
+	PINCTRL_PIN(126, "GPP_G_7"),
+	/* GPP_H */
+	PINCTRL_PIN(127, "SRCCLKREQB_18"),
+	PINCTRL_PIN(128, "GPP_H_1"),
+	PINCTRL_PIN(129, "SRCCLKREQB_8"),
+	PINCTRL_PIN(130, "SRCCLKREQB_9"),
+	PINCTRL_PIN(131, "SRCCLKREQB_10"),
+	PINCTRL_PIN(132, "SRCCLKREQB_11"),
+	PINCTRL_PIN(133, "SRCCLKREQB_12"),
+	PINCTRL_PIN(134, "SRCCLKREQB_13"),
+	PINCTRL_PIN(135, "SRCCLKREQB_14"),
+	PINCTRL_PIN(136, "SRCCLKREQB_15"),
+	PINCTRL_PIN(137, "SML2CLK"),
+	PINCTRL_PIN(138, "SML2DATA"),
+	PINCTRL_PIN(139, "SML2ALERTB"),
+	PINCTRL_PIN(140, "SML3CLK"),
+	PINCTRL_PIN(141, "SML3DATA"),
+	PINCTRL_PIN(142, "SML3ALERTB"),
+	PINCTRL_PIN(143, "SML4CLK"),
+	PINCTRL_PIN(144, "SML4DATA"),
+	PINCTRL_PIN(145, "SML4ALERTB"),
+	PINCTRL_PIN(146, "ISH_I2C0_SDA"),
+	PINCTRL_PIN(147, "ISH_I2C0_SCL"),
+	PINCTRL_PIN(148, "ISH_I2C1_SDA"),
+	PINCTRL_PIN(149, "ISH_I2C1_SCL"),
+	PINCTRL_PIN(150, "TIME_SYNC_0"),
+	/* SPI0 */
+	PINCTRL_PIN(151, "SPI0_IO_2"),
+	PINCTRL_PIN(152, "SPI0_IO_3"),
+	PINCTRL_PIN(153, "SPI0_MOSI_IO_0"),
+	PINCTRL_PIN(154, "SPI0_MISO_IO_1"),
+	PINCTRL_PIN(155, "SPI0_TPM_CSB"),
+	PINCTRL_PIN(156, "SPI0_FLASH_0_CSB"),
+	PINCTRL_PIN(157, "SPI0_FLASH_1_CSB"),
+	PINCTRL_PIN(158, "SPI0_CLK"),
+	PINCTRL_PIN(159, "SPI0_CLK_LOOPBK"),
+	/* GPP_A */
+	PINCTRL_PIN(160, "ESPI_IO_0"),
+	PINCTRL_PIN(161, "ESPI_IO_1"),
+	PINCTRL_PIN(162, "ESPI_IO_2"),
+	PINCTRL_PIN(163, "ESPI_IO_3"),
+	PINCTRL_PIN(164, "ESPI_CS0B"),
+	PINCTRL_PIN(165, "ESPI_CLK"),
+	PINCTRL_PIN(166, "ESPI_RESETB"),
+	PINCTRL_PIN(167, "ESPI_CS1B"),
+	PINCTRL_PIN(168, "ESPI_CS2B"),
+	PINCTRL_PIN(169, "ESPI_CS3B"),
+	PINCTRL_PIN(170, "ESPI_ALERT0B"),
+	PINCTRL_PIN(171, "ESPI_ALERT1B"),
+	PINCTRL_PIN(172, "ESPI_ALERT2B"),
+	PINCTRL_PIN(173, "ESPI_ALERT3B"),
+	PINCTRL_PIN(174, "GPP_A_14"),
+	PINCTRL_PIN(175, "ESPI_CLK_LOOPBK"),
+	/* GPP_C */
+	PINCTRL_PIN(176, "SMBCLK"),
+	PINCTRL_PIN(177, "SMBDATA"),
+	PINCTRL_PIN(178, "SMBALERTB"),
+	PINCTRL_PIN(179, "ISH_UART0_RXD"),
+	PINCTRL_PIN(180, "ISH_UART0_TXD"),
+	PINCTRL_PIN(181, "SML0ALERTB"),
+	PINCTRL_PIN(182, "ISH_I2C2_SDA"),
+	PINCTRL_PIN(183, "ISH_I2C2_SCL"),
+	PINCTRL_PIN(184, "UART0_RXD"),
+	PINCTRL_PIN(185, "UART0_TXD"),
+	PINCTRL_PIN(186, "UART0_RTSB"),
+	PINCTRL_PIN(187, "UART0_CTSB"),
+	PINCTRL_PIN(188, "UART1_RXD"),
+	PINCTRL_PIN(189, "UART1_TXD"),
+	PINCTRL_PIN(190, "UART1_RTSB"),
+	PINCTRL_PIN(191, "UART1_CTSB"),
+	PINCTRL_PIN(192, "I2C0_SDA"),
+	PINCTRL_PIN(193, "I2C0_SCL"),
+	PINCTRL_PIN(194, "I2C1_SDA"),
+	PINCTRL_PIN(195, "I2C1_SCL"),
+	PINCTRL_PIN(196, "UART2_RXD"),
+	PINCTRL_PIN(197, "UART2_TXD"),
+	PINCTRL_PIN(198, "UART2_RTSB"),
+	PINCTRL_PIN(199, "UART2_CTSB"),
+	/* GPP_S */
+	PINCTRL_PIN(200, "SNDW1_CLK"),
+	PINCTRL_PIN(201, "SNDW1_DATA"),
+	PINCTRL_PIN(202, "SNDW2_CLK"),
+	PINCTRL_PIN(203, "SNDW2_DATA"),
+	PINCTRL_PIN(204, "SNDW3_CLK"),
+	PINCTRL_PIN(205, "SNDW3_DATA"),
+	PINCTRL_PIN(206, "SNDW4_CLK"),
+	PINCTRL_PIN(207, "SNDW4_DATA"),
+	/* GPP_E */
+	PINCTRL_PIN(208, "SATAXPCIE_0"),
+	PINCTRL_PIN(209, "SATAXPCIE_1"),
+	PINCTRL_PIN(210, "SATAXPCIE_2"),
+	PINCTRL_PIN(211, "CPU_GP_0"),
+	PINCTRL_PIN(212, "SATA_DEVSLP_0"),
+	PINCTRL_PIN(213, "SATA_DEVSLP_1"),
+	PINCTRL_PIN(214, "SATA_DEVSLP_2"),
+	PINCTRL_PIN(215, "CPU_GP_1"),
+	PINCTRL_PIN(216, "SATA_LEDB"),
+	PINCTRL_PIN(217, "USB2_OCB_0"),
+	PINCTRL_PIN(218, "USB2_OCB_1"),
+	PINCTRL_PIN(219, "USB2_OCB_2"),
+	PINCTRL_PIN(220, "USB2_OCB_3"),
+	PINCTRL_PIN(221, "SPI1_CSB"),
+	PINCTRL_PIN(222, "SPI1_CLK"),
+	PINCTRL_PIN(223, "SPI1_MISO_IO_1"),
+	PINCTRL_PIN(224, "SPI1_MOSI_IO_0"),
+	PINCTRL_PIN(225, "SPI1_IO_2"),
+	PINCTRL_PIN(226, "SPI1_IO_3"),
+	PINCTRL_PIN(227, "GPP_E_19"),
+	PINCTRL_PIN(228, "GPP_E_20"),
+	PINCTRL_PIN(229, "ISH_UART0_CTSB"),
+	PINCTRL_PIN(230, "SPI1_CLK_LOOPBK"),
+	/* GPP_K */
+	PINCTRL_PIN(231, "GSXDOUT"),
+	PINCTRL_PIN(232, "GSXSLOAD"),
+	PINCTRL_PIN(233, "GSXDIN"),
+	PINCTRL_PIN(234, "GSXSRESETB"),
+	PINCTRL_PIN(235, "GSXCLK"),
+	PINCTRL_PIN(236, "ADR_COMPLETE"),
+	PINCTRL_PIN(237, "GPP_K_6"),
+	PINCTRL_PIN(238, "GPP_K_7"),
+	PINCTRL_PIN(239, "CORE_VID_0"),
+	PINCTRL_PIN(240, "CORE_VID_1"),
+	PINCTRL_PIN(241, "GPP_K_10"),
+	PINCTRL_PIN(242, "GPP_K_11"),
+	PINCTRL_PIN(243, "SYS_PWROK"),
+	PINCTRL_PIN(244, "SYS_RESETB"),
+	PINCTRL_PIN(245, "MLK_RSTB"),
+	/* GPP_F */
+	PINCTRL_PIN(246, "SATAXPCIE_3"),
+	PINCTRL_PIN(247, "SATAXPCIE_4"),
+	PINCTRL_PIN(248, "SATAXPCIE_5"),
+	PINCTRL_PIN(249, "SATAXPCIE_6"),
+	PINCTRL_PIN(250, "SATAXPCIE_7"),
+	PINCTRL_PIN(251, "SATA_DEVSLP_3"),
+	PINCTRL_PIN(252, "SATA_DEVSLP_4"),
+	PINCTRL_PIN(253, "SATA_DEVSLP_5"),
+	PINCTRL_PIN(254, "SATA_DEVSLP_6"),
+	PINCTRL_PIN(255, "SATA_DEVSLP_7"),
+	PINCTRL_PIN(256, "SATA_SCLOCK"),
+	PINCTRL_PIN(257, "SATA_SLOAD"),
+	PINCTRL_PIN(258, "SATA_SDATAOUT1"),
+	PINCTRL_PIN(259, "SATA_SDATAOUT0"),
+	PINCTRL_PIN(260, "PS_ONB"),
+	PINCTRL_PIN(261, "M2_SKT2_CFG_0"),
+	PINCTRL_PIN(262, "M2_SKT2_CFG_1"),
+	PINCTRL_PIN(263, "M2_SKT2_CFG_2"),
+	PINCTRL_PIN(264, "M2_SKT2_CFG_3"),
+	PINCTRL_PIN(265, "L_VDDEN"),
+	PINCTRL_PIN(266, "L_BKLTEN"),
+	PINCTRL_PIN(267, "L_BKLTCTL"),
+	PINCTRL_PIN(268, "VNN_CTRL"),
+	PINCTRL_PIN(269, "GPP_F_23"),
+	/* GPP_D */
+	PINCTRL_PIN(270, "SRCCLKREQB_0"),
+	PINCTRL_PIN(271, "SRCCLKREQB_1"),
+	PINCTRL_PIN(272, "SRCCLKREQB_2"),
+	PINCTRL_PIN(273, "SRCCLKREQB_3"),
+	PINCTRL_PIN(274, "SML1CLK"),
+	PINCTRL_PIN(275, "I2S2_SFRM"),
+	PINCTRL_PIN(276, "I2S2_TXD"),
+	PINCTRL_PIN(277, "I2S2_RXD"),
+	PINCTRL_PIN(278, "I2S2_SCLK"),
+	PINCTRL_PIN(279, "SML0CLK"),
+	PINCTRL_PIN(280, "SML0DATA"),
+	PINCTRL_PIN(281, "SRCCLKREQB_4"),
+	PINCTRL_PIN(282, "SRCCLKREQB_5"),
+	PINCTRL_PIN(283, "SRCCLKREQB_6"),
+	PINCTRL_PIN(284, "SRCCLKREQB_7"),
+	PINCTRL_PIN(285, "SML1DATA"),
+	PINCTRL_PIN(286, "GSPI3_CS0B"),
+	PINCTRL_PIN(287, "GSPI3_CLK"),
+	PINCTRL_PIN(288, "GSPI3_MISO"),
+	PINCTRL_PIN(289, "GSPI3_MOSI"),
+	PINCTRL_PIN(290, "UART3_RXD"),
+	PINCTRL_PIN(291, "UART3_TXD"),
+	PINCTRL_PIN(292, "UART3_RTSB"),
+	PINCTRL_PIN(293, "UART3_CTSB"),
+	PINCTRL_PIN(294, "GSPI3_CLK_LOOPBK"),
+	/* JTAG */
+	PINCTRL_PIN(295, "JTAG_TDO"),
+	PINCTRL_PIN(296, "JTAGX"),
+	PINCTRL_PIN(297, "PRDYB"),
+	PINCTRL_PIN(298, "PREQB"),
+	PINCTRL_PIN(299, "JTAG_TDI"),
+	PINCTRL_PIN(300, "JTAG_TMS"),
+	PINCTRL_PIN(301, "JTAG_TCK"),
+	PINCTRL_PIN(302, "DBG_PMODE"),
+	PINCTRL_PIN(303, "CPU_TRSTB"),
+};
+
+static const struct intel_padgroup adls_community0_gpps[] = {
+	ADL_GPP(0, 0, 24, 0),				/* GPP_I */
+	ADL_GPP(1, 25, 47, 32),				/* GPP_R */
+	ADL_GPP(2, 48, 59, 64),				/* GPP_J */
+	ADL_GPP(3, 60, 86, 96),				/* vGPIO */
+	ADL_GPP(4, 87, 94, 128),			/* vGPIO_0 */
+};
+
+static const struct intel_padgroup adls_community1_gpps[] = {
+	ADL_GPP(0, 95, 118, 160),			/* GPP_B */
+	ADL_GPP(1, 119, 126, 192),			/* GPP_G */
+	ADL_GPP(2, 127, 150, 224),			/* GPP_H */
+};
+
+static const struct intel_padgroup adls_community3_gpps[] = {
+	ADL_GPP(0, 151, 159, INTEL_GPIO_BASE_NOMAP),	/* SPI0 */
+	ADL_GPP(1, 160, 175, 256),			/* GPP_A */
+	ADL_GPP(2, 176, 199, 288),			/* GPP_C */
+};
+
+static const struct intel_padgroup adls_community4_gpps[] = {
+	ADL_GPP(0, 200, 207, 320),			/* GPP_S */
+	ADL_GPP(1, 208, 230, 352),			/* GPP_E */
+	ADL_GPP(2, 231, 245, 384),			/* GPP_K */
+	ADL_GPP(3, 246, 269, 416),			/* GPP_F */
+};
+
+static const struct intel_padgroup adls_community5_gpps[] = {
+	ADL_GPP(0, 270, 294, 448),			/* GPP_D */
+	ADL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+};
+
+static const struct intel_community adls_communities[] = {
+	ADL_COMMUNITY(0, 0, 94, adls_community0_gpps),
+	ADL_COMMUNITY(1, 95, 150, adls_community1_gpps),
+	ADL_COMMUNITY(2, 151, 199, adls_community3_gpps),
+	ADL_COMMUNITY(3, 200, 269, adls_community4_gpps),
+	ADL_COMMUNITY(4, 270, 303, adls_community5_gpps),
+};
+
+static const struct intel_pinctrl_soc_data adls_soc_data = {
+	.pins = adls_pins,
+	.npins = ARRAY_SIZE(adls_pins),
+	.communities = adls_communities,
+	.ncommunities = ARRAY_SIZE(adls_communities),
+};
+
+static const struct acpi_device_id adl_pinctrl_acpi_match[] = {
+	{ "INTC1056", (kernel_ulong_t)&adls_soc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, adl_pinctrl_acpi_match);
+
+static INTEL_PINCTRL_PM_OPS(adl_pinctrl_pm_ops);
+
+static struct platform_driver adl_pinctrl_driver = {
+	.probe = intel_pinctrl_probe_by_hid,
+	.driver = {
+		.name = "alderlake-pinctrl",
+		.acpi_match_table = adl_pinctrl_acpi_match,
+		.pm = &adl_pinctrl_pm_ops,
+	},
+};
+module_platform_driver(adl_pinctrl_driver);
+
+MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Alder Lake PCH pinctrl/GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0

