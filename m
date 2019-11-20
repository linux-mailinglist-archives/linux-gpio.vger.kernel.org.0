Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E27103BC5
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbfKTNhn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:37:43 -0500
Received: from mga07.intel.com ([134.134.136.100]:44112 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729917AbfKTNhm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 08:37:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 05:37:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="357435827"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2019 05:37:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 259DA236; Wed, 20 Nov 2019 15:37:40 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: lewisburg: Update pin list according to v1.1v6
Date:   Wed, 20 Nov 2019 15:37:39 +0200
Message-Id: <20191120133739.54332-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Version 1.1v6 of pin list has some changes in pin names for Intel Lewisburg.

Update the driver accordingly.

Note, it reveals the bug in the driver that misses two pins in GPP_L and
has rather two extra ones. That's why the ordering of some groups is changed.

Fixes: e480b745386e ("pinctrl: intel: Add Intel Lewisburg GPIO support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-lewisburg.c | 171 +++++++++++-----------
 1 file changed, 86 insertions(+), 85 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
index 2e06fb1464ab..7fdf4257df1e 100644
--- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
+++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
@@ -33,6 +33,7 @@
 		.npins = ((e) - (s) + 1),		\
 	}
 
+/* Lewisburg */
 static const struct pinctrl_pin_desc lbg_pins[] = {
 	/* GPP_A */
 	PINCTRL_PIN(0, "RCINB"),
@@ -72,7 +73,7 @@ static const struct pinctrl_pin_desc lbg_pins[] = {
 	PINCTRL_PIN(33, "SRCCLKREQB_4"),
 	PINCTRL_PIN(34, "SRCCLKREQB_5"),
 	PINCTRL_PIN(35, "GPP_B_11"),
-	PINCTRL_PIN(36, "GLB_RST_WARN_N"),
+	PINCTRL_PIN(36, "SLP_S0B"),
 	PINCTRL_PIN(37, "PLTRSTB"),
 	PINCTRL_PIN(38, "SPKR"),
 	PINCTRL_PIN(39, "GPP_B_15"),
@@ -185,96 +186,96 @@ static const struct pinctrl_pin_desc lbg_pins[] = {
 	PINCTRL_PIN(141, "GBE_PCI_DIS"),
 	PINCTRL_PIN(142, "GBE_LAN_DIS"),
 	PINCTRL_PIN(143, "GPP_I_10"),
-	PINCTRL_PIN(144, "GPIO_RCOMP_3P3"),
 	/* GPP_J */
-	PINCTRL_PIN(145, "GBE_LED_0_0"),
-	PINCTRL_PIN(146, "GBE_LED_0_1"),
-	PINCTRL_PIN(147, "GBE_LED_1_0"),
-	PINCTRL_PIN(148, "GBE_LED_1_1"),
-	PINCTRL_PIN(149, "GBE_LED_2_0"),
-	PINCTRL_PIN(150, "GBE_LED_2_1"),
-	PINCTRL_PIN(151, "GBE_LED_3_0"),
-	PINCTRL_PIN(152, "GBE_LED_3_1"),
-	PINCTRL_PIN(153, "GBE_SCL_0"),
-	PINCTRL_PIN(154, "GBE_SDA_0"),
-	PINCTRL_PIN(155, "GBE_SCL_1"),
-	PINCTRL_PIN(156, "GBE_SDA_1"),
-	PINCTRL_PIN(157, "GBE_SCL_2"),
-	PINCTRL_PIN(158, "GBE_SDA_2"),
-	PINCTRL_PIN(159, "GBE_SCL_3"),
-	PINCTRL_PIN(160, "GBE_SDA_3"),
-	PINCTRL_PIN(161, "GBE_SDP_0_0"),
-	PINCTRL_PIN(162, "GBE_SDP_0_1"),
-	PINCTRL_PIN(163, "GBE_SDP_1_0"),
-	PINCTRL_PIN(164, "GBE_SDP_1_1"),
-	PINCTRL_PIN(165, "GBE_SDP_2_0"),
-	PINCTRL_PIN(166, "GBE_SDP_2_1"),
-	PINCTRL_PIN(167, "GBE_SDP_3_0"),
-	PINCTRL_PIN(168, "GBE_SDP_3_1"),
+	PINCTRL_PIN(144, "GBE_LED_0_0"),
+	PINCTRL_PIN(145, "GBE_LED_0_1"),
+	PINCTRL_PIN(146, "GBE_LED_1_0"),
+	PINCTRL_PIN(147, "GBE_LED_1_1"),
+	PINCTRL_PIN(148, "GBE_LED_2_0"),
+	PINCTRL_PIN(149, "GBE_LED_2_1"),
+	PINCTRL_PIN(150, "GBE_LED_3_0"),
+	PINCTRL_PIN(151, "GBE_LED_3_1"),
+	PINCTRL_PIN(152, "GBE_SCL_0"),
+	PINCTRL_PIN(153, "GBE_SDA_0"),
+	PINCTRL_PIN(154, "GBE_SCL_1"),
+	PINCTRL_PIN(155, "GBE_SDA_1"),
+	PINCTRL_PIN(156, "GBE_SCL_2"),
+	PINCTRL_PIN(157, "GBE_SDA_2"),
+	PINCTRL_PIN(158, "GBE_SCL_3"),
+	PINCTRL_PIN(159, "GBE_SDA_3"),
+	PINCTRL_PIN(160, "GBE_SDP_0_0"),
+	PINCTRL_PIN(161, "GBE_SDP_0_1"),
+	PINCTRL_PIN(162, "GBE_SDP_1_0"),
+	PINCTRL_PIN(163, "GBE_SDP_1_1"),
+	PINCTRL_PIN(164, "GBE_SDP_2_0"),
+	PINCTRL_PIN(165, "GBE_SDP_2_1"),
+	PINCTRL_PIN(166, "GBE_SDP_3_0"),
+	PINCTRL_PIN(167, "GBE_SDP_3_1"),
 	/* GPP_K */
-	PINCTRL_PIN(169, "GBE_RMIICLK"),
-	PINCTRL_PIN(170, "GBE_RMII_TXD_0"),
-	PINCTRL_PIN(171, "GBE_RMII_TXD_1"),
+	PINCTRL_PIN(168, "GBE_RMIICLK"),
+	PINCTRL_PIN(169, "GBE_RMII_RXD_0"),
+	PINCTRL_PIN(170, "GBE_RMII_RXD_1"),
+	PINCTRL_PIN(171, "GBE_RMII_CRS_DV"),
 	PINCTRL_PIN(172, "GBE_RMII_TX_EN"),
-	PINCTRL_PIN(173, "GBE_RMII_CRS_DV"),
-	PINCTRL_PIN(174, "GBE_RMII_RXD_0"),
-	PINCTRL_PIN(175, "GBE_RMII_RXD_1"),
-	PINCTRL_PIN(176, "GBE_RMII_RX_ER"),
-	PINCTRL_PIN(177, "GBE_RMII_ARBIN"),
-	PINCTRL_PIN(178, "GBE_RMII_ARB_OUT"),
-	PINCTRL_PIN(179, "PE_RST_N"),
-	PINCTRL_PIN(180, "GPIO_RCOMP_1P8_3P3"),
+	PINCTRL_PIN(173, "GBE_RMII_TXD_0"),
+	PINCTRL_PIN(174, "GBE_RMII_TXD_1"),
+	PINCTRL_PIN(175, "GBE_RMII_RX_ER"),
+	PINCTRL_PIN(176, "GBE_RMII_ARBIN"),
+	PINCTRL_PIN(177, "GBE_RMII_ARB_OUT"),
+	PINCTRL_PIN(178, "PE_RST_N"),
 	/* GPP_G */
-	PINCTRL_PIN(181, "FAN_TACH_0"),
-	PINCTRL_PIN(182, "FAN_TACH_1"),
-	PINCTRL_PIN(183, "FAN_TACH_2"),
-	PINCTRL_PIN(184, "FAN_TACH_3"),
-	PINCTRL_PIN(185, "FAN_TACH_4"),
-	PINCTRL_PIN(186, "FAN_TACH_5"),
-	PINCTRL_PIN(187, "FAN_TACH_6"),
-	PINCTRL_PIN(188, "FAN_TACH_7"),
-	PINCTRL_PIN(189, "FAN_PWM_0"),
-	PINCTRL_PIN(190, "FAN_PWM_1"),
-	PINCTRL_PIN(191, "FAN_PWM_2"),
-	PINCTRL_PIN(192, "FAN_PWM_3"),
-	PINCTRL_PIN(193, "GSXDOUT"),
-	PINCTRL_PIN(194, "GSXSLOAD"),
-	PINCTRL_PIN(195, "GSXDIN"),
-	PINCTRL_PIN(196, "GSXSRESETB"),
-	PINCTRL_PIN(197, "GSXCLK"),
-	PINCTRL_PIN(198, "ADR_COMPLETE"),
-	PINCTRL_PIN(199, "NMIB"),
-	PINCTRL_PIN(200, "SMIB"),
-	PINCTRL_PIN(201, "SSATA_DEVSLP_0"),
-	PINCTRL_PIN(202, "SSATA_DEVSLP_1"),
-	PINCTRL_PIN(203, "SSATA_DEVSLP_2"),
-	PINCTRL_PIN(204, "SSATAXPCIE0_SSATAGP0"),
+	PINCTRL_PIN(179, "FAN_TACH_0"),
+	PINCTRL_PIN(180, "FAN_TACH_1"),
+	PINCTRL_PIN(181, "FAN_TACH_2"),
+	PINCTRL_PIN(182, "FAN_TACH_3"),
+	PINCTRL_PIN(183, "FAN_TACH_4"),
+	PINCTRL_PIN(184, "FAN_TACH_5"),
+	PINCTRL_PIN(185, "FAN_TACH_6"),
+	PINCTRL_PIN(186, "FAN_TACH_7"),
+	PINCTRL_PIN(187, "FAN_PWM_0"),
+	PINCTRL_PIN(188, "FAN_PWM_1"),
+	PINCTRL_PIN(189, "FAN_PWM_2"),
+	PINCTRL_PIN(190, "FAN_PWM_3"),
+	PINCTRL_PIN(191, "GSXDOUT"),
+	PINCTRL_PIN(192, "GSXSLOAD"),
+	PINCTRL_PIN(193, "GSXDIN"),
+	PINCTRL_PIN(194, "GSXSRESETB"),
+	PINCTRL_PIN(195, "GSXCLK"),
+	PINCTRL_PIN(196, "ADR_COMPLETE"),
+	PINCTRL_PIN(197, "NMIB"),
+	PINCTRL_PIN(198, "SMIB"),
+	PINCTRL_PIN(199, "SSATA_DEVSLP_0"),
+	PINCTRL_PIN(200, "SSATA_DEVSLP_1"),
+	PINCTRL_PIN(201, "SSATA_DEVSLP_2"),
+	PINCTRL_PIN(202, "SSATAXPCIE0_SSATAGP0"),
 	/* GPP_H */
-	PINCTRL_PIN(205, "SRCCLKREQB_6"),
-	PINCTRL_PIN(206, "SRCCLKREQB_7"),
-	PINCTRL_PIN(207, "SRCCLKREQB_8"),
-	PINCTRL_PIN(208, "SRCCLKREQB_9"),
-	PINCTRL_PIN(209, "SRCCLKREQB_10"),
-	PINCTRL_PIN(210, "SRCCLKREQB_11"),
-	PINCTRL_PIN(211, "SRCCLKREQB_12"),
-	PINCTRL_PIN(212, "SRCCLKREQB_13"),
-	PINCTRL_PIN(213, "SRCCLKREQB_14"),
-	PINCTRL_PIN(214, "SRCCLKREQB_15"),
-	PINCTRL_PIN(215, "SML2CLK"),
-	PINCTRL_PIN(216, "SML2DATA"),
-	PINCTRL_PIN(217, "SML2ALERTB"),
-	PINCTRL_PIN(218, "SML3CLK"),
-	PINCTRL_PIN(219, "SML3DATA"),
-	PINCTRL_PIN(220, "SML3ALERTB"),
-	PINCTRL_PIN(221, "SML4CLK"),
-	PINCTRL_PIN(222, "SML4DATA"),
-	PINCTRL_PIN(223, "SML4ALERTB"),
-	PINCTRL_PIN(224, "SSATAXPCIE1_SSATAGP1"),
-	PINCTRL_PIN(225, "SSATAXPCIE2_SSATAGP2"),
-	PINCTRL_PIN(226, "SSATAXPCIE3_SSATAGP3"),
-	PINCTRL_PIN(227, "SSATAXPCIE4_SSATAGP4"),
-	PINCTRL_PIN(228, "SSATAXPCIE5_SSATAGP5"),
+	PINCTRL_PIN(203, "SRCCLKREQB_6"),
+	PINCTRL_PIN(204, "SRCCLKREQB_7"),
+	PINCTRL_PIN(205, "SRCCLKREQB_8"),
+	PINCTRL_PIN(206, "SRCCLKREQB_9"),
+	PINCTRL_PIN(207, "SRCCLKREQB_10"),
+	PINCTRL_PIN(208, "SRCCLKREQB_11"),
+	PINCTRL_PIN(209, "SRCCLKREQB_12"),
+	PINCTRL_PIN(210, "SRCCLKREQB_13"),
+	PINCTRL_PIN(211, "SRCCLKREQB_14"),
+	PINCTRL_PIN(212, "SRCCLKREQB_15"),
+	PINCTRL_PIN(213, "SML2CLK"),
+	PINCTRL_PIN(214, "SML2DATA"),
+	PINCTRL_PIN(215, "SML2ALERTB"),
+	PINCTRL_PIN(216, "SML3CLK"),
+	PINCTRL_PIN(217, "SML3DATA"),
+	PINCTRL_PIN(218, "SML3ALERTB"),
+	PINCTRL_PIN(219, "SML4CLK"),
+	PINCTRL_PIN(220, "SML4DATA"),
+	PINCTRL_PIN(221, "SML4ALERTB"),
+	PINCTRL_PIN(222, "SSATAXPCIE1_SSATAGP1"),
+	PINCTRL_PIN(223, "SSATAXPCIE2_SSATAGP2"),
+	PINCTRL_PIN(224, "SSATAXPCIE3_SSATAGP3"),
+	PINCTRL_PIN(225, "SSATAXPCIE4_SSATAGP4"),
+	PINCTRL_PIN(226, "SSATAXPCIE5_SSATAGP5"),
 	/* GPP_L */
+	PINCTRL_PIN(227, "GPP_L_0"),
+	PINCTRL_PIN(228, "EC_CSME_INTR_OUT"),
 	PINCTRL_PIN(229, "VISA2CH0_D0"),
 	PINCTRL_PIN(230, "VISA2CH0_D1"),
 	PINCTRL_PIN(231, "VISA2CH0_D2"),
-- 
2.24.0

