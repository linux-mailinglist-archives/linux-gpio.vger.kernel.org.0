Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9902EF344
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbhAHNly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:41:54 -0500
Received: from mga06.intel.com ([134.134.136.31]:54213 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726784AbhAHNlx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 08:41:53 -0500
IronPort-SDR: t98IbXWJHcF5Dsz9OENkWMrzArEwJAONTK5/6lY9InWVcOrt3haODwTi5Av3fAMGv+CT9fEgVu
 8Ma5SY9SoJqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="239145658"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="239145658"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:40:07 -0800
IronPort-SDR: zuprHiVY9/Yw8rzdLrkLIFibpsQGj/2tx2CHKm6Y+99AUb7YOeHbV3tJj8Iv33jLwIAW7D+KhO
 rwdiKd9oVl9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="344229026"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jan 2021 05:40:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BE93AE3; Fri,  8 Jan 2021 15:40:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/3] pinctrl: intel: Drop unnecessary check for predefined features
Date:   Fri,  8 Jan 2021 15:40:04 +0200
Message-Id: <20210108134005.30048-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108134005.30048-1-andriy.shevchenko@linux.intel.com>
References: <20210108134005.30048-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

None of the drivers is overriding features. Remove unnecessary check.
While here, rename rev to value to make easier further development.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
v2: added tag (Mika)
 drivers/pinctrl/intel/pinctrl-intel.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index ae13e4390935..1a479112ed85 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1473,6 +1473,7 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 		struct intel_community *community = &pctrl->communities[i];
 		void __iomem *regs;
 		u32 padbar;
+		u32 value;
 
 		*community = pctrl->soc->communities[i];
 
@@ -1480,18 +1481,11 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
 
-		/*
-		 * Determine community features based on the revision if
-		 * not specified already.
-		 */
-		if (!community->features) {
-			u32 rev;
-
-			rev = (readl(regs + REVID) & REVID_MASK) >> REVID_SHIFT;
-			if (rev >= 0x94) {
-				community->features |= PINCTRL_FEATURE_DEBOUNCE;
-				community->features |= PINCTRL_FEATURE_1K_PD;
-			}
+		/* Determine community features based on the revision */
+		value = readl(regs + REVID);
+		if (((value & REVID_MASK) >> REVID_SHIFT) >= 0x94) {
+			community->features |= PINCTRL_FEATURE_DEBOUNCE;
+			community->features |= PINCTRL_FEATURE_1K_PD;
 		}
 
 		/* Read offset of the pad configuration registers */
-- 
2.29.2

