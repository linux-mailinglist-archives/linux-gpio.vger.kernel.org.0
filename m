Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248321A6590
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 13:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgDMLSg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 07:18:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:56690 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728826AbgDMLSe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 07:18:34 -0400
IronPort-SDR: +8GfpxbnS4EwbRNhhHmZ6N3B5EU/fhJer9hJIfrmNPt7bfBodQTCmCbUr2GbXQaSgU84uiIHfj
 VvF9vwK1WX+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:18:32 -0700
IronPort-SDR: 4VgFkbErqm8VkFaVU/nTymfUq8w5tKIv29QZhBWANPOtPiF+JfF/aqIBLiStsB+0+mcyWtvvPw
 oEnZ2xoapzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="252845156"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2020 04:18:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 85C301F5; Mon, 13 Apr 2020 14:18:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 6/6] pinctrl: intel: Add Intel Jasper Lake pin controller support
Date:   Mon, 13 Apr 2020 14:18:25 +0300
Message-Id: <20200413111825.89866-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds pinctrl/GPIO support for Intel Jasper Lake SoC. The
GPIO controller is based on the next generation GPIO hardware but still
compatible with the one supported by the Intel core pinctrl/GPIO driver.

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: new patch
 drivers/pinctrl/intel/Kconfig              |   8 +
 drivers/pinctrl/intel/Makefile             |   1 +
 drivers/pinctrl/intel/pinctrl-jasperlake.c | 344 +++++++++++++++++++++
 3 files changed, 353 insertions(+)
 create mode 100644 drivers/pinctrl/intel/pinctrl-jasperlake.c

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index ee440ec4c94c..787833e343a4 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -111,6 +111,14 @@ config PINCTRL_ICELAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Ice Lake PCH pins and using them as GPIOs.
 
+config PINCTRL_JASPERLAKE
+	tristate "Intel Jasper Lake PCH pinctrl and GPIO driver"
+	depends on ACPI
+	select PINCTRL_INTEL
+	help
+	  This pinctrl driver provides an interface that allows configuring
+	  of Intel Jasper Lake PCH pins and using them as GPIOs.
+
 config PINCTRL_LEWISBURG
 	tristate "Intel Lewisburg pinctrl and GPIO driver"
 	depends on ACPI
diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index f60f99cfa7aa..f6f63eb8100f 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_PINCTRL_CEDARFORK)		+= pinctrl-cedarfork.o
 obj-$(CONFIG_PINCTRL_DENVERTON)		+= pinctrl-denverton.o
 obj-$(CONFIG_PINCTRL_GEMINILAKE)	+= pinctrl-geminilake.o
 obj-$(CONFIG_PINCTRL_ICELAKE)		+= pinctrl-icelake.o
+obj-$(CONFIG_PINCTRL_JASPERLAKE)	+= pinctrl-jasperlake.o
 obj-$(CONFIG_PINCTRL_LEWISBURG)		+= pinctrl-lewisburg.o
 obj-$(CONFIG_PINCTRL_SUNRISEPOINT)	+= pinctrl-sunrisepoint.o
 obj-$(CONFIG_PINCTRL_TIGERLAKE)		+= pinctrl-tigerlake.o
