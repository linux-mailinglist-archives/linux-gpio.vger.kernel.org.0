Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEF37C3CC
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388322AbfGaNkF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:40:05 -0400
Received: from mga06.intel.com ([134.134.136.31]:52879 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387612AbfGaNkF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Jul 2019 09:40:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Jul 2019 06:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; 
   d="scan'208";a="347540086"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 31 Jul 2019 06:40:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 359033C0; Wed, 31 Jul 2019 16:39:59 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: denverton: Update pin names according to v1.08
Date:   Wed, 31 Jul 2019 16:39:58 +0300
Message-Id: <20190731133958.51263-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Version 1.08 of pin list has some changes in pin names for Intel Denverton.

Update the driver accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-denverton.c | 49 ++++++++++++-----------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 3a4932b557b4..ae59f9d84507 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -39,6 +39,7 @@
 		.ngpps = ARRAY_SIZE(g),			\
 	}
 
+/* Denverton */
 static const struct pinctrl_pin_desc dnv_pins[] = {
 	/* North ALL */
 	PINCTRL_PIN(0, "GBE0_SDP0"),
@@ -59,7 +60,7 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(15, "NCSI_CLK_IN"),
 	PINCTRL_PIN(16, "NCSI_RXD1"),
 	PINCTRL_PIN(17, "NCSI_CRS_DV"),
-	PINCTRL_PIN(18, "NCSI_ARB_IN"),
+	PINCTRL_PIN(18, "IDSLDO_VID_TICKLE"),
 	PINCTRL_PIN(19, "NCSI_TX_EN"),
 	PINCTRL_PIN(20, "NCSI_TXD0"),
 	PINCTRL_PIN(21, "NCSI_TXD1"),
@@ -68,14 +69,14 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(24, "GBE0_LED1"),
 	PINCTRL_PIN(25, "GBE1_LED0"),
 	PINCTRL_PIN(26, "GBE1_LED1"),
-	PINCTRL_PIN(27, "GPIO_0"),
+	PINCTRL_PIN(27, "SPARE_0"),
 	PINCTRL_PIN(28, "PCIE_CLKREQ0_N"),
 	PINCTRL_PIN(29, "PCIE_CLKREQ1_N"),
 	PINCTRL_PIN(30, "PCIE_CLKREQ2_N"),
 	PINCTRL_PIN(31, "PCIE_CLKREQ3_N"),
 	PINCTRL_PIN(32, "PCIE_CLKREQ4_N"),
-	PINCTRL_PIN(33, "GPIO_1"),
-	PINCTRL_PIN(34, "GPIO_2"),
+	PINCTRL_PIN(33, "GBE_MDC"),
+	PINCTRL_PIN(34, "GBE_MDIO"),
 	PINCTRL_PIN(35, "SVID_ALERT_N"),
 	PINCTRL_PIN(36, "SVID_DATA"),
 	PINCTRL_PIN(37, "SVID_CLK"),
@@ -102,15 +103,15 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(57, "DFX_PORT14"),
 	PINCTRL_PIN(58, "DFX_PORT15"),
 	/* South GPP0 */
-	PINCTRL_PIN(59, "GPIO_12"),
-	PINCTRL_PIN(60, "SMB5_GBE_ALRT_N"),
+	PINCTRL_PIN(59, "SPI_TPM_CS_N"),
+	PINCTRL_PIN(60, "UART2_CTS"),
 	PINCTRL_PIN(61, "PCIE_CLKREQ5_N"),
 	PINCTRL_PIN(62, "PCIE_CLKREQ6_N"),
 	PINCTRL_PIN(63, "PCIE_CLKREQ7_N"),
 	PINCTRL_PIN(64, "UART0_RXD"),
 	PINCTRL_PIN(65, "UART0_TXD"),
-	PINCTRL_PIN(66, "SMB5_GBE_CLK"),
-	PINCTRL_PIN(67, "SMB5_GBE_DATA"),
+	PINCTRL_PIN(66, "CPU_RESET_N"),
+	PINCTRL_PIN(67, "NMI"),
 	PINCTRL_PIN(68, "ERROR2_N"),
 	PINCTRL_PIN(69, "ERROR1_N"),
 	PINCTRL_PIN(70, "ERROR0_N"),
@@ -129,20 +130,20 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(83, "USB_OC0_N"),
 	PINCTRL_PIN(84, "FLEX_CLK_SE0"),
 	PINCTRL_PIN(85, "FLEX_CLK_SE1"),
-	PINCTRL_PIN(86, "GPIO_4"),
-	PINCTRL_PIN(87, "GPIO_5"),
-	PINCTRL_PIN(88, "GPIO_6"),
-	PINCTRL_PIN(89, "GPIO_7"),
+	PINCTRL_PIN(86, "SPARE_4"),
+	PINCTRL_PIN(87, "SMB3_IE0_CLK"),
+	PINCTRL_PIN(88, "SMB3_IE0_DATA"),
+	PINCTRL_PIN(89, "SMB3_IE0_ALRT_N"),
 	PINCTRL_PIN(90, "SATA0_LED_N"),
 	PINCTRL_PIN(91, "SATA1_LED_N"),
 	PINCTRL_PIN(92, "SATA_PDETECT0"),
 	PINCTRL_PIN(93, "SATA_PDETECT1"),
-	PINCTRL_PIN(94, "SATA0_SDOUT"),
-	PINCTRL_PIN(95, "SATA1_SDOUT"),
+	PINCTRL_PIN(94, "UART1_RTS"),
+	PINCTRL_PIN(95, "UART1_CTS"),
 	PINCTRL_PIN(96, "UART1_RXD"),
 	PINCTRL_PIN(97, "UART1_TXD"),
-	PINCTRL_PIN(98, "GPIO_8"),
-	PINCTRL_PIN(99, "GPIO_9"),
+	PINCTRL_PIN(98, "SPARE_8"),
+	PINCTRL_PIN(99, "SPARE_9"),
 	PINCTRL_PIN(100, "TCK"),
 	PINCTRL_PIN(101, "TRST_N"),
 	PINCTRL_PIN(102, "TMS"),
@@ -150,11 +151,11 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(104, "TDO"),
 	PINCTRL_PIN(105, "CX_PRDY_N"),
 	PINCTRL_PIN(106, "CX_PREQ_N"),
-	PINCTRL_PIN(107, "CTBTRIGINOUT"),
-	PINCTRL_PIN(108, "CTBTRIGOUT"),
-	PINCTRL_PIN(109, "DFX_SPARE2"),
-	PINCTRL_PIN(110, "DFX_SPARE3"),
-	PINCTRL_PIN(111, "DFX_SPARE4"),
+	PINCTRL_PIN(107, "TAP1_TCK"),
+	PINCTRL_PIN(108, "TAP1_TRST_N"),
+	PINCTRL_PIN(109, "TAP1_TMS"),
+	PINCTRL_PIN(110, "TAP1_TDI"),
+	PINCTRL_PIN(111, "TAP1_TDO"),
 	/* South GPP1 */
 	PINCTRL_PIN(112, "SUSPWRDNACK"),
 	PINCTRL_PIN(113, "PMU_SUSCLK"),
@@ -183,8 +184,8 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(136, "ESPI_CLK"),
 	PINCTRL_PIN(137, "ESPI_RST_N"),
 	PINCTRL_PIN(138, "ESPI_ALRT0_N"),
-	PINCTRL_PIN(139, "GPIO_10"),
-	PINCTRL_PIN(140, "GPIO_11"),
+	PINCTRL_PIN(139, "ESPI_CS1_N"),
+	PINCTRL_PIN(140, "ESPI_ALRT1_N"),
 	PINCTRL_PIN(141, "ESPI_CLK_LOOPBK"),
 	PINCTRL_PIN(142, "EMMC_CMD"),
 	PINCTRL_PIN(143, "EMMC_STROBE"),
@@ -197,7 +198,7 @@ static const struct pinctrl_pin_desc dnv_pins[] = {
 	PINCTRL_PIN(150, "EMMC_D5"),
 	PINCTRL_PIN(151, "EMMC_D6"),
 	PINCTRL_PIN(152, "EMMC_D7"),
-	PINCTRL_PIN(153, "GPIO_3"),
+	PINCTRL_PIN(153, "SPARE_3"),
 };
 
 static const unsigned int dnv_uart0_pins[] = { 60, 61, 64, 65 };
-- 
2.20.1

