Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818901A6B05
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 19:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732550AbgDMRJY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 13:09:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:29256 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728949AbgDMLSa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 07:18:30 -0400
IronPort-SDR: A0c/Cq+X5r0ARpmId10dOmBRakVFXdBsi5JB3TdXm3Umr31F3KJ78zU/FgbQdal8/PCQL4dzWM
 5u7rFHtkyEAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:18:29 -0700
IronPort-SDR: l3Z2FHNWep21kq7Apd0ZE8q0Bs1kBcdZtqpyEi1BsCL7hdEI/gYHLbcYQmC+k8p4IKSYVQUWCV
 nh4Uuir0X4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="245118563"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2020 04:18:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 68C151A5; Mon, 13 Apr 2020 14:18:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 4/6] pinctrl: tigerlake: Use generic flag for special GPIO base treatment
Date:   Mon, 13 Apr 2020 14:18:23 +0300
Message-Id: <20200413111825.89866-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have a generic flag for special GPIO base treatment,
use it in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 08a86f6fdea6..bcfd7548e282 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -21,8 +21,6 @@
 #define TGL_GPI_IS	0x100
 #define TGL_GPI_IE	0x120
 
-#define TGL_NO_GPIO	-1
-
 #define TGL_GPP(r, s, e, g)				\
 	{						\
 		.reg_num = (r),				\
@@ -342,30 +340,30 @@ static const struct pinctrl_pin_desc tgllp_pins[] = {
 };
 
 static const struct intel_padgroup tgllp_community0_gpps[] = {
-	TGL_GPP(0, 0, 25, 0),			/* GPP_B */
-	TGL_GPP(1, 26, 41, 32),			/* GPP_T */
-	TGL_GPP(2, 42, 66, 64),			/* GPP_A */
+	TGL_GPP(0, 0, 25, 0),				/* GPP_B */
+	TGL_GPP(1, 26, 41, 32),				/* GPP_T */
+	TGL_GPP(2, 42, 66, 64),				/* GPP_A */
 };
 
 static const struct intel_padgroup tgllp_community1_gpps[] = {
-	TGL_GPP(0, 67, 74, 96),			/* GPP_S */
-	TGL_GPP(1, 75, 98, 128),		/* GPP_H */
-	TGL_GPP(2, 99, 119, 160),		/* GPP_D */
-	TGL_GPP(3, 120, 143, 192),		/* GPP_U */
-	TGL_GPP(4, 144, 170, 224),		/* vGPIO */
+	TGL_GPP(0, 67, 74, 96),				/* GPP_S */
+	TGL_GPP(1, 75, 98, 128),			/* GPP_H */
+	TGL_GPP(2, 99, 119, 160),			/* GPP_D */
+	TGL_GPP(3, 120, 143, 192),			/* GPP_U */
+	TGL_GPP(4, 144, 170, 224),			/* vGPIO */
 };
 
 static const struct intel_padgroup tgllp_community4_gpps[] = {
-	TGL_GPP(0, 171, 194, 256),		/* GPP_C */
-	TGL_GPP(1, 195, 219, 288),		/* GPP_F */
-	TGL_GPP(2, 220, 225, TGL_NO_GPIO),	/* HVCMOS */
-	TGL_GPP(3, 226, 250, 320),		/* GPP_E */
-	TGL_GPP(4, 251, 259, TGL_NO_GPIO),	/* JTAG */
+	TGL_GPP(0, 171, 194, 256),			/* GPP_C */
+	TGL_GPP(1, 195, 219, 288),			/* GPP_F */
+	TGL_GPP(2, 220, 225, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	TGL_GPP(3, 226, 250, 320),			/* GPP_E */
+	TGL_GPP(4, 251, 259, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
 static const struct intel_padgroup tgllp_community5_gpps[] = {
-	TGL_GPP(0, 260, 267, 352),		/* GPP_R */
-	TGL_GPP(1, 268, 276, TGL_NO_GPIO),	/* SPI */
+	TGL_GPP(0, 260, 267, 352),			/* GPP_R */
+	TGL_GPP(1, 268, 276, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_community tgllp_communities[] = {
-- 
2.25.1

