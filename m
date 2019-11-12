Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA34F94DB
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 16:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfKLP5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 10:57:25 -0500
Received: from mga12.intel.com ([192.55.52.136]:64016 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbfKLP5Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Nov 2019 10:57:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 07:57:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="287583262"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Nov 2019 07:57:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2C2AFFD; Tue, 12 Nov 2019 17:57:22 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: baytrail: Update North Community pin list
Date:   Tue, 12 Nov 2019 17:57:21 +0200
Message-Id: <20191112155721.3760-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update North Community pin list to be more clear about pin functions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 56 ++++++++++++------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index cf19a0e28c1c..80cdb976a134 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -483,34 +483,34 @@ static const struct intel_pinctrl_soc_data byt_sus_soc_data = {
 };
 
 static const struct pinctrl_pin_desc byt_ncore_pins[] = {
-	PINCTRL_PIN(0, "GPIO_NCORE0"),
-	PINCTRL_PIN(1, "GPIO_NCORE1"),
-	PINCTRL_PIN(2, "GPIO_NCORE2"),
-	PINCTRL_PIN(3, "GPIO_NCORE3"),
-	PINCTRL_PIN(4, "GPIO_NCORE4"),
-	PINCTRL_PIN(5, "GPIO_NCORE5"),
-	PINCTRL_PIN(6, "GPIO_NCORE6"),
-	PINCTRL_PIN(7, "GPIO_NCORE7"),
-	PINCTRL_PIN(8, "GPIO_NCORE8"),
-	PINCTRL_PIN(9, "GPIO_NCORE9"),
-	PINCTRL_PIN(10, "GPIO_NCORE10"),
-	PINCTRL_PIN(11, "GPIO_NCORE11"),
-	PINCTRL_PIN(12, "GPIO_NCORE12"),
-	PINCTRL_PIN(13, "GPIO_NCORE13"),
-	PINCTRL_PIN(14, "GPIO_NCORE14"),
-	PINCTRL_PIN(15, "GPIO_NCORE15"),
-	PINCTRL_PIN(16, "GPIO_NCORE16"),
-	PINCTRL_PIN(17, "GPIO_NCORE17"),
-	PINCTRL_PIN(18, "GPIO_NCORE18"),
-	PINCTRL_PIN(19, "GPIO_NCORE19"),
-	PINCTRL_PIN(20, "GPIO_NCORE20"),
-	PINCTRL_PIN(21, "GPIO_NCORE21"),
-	PINCTRL_PIN(22, "GPIO_NCORE22"),
-	PINCTRL_PIN(23, "GPIO_NCORE23"),
-	PINCTRL_PIN(24, "GPIO_NCORE24"),
-	PINCTRL_PIN(25, "GPIO_NCORE25"),
-	PINCTRL_PIN(26, "GPIO_NCORE26"),
-	PINCTRL_PIN(27, "GPIO_NCORE27"),
+	PINCTRL_PIN(0, "HV_DDI0_HPD"),
+	PINCTRL_PIN(1, "HV_DDI0_DDC_SDA"),
+	PINCTRL_PIN(2, "HV_DDI0_DDC_SCL"),
+	PINCTRL_PIN(3, "PANEL0_VDDEN"),
+	PINCTRL_PIN(4, "PANEL0_BKLTEN"),
+	PINCTRL_PIN(5, "PANEL0_BKLTCTL"),
+	PINCTRL_PIN(6, "HV_DDI1_HPD"),
+	PINCTRL_PIN(7, "HV_DDI1_DDC_SDA"),
+	PINCTRL_PIN(8, "HV_DDI1_DDC_SCL"),
+	PINCTRL_PIN(9, "PANEL1_VDDEN"),
+	PINCTRL_PIN(10, "PANEL1_BKLTEN"),
+	PINCTRL_PIN(11, "PANEL1_BKLTCTL"),
+	PINCTRL_PIN(12, "GP_INTD_DSI_TE1"),
+	PINCTRL_PIN(13, "HV_DDI2_DDC_SDA"),
+	PINCTRL_PIN(14, "HV_DDI2_DDC_SCL"),
+	PINCTRL_PIN(15, "GP_CAMERASB00"),
+	PINCTRL_PIN(16, "GP_CAMERASB01"),
+	PINCTRL_PIN(17, "GP_CAMERASB02"),
+	PINCTRL_PIN(18, "GP_CAMERASB03"),
+	PINCTRL_PIN(19, "GP_CAMERASB04"),
+	PINCTRL_PIN(20, "GP_CAMERASB05"),
+	PINCTRL_PIN(21, "GP_CAMERASB06"),
+	PINCTRL_PIN(22, "GP_CAMERASB07"),
+	PINCTRL_PIN(23, "GP_CAMERASB08"),
+	PINCTRL_PIN(24, "GP_CAMERASB09"),
+	PINCTRL_PIN(25, "GP_CAMERASB10"),
+	PINCTRL_PIN(26, "GP_CAMERASB11"),
+	PINCTRL_PIN(27, "GP_INTD_DSI_TE2"),
 };
 
 static const unsigned int byt_ncore_pins_map[BYT_NGPIO_NCORE] = {
-- 
2.24.0

