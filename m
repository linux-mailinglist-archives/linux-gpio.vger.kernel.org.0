Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF68927CDFF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728393AbgI2LDU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 07:03:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:40657 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbgI2LDK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 07:03:10 -0400
IronPort-SDR: /wTvnaxLW11PinrXmlHYY8q6iDWgMhJVtboZjTX+jVhC0jElHJX6DfL3l1+Ff974I3ThPccNMP
 UjhhdfK+r1UA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="162227649"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="162227649"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 04:03:08 -0700
IronPort-SDR: eTWk5g4gXE17JILJKOmZx6MqWPa06YusWSe18/IMFpmkptHEdAnbF6GwombTCq840M6Ainy1Yk
 RcdSzhMKq0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="324632011"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 29 Sep 2020 04:03:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8103A352; Tue, 29 Sep 2020 14:03:06 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] pinctrl: sunrisepoint: Modify COMMUNITY macros to be consistent
Date:   Tue, 29 Sep 2020 14:03:06 +0300
Message-Id: <20200929110306.40852-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Modify COMMUNITY macros to be consistent with Tiger Lake and others.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 60 +++++++++-----------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index 4d7a86a5a37b..14eac924d43d 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -22,21 +22,26 @@
 #define SPT_GPI_IS		0x100
 #define SPT_GPI_IE		0x120
 
-#define SPT_COMMUNITY(b, s, e)				\
+#define SPT_COMMUNITY(b, s, e, pl, gs, gn, g, n)	\
 	{						\
 		.barno = (b),				\
 		.padown_offset = SPT_PAD_OWN,		\
-		.padcfglock_offset = SPT_LP_PADCFGLOCK,	\
+		.padcfglock_offset = (pl),		\
 		.hostown_offset = SPT_HOSTSW_OWN,	\
 		.is_offset = SPT_GPI_IS,		\
 		.ie_offset = SPT_GPI_IE,		\
-		.gpp_size = 24,				\
-		.gpp_num_padown_regs = 4,		\
+		.gpp_size = (gs),			\
+		.gpp_num_padown_regs = (gn),		\
 		.pin_base = (s),			\
 		.npins = ((e) - (s) + 1),		\
+		.gpps = (g),				\
+		.ngpps = (n),				\
 	}
 
-#define SPTH_GPP(r, s, e, g)				\
+#define SPT_LP_COMMUNITY(b, s, e)			\
+	SPT_COMMUNITY(b, s, e, SPT_LP_PADCFGLOCK, 24, 4, NULL, 0)
+
+#define SPT_H_GPP(r, s, e, g)				\
 	{						\
 		.reg_num = (r),				\
 		.base = (s),				\
@@ -44,19 +49,8 @@
 		.gpio_base = (g),			\
 	}
 
-#define SPTH_COMMUNITY(b, s, e, g)			\
-	{						\
-		.barno = (b),				\
-		.padown_offset = SPT_PAD_OWN,		\
-		.padcfglock_offset = SPT_H_PADCFGLOCK,	\
-		.hostown_offset = SPT_HOSTSW_OWN,	\
-		.is_offset = SPT_GPI_IS,		\
-		.ie_offset = SPT_GPI_IE,		\
-		.pin_base = (s),			\
-		.npins = ((e) - (s) + 1),		\
-		.gpps = (g),				\
-		.ngpps = ARRAY_SIZE(g),			\
-	}
+#define SPT_H_COMMUNITY(b, s, e, g)			\
+	SPT_COMMUNITY(b, s, e, SPT_H_PADCFGLOCK, 0, 0, g, ARRAY_SIZE(g))
 
 /* Sunrisepoint-LP */
 static const struct pinctrl_pin_desc sptlp_pins[] = {
@@ -292,9 +286,9 @@ static const struct intel_function sptlp_functions[] = {
 };
 
 static const struct intel_community sptlp_communities[] = {
-	SPT_COMMUNITY(0, 0, 47),
-	SPT_COMMUNITY(1, 48, 119),
-	SPT_COMMUNITY(2, 120, 151),
+	SPT_LP_COMMUNITY(0, 0, 47),
+	SPT_LP_COMMUNITY(1, 48, 119),
+	SPT_LP_COMMUNITY(2, 120, 151),
 };
 
 static const struct intel_pinctrl_soc_data sptlp_soc_data = {
@@ -554,27 +548,27 @@ static const struct intel_function spth_functions[] = {
 };
 
 static const struct intel_padgroup spth_community0_gpps[] = {
-	SPTH_GPP(0, 0, 23, 0),		/* GPP_A */
-	SPTH_GPP(1, 24, 47, 24),	/* GPP_B */
+	SPT_H_GPP(0, 0, 23, 0),		/* GPP_A */
+	SPT_H_GPP(1, 24, 47, 24),	/* GPP_B */
 };
 
 static const struct intel_padgroup spth_community1_gpps[] = {
-	SPTH_GPP(0, 48, 71, 48),	/* GPP_C */
-	SPTH_GPP(1, 72, 95, 72),	/* GPP_D */
-	SPTH_GPP(2, 96, 108, 96),	/* GPP_E */
-	SPTH_GPP(3, 109, 132, 120),	/* GPP_F */
-	SPTH_GPP(4, 133, 156, 144),	/* GPP_G */
-	SPTH_GPP(5, 157, 180, 168),	/* GPP_H */
+	SPT_H_GPP(0, 48, 71, 48),	/* GPP_C */
+	SPT_H_GPP(1, 72, 95, 72),	/* GPP_D */
+	SPT_H_GPP(2, 96, 108, 96),	/* GPP_E */
+	SPT_H_GPP(3, 109, 132, 120),	/* GPP_F */
+	SPT_H_GPP(4, 133, 156, 144),	/* GPP_G */
+	SPT_H_GPP(5, 157, 180, 168),	/* GPP_H */
 };
 
 static const struct intel_padgroup spth_community3_gpps[] = {
-	SPTH_GPP(0, 181, 191, 192),	/* GPP_I */
+	SPT_H_GPP(0, 181, 191, 192),	/* GPP_I */
 };
 
 static const struct intel_community spth_communities[] = {
-	SPTH_COMMUNITY(0, 0, 47, spth_community0_gpps),
-	SPTH_COMMUNITY(1, 48, 180, spth_community1_gpps),
-	SPTH_COMMUNITY(2, 181, 191, spth_community3_gpps),
+	SPT_H_COMMUNITY(0, 0, 47, spth_community0_gpps),
+	SPT_H_COMMUNITY(1, 48, 180, spth_community1_gpps),
+	SPT_H_COMMUNITY(2, 181, 191, spth_community3_gpps),
 };
 
 static const struct intel_pinctrl_soc_data spth_soc_data = {
-- 
2.28.0

