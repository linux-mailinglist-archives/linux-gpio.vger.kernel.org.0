Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4893627CE06
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729540AbgI2Ms2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:48:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:25725 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbgI2LDJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 07:03:09 -0400
IronPort-SDR: y4NEzYY97+m81d4S7bCm26dcvm0RemIzzcoUp8N5qP6d94NQfOtmaVaECDlnTZUklGBtZ+gbyo
 jlpCiJ5nOoyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180320186"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="180320186"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 04:03:08 -0700
IronPort-SDR: n/9ZVEBO0YUddstVqGD+o/TdiKBQB6oF5oRjtprCZJPDwyw7aeC3rtTjm+py6AJ0f66gFc15fm
 B6BFSa6v1L3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="415344018"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2020 04:03:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6B224320; Tue, 29 Sep 2020 14:03:06 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v1 1/3] pinctrl: tigerlake: Fix register offsets for TGL-H variant
Date:   Tue, 29 Sep 2020 14:03:04 +0300
Message-Id: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that almost traditionally the H variants have some deviations
in the register offsets in comparison to LP ones. This is the case for
Intel Tiger Lake as well. Fix register offsets for TGL-H variant.

Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 42 ++++++++++++++---------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 8c162dd5f5a1..3e354e02f408 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -15,11 +15,13 @@
 
 #include "pinctrl-intel.h"
 
-#define TGL_PAD_OWN	0x020
-#define TGL_PADCFGLOCK	0x080
-#define TGL_HOSTSW_OWN	0x0b0
-#define TGL_GPI_IS	0x100
-#define TGL_GPI_IE	0x120
+#define TGL_PAD_OWN		0x020
+#define TGL_LP_PADCFGLOCK	0x080
+#define TGL_H_PADCFGLOCK	0x090
+#define TGL_LP_HOSTSW_OWN	0x0b0
+#define TGL_H_HOSTSW_OWN	0x0c0
+#define TGL_GPI_IS		0x100
+#define TGL_GPI_IE		0x120
 
 #define TGL_GPP(r, s, e, g)				\
 	{						\
@@ -29,12 +31,12 @@
 		.gpio_base = (g),			\
 	}
 
-#define TGL_COMMUNITY(b, s, e, g)			\
+#define TGL_COMMUNITY(b, s, e, pl, ho, g)		\
 	{						\
 		.barno = (b),				\
 		.padown_offset = TGL_PAD_OWN,		\
-		.padcfglock_offset = TGL_PADCFGLOCK,	\
-		.hostown_offset = TGL_HOSTSW_OWN,	\
+		.padcfglock_offset = (pl),		\
+		.hostown_offset = (ho),			\
 		.is_offset = TGL_GPI_IS,		\
 		.ie_offset = TGL_GPI_IE,		\
 		.pin_base = (s),			\
@@ -43,6 +45,12 @@
 		.ngpps = ARRAY_SIZE(g),			\
 	}
 
+#define TGL_LP_COMMUNITY(b, s, e, g)			\
+	TGL_COMMUNITY(b, s, e, TGL_LP_PADCFGLOCK, TGL_LP_HOSTSW_OWN, g)
+
+#define TGL_H_COMMUNITY(b, s, e, g)			\
+	TGL_COMMUNITY(b, s, e, TGL_H_PADCFGLOCK, TGL_H_HOSTSW_OWN, g)
+
 /* Tiger Lake-LP */
 static const struct pinctrl_pin_desc tgllp_pins[] = {
 	/* GPP_B */
@@ -367,10 +375,10 @@ static const struct intel_padgroup tgllp_community5_gpps[] = {
 };
 
 static const struct intel_community tgllp_communities[] = {
-	TGL_COMMUNITY(0, 0, 66, tgllp_community0_gpps),
-	TGL_COMMUNITY(1, 67, 170, tgllp_community1_gpps),
-	TGL_COMMUNITY(2, 171, 259, tgllp_community4_gpps),
-	TGL_COMMUNITY(3, 260, 276, tgllp_community5_gpps),
+	TGL_LP_COMMUNITY(0, 0, 66, tgllp_community0_gpps),
+	TGL_LP_COMMUNITY(1, 67, 170, tgllp_community1_gpps),
+	TGL_LP_COMMUNITY(2, 171, 259, tgllp_community4_gpps),
+	TGL_LP_COMMUNITY(3, 260, 276, tgllp_community5_gpps),
 };
 
 static const struct intel_pinctrl_soc_data tgllp_soc_data = {
@@ -723,11 +731,11 @@ static const struct intel_padgroup tglh_community5_gpps[] = {
 };
 
 static const struct intel_community tglh_communities[] = {
-	TGL_COMMUNITY(0, 0, 78, tglh_community0_gpps),
-	TGL_COMMUNITY(1, 79, 180, tglh_community1_gpps),
-	TGL_COMMUNITY(2, 181, 217, tglh_community3_gpps),
-	TGL_COMMUNITY(3, 218, 266, tglh_community4_gpps),
-	TGL_COMMUNITY(4, 267, 290, tglh_community5_gpps),
+	TGL_H_COMMUNITY(0, 0, 78, tglh_community0_gpps),
+	TGL_H_COMMUNITY(1, 79, 180, tglh_community1_gpps),
+	TGL_H_COMMUNITY(2, 181, 217, tglh_community3_gpps),
+	TGL_H_COMMUNITY(3, 218, 266, tglh_community4_gpps),
+	TGL_H_COMMUNITY(4, 267, 290, tglh_community5_gpps),
 };
 
 static const struct intel_pinctrl_soc_data tglh_soc_data = {
-- 
2.28.0

