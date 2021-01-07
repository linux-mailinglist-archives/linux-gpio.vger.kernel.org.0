Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028F72ED723
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 20:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbhAGTFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 14:05:13 -0500
Received: from mga03.intel.com ([134.134.136.65]:7191 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbhAGTFN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 14:05:13 -0500
IronPort-SDR: jVqvlrIXwpxNXCQ26+CQ3FGVymqsMHVO4vyAtsF5IpiuoVa55MvX6RhoNop4QQfmsX37JP0g5J
 iJ6n3kNgSABw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="177579062"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="177579062"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 11:02:05 -0800
IronPort-SDR: 7opanTpbSusnsWr6kENe2qcjH9nMc2KSk0mJ4Y0JX/wZhaXPhp9OH0B6WtzBg5C92PdbQHWhTS
 reMPA5DEhlBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="497608518"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Jan 2021 11:02:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AECD1191; Thu,  7 Jan 2021 21:02:01 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] pinctrl: intel: Drop unnecessary check for predefined features
Date:   Thu,  7 Jan 2021 21:01:58 +0200
Message-Id: <20210107190200.41221-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

None of the drivers is overriding features. Remove unnecessary check.
While here, rename rev to value to make easier further development.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

