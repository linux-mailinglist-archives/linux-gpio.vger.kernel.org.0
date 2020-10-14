Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90FA28DF4C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 12:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgJNKqn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 06:46:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:31115 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727298AbgJNKqm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 06:46:42 -0400
IronPort-SDR: 6fzPrPKlGUAhQYv9I+KPpvPiA7GO4ZVC5gCknPfCA9MO2LpsLUUV+HKwVB9hFM4UOW+/BVcKoJ
 Rq8Pcjx0jhjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="227716292"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="227716292"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:46:41 -0700
IronPort-SDR: wxTHE5/KS9bswCMoP+smjgz03rmyv35ZZQ9N4uyvwQE3l7krM+UwPTnN0PHJmxFcD2zzf9ysw5
 GNoSHQfiQ8iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="520329171"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2020 03:46:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0EB7917C; Wed, 14 Oct 2020 13:46:38 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: [PATCH v1 1/2] pinctrl: intel: Fix 2 kOhm bias which is 833 Ohm
Date:   Wed, 14 Oct 2020 13:46:37 +0300
Message-Id: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2 kOhm bias was never an option in Intel GPIO hardware, the available
matrix is:

	000	none
	001	1 kOhm (if available)
	010	5 kOhm
	100	20 kOhm

As easy to get the 3 resistors are gated separately and according to
parallel circuits calculations we may get combinations of the above where
the result is always strictly less than minimal resistance. Hence,
additional values can be:

	011	~833.3 Ohm
	101	~952.4 Ohm
	110	~4 kOhm
	111	~800 Ohm

That said, convert TERM definitions to be the bit masks to reflect the above.

While at it, enable the same setting for pull down case.

Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
Cc: Jamie McClymont <jamie@kwiius.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 32 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 80b4c5cdc3f6..df626643f9e4 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -72,10 +72,10 @@
 #define PADCFG1_TERM_UP			BIT(13)
 #define PADCFG1_TERM_SHIFT		10
 #define PADCFG1_TERM_MASK		GENMASK(12, 10)
-#define PADCFG1_TERM_20K		4
-#define PADCFG1_TERM_2K			3
-#define PADCFG1_TERM_5K			2
-#define PADCFG1_TERM_1K			1
+#define PADCFG1_TERM_20K		BIT(2)
+#define PADCFG1_TERM_5K			BIT(1)
+#define PADCFG1_TERM_1K			BIT(0)
+#define PADCFG1_TERM_833		(BIT(1) | BIT(0))
 
 #define PADCFG2				0x008
 #define PADCFG2_DEBEN			BIT(0)
@@ -559,12 +559,12 @@ static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 			return -EINVAL;
 
 		switch (term) {
+		case PADCFG1_TERM_833:
+			*arg = 833;
+			break;
 		case PADCFG1_TERM_1K:
 			*arg = 1000;
 			break;
-		case PADCFG1_TERM_2K:
-			*arg = 2000;
-			break;
 		case PADCFG1_TERM_5K:
 			*arg = 5000;
 			break;
@@ -580,6 +580,11 @@ static int intel_config_get_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 			return -EINVAL;
 
 		switch (term) {
+		case PADCFG1_TERM_833:
+			if (!(community->features & PINCTRL_FEATURE_1K_PD))
+				return -EINVAL;
+			*arg = 833;
+			break;
 		case PADCFG1_TERM_1K:
 			if (!(community->features & PINCTRL_FEATURE_1K_PD))
 				return -EINVAL;
@@ -695,12 +700,12 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 		case 5000:
 			value |= PADCFG1_TERM_5K << PADCFG1_TERM_SHIFT;
 			break;
-		case 2000:
-			value |= PADCFG1_TERM_2K << PADCFG1_TERM_SHIFT;
-			break;
 		case 1000:
 			value |= PADCFG1_TERM_1K << PADCFG1_TERM_SHIFT;
 			break;
+		case 833:
+			value |= PADCFG1_TERM_833 << PADCFG1_TERM_SHIFT;
+			break;
 		default:
 			ret = -EINVAL;
 		}
@@ -724,6 +729,13 @@ static int intel_config_set_pull(struct intel_pinctrl *pctrl, unsigned int pin,
 			}
 			value |= PADCFG1_TERM_1K << PADCFG1_TERM_SHIFT;
 			break;
+		case 833:
+			if (!(community->features & PINCTRL_FEATURE_1K_PD)) {
+				ret = -EINVAL;
+				break;
+			}
+			value |= PADCFG1_TERM_833 << PADCFG1_TERM_SHIFT;
+			break;
 		default:
 			ret = -EINVAL;
 		}
-- 
2.28.0

