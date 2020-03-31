Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7086199990
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 17:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbgCaPZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 11:25:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:9390 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730950AbgCaPZv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Mar 2020 11:25:51 -0400
IronPort-SDR: 2wNTv2MQyd0k5zo8eLTfgMIvWDpE2R/wpa3MevDqlm8YLv56KZAKJ9ar1YgpefokrZLK7h7q63
 mkdlzaGNCS4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 08:25:50 -0700
IronPort-SDR: D8bX788ah4YWZJBTVby2817dNCjRH504gk0++/ReTh+xfJPZW1dfjRex+xzu0XLa9apmHHaHV6
 Q1adr9LIm7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="237737449"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 31 Mar 2020 08:25:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 44C2D339; Tue, 31 Mar 2020 18:25:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] pinctrl: icelake: Use generic flag for special GPIO base treatment
Date:   Tue, 31 Mar 2020 18:25:46 +0300
Message-Id: <20200331152547.34044-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200331152547.34044-1-andriy.shevchenko@linux.intel.com>
References: <20200331152547.34044-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-icelake.c | 30 ++++++++++++-------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
index 6489e9bbb61f..429b5a83acf0 100644
--- a/drivers/pinctrl/intel/pinctrl-icelake.c
+++ b/drivers/pinctrl/intel/pinctrl-icelake.c
@@ -29,8 +29,6 @@
 		.gpio_base = (g),			\
 	}
 
-#define ICL_NO_GPIO	-1
-
 #define ICL_COMMUNITY(b, s, e, g)			\
 	{						\
 		.barno = (b),				\
@@ -305,29 +303,29 @@ static const struct pinctrl_pin_desc icllp_pins[] = {
 };
 
 static const struct intel_padgroup icllp_community0_gpps[] = {
-	ICL_GPP(0, 0, 7, 0),			/* GPP_G */
-	ICL_GPP(1, 8, 33, 32),			/* GPP_B */
-	ICL_GPP(2, 34, 58, 64),			/* GPP_A */
+	ICL_GPP(0, 0, 7, 0),				/* GPP_G */
+	ICL_GPP(1, 8, 33, 32),				/* GPP_B */
+	ICL_GPP(2, 34, 58, 64),				/* GPP_A */
 };
 
 static const struct intel_padgroup icllp_community1_gpps[] = {
-	ICL_GPP(0, 59, 82, 96),			/* GPP_H */
-	ICL_GPP(1, 83, 103, 128),		/* GPP_D */
-	ICL_GPP(2, 104, 123, 160),		/* GPP_F */
-	ICL_GPP(3, 124, 152, 192),		/* vGPIO */
+	ICL_GPP(0, 59, 82, 96),				/* GPP_H */
+	ICL_GPP(1, 83, 103, 128),			/* GPP_D */
+	ICL_GPP(2, 104, 123, 160),			/* GPP_F */
+	ICL_GPP(3, 124, 152, 192),			/* vGPIO */
 };
 
 static const struct intel_padgroup icllp_community4_gpps[] = {
-	ICL_GPP(0, 153, 176, 224),		/* GPP_C */
-	ICL_GPP(1, 177, 182, ICL_NO_GPIO),	/* HVCMOS */
-	ICL_GPP(2, 183, 206, 256),		/* GPP_E */
-	ICL_GPP(3, 207, 215, ICL_NO_GPIO),	/* JTAG */
+	ICL_GPP(0, 153, 176, 224),			/* GPP_C */
+	ICL_GPP(1, 177, 182, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	ICL_GPP(2, 183, 206, 256),			/* GPP_E */
+	ICL_GPP(3, 207, 215, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
 static const struct intel_padgroup icllp_community5_gpps[] = {
-	ICL_GPP(0, 216, 223, 288),		/* GPP_R */
-	ICL_GPP(1, 224, 231, 320),		/* GPP_S */
-	ICL_GPP(2, 232, 240, ICL_NO_GPIO),	/* SPI */
+	ICL_GPP(0, 216, 223, 288),			/* GPP_R */
+	ICL_GPP(1, 224, 231, 320),			/* GPP_S */
+	ICL_GPP(2, 232, 240, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_community icllp_communities[] = {
-- 
2.25.1

