Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEFE4B710F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Feb 2022 17:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiBOP3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Feb 2022 10:29:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240055AbiBOP31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Feb 2022 10:29:27 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCE6BA746;
        Tue, 15 Feb 2022 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644938896; x=1676474896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tKfbY1V/3Tn8i/Ccx7NdfCBcTFiVSJiSw4K91IaM1Ew=;
  b=kHERqhMINwqBrSddnb4RrsYUGsh8HVwweorZC67QKf0htVvDrQCRX/Kj
   wDilXaf2gz7wzznARzc3QRs8RvQVQNHH/I2Yn8z2WJxLE849m70C5m0II
   Ncj/Usf+J7sf4AXevAlkkAjl8VLFnvI30aBuOzSs36FJifT/+pLoFCEnk
   ZXgb5xPI1YWAHgA24Kd4SeDii7VmsNZ0Nj2vEQRrNt36TiF2+ctXveZB6
   NHG6xVxA4+Llx4CvifSBBL2+n4MtgQBjoiBKnXWYzBMM6RYMXMMqZGWoI
   XdwQKd9F43mKqPrbUQ2eaXWAu3QAI5askXceUUmOTDCNDNFKDfIssqHAG
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="311113162"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="311113162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 07:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="703747133"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2022 07:27:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AC38B143; Tue, 15 Feb 2022 17:28:09 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 3/4] pinctrl: alderlake: Add Intel Alder Lake-N pin controller support
Date:   Tue, 15 Feb 2022 17:27:59 +0200
Message-Id: <20220215152800.21104-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152800.21104-1-andriy.shevchenko@linux.intel.com>
References: <20220215152800.21104-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This change driver adds pinctrl/GPIO support for Intel Alder Lake-N SoC. The
GPIO controller is based on the next generation GPIO hardware but still
compatible with the one supported by the Intel core pinctrl/GPIO driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c | 316 +++++++++++++++++++++-
 1 file changed, 315 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 51fb99cd64a2..32ba50efbceb 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -2,7 +2,7 @@
 /*
  * Intel Alder Lake PCH pinctrl/GPIO driver
  *
- * Copyright (C) 2020, Intel Corporation
+ * Copyright (C) 2020, 2022 Intel Corporation
  * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  */
 
@@ -42,6 +42,319 @@
 		.ngpps = ARRAY_SIZE(g),			\
 	}
 