diff --git a/drivers/pinctrl/intel/pinctrl-jasperlake.c b/drivers/pinctrl/intel/pinctrl-jasperlake.c
new file mode 100644
index 000000000000..9bd0e8e6310c
--- /dev/null
+++ b/drivers/pinctrl/intel/pinctrl-jasperlake.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Jasper Lake PCH pinctrl/GPIO driver
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
+#define JSL_PAD_OWN	0x020
+#define JSL_PADCFGLOCK	0x080
+#define JSL_HOSTSW_OWN	0x0b0
+#define JSL_GPI_IS	0x100
+#define JSL_GPI_IE	0x120
+
+#define JSL_GPP(r, s, e, g)				\
+	{						\
+		.reg_num = (r),				\
+		.base = (s),				\
+		.size = ((e) - (s) + 1),		\
+		.gpio_base = (g),			\
+	}
+
+#define JSL_COMMUNITY(b, s, e, g)			\
+	{						\
+		.barno = (b),				\
+		.padown_offset = JSL_PAD_OWN,		\
+		.padcfglock_offset = JSL_PADCFGLOCK,	\
+		.hostown_offset = JSL_HOSTSW_OWN,	\
+		.is_offset = JSL_GPI_IS,		\
+		.ie_offset = JSL_GPI_IE,		\
+		.pin_base = (s),			\
+		.npins = ((e) - (s) + 1),		\
+		.gpps = (g),				\
+		.ngpps = ARRAY_SIZE(g),			\
+	}
+
+/* Jasper Lake */
+static const struct pinctrl_pin_desc jsl_pins[] = {
+	/* GPP_F */
+	PINCTRL_PIN(0, "CNV_BRI_DT_UART0_RTSB"),
+	PINCTRL_PIN(1, "CNV_BRI_RSP_UART0_RXD"),
+	PINCTRL_PIN(2, "EMMC_HIP_MON"),
+	PINCTRL_PIN(3, "CNV_RGI_RSP_UART0_CTSB"),
+	PINCTRL_PIN(4, "CNV_RF_RESET_B"),
+	PINCTRL_PIN(5, "MODEM_CLKREQ"),
+	PINCTRL_PIN(6, "CNV_PA_BLANKING"),
+	PINCTRL_PIN(7, "EMMC_CMD"),
+	PINCTRL_PIN(8, "EMMC_DATA0"),
+	PINCTRL_PIN(9, "EMMC_DATA1"),
+	PINCTRL_PIN(10, "EMMC_DATA2"),
+	PINCTRL_PIN(11, "EMMC_DATA3"),
+	PINCTRL_PIN(12, "EMMC_DATA4"),
+	PINCTRL_PIN(13, "EMMC_DATA5"),
+	PINCTRL_PIN(14, "EMMC_DATA6"),
+	PINCTRL_PIN(15, "EMMC_DATA7"),
+	PINCTRL_PIN(16, "EMMC_RCLK"),
+	PINCTRL_PIN(17, "EMMC_CLK"),
+	PINCTRL_PIN(18, "EMMC_RESETB"),
+	PINCTRL_PIN(19, "A4WP_PRESENT"),
+	/* GPP_B */
+	PINCTRL_PIN(20, "CORE_VID_0"),
+	PINCTRL_PIN(21, "CORE_VID_1"),
+	PINCTRL_PIN(22, "VRALERTB"),
+	PINCTRL_PIN(23, "CPU_GP_2"),
+	PINCTRL_PIN(24, "CPU_GP_3"),
+	PINCTRL_PIN(25, "SRCCLKREQB_0"),
+	PINCTRL_PIN(26, "SRCCLKREQB_1"),
+	PINCTRL_PIN(27, "SRCCLKREQB_2"),
+	PINCTRL_PIN(28, "SRCCLKREQB_3"),
+	PINCTRL_PIN(29, "SRCCLKREQB_4"),
+	PINCTRL_PIN(30, "SRCCLKREQB_5"),
+	PINCTRL_PIN(31, "PMCALERTB"),
+	PINCTRL_PIN(32, "SLP_S0B"),
+	PINCTRL_PIN(33, "PLTRSTB"),
+	PINCTRL_PIN(34, "SPKR"),
+	PINCTRL_PIN(35, "GSPI0_CS0B"),
+	PINCTRL_PIN(36, "GSPI0_CLK"),
+	PINCTRL_PIN(37, "GSPI0_MISO"),
+	PINCTRL_PIN(38, "GSPI0_MOSI"),
+	PINCTRL_PIN(39, "GSPI1_CS0B"),
+	PINCTRL_PIN(40, "GSPI1_CLK"),
+	PINCTRL_PIN(41, "GSPI1_MISO"),
+	PINCTRL_PIN(42, "GSPI1_MOSI"),
+	PINCTRL_PIN(43, "DDSP_HPD_A"),
+	PINCTRL_PIN(44, "GSPI0_CLK_LOOPBK"),
+	PINCTRL_PIN(45, "GSPI1_CLK_LOOPBK"),
+	/* GPP_A */
+	PINCTRL_PIN(46, "ESPI_IO_0"),
+	PINCTRL_PIN(47, "ESPI_IO_1"),
+	PINCTRL_PIN(48, "ESPI_IO_2"),
+	PINCTRL_PIN(49, "ESPI_IO_3"),
+	PINCTRL_PIN(50, "ESPI_CSB"),
+	PINCTRL_PIN(51, "ESPI_CLK"),
+	PINCTRL_PIN(52, "ESPI_RESETB"),
+	PINCTRL_PIN(53, "SMBCLK"),
+	PINCTRL_PIN(54, "SMBDATA"),
+	PINCTRL_PIN(55, "SMBALERTB"),
+	PINCTRL_PIN(56, "CPU_GP_0"),
+	PINCTRL_PIN(57, "CPU_GP_1"),
+	PINCTRL_PIN(58, "USB2_OCB_1"),
+	PINCTRL_PIN(59, "USB2_OCB_2"),
+	PINCTRL_PIN(60, "USB2_OCB_3"),
+	PINCTRL_PIN(61, "DDSP_HPD_A_TIME_SYNC_0"),
+	PINCTRL_PIN(62, "DDSP_HPD_B"),
+	PINCTRL_PIN(63, "DDSP_HPD_C"),
+	PINCTRL_PIN(64, "USB2_OCB_0"),
+	PINCTRL_PIN(65, "PCHHOTB"),
+	PINCTRL_PIN(66, "ESPI_CLK_LOOPBK"),
+	/* GPP_S */
+	PINCTRL_PIN(67, "SNDW1_CLK"),
+	PINCTRL_PIN(68, "SNDW1_DATA"),
+	PINCTRL_PIN(69, "SNDW2_CLK"),
+	PINCTRL_PIN(70, "SNDW2_DATA"),
+	PINCTRL_PIN(71, "SNDW1_CLK"),
+	PINCTRL_PIN(72, "SNDW1_DATA"),
+	PINCTRL_PIN(73, "SNDW4_CLK_DMIC_CLK_0"),
+	PINCTRL_PIN(74, "SNDW4_DATA_DMIC_DATA_0"),
+	/* GPP_R */
+	PINCTRL_PIN(75, "HDA_BCLK"),
+	PINCTRL_PIN(76, "HDA_SYNC"),
+	PINCTRL_PIN(77, "HDA_SDO"),
+	PINCTRL_PIN(78, "HDA_SDI_0"),
+	PINCTRL_PIN(79, "HDA_RSTB"),
+	PINCTRL_PIN(80, "HDA_SDI_1"),
+	PINCTRL_PIN(81, "I2S1_SFRM"),
+	PINCTRL_PIN(82, "I2S1_TXD"),
+	/* GPP_H */
+	PINCTRL_PIN(83, "GPPC_H_0"),
+	PINCTRL_PIN(84, "SD_PWR_EN_B"),
+	PINCTRL_PIN(85, "MODEM_CLKREQ"),
+	PINCTRL_PIN(86, "SX_EXIT_HOLDOFFB"),
+	PINCTRL_PIN(87, "I2C2_SDA"),
+	PINCTRL_PIN(88, "I2C2_SCL"),
+	PINCTRL_PIN(89, "I2C3_SDA"),
+	PINCTRL_PIN(90, "I2C3_SCL"),
+	PINCTRL_PIN(91, "I2C4_SDA"),
+	PINCTRL_PIN(92, "I2C4_SCL"),
+	PINCTRL_PIN(93, "CPU_VCCIO_PWR_GATEB"),
+	PINCTRL_PIN(94, "I2S2_SCLK"),
+	PINCTRL_PIN(95, "I2S2_SFRM"),
+	PINCTRL_PIN(96, "I2S2_TXD"),
+	PINCTRL_PIN(97, "I2S2_RXD"),
+	PINCTRL_PIN(98, "I2S1_SCLK"),
+	PINCTRL_PIN(99, "GPPC_H_16"),
+	PINCTRL_PIN(100, "GPPC_H_17"),
+	PINCTRL_PIN(101, "GPPC_H_18"),
+	PINCTRL_PIN(102, "GPPC_H_19"),
+	PINCTRL_PIN(103, "GPPC_H_20"),
+	PINCTRL_PIN(104, "GPPC_H_21"),
+	PINCTRL_PIN(105, "GPPC_H_22"),
+	PINCTRL_PIN(106, "GPPC_H_23"),
+	/* GPP_D */
+	PINCTRL_PIN(107, "SPI1_CSB"),
+	PINCTRL_PIN(108, "SPI1_CLK"),
+	PINCTRL_PIN(109, "SPI1_MISO_IO_1"),
+	PINCTRL_PIN(110, "SPI1_MOSI_IO_0"),
+	PINCTRL_PIN(111, "ISH_I2C0_SDA"),
+	PINCTRL_PIN(112, "ISH_I2C0_SCL"),
+	PINCTRL_PIN(113, "ISH_I2C1_SDA"),
+	PINCTRL_PIN(114, "ISH_I2C1_SCL"),
+	PINCTRL_PIN(115, "ISH_SPI_CSB"),
+	PINCTRL_PIN(116, "ISH_SPI_CLK"),
+	PINCTRL_PIN(117, "ISH_SPI_MISO"),
+	PINCTRL_PIN(118, "ISH_SPI_MOSI"),
+	PINCTRL_PIN(119, "ISH_UART0_RXD"),
+	PINCTRL_PIN(120, "ISH_UART0_TXD"),
+	PINCTRL_PIN(121, "ISH_UART0_RTSB"),
+	PINCTRL_PIN(122, "ISH_UART0_CTSB"),
+	PINCTRL_PIN(123, "SPI1_IO_2"),
+	PINCTRL_PIN(124, "SPI1_IO_3"),
+	PINCTRL_PIN(125, "I2S_MCLK"),
+	PINCTRL_PIN(126, "CNV_MFUART2_RXD"),
+	PINCTRL_PIN(127, "CNV_MFUART2_TXD"),
+	PINCTRL_PIN(128, "CNV_PA_BLANKING"),
+	PINCTRL_PIN(129, "I2C5_SDA"),
+	PINCTRL_PIN(130, "I2C5_SCL"),
+	PINCTRL_PIN(131, "GSPI2_CLK_LOOPBK"),
+	PINCTRL_PIN(132, "SPI1_CLK_LOOPBK"),
+	/* vGPIO */
+	PINCTRL_PIN(133, "CNV_BTEN"),
+	PINCTRL_PIN(134, "CNV_WCEN"),
+	PINCTRL_PIN(135, "CNV_BT_HOST_WAKEB"),
+	PINCTRL_PIN(136, "CNV_BT_IF_SELECT"),
+	PINCTRL_PIN(137, "vCNV_BT_UART_TXD"),
+	PINCTRL_PIN(138, "vCNV_BT_UART_RXD"),
+	PINCTRL_PIN(139, "vCNV_BT_UART_CTS_B"),
+	PINCTRL_PIN(140, "vCNV_BT_UART_RTS_B"),
+	PINCTRL_PIN(141, "vCNV_MFUART1_TXD"),
+	PINCTRL_PIN(142, "vCNV_MFUART1_RXD"),
+	PINCTRL_PIN(143, "vCNV_MFUART1_CTS_B"),
+	PINCTRL_PIN(144, "vCNV_MFUART1_RTS_B"),
+	PINCTRL_PIN(145, "vUART0_TXD"),
+	PINCTRL_PIN(146, "vUART0_RXD"),
+	PINCTRL_PIN(147, "vUART0_CTS_B"),
+	PINCTRL_PIN(148, "vUART0_RTS_B"),
+	PINCTRL_PIN(149, "vISH_UART0_TXD"),
+	PINCTRL_PIN(150, "vISH_UART0_RXD"),
+	PINCTRL_PIN(151, "vISH_UART0_CTS_B"),
+	PINCTRL_PIN(152, "vISH_UART0_RTS_B"),
+	PINCTRL_PIN(153, "vCNV_BT_I2S_BCLK"),
+	PINCTRL_PIN(154, "vCNV_BT_I2S_WS_SYNC"),
+	PINCTRL_PIN(155, "vCNV_BT_I2S_SDO"),
+	PINCTRL_PIN(156, "vCNV_BT_I2S_SDI"),
+	PINCTRL_PIN(157, "vI2S2_SCLK"),
+	PINCTRL_PIN(158, "vI2S2_SFRM"),
+	PINCTRL_PIN(159, "vI2S2_TXD"),
+	PINCTRL_PIN(160, "vI2S2_RXD"),
+	PINCTRL_PIN(161, "vSD3_CD_B"),
+	/* GPP_C */
+	PINCTRL_PIN(162, "GPPC_C_0"),
+	PINCTRL_PIN(163, "GPPC_C_1"),
+	PINCTRL_PIN(164, "GPPC_C_2"),
+	PINCTRL_PIN(165, "GPPC_C_3"),
+	PINCTRL_PIN(166, "GPPC_C_4"),
+	PINCTRL_PIN(167, "GPPC_C_5"),
+	PINCTRL_PIN(168, "SUSWARNB_SUSPWRDNACK"),
+	PINCTRL_PIN(169, "SUSACKB"),
+	PINCTRL_PIN(170, "UART0_RXD"),
+	PINCTRL_PIN(171, "UART0_TXD"),
+	PINCTRL_PIN(172, "UART0_RTSB"),
+	PINCTRL_PIN(173, "UART0_CTSB"),
+	PINCTRL_PIN(174, "UART1_RXD"),
+	PINCTRL_PIN(175, "UART1_TXD"),
+	PINCTRL_PIN(176, "UART1_RTSB"),
+	PINCTRL_PIN(177, "UART1_CTSB"),
+	PINCTRL_PIN(178, "I2C0_SDA"),
+	PINCTRL_PIN(179, "I2C0_SCL"),
+	PINCTRL_PIN(180, "I2C1_SDA"),
+	PINCTRL_PIN(181, "I2C1_SCL"),
+	PINCTRL_PIN(182, "UART2_RXD"),
+	PINCTRL_PIN(183, "UART2_TXD"),
+	PINCTRL_PIN(184, "UART2_RTSB"),
+	PINCTRL_PIN(185, "UART2_CTSB"),
+	/* HVCMOS */
+	PINCTRL_PIN(186, "L_BKLTEN"),
+	PINCTRL_PIN(187, "L_BKLTCTL"),
+	PINCTRL_PIN(188, "L_VDDEN"),
+	PINCTRL_PIN(189, "SYS_PWROK"),
+	PINCTRL_PIN(190, "SYS_RESETB"),
+	PINCTRL_PIN(191, "MLK_RSTB"),
+	/* GPP_E */
+	PINCTRL_PIN(192, "ISH_GP_0"),
+	PINCTRL_PIN(193, "ISH_GP_1"),
+	PINCTRL_PIN(194, "IMGCLKOUT_1"),
+	PINCTRL_PIN(195, "ISH_GP_2"),
+	PINCTRL_PIN(196, "IMGCLKOUT_2"),
+	PINCTRL_PIN(197, "SATA_LEDB"),
+	PINCTRL_PIN(198, "IMGCLKOUT_3"),
+	PINCTRL_PIN(199, "ISH_GP_3"),
+	PINCTRL_PIN(200, "ISH_GP_4"),
+	PINCTRL_PIN(201, "ISH_GP_5"),
+	PINCTRL_PIN(202, "ISH_GP_6"),
+	PINCTRL_PIN(203, "ISH_GP_7"),
+	PINCTRL_PIN(204, "IMGCLKOUT_4"),
+	PINCTRL_PIN(205, "DDPA_CTRLCLK"),
+	PINCTRL_PIN(206, "DDPA_CTRLDATA"),
+	PINCTRL_PIN(207, "DDPB_CTRLCLK"),
+	PINCTRL_PIN(208, "DDPB_CTRLDATA"),
+	PINCTRL_PIN(209, "DDPC_CTRLCLK"),
+	PINCTRL_PIN(210, "DDPC_CTRLDATA"),
+	PINCTRL_PIN(211, "IMGCLKOUT_5"),
+	PINCTRL_PIN(212, "CNV_BRI_DT"),
+	PINCTRL_PIN(213, "CNV_BRI_RSP"),
+	PINCTRL_PIN(214, "CNV_RGI_DT"),
+	PINCTRL_PIN(215, "CNV_RGI_RSP"),
+	/* GPP_G */
+	PINCTRL_PIN(216, "SD3_CMD"),
+	PINCTRL_PIN(217, "SD3_D0"),
+	PINCTRL_PIN(218, "SD3_D1"),
+	PINCTRL_PIN(219, "SD3_D2"),
+	PINCTRL_PIN(220, "SD3_D3"),
+	PINCTRL_PIN(221, "SD3_CDB"),
+	PINCTRL_PIN(222, "SD3_CLK"),
+	PINCTRL_PIN(223, "SD3_WP"),
+};
+
+static const struct intel_padgroup jsl_community0_gpps[] = {
+	JSL_GPP(0, 0, 19, 320),				/* GPP_F */
+	JSL_GPP(1, 20, 45, 32),				/* GPP_B */
+	JSL_GPP(2, 46, 66, 64),				/* GPP_A */
+	JSL_GPP(3, 67, 74, 96),				/* GPP_S */
+	JSL_GPP(4, 75, 82, 128),			/* GPP_R */
+};
+
+static const struct intel_padgroup jsl_community1_gpps[] = {
+	JSL_GPP(0, 83, 106, 160),			/* GPP_H */
+	JSL_GPP(1, 107, 132, 192),			/* GPP_D */
+	JSL_GPP(2, 133, 161, 224),			/* vGPIO */
+	JSL_GPP(3, 162, 185, 256),			/* GPP_C */
+};
+
+static const struct intel_padgroup jsl_community4_gpps[] = {
+	JSL_GPP(0, 186, 191, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	JSL_GPP(1, 192, 215, 288),			/* GPP_E */
+};
+
+static const struct intel_padgroup jsl_community5_gpps[] = {
+	JSL_GPP(0, 216, 223, INTEL_GPIO_BASE_ZERO),	/* GPP_G */
+};
+
+static const struct intel_community jsl_communities[] = {
+	JSL_COMMUNITY(0, 0, 82, jsl_community0_gpps),
+	JSL_COMMUNITY(1, 83, 185, jsl_community1_gpps),
+	JSL_COMMUNITY(2, 186, 215, jsl_community4_gpps),
+	JSL_COMMUNITY(3, 216, 223, jsl_community5_gpps),
+};
+
+static const struct intel_pinctrl_soc_data jsl_soc_data = {
+	.pins = jsl_pins,
+	.npins = ARRAY_SIZE(jsl_pins),
+	.communities = jsl_communities,
+	.ncommunities = ARRAY_SIZE(jsl_communities),
+};
+
+static const struct acpi_device_id jsl_pinctrl_acpi_match[] = {
+	{ "INT34C8", (kernel_ulong_t)&jsl_soc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, jsl_pinctrl_acpi_match);
+
+static INTEL_PINCTRL_PM_OPS(jsl_pinctrl_pm_ops);
+
+static struct platform_driver jsl_pinctrl_driver = {
+	.probe = intel_pinctrl_probe_by_hid,
+	.driver = {
+		.name = "jasperlake-pinctrl",
+		.acpi_match_table = jsl_pinctrl_acpi_match,
+		.pm = &jsl_pinctrl_pm_ops,
+	},
+};
+
+module_platform_driver(jsl_pinctrl_driver);
+
+MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Jasper Lake PCH pinctrl/GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

