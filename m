Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14A2561A7B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jun 2022 14:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiF3MjP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 08:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234582AbiF3MjF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 08:39:05 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FA03F897;
        Thu, 30 Jun 2022 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656592744; x=1688128744;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7JVA3zZCkXaGsMo8+jZkrU0CIqYw/YSnzkY7I1YLwF0=;
  b=n98s7KKsi9uRJuD0GGAUI4HqynQOGUeziciGJNXMKs063H5GTtpyZgne
   SSkKMX5mRiLm1mFZpHbffFG6cGxe/GQ1qtM/OFQVGLSCU0Qbe+Jnog5tK
   F97lMwoF5+TB2WZASs4nhQc2exrmvx7BspTBys6we6GtviwfMqseFJKPM
   GX0ezNsCcq3/YtyC4f8jfg+tb2MRIzN4NBXmdkwuz6H2aBsuuJW+iNFlM
   quq94GujsTQia2JTaUhMtAM1jR5uC/uMylfDoKtxBtKdK6MLPAFrYDtAh
   Q9QDMp3KkRqWxl0hmamo3pz1m2z0Ea+WNerl8Mw1x+7yKljg5lE3cUG8+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282369457"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="282369457"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 05:39:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="541312999"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2022 05:39:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B6B0213C; Thu, 30 Jun 2022 15:39:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Add Intel Meteor Lake pin controller support
Date:   Thu, 30 Jun 2022 15:38:58 +0300
Message-Id: <20220630123858.74300-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver adds pinctrl/GPIO support for Intel Meteor Lake. The
GPIO controller is based on the next generation GPIO hardware but still
compatible with the one supported by the Intel core pinctrl/GPIO driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/Kconfig              |   8 +
 drivers/pinctrl/intel/Makefile             |   1 +
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 417 +++++++++++++++++++++
 3 files changed, 426 insertions(+)
 create mode 100644 drivers/pinctrl/intel/pinctrl-meteorlake.c

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index e5ec8b8956da..078eec8af4a4 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -151,6 +151,14 @@ config PINCTRL_LEWISBURG
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Lewisburg pins and using them as GPIOs.
 
+config PINCTRL_METEORLAKE
+	tristate "Intel Meteor Lake pinctrl and GPIO driver"
+	depends on ACPI
+	select PINCTRL_INTEL
+	help
+	  This pinctrl driver provides an interface that allows configuring
+	  of Intel Meteor Lake pins and using them as GPIOs.
+
 config PINCTRL_SUNRISEPOINT
 	tristate "Intel Sunrisepoint pinctrl and GPIO driver"
 	depends on ACPI
diff --git a/drivers/pinctrl/intel/Makefile b/drivers/pinctrl/intel/Makefile
index 181ffcf34d62..bb87e7bc7b20 100644
--- a/drivers/pinctrl/intel/Makefile
+++ b/drivers/pinctrl/intel/Makefile
@@ -18,5 +18,6 @@ obj-$(CONFIG_PINCTRL_ICELAKE)		+= pinctrl-icelake.o
 obj-$(CONFIG_PINCTRL_JASPERLAKE)	+= pinctrl-jasperlake.o
 obj-$(CONFIG_PINCTRL_LAKEFIELD)		+= pinctrl-lakefield.o
 obj-$(CONFIG_PINCTRL_LEWISBURG)		+= pinctrl-lewisburg.o
+obj-$(CONFIG_PINCTRL_METEORLAKE)	+= pinctrl-meteorlake.o
 obj-$(CONFIG_PINCTRL_SUNRISEPOINT)	+= pinctrl-sunrisepoint.o
 obj-$(CONFIG_PINCTRL_TIGERLAKE)		+= pinctrl-tigerlake.o
diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
new file mode 100644
index 000000000000..9576dcd1cb29
--- /dev/null
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Meteor Lake PCH pinctrl/GPIO driver
+ *
+ * Copyright (C) 2022, Intel Corporation
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
+#define MTL_PAD_OWN	0x0b0
+#define MTL_PADCFGLOCK	0x110
+#define MTL_HOSTSW_OWN	0x140
+#define MTL_GPI_IS	0x200
+#define MTL_GPI_IE	0x210
+
+#define MTL_GPP(r, s, e, g)				\
+	{						\
+		.reg_num = (r),				\
+		.base = (s),				\
+		.size = ((e) - (s) + 1),		\
+		.gpio_base = (g),			\
+	}
+
+#define MTL_COMMUNITY(b, s, e, g)			\
+	{						\
+		.barno = (b),				\
+		.padown_offset = MTL_PAD_OWN,		\
+		.padcfglock_offset = MTL_PADCFGLOCK,	\
+		.hostown_offset = MTL_HOSTSW_OWN,	\
+		.is_offset = MTL_GPI_IS,		\
+		.ie_offset = MTL_GPI_IE,		\
+		.pin_base = (s),			\
+		.npins = ((e) - (s) + 1),		\
+		.gpps = (g),				\
+		.ngpps = ARRAY_SIZE(g),			\
+	}
+
+/* Meteor Lake-P */
+static const struct pinctrl_pin_desc mtlp_pins[] = {
+	/* CPU */
+	PINCTRL_PIN(0, "PECI"),
+	PINCTRL_PIN(1, "UFS_RESET_B"),
+	PINCTRL_PIN(2, "VIDSOUT"),
+	PINCTRL_PIN(3, "VIDSCK"),
+	PINCTRL_PIN(4, "VIDALERT_B"),
+	/* GPP_V */
+	PINCTRL_PIN(5, "BATLOW_B"),
+	PINCTRL_PIN(6, "AC_PRESENT"),
+	PINCTRL_PIN(7, "SOC_WAKE_B"),
+	PINCTRL_PIN(8, "PWRBTN_B"),
+	PINCTRL_PIN(9, "SLP_S3_B"),
+	PINCTRL_PIN(10, "SLP_S4_B"),
+	PINCTRL_PIN(11, "SLP_A_B"),
+	PINCTRL_PIN(12, "GPP_V_7"),
+	PINCTRL_PIN(13, "SUSCLK"),
+	PINCTRL_PIN(14, "SLP_WLAN_B"),
+	PINCTRL_PIN(15, "SLP_S5_B"),
+	PINCTRL_PIN(16, "LANPHYPC"),
+	PINCTRL_PIN(17, "SLP_LAN_B"),
+	PINCTRL_PIN(18, "GPP_V_13"),
+	PINCTRL_PIN(19, "WAKE_B"),
+	PINCTRL_PIN(20, "GPP_V_15"),
+	PINCTRL_PIN(21, "GPP_V_16"),
+	PINCTRL_PIN(22, "GPP_V_17"),
+	PINCTRL_PIN(23, "GPP_V_18"),
+	PINCTRL_PIN(24, "CATERR_B"),
+	PINCTRL_PIN(25, "PROCHOT_B"),
+	PINCTRL_PIN(26, "THERMTRIP_B"),
+	PINCTRL_PIN(27, "DSI_DE_TE_2_GENLOCK_REF"),
+	PINCTRL_PIN(28, "DSI_DE_TE_1_DISP_UTILS"),
+	/* GPP_C */
+	PINCTRL_PIN(29, "SMBCLK"),
+	PINCTRL_PIN(30, "SMBDATA"),
+	PINCTRL_PIN(31, "SMBALERT_B"),
+	PINCTRL_PIN(32, "SML0CLK"),
+	PINCTRL_PIN(33, "SML0DATA"),
+	PINCTRL_PIN(34, "GPP_C_5"),
+	PINCTRL_PIN(35, "GPP_C_6"),
+	PINCTRL_PIN(36, "GPP_C_7"),
+	PINCTRL_PIN(37, "GPP_C_8"),
+	PINCTRL_PIN(38, "GPP_C_9"),
+	PINCTRL_PIN(39, "GPP_C_10"),
+	PINCTRL_PIN(40, "GPP_C_11"),
+	PINCTRL_PIN(41, "GPP_C_12"),
+	PINCTRL_PIN(42, "GPP_C_13"),
+	PINCTRL_PIN(43, "GPP_C_14"),
+	PINCTRL_PIN(44, "GPP_C_15"),
+	PINCTRL_PIN(45, "GPP_C_16"),
+	PINCTRL_PIN(46, "GPP_C_17"),
+	PINCTRL_PIN(47, "GPP_C_18"),
+	PINCTRL_PIN(48, "GPP_C_19"),
+	PINCTRL_PIN(49, "GPP_C_20"),
+	PINCTRL_PIN(50, "GPP_C_21"),
+	PINCTRL_PIN(51, "GPP_C_22"),
+	PINCTRL_PIN(52, "GPP_C_23"),
+	/* GPP_A */
+	PINCTRL_PIN(53, "ESPI_IO_0"),
+	PINCTRL_PIN(54, "ESPI_IO_1"),
+	PINCTRL_PIN(55, "ESPI_IO_2"),
+	PINCTRL_PIN(56, "ESPI_IO_3"),
+	PINCTRL_PIN(57, "ESPI_CS0_B"),
+	PINCTRL_PIN(58, "ESPI_CLK"),
+	PINCTRL_PIN(59, "ESPI_RESET_B"),
+	PINCTRL_PIN(60, "GPP_A_7"),
+	PINCTRL_PIN(61, "GPP_A_8"),
+	PINCTRL_PIN(62, "GPP_A_9"),
+	PINCTRL_PIN(63, "GPP_A_10"),
+	PINCTRL_PIN(64, "GPP_A_11"),
+	PINCTRL_PIN(65, "GPP_A_12"),
+	PINCTRL_PIN(66, "ESPI_CS1_B"),
+	PINCTRL_PIN(67, "ESPI_CS2_B"),
+	PINCTRL_PIN(68, "ESPI_CS3_B"),
+	PINCTRL_PIN(69, "ESPI_ALERT0_B"),
+	PINCTRL_PIN(70, "ESPI_ALERT1_B"),
+	PINCTRL_PIN(71, "ESPI_ALERT2_B"),
+	PINCTRL_PIN(72, "ESPI_ALERT3_B"),
+	PINCTRL_PIN(73, "GPP_A_20"),
+	PINCTRL_PIN(74, "GPP_A_21"),
+	PINCTRL_PIN(75, "GPP_A_22"),
+	PINCTRL_PIN(76, "GPP_A_23"),
+	PINCTRL_PIN(77, "ESPI_CLK_LOOPBK"),
+	/* GPP_E */
+	PINCTRL_PIN(78, "GPP_E_0"),
+	PINCTRL_PIN(79, "GPP_E_1"),
+	PINCTRL_PIN(80, "GPP_E_2"),
+	PINCTRL_PIN(81, "GPP_E_3"),
+	PINCTRL_PIN(82, "GPP_E_4"),
+	PINCTRL_PIN(83, "GPP_E_5"),
+	PINCTRL_PIN(84, "GPP_E_6"),
+	PINCTRL_PIN(85, "GPP_E_7"),
+	PINCTRL_PIN(86, "GPP_E_8"),
+	PINCTRL_PIN(87, "GPP_E_9"),
+	PINCTRL_PIN(88, "GPP_E_10"),
+	PINCTRL_PIN(89, "GPP_E_11"),
+	PINCTRL_PIN(90, "GPP_E_12"),
+	PINCTRL_PIN(91, "GPP_E_13"),
+	PINCTRL_PIN(92, "GPP_E_14"),
+	PINCTRL_PIN(93, "SLP_DRAM_B"),
+	PINCTRL_PIN(94, "GPP_E_16"),
+	PINCTRL_PIN(95, "GPP_E_17"),
+	PINCTRL_PIN(96, "GPP_E_18"),
+	PINCTRL_PIN(97, "GPP_E_19"),
+	PINCTRL_PIN(98, "GPP_E_20"),
+	PINCTRL_PIN(99, "GPP_E_21"),
+	PINCTRL_PIN(100, "DNX_FORCE_RELOAD"),
+	PINCTRL_PIN(101, "GPP_E_23"),
+	PINCTRL_PIN(102, "THC0_GSPI0_CLK_LOOPBK"),
+	/* GPP_H */
+	PINCTRL_PIN(103, "GPP_H_0"),
+	PINCTRL_PIN(104, "GPP_H_1"),
+	PINCTRL_PIN(105, "GPP_H_2"),
+	PINCTRL_PIN(106, "GPP_H_3"),
+	PINCTRL_PIN(107, "GPP_H_4"),
+	PINCTRL_PIN(108, "GPP_H_5"),
+	PINCTRL_PIN(109, "GPP_H_6"),
+	PINCTRL_PIN(110, "GPP_H_7"),
+	PINCTRL_PIN(111, "GPP_H_8"),
+	PINCTRL_PIN(112, "GPP_H_9"),
+	PINCTRL_PIN(113, "GPP_H_10"),
+	PINCTRL_PIN(114, "GPP_H_11"),
+	PINCTRL_PIN(115, "GPP_H_12"),
+	PINCTRL_PIN(116, "CPU_C10_GATE_B"),
+	PINCTRL_PIN(117, "GPP_H_14"),
+	PINCTRL_PIN(118, "GPP_H_15"),
+	PINCTRL_PIN(119, "GPP_H_16"),
+	PINCTRL_PIN(120, "GPP_H_17"),
+	PINCTRL_PIN(121, "GPP_H_18"),
+	PINCTRL_PIN(122, "GPP_H_19"),
+	PINCTRL_PIN(123, "GPP_H_20"),
+	PINCTRL_PIN(124, "GPP_H_21"),
+	PINCTRL_PIN(125, "GPP_H_22"),
+	PINCTRL_PIN(126, "GPP_H_23"),
+	PINCTRL_PIN(127, "LPI3C1_CLK_LOOPBK"),
+	PINCTRL_PIN(128, "I3C0_CLK_LOOPBK"),
+	/* GPP_F */
+	PINCTRL_PIN(129, "CNV_BRI_DT"),
+	PINCTRL_PIN(130, "CNV_BRI_RSP"),
+	PINCTRL_PIN(131, "CNV_RGI_DT"),
+	PINCTRL_PIN(132, "CNV_RGI_RSP"),
+	PINCTRL_PIN(133, "CNV_RF_RESET_B"),
+	PINCTRL_PIN(134, "CRF_CLKREQ"),
+	PINCTRL_PIN(135, "GPP_F_6"),
+	PINCTRL_PIN(136, "FUSA_DIAGTEST_EN"),
+	PINCTRL_PIN(137, "FUSA_DIAGTEST_MODE"),
+	PINCTRL_PIN(138, "BOOTMPC"),
+	PINCTRL_PIN(139, "GPP_F_10"),
+	PINCTRL_PIN(140, "GPP_F_11"),
+	PINCTRL_PIN(141, "GSXDOUT"),
+	PINCTRL_PIN(142, "GSXSLOAD"),
+	PINCTRL_PIN(143, "GSXDIN"),
+	PINCTRL_PIN(144, "GSXSRESETB"),
+	PINCTRL_PIN(145, "GSXCLK"),
+	PINCTRL_PIN(146, "GMII_MDC_0"),
+	PINCTRL_PIN(147, "GMII_MDIO_0"),
+	PINCTRL_PIN(148, "GPP_F_19"),
+	PINCTRL_PIN(149, "GPP_F_20"),
+	PINCTRL_PIN(150, "GPP_F_21"),
+	PINCTRL_PIN(151, "GPP_F_22"),
+	PINCTRL_PIN(152, "GPP_F_23"),
+	PINCTRL_PIN(153, "THC1_GSPI1_CLK_LOOPBK"),
+	PINCTRL_PIN(154, "GSPI0A_CLK_LOOPBK"),
+	/* SPI0 */
+	PINCTRL_PIN(155, "SPI0_IO_2"),
+	PINCTRL_PIN(156, "SPI0_IO_3"),
+	PINCTRL_PIN(157, "SPI0_MOSI_IO_0"),
+	PINCTRL_PIN(158, "SPI0_MISO_IO_1"),
+	PINCTRL_PIN(159, "SPI0_TPM_CS_B"),
+	PINCTRL_PIN(160, "SPI0_FLASH_0_CS_B"),
+	PINCTRL_PIN(161, "SPI0_FLASH_1_CS_B"),
+	PINCTRL_PIN(162, "SPI0_CLK"),
+	PINCTRL_PIN(163, "L_BKLTEN"),
+	PINCTRL_PIN(164, "L_BKLTCTL"),
+	PINCTRL_PIN(165, "L_VDDEN"),
+	PINCTRL_PIN(166, "SYS_PWROK"),
+	PINCTRL_PIN(167, "SYS_RESET_B"),
+	PINCTRL_PIN(168, "MLK_RST_B"),
+	PINCTRL_PIN(169, "SPI0_CLK_LOOPBK"),
+	/* vGPIO_3 */
+	PINCTRL_PIN(170, "ESPI_USB_OCB_0"),
+	PINCTRL_PIN(171, "ESPI_USB_OCB_1"),
+	PINCTRL_PIN(172, "ESPI_USB_OCB_2"),
+	PINCTRL_PIN(173, "ESPI_USB_OCB_3"),
+	PINCTRL_PIN(174, "USB_CPU_OCB_0"),
+	PINCTRL_PIN(175, "USB_CPU_OCB_1"),
+	PINCTRL_PIN(176, "USB_CPU_OCB_2"),
+	PINCTRL_PIN(177, "USB_CPU_OCB_3"),
+	PINCTRL_PIN(178, "TS0_IN_INT"),
+	PINCTRL_PIN(179, "TS1_IN_INT"),
+	PINCTRL_PIN(180, "THC0_WOT_INT"),
+	PINCTRL_PIN(181, "THC1_WOT_INT"),
+	PINCTRL_PIN(182, "THC0_WHC_INT"),
+	PINCTRL_PIN(183, "THC1_WHC_INT"),
+	/* GPP_S */
+	PINCTRL_PIN(184, "GPP_S_0"),
+	PINCTRL_PIN(185, "GPP_S_1"),
+	PINCTRL_PIN(186, "GPP_S_2"),
+	PINCTRL_PIN(187, "GPP_S_3"),
+	PINCTRL_PIN(188, "GPP_S_4"),
+	PINCTRL_PIN(189, "GPP_S_5"),
+	PINCTRL_PIN(190, "GPP_S_6"),
+	PINCTRL_PIN(191, "GPP_S_7"),
+	/* JTAG */
+	PINCTRL_PIN(192, "JTAG_MBPB0"),
+	PINCTRL_PIN(193, "JTAG_MBPB1"),
+	PINCTRL_PIN(194, "JTAG_MBPB2"),
+	PINCTRL_PIN(195, "JTAG_MBPB3"),
+	PINCTRL_PIN(196, "JTAG_TDO"),
+	PINCTRL_PIN(197, "PRDY_B"),
+	PINCTRL_PIN(198, "PREQ_B"),
+	PINCTRL_PIN(199, "JTAG_TDI"),
+	PINCTRL_PIN(200, "JTAG_TMS"),
+	PINCTRL_PIN(201, "JTAG_TCK"),
+	PINCTRL_PIN(202, "DBG_PMODE"),
+	PINCTRL_PIN(203, "JTAG_TRST_B"),
+	/* GPP_B */
+	PINCTRL_PIN(204, "ADM_VID_0"),
+	PINCTRL_PIN(205, "ADM_VID_1"),
+	PINCTRL_PIN(206, "GPP_B_2"),
+	PINCTRL_PIN(207, "GPP_B_3"),
+	PINCTRL_PIN(208, "GPP_B_4"),
+	PINCTRL_PIN(209, "GPP_B_5"),
+	PINCTRL_PIN(210, "GPP_B_6"),
+	PINCTRL_PIN(211, "GPP_B_7"),
+	PINCTRL_PIN(212, "GPP_B_8"),
+	PINCTRL_PIN(213, "GPP_B_9"),
+	PINCTRL_PIN(214, "GPP_B_10"),
+	PINCTRL_PIN(215, "GPP_B_11"),
+	PINCTRL_PIN(216, "SLP_S0_B"),
+	PINCTRL_PIN(217, "PLTRST_B"),
+	PINCTRL_PIN(218, "GPP_B_14"),
+	PINCTRL_PIN(219, "GPP_B_15"),
+	PINCTRL_PIN(220, "GPP_B_16"),
+	PINCTRL_PIN(221, "GPP_B_17"),
+	PINCTRL_PIN(222, "GPP_B_18"),
+	PINCTRL_PIN(223, "GPP_B_19"),
+	PINCTRL_PIN(224, "GPP_B_20"),
+	PINCTRL_PIN(225, "GPP_B_21"),
+	PINCTRL_PIN(226, "GPP_B_22"),
+	PINCTRL_PIN(227, "GPP_B_23"),
+	PINCTRL_PIN(228, "ISH_I3C0_CLK_LOOPBK"),
+	/* GPP_D */
+	PINCTRL_PIN(229, "GPP_D_0"),
+	PINCTRL_PIN(230, "GPP_D_1"),
+	PINCTRL_PIN(231, "GPP_D_2"),
+	PINCTRL_PIN(232, "GPP_D_3"),
+	PINCTRL_PIN(233, "GPP_D_4"),
+	PINCTRL_PIN(234, "GPP_D_5"),
+	PINCTRL_PIN(235, "GPP_D_6"),
+	PINCTRL_PIN(236, "GPP_D_7"),
+	PINCTRL_PIN(237, "GPP_D_8"),
+	PINCTRL_PIN(238, "GPP_D_9"),
+	PINCTRL_PIN(239, "HDA_BCLK"),
+	PINCTRL_PIN(240, "HDA_SYNC"),
+	PINCTRL_PIN(241, "HDA_SDO"),
+	PINCTRL_PIN(242, "HDA_SDI_0"),
+	PINCTRL_PIN(243, "GPP_D_14"),
+	PINCTRL_PIN(244, "GPP_D_15"),
+	PINCTRL_PIN(245, "GPP_D_16"),
+	PINCTRL_PIN(246, "HDA_RST_B"),
+	PINCTRL_PIN(247, "GPP_D_18"),
+	PINCTRL_PIN(248, "GPP_D_19"),
+	PINCTRL_PIN(249, "GPP_D_20"),
+	PINCTRL_PIN(250, "UFS_REFCLK"),
+	PINCTRL_PIN(251, "BPKI3C_SDA"),
+	PINCTRL_PIN(252, "BPKI3C_SCL"),
+	PINCTRL_PIN(253, "BOOTHALT_B"),
+	/* vGPIO */
+	PINCTRL_PIN(254, "CNV_BTEN"),
+	PINCTRL_PIN(255, "CNV_BT_HOST_WAKEB"),
+	PINCTRL_PIN(256, "CNV_BT_IF_SELECT"),
+	PINCTRL_PIN(257, "vCNV_BT_UART_TXD"),
+	PINCTRL_PIN(258, "vCNV_BT_UART_RXD"),
+	PINCTRL_PIN(259, "vCNV_BT_UART_CTS_B"),
+	PINCTRL_PIN(260, "vCNV_BT_UART_RTS_B"),
+	PINCTRL_PIN(261, "vCNV_MFUART1_TXD"),
+	PINCTRL_PIN(262, "vCNV_MFUART1_RXD"),
+	PINCTRL_PIN(263, "vCNV_MFUART1_CTS_B"),
+	PINCTRL_PIN(264, "vCNV_MFUART1_RTS_B"),
+	PINCTRL_PIN(265, "vUART0_TXD"),
+	PINCTRL_PIN(266, "vUART0_RXD"),
+	PINCTRL_PIN(267, "vUART0_CTS_B"),
+	PINCTRL_PIN(268, "vUART0_RTS_B"),
+	PINCTRL_PIN(269, "vISH_UART0_TXD"),
+	PINCTRL_PIN(270, "vISH_UART0_RXD"),
+	PINCTRL_PIN(271, "vISH_UART0_CTS_B"),
+	PINCTRL_PIN(272, "vISH_UART0_RTS_B"),
+	PINCTRL_PIN(273, "vCNV_BT_I2S_BCLK"),
+	PINCTRL_PIN(274, "vCNV_BT_I2S_WS_SYNC"),
+	PINCTRL_PIN(275, "vCNV_BT_I2S_SDO"),
+	PINCTRL_PIN(276, "vCNV_BT_I2S_SDI"),
+	PINCTRL_PIN(277, "vI2S2_SCLK"),
+	PINCTRL_PIN(278, "vI2S2_SFRM"),
+	PINCTRL_PIN(279, "vI2S2_TXD"),
+	PINCTRL_PIN(280, "vI2S2_RXD"),
+	PINCTRL_PIN(281, "vCNV_BT_I2S_BCLK_2"),
+	PINCTRL_PIN(282, "vCNV_BT_I2S_WS_SYNC_2"),
+	PINCTRL_PIN(283, "vCNV_BT_I2S_SDO_2"),
+	PINCTRL_PIN(284, "vCNV_BT_I2S_SDI_2"),
+	PINCTRL_PIN(285, "vI2S2_SCLK_2"),
+	PINCTRL_PIN(286, "vI2S2_SFRM_2"),
+	PINCTRL_PIN(287, "vI2S2_TXD_2"),
+	PINCTRL_PIN(288, "vI2S2_RXD_2"),
+};
+
+static const struct intel_padgroup mtlp_community0_gpps[] = {
+	MTL_GPP(0, 0, 4, 0),		/* CPU */
+	MTL_GPP(1, 5, 28, 32),		/* GPP_V */
+	MTL_GPP(2, 29, 52, 64),		/* GPP_C */
+};
+
+static const struct intel_padgroup mtlp_community1_gpps[] = {
+	MTL_GPP(0, 53, 77, 96),		/* GPP_A */
+	MTL_GPP(1, 78, 102, 128),	/* GPP_E */
+};
+
+static const struct intel_padgroup mtlp_community3_gpps[] = {
+	MTL_GPP(0, 103, 128, 160),	/* GPP_H */
+	MTL_GPP(1, 129, 154, 192),	/* GPP_F */
+	MTL_GPP(2, 155, 169, 224),	/* SPI0 */
+	MTL_GPP(3, 170, 183, 256),	/* vGPIO_3 */
+};
+
+static const struct intel_padgroup mtlp_community4_gpps[] = {
+	MTL_GPP(0, 184, 191, 288),	/* GPP_S */
+	MTL_GPP(1, 192, 203, 320),	/* JTAG */
+};
+
+static const struct intel_padgroup mtlp_community5_gpps[] = {
+	MTL_GPP(0, 204, 228, 352),	/* GPP_B */
+	MTL_GPP(1, 229, 253, 384),	/* GPP_D */
+	MTL_GPP(2, 254, 285, 416),	/* vGPIO_0 */
+	MTL_GPP(3, 286, 288, 448),	/* vGPIO_1 */
+};
+
+static const struct intel_community mtlp_communities[] = {
+	MTL_COMMUNITY(0, 0, 52, mtlp_community0_gpps),
+	MTL_COMMUNITY(1, 53, 102, mtlp_community1_gpps),
+	MTL_COMMUNITY(2, 103, 183, mtlp_community3_gpps),
+	MTL_COMMUNITY(3, 184, 203, mtlp_community4_gpps),
+	MTL_COMMUNITY(4, 204, 288, mtlp_community5_gpps),
+};
+
+static const struct intel_pinctrl_soc_data mtlp_soc_data = {
+	.pins = mtlp_pins,
+	.npins = ARRAY_SIZE(mtlp_pins),
+	.communities = mtlp_communities,
+	.ncommunities = ARRAY_SIZE(mtlp_communities),
+};
+
+static const struct acpi_device_id mtl_pinctrl_acpi_match[] = {
+	{ "INTC1083", (kernel_ulong_t)&mtlp_soc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, mtl_pinctrl_acpi_match);
+
+static INTEL_PINCTRL_PM_OPS(mtl_pinctrl_pm_ops);
+
+static struct platform_driver mtl_pinctrl_driver = {
+	.probe = intel_pinctrl_probe_by_hid,
+	.driver = {
+		.name = "meteorlake-pinctrl",
+		.acpi_match_table = mtl_pinctrl_acpi_match,
+		.pm = &mtl_pinctrl_pm_ops,
+	},
+};
+module_platform_driver(mtl_pinctrl_driver);
+
+MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Meteor Lake PCH pinctrl/GPIO driver");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

