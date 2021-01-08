Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818552EF34F
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 14:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbhAHNnO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 08:43:14 -0500
Received: from mga06.intel.com ([134.134.136.31]:54277 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727860AbhAHNnN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 08:43:13 -0500
IronPort-SDR: 9GxVB8nSIyNOyvQ7Q+s1nqMuehh4eo+DCaZLMBXAjsVjeLcUbVSzOHqw6ijts8aYK9zGagaK9a
 ShiXLy5TeRZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="239145659"
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="239145659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2021 05:40:07 -0800
IronPort-SDR: v7YZPJkd8zeXbAMGj8oURyax9oeTxNZar7i+M7hKt6UGsvENjJh1a0wShqoWNX+3s2SGBvoU31
 dP7jSwTWlo/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,331,1602572400"; 
   d="scan'208";a="388189620"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 08 Jan 2021 05:40:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B3496113; Fri,  8 Jan 2021 15:40:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/3] pinctrl: intel: Split intel_pinctrl_add_padgroups() for better maintenance
Date:   Fri,  8 Jan 2021 15:40:03 +0200
Message-Id: <20210108134005.30048-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently the intel_pinctrl_add_padgroups() is twisted a bit due to
a different nature of the pin control hardware implementations. Thus,
its maintenance is a bit hard. Besides that some pieces of code
are run on all hardware and make this code slightly inefficient,
and moreover, validation for one case is done in a wrong time in a flow
which makes it even slower.

Split intel_pinctrl_add_padgroups() to two functions, one per hardware
implementation, for better maintenance and readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
v2: added tag (Mika)
 drivers/pinctrl/intel/pinctrl-intel.c | 60 ++++++++++++++++++---------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index b6ef1911c1dd..ae13e4390935 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1321,34 +1321,19 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
 	return 0;
 }
 
-static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
-				       struct intel_community *community)
+static int intel_pinctrl_add_padgroups_by_gpps(struct intel_pinctrl *pctrl,
+					       struct intel_community *community)
 {
 	struct intel_padgroup *gpps;
-	unsigned int npins = community->npins;
 	unsigned int padown_num = 0;
-	size_t ngpps, i;
-
-	if (community->gpps)
-		ngpps = community->ngpps;
-	else
-		ngpps = DIV_ROUND_UP(community->npins, community->gpp_size);
+	size_t i, ngpps = community->ngpps;
 
 	gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
 	if (!gpps)
 		return -ENOMEM;
 
 	for (i = 0; i < ngpps; i++) {
-		if (community->gpps) {
-			gpps[i] = community->gpps[i];
-		} else {
-			unsigned int gpp_size = community->gpp_size;
-
-			gpps[i].reg_num = i;
-			gpps[i].base = community->pin_base + i * gpp_size;
-			gpps[i].size = min(gpp_size, npins);
-			npins -= gpps[i].size;
-		}
+		gpps[i] = community->gpps[i];
 
 		if (gpps[i].size > 32)
 			return -EINVAL;
@@ -1366,6 +1351,38 @@ static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
 				break;
 		}
 
+		gpps[i].padown_num = padown_num;
+		padown_num += DIV_ROUND_UP(gpps[i].size * 4, 32);
+	}
+
+	community->gpps = gpps;
+
+	return 0;
+}
+
+static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
+					       struct intel_community *community)
+{
+	struct intel_padgroup *gpps;
+	unsigned int npins = community->npins;
+	unsigned int padown_num = 0;
+	size_t i, ngpps = DIV_ROUND_UP(npins, community->gpp_size);
+
+	if (community->gpp_size > 32)
+		return -EINVAL;
+
+	gpps = devm_kcalloc(pctrl->dev, ngpps, sizeof(*gpps), GFP_KERNEL);
+	if (!gpps)
+		return -ENOMEM;
+
+	for (i = 0; i < ngpps; i++) {
+		unsigned int gpp_size = community->gpp_size;
+
+		gpps[i].reg_num = i;
+		gpps[i].base = community->pin_base + i * gpp_size;
+		gpps[i].size = min(gpp_size, npins);
+		npins -= gpps[i].size;
+
 		gpps[i].padown_num = padown_num;
 
 		/*
@@ -1483,7 +1500,10 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
 		community->regs = regs;
 		community->pad_regs = regs + padbar;
 
-		ret = intel_pinctrl_add_padgroups(pctrl, community);
+		if (community->gpps)
+			ret = intel_pinctrl_add_padgroups_by_gpps(pctrl, community);
+		else
+			ret = intel_pinctrl_add_padgroups_by_size(pctrl, community);
 		if (ret)
 			return ret;
 	}
-- 
2.29.2

