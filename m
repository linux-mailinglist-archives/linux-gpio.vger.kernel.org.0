Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F141A658E
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 13:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgDMLSb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 07:18:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:49288 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728947AbgDMLSb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 07:18:31 -0400
IronPort-SDR: VyXra71rZnIdHjjm+Lh4kdfy+zN+F/DzFycuPHZ9jVUwieFu735E8UYHjLCMDgBHR4n4NmexjE
 5cZjA/29XcGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:18:29 -0700
IronPort-SDR: S4g+teC9sTnXUr61VjblMQqa4QcXuqnC8p87Zj8jZ6ExfTb2o1kXYg9g6QhsCxlKzHCQI07Yxr
 CrLSMpM3xEqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="241635278"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 13 Apr 2020 04:18:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4B50495; Mon, 13 Apr 2020 14:18:27 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/6] pinctrl: cannonlake: Use generic flag for special GPIO base treatment
Date:   Mon, 13 Apr 2020 14:18:21 +0300
Message-Id: <20200413111825.89866-2-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cannonlake.c | 58 +++++++++++-----------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index f51b27bbf9f1..515f57a0d180 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -30,8 +30,6 @@
 		.gpio_base = (g),			\
 	}
 
-#define CNL_NO_GPIO	-1
-
 #define CNL_COMMUNITY(b, s, e, o, g)			\
 	{						\
 		.barno = (b),				\
@@ -377,27 +375,27 @@ static const struct intel_padgroup cnlh_community0_gpps[] = {
 };
 
 static const struct intel_padgroup cnlh_community1_gpps[] = {
-	CNL_GPP(0, 51, 74, 64),			/* GPP_C */
-	CNL_GPP(1, 75, 98, 96),			/* GPP_D */
-	CNL_GPP(2, 99, 106, 128),		/* GPP_G */
-	CNL_GPP(3, 107, 114, CNL_NO_GPIO),	/* AZA */
-	CNL_GPP(4, 115, 146, 160),		/* vGPIO_0 */
-	CNL_GPP(5, 147, 154, CNL_NO_GPIO),	/* vGPIO_1 */
+	CNL_GPP(0, 51, 74, 64),				/* GPP_C */
+	CNL_GPP(1, 75, 98, 96),				/* GPP_D */
+	CNL_GPP(2, 99, 106, 128),			/* GPP_G */
+	CNL_GPP(3, 107, 114, INTEL_GPIO_BASE_NOMAP),	/* AZA */
+	CNL_GPP(4, 115, 146, 160),			/* vGPIO_0 */
+	CNL_GPP(5, 147, 154, INTEL_GPIO_BASE_NOMAP),	/* vGPIO_1 */
 };
 
 static const struct intel_padgroup cnlh_community3_gpps[] = {
-	CNL_GPP(0, 155, 178, 192),		/* GPP_K */
-	CNL_GPP(1, 179, 202, 224),		/* GPP_H */
-	CNL_GPP(2, 203, 215, 256),		/* GPP_E */
-	CNL_GPP(3, 216, 239, 288),		/* GPP_F */
-	CNL_GPP(4, 240, 248, CNL_NO_GPIO),	/* SPI */
+	CNL_GPP(0, 155, 178, 192),			/* GPP_K */
+	CNL_GPP(1, 179, 202, 224),			/* GPP_H */
+	CNL_GPP(2, 203, 215, 256),			/* GPP_E */
+	CNL_GPP(3, 216, 239, 288),			/* GPP_F */
+	CNL_GPP(4, 240, 248, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_padgroup cnlh_community4_gpps[] = {
-	CNL_GPP(0, 249, 259, CNL_NO_GPIO),	/* CPU */
-	CNL_GPP(1, 260, 268, CNL_NO_GPIO),	/* JTAG */
-	CNL_GPP(2, 269, 286, 320),		/* GPP_I */
-	CNL_GPP(3, 287, 298, 352),		/* GPP_J */
+	CNL_GPP(0, 249, 259, INTEL_GPIO_BASE_NOMAP),	/* CPU */
+	CNL_GPP(1, 260, 268, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	CNL_GPP(2, 269, 286, 320),			/* GPP_I */
+	CNL_GPP(3, 287, 298, 352),			/* GPP_J */
 };
 
 static const unsigned int cnlh_spi0_pins[] = { 40, 41, 42, 43 };
@@ -790,25 +788,25 @@ static const struct intel_function cnllp_functions[] = {
 };
 
 static const struct intel_padgroup cnllp_community0_gpps[] = {
-	CNL_GPP(0, 0, 24, 0),			/* GPP_A */
-	CNL_GPP(1, 25, 50, 32),			/* GPP_B */
-	CNL_GPP(2, 51, 58, 64),			/* GPP_G */
-	CNL_GPP(3, 59, 67, CNL_NO_GPIO),	/* SPI */
+	CNL_GPP(0, 0, 24, 0),				/* GPP_A */
+	CNL_GPP(1, 25, 50, 32),				/* GPP_B */
+	CNL_GPP(2, 51, 58, 64),				/* GPP_G */
+	CNL_GPP(3, 59, 67, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_padgroup cnllp_community1_gpps[] = {
-	CNL_GPP(0, 68, 92, 96),			/* GPP_D */
-	CNL_GPP(1, 93, 116, 128),		/* GPP_F */
-	CNL_GPP(2, 117, 140, 160),		/* GPP_H */
-	CNL_GPP(3, 141, 172, 192),		/* vGPIO */
-	CNL_GPP(4, 173, 180, 224),		/* vGPIO */
+	CNL_GPP(0, 68, 92, 96),				/* GPP_D */
+	CNL_GPP(1, 93, 116, 128),			/* GPP_F */
+	CNL_GPP(2, 117, 140, 160),			/* GPP_H */
+	CNL_GPP(3, 141, 172, 192),			/* vGPIO */
+	CNL_GPP(4, 173, 180, 224),			/* vGPIO */
 };
 
 static const struct intel_padgroup cnllp_community4_gpps[] = {
-	CNL_GPP(0, 181, 204, 256),		/* GPP_C */
-	CNL_GPP(1, 205, 228, 288),		/* GPP_E */
-	CNL_GPP(2, 229, 237, CNL_NO_GPIO),	/* JTAG */
-	CNL_GPP(3, 238, 243, CNL_NO_GPIO),	/* HVCMOS */
+	CNL_GPP(0, 181, 204, 256),			/* GPP_C */
+	CNL_GPP(1, 205, 228, 288),			/* GPP_E */
+	CNL_GPP(2, 229, 237, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	CNL_GPP(3, 238, 243, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
 };
 
 static const struct intel_community cnllp_communities[] = {
-- 
2.25.1