+/* Alder Lake-N */
+static const struct pinctrl_pin_desc adln_pins[] = {
+	/* GPP_B */
+	PINCTRL_PIN(0, "CORE_VID_0"),
+	PINCTRL_PIN(1, "CORE_VID_1"),
+	PINCTRL_PIN(2, "GPPC_B_2"),
+	PINCTRL_PIN(3, "GPPC_B_3"),
+	PINCTRL_PIN(4, "GPPC_B_4"),
+	PINCTRL_PIN(5, "GPPC_B_5"),
+	PINCTRL_PIN(6, "GPPC_B_6"),
+	PINCTRL_PIN(7, "GPPC_B_7"),
+	PINCTRL_PIN(8, "GPPC_B_8"),
+	PINCTRL_PIN(9, "GPPC_B_9"),
+	PINCTRL_PIN(10, "GPPC_B_10"),
+	PINCTRL_PIN(11, "GPPC_B_11"),
+	PINCTRL_PIN(12, "SLP_S0B"),
+	PINCTRL_PIN(13, "PLTRSTB"),
+	PINCTRL_PIN(14, "GPPC_B_14"),
+	PINCTRL_PIN(15, "GPPC_B_15"),
+	PINCTRL_PIN(16, "GPPC_B_16"),
+	PINCTRL_PIN(17, "GPPC_B_17"),
+	PINCTRL_PIN(18, "GPPC_B_18"),
+	PINCTRL_PIN(19, "GPPC_B_19"),
+	PINCTRL_PIN(20, "GPPC_B_20"),
+	PINCTRL_PIN(21, "GPPC_B_21"),
+	PINCTRL_PIN(22, "GPPC_B_22"),
+	PINCTRL_PIN(23, "GPPC_B_23"),
+	PINCTRL_PIN(24, "GSPI0_CLK_LOOPBK"),
+	PINCTRL_PIN(25, "GSPI1_CLK_LOOPBK"),
+	/* GPP_T */
+	PINCTRL_PIN(26, "GPPC_T_0"),
+	PINCTRL_PIN(27, "GPPC_T_1"),
+	PINCTRL_PIN(28, "FUSA_DIAGTEST_EN"),
+	PINCTRL_PIN(29, "FUSA_DIAGTEST_MODE"),
+	PINCTRL_PIN(30, "GPPC_T_4"),
+	PINCTRL_PIN(31, "GPPC_T_5"),
+	PINCTRL_PIN(32, "GPPC_T_6"),
+	PINCTRL_PIN(33, "GPPC_T_7"),
+	PINCTRL_PIN(34, "GPPC_T_8"),
+	PINCTRL_PIN(35, "GPPC_T_9"),
+	PINCTRL_PIN(36, "GPPC_T_10"),
+	PINCTRL_PIN(37, "GPPC_T_11"),
+	PINCTRL_PIN(38, "GPPC_T_12"),
+	PINCTRL_PIN(39, "GPPC_T_13"),
+	PINCTRL_PIN(40, "GPPC_T_14"),
+	PINCTRL_PIN(41, "GPPC_T_15"),
+	/* GPP_A */
+	PINCTRL_PIN(42, "ESPI_IO_0"),
+	PINCTRL_PIN(43, "ESPI_IO_1"),
+	PINCTRL_PIN(44, "ESPI_IO_2"),
+	PINCTRL_PIN(45, "ESPI_IO_3"),
+	PINCTRL_PIN(46, "ESPI_CS0B"),
+	PINCTRL_PIN(47, "ESPI_ALERT0B"),
+	PINCTRL_PIN(48, "ESPI_ALERT1B"),
+	PINCTRL_PIN(49, "GPPC_A_7"),
+	PINCTRL_PIN(50, "GPPC_A_8"),
+	PINCTRL_PIN(51, "ESPI_CLK"),
+	PINCTRL_PIN(52, "ESPI_RESETB"),
+	PINCTRL_PIN(53, "GPPC_A_11"),
+	PINCTRL_PIN(54, "GPPC_A_12"),
+	PINCTRL_PIN(55, "GPPC_A_13"),
+	PINCTRL_PIN(56, "GPPC_A_14"),
+	PINCTRL_PIN(57, "GPPC_A_15"),
+	PINCTRL_PIN(58, "GPPC_A_16"),
+	PINCTRL_PIN(59, "GPPC_A_17"),
+	PINCTRL_PIN(60, "GPPC_A_18"),
+	PINCTRL_PIN(61, "GPPC_A_19"),
+	PINCTRL_PIN(62, "GPPC_A_20"),
+	PINCTRL_PIN(63, "GPPC_A_21"),
+	PINCTRL_PIN(64, "GPPC_A_22"),
+	PINCTRL_PIN(65, "ESPI_CS1B"),
+	PINCTRL_PIN(66, "ESPI_CLK_LOOPBK"),
+	/* GPP_S */
+	PINCTRL_PIN(67, "GPP_S_0"),
+	PINCTRL_PIN(68, "GPP_S_1"),
+	PINCTRL_PIN(69, "GPP_S_2"),
+	PINCTRL_PIN(70, "GPP_S_3"),
+	PINCTRL_PIN(71, "GPP_S_4"),
+	PINCTRL_PIN(72, "GPP_S_5"),
+	PINCTRL_PIN(73, "GPP_S_6"),
+	PINCTRL_PIN(74, "GPP_S_7"),
+	/* GPP_I */
+	PINCTRL_PIN(75, "GPP_F_0_CNV_BRI_DT_UART0_RTSB"),
+	PINCTRL_PIN(76, "GPP_F_1_CNV_BRI_RSP_UART0_RXD"),
+	PINCTRL_PIN(77, "GPP_F_2_CNV_RGI_DT_UART0_TXD"),
+	PINCTRL_PIN(78, "GPP_F_3_CNV_RGI_RSP_UART0_CTSB"),
+	PINCTRL_PIN(79, "GPP_F_4_CNV_RF_RESET_B"),
+	PINCTRL_PIN(80, "GPP_F_5_MODEM_CLKREQ"),
+	PINCTRL_PIN(81, "GPP_F_6_CNV_PA_BLANKING"),
+	PINCTRL_PIN(82, "GPP_F_7_EMMC_CMD"),
+	PINCTRL_PIN(83, "GPP_F_8_EMMC_DATA0"),
+	PINCTRL_PIN(84, "GPP_F_9_EMMC_DATA1"),
+	PINCTRL_PIN(85, "GPP_F_10_EMMC_DATA2"),
+	PINCTRL_PIN(86, "GPP_F_11_EMMC_DATA3"),
+	PINCTRL_PIN(87, "GPP_F_12_EMMC_DATA4"),
+	PINCTRL_PIN(88, "GPP_F_13_EMMC_DATA5"),
+	PINCTRL_PIN(89, "GPP_F_14_EMMC_DATA6"),
+	PINCTRL_PIN(90, "GPP_F_15_EMMC_DATA7"),
+	PINCTRL_PIN(91, "GPP_F_16_EMMC_RCLK"),
+	PINCTRL_PIN(92, "GPP_F_17_EMMC_CLK"),
+	PINCTRL_PIN(93, "GPP_F_18_EMMC_RESETB"),
+	PINCTRL_PIN(94, "GPP_F_19_A4WP_PRESENT"),
+	/* GPP_H */
+	PINCTRL_PIN(95, "GPPC_H_0"),
+	PINCTRL_PIN(96, "GPPC_H_1"),
+	PINCTRL_PIN(97, "GPPC_H_2"),
+	PINCTRL_PIN(98, "GPPC_H_3"),
+	PINCTRL_PIN(99, "GPPC_H_4"),
+	PINCTRL_PIN(100, "GPPC_H_5"),
+	PINCTRL_PIN(101, "GPPC_H_6"),
+	PINCTRL_PIN(102, "GPPC_H_7"),
+	PINCTRL_PIN(103, "GPPC_H_8"),
+	PINCTRL_PIN(104, "GPPC_H_9"),
+	PINCTRL_PIN(105, "GPPC_H_10"),
+	PINCTRL_PIN(106, "GPPC_H_11"),
+	PINCTRL_PIN(107, "I2C7_SDA"),
+	PINCTRL_PIN(108, "I2C7_SCL"),
+	PINCTRL_PIN(109, "GPPC_H_14"),
+	PINCTRL_PIN(110, "GPPC_H_15"),
+	PINCTRL_PIN(111, "GPPC_H_16"),
+	PINCTRL_PIN(112, "GPPC_H_17"),
+	PINCTRL_PIN(113, "CPU_C10_GATEB"),
+	PINCTRL_PIN(114, "GPPC_H_19"),
+	PINCTRL_PIN(115, "GPPC_H_20"),
+	PINCTRL_PIN(116, "GPPC_H_21"),
+	PINCTRL_PIN(117, "GPPC_H_22"),
+	PINCTRL_PIN(118, "GPPC_H_23"),
+	/* GPP_D */
+	PINCTRL_PIN(119, "GPPC_D_0"),
+	PINCTRL_PIN(120, "GPPC_D_1"),
+	PINCTRL_PIN(121, "GPPC_D_2"),
+	PINCTRL_PIN(122, "GPPC_D_3"),
+	PINCTRL_PIN(123, "GPPC_D_4"),
+	PINCTRL_PIN(124, "GPPC_D_5"),
+	PINCTRL_PIN(125, "GPPC_D_6"),
+	PINCTRL_PIN(126, "GPPC_D_7"),
+	PINCTRL_PIN(127, "GPPC_D_8"),
+	PINCTRL_PIN(128, "BSSB_LS2_RX"),
+	PINCTRL_PIN(129, "BSSB_LS2_TX"),
+	PINCTRL_PIN(130, "BSSB_LS3_RX"),
+	PINCTRL_PIN(131, "BSSB_LS3_TX"),
+	PINCTRL_PIN(132, "GPPC_D_13"),
+	PINCTRL_PIN(133, "GPPC_D_14"),
+	PINCTRL_PIN(134, "GPPC_D_15"),
+	PINCTRL_PIN(135, "GPPC_D_16"),
+	PINCTRL_PIN(136, "GPPC_D_17"),
+	PINCTRL_PIN(137, "GPPC_D_18"),
+	PINCTRL_PIN(138, "GPPC_D_19"),
+	PINCTRL_PIN(139, "GSPI2_CLK_LOOPBK"),
+	/* vGPIO */
+	PINCTRL_PIN(140, "CNV_BTEN"),
+	PINCTRL_PIN(141, "CNV_BT_HOST_WAKEB"),
+	PINCTRL_PIN(142, "CNV_BT_IF_SELECT"),
+	PINCTRL_PIN(143, "vCNV_BT_UART_TXD"),
+	PINCTRL_PIN(144, "vCNV_BT_UART_RXD"),
+	PINCTRL_PIN(145, "vCNV_BT_UART_CTS_B"),
+	PINCTRL_PIN(146, "vCNV_BT_UART_RTS_B"),
+	PINCTRL_PIN(147, "vCNV_MFUART1_TXD"),
+	PINCTRL_PIN(148, "vCNV_MFUART1_RXD"),
+	PINCTRL_PIN(149, "vCNV_MFUART1_CTS_B"),
+	PINCTRL_PIN(150, "vCNV_MFUART1_RTS_B"),
+	PINCTRL_PIN(151, "vUART0_TXD"),
+	PINCTRL_PIN(152, "vUART0_RXD"),
+	PINCTRL_PIN(153, "vUART0_CTS_B"),
+	PINCTRL_PIN(154, "vUART0_RTS_B"),
+	PINCTRL_PIN(155, "vISH_UART0_TXD"),
+	PINCTRL_PIN(156, "vISH_UART0_RXD"),
+	PINCTRL_PIN(157, "vISH_UART0_CTS_B"),
+	PINCTRL_PIN(158, "vISH_UART0_RTS_B"),
+	PINCTRL_PIN(159, "vCNV_BT_I2S_BCLK"),
+	PINCTRL_PIN(160, "vCNV_BT_I2S_WS_SYNC"),
+	PINCTRL_PIN(161, "vCNV_BT_I2S_SDO"),
+	PINCTRL_PIN(162, "vCNV_BT_I2S_SDI"),
+	PINCTRL_PIN(163, "vI2S2_SCLK"),
+	PINCTRL_PIN(164, "vI2S2_SFRM"),
+	PINCTRL_PIN(165, "vI2S2_TXD"),
+	PINCTRL_PIN(166, "vI2S2_RXD"),
+	PINCTRL_PIN(167, "THC0_WOT_INT"),
+	PINCTRL_PIN(168, "THC1_WOT_INT"),
+	/* GPP_C */
+	PINCTRL_PIN(169, "SMBCLK"),
+	PINCTRL_PIN(170, "SMBDATA"),
+	PINCTRL_PIN(171, "SMBALERTB"),
+	PINCTRL_PIN(172, "SML0CLK"),
+	PINCTRL_PIN(173, "SML0DATA"),
+	PINCTRL_PIN(174, "GPPC_C_5"),
+	PINCTRL_PIN(175, "GPPC_C_6"),
+	PINCTRL_PIN(176, "GPPC_C_7"),
+	PINCTRL_PIN(177, "GPPC_C_8"),
+	PINCTRL_PIN(178, "GPPC_C_9"),
+	PINCTRL_PIN(179, "GPPC_C_10"),
+	PINCTRL_PIN(180, "GPPC_C_11"),
+	PINCTRL_PIN(181, "GPPC_C_12"),
+	PINCTRL_PIN(182, "GPPC_C_13"),
+	PINCTRL_PIN(183, "GPPC_C_14"),
+	PINCTRL_PIN(184, "GPPC_C_15"),
+	PINCTRL_PIN(185, "GPPC_C_16"),
+	PINCTRL_PIN(186, "GPPC_C_17"),
+	PINCTRL_PIN(187, "GPPC_C_18"),
+	PINCTRL_PIN(188, "GPPC_C_19"),
+	PINCTRL_PIN(189, "GPPC_C_20"),
+	PINCTRL_PIN(190, "GPPC_C_21"),
+	PINCTRL_PIN(191, "GPPC_C_22"),
+	PINCTRL_PIN(192, "GPPC_C_23"),
+	/* GPP_F */
+	PINCTRL_PIN(193, "CNV_BRI_DT"),
+	PINCTRL_PIN(194, "CNV_BRI_RSP"),
+	PINCTRL_PIN(195, "CNV_RGI_DT"),
+	PINCTRL_PIN(196, "CNV_RGI_RSP"),
+	PINCTRL_PIN(197, "CNV_RF_RESET_B"),
+	PINCTRL_PIN(198, "MODEM_CLKREQ"),
+	PINCTRL_PIN(199, "GPPC_F_6"),
+	PINCTRL_PIN(200, "GPPC_F_7"),
+	PINCTRL_PIN(201, "GPPC_F_8"),
+	PINCTRL_PIN(202, "BOOTMPC"),
+	PINCTRL_PIN(203, "GPPC_F_10"),
+	PINCTRL_PIN(204, "GPPC_F_11"),
+	PINCTRL_PIN(205, "GPPC_F_12"),
+	PINCTRL_PIN(206, "GPPC_F_13"),
+	PINCTRL_PIN(207, "GPPC_F_14"),
+	PINCTRL_PIN(208, "GPPC_F_15"),
+	PINCTRL_PIN(209, "GPPC_F_16"),
+	PINCTRL_PIN(210, "GPPC_F_17"),
+	PINCTRL_PIN(211, "GPPC_F_18"),
+	PINCTRL_PIN(212, "GPPC_F_19"),
+	PINCTRL_PIN(213, "EXT_PWR_GATEB"),
+	PINCTRL_PIN(214, "EXT_PWR_GATE2B"),
+	PINCTRL_PIN(215, "GPPC_F_22"),
+	PINCTRL_PIN(216, "GPPC_F_23"),
+	PINCTRL_PIN(217, "GPPF_CLK_LOOPBACK"),
+	/* HVCMOS */
+	PINCTRL_PIN(218, "L_BKLTEN"),
+	PINCTRL_PIN(219, "L_BKLTCTL"),
+	PINCTRL_PIN(220, "L_VDDEN"),
+	PINCTRL_PIN(221, "SYS_PWROK"),
+	PINCTRL_PIN(222, "SYS_RESETB"),
+	PINCTRL_PIN(223, "MLK_RSTB"),
+	/* GPP_E */
+	PINCTRL_PIN(224, "GPPC_E_0"),
+	PINCTRL_PIN(225, "GPPC_E_1"),
+	PINCTRL_PIN(226, "GPPC_E_2"),
+	PINCTRL_PIN(227, "GPPC_E_3"),
+	PINCTRL_PIN(228, "GPPC_E_4"),
+	PINCTRL_PIN(229, "GPPC_E_5"),
+	PINCTRL_PIN(230, "GPPC_E_6"),
+	PINCTRL_PIN(231, "GPPC_E_7"),
+	PINCTRL_PIN(232, "GPPC_E_8"),
+	PINCTRL_PIN(233, "GPPC_E_9"),
+	PINCTRL_PIN(234, "GPPC_E_10"),
+	PINCTRL_PIN(235, "GPPC_E_11"),
+	PINCTRL_PIN(236, "GPPC_E_12"),
+	PINCTRL_PIN(237, "GPPC_E_13"),
+	PINCTRL_PIN(238, "GPPC_E_14"),
+	PINCTRL_PIN(239, "FIVR_DIGPB_0"),
+	PINCTRL_PIN(240, "FIVR_DIGPB_1"),
+	PINCTRL_PIN(241, "GPPC_E_17"),
+	PINCTRL_PIN(242, "BSSB_LS0_RX"),
+	PINCTRL_PIN(243, "BSSB_LS0_TX"),
+	PINCTRL_PIN(244, "BSSB_LS1_RX"),
+	PINCTRL_PIN(245, "BSSB_LS1_TX"),
+	PINCTRL_PIN(246, "DNX_FORCE_RELOAD"),
+	PINCTRL_PIN(247, "GPPC_E_23"),
+	PINCTRL_PIN(248, "GPPE_CLK_LOOPBACK"),
+	/* GPP_R */
+	PINCTRL_PIN(249, "HDA_BCLK"),
+	PINCTRL_PIN(250, "HDA_SYNC"),
+	PINCTRL_PIN(251, "HDA_SDO"),
+	PINCTRL_PIN(252, "HDA_SDI_0"),
+	PINCTRL_PIN(253, "HDA_RSTB"),
+	PINCTRL_PIN(254, "GPP_R_5"),
+	PINCTRL_PIN(255, "GPP_R_6"),
+	PINCTRL_PIN(256, "GPP_R_7"),
+};
+
+static const struct intel_padgroup adln_community0_gpps[] = {
+	ADL_GPP(0, 0, 25, 0),				/* GPP_B */
+	ADL_GPP(1, 26, 41, 32),				/* GPP_T */
+	ADL_GPP(2, 42, 66, 64),				/* GPP_A */
+};
+
+static const struct intel_padgroup adln_community1_gpps[] = {
+	ADL_GPP(0, 67, 74, 96),				/* GPP_S */
+	ADL_GPP(1, 75, 94, 128),			/* GPP_I */
+	ADL_GPP(2, 95, 118, 160),			/* GPP_H */
+	ADL_GPP(3, 119, 139, 192),			/* GPP_D */
+	ADL_GPP(4, 140, 168, 224),			/* vGPIO */
+};
+
+static const struct intel_padgroup adln_community4_gpps[] = {
+	ADL_GPP(0, 169, 192, 256),			/* GPP_C */
+	ADL_GPP(1, 193, 217, 288),			/* GPP_F */
+	ADL_GPP(2, 218, 223, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	ADL_GPP(3, 224, 248, 320),			/* GPP_E */
+};
+
+static const struct intel_padgroup adln_community5_gpps[] = {
+	ADL_GPP(0, 249, 256, 352),			/* GPP_R */
+};
+
+static const struct intel_community adln_communities[] = {
+	ADL_COMMUNITY(0, 0, 66, adln_community0_gpps),
+	ADL_COMMUNITY(1, 67, 168, adln_community1_gpps),
+	ADL_COMMUNITY(2, 169, 248, adln_community4_gpps),
+	ADL_COMMUNITY(3, 249, 256, adln_community5_gpps),
+};
+
+static const struct intel_pinctrl_soc_data adln_soc_data = {
+	.pins = adln_pins,
+	.npins = ARRAY_SIZE(adln_pins),
+	.communities = adln_communities,
+	.ncommunities = ARRAY_SIZE(adln_communities),
+};
+
 /* Alder Lake-S */
 static const struct pinctrl_pin_desc adls_pins[] = {
 	/* GPP_I */
@@ -416,6 +729,7 @@ static const struct intel_pinctrl_soc_data adls_soc_data = {
 
 static const struct acpi_device_id adl_pinctrl_acpi_match[] = {
 	{ "INTC1056", (kernel_ulong_t)&adls_soc_data },
+	{ "INTC1057", (kernel_ulong_t)&adln_soc_data },
 	{ "INTC1085", (kernel_ulong_t)&adls_soc_data },
 	{ }
 };
-- 
2.34.1

