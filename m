Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196BBE0153
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731458AbfJVKAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 06:00:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:6884 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731344AbfJVKAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 06:00:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="197074903"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 22 Oct 2019 03:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BBC3E3BB; Tue, 22 Oct 2019 13:00:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/5] pinctrl: intel: Introduce intel_restore_hostown() helper
Date:   Tue, 22 Oct 2019 13:00:01 +0300
Message-Id: <20191022100004.66532-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Refactor restoring HOSTSW_OWN registers by using an introduced helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 38 +++++++++++++++------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 181e5c8c1855..1bdc0365e1ad 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1607,6 +1607,25 @@ intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
 	return curr;
 }
 
+static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
+				  void __iomem *base, unsigned int gpp, u32 saved)
+{
+	const struct intel_community *community = &pctrl->communities[c];
+	const struct intel_padgroup *padgrp = &community->gpps[gpp];
+	struct device *dev = pctrl->dev;
+	u32 requested, value;
+
+	if (padgrp->gpio_base < 0)
+		return;
+
+	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
+	value = intel_gpio_update_pad_mode(base + gpp * 4, requested, saved);
+	if (!((value ^ saved) & requested))
+		return;
+
+	dev_warn(dev, "restored hostown %u/%u %#8x->%#8x\n", c, gpp, value, saved);
+}
+
 static void intel_restore_padcfg(struct intel_pinctrl *pctrl, unsigned int pin,
 				 unsigned int reg, u32 saved)
 {
@@ -1664,23 +1683,8 @@ int intel_pinctrl_resume_noirq(struct device *dev)
 		}
 
 		base = community->regs + community->hostown_offset;
-		for (gpp = 0; gpp < community->ngpps; gpp++) {
-			const struct intel_padgroup *padgrp = &community->gpps[gpp];
-			u32 requested = 0, value = 0;
-			u32 saved = communities[i].hostown[gpp];
-
-			if (padgrp->gpio_base < 0)
-				continue;
-
-			requested = intel_gpio_is_requested(&pctrl->chip,
-					padgrp->gpio_base, padgrp->size);
-			value = intel_gpio_update_pad_mode(base + gpp * 4,
-					requested, saved);
-			if ((value ^ saved) & requested) {
-				dev_warn(dev, "restore hostown %d/%u %#8x->%#8x\n",
-					i, gpp, value, saved);
-			}
-		}
+		for (gpp = 0; gpp < community->ngpps; gpp++)
+			intel_restore_hostown(pctrl, i, base, gpp, communities[i].hostown[gpp]);
 	}
 
 	return 0;
-- 
2.23.0

