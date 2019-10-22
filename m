Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 834CDE0154
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731567AbfJVKAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 06:00:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:36515 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731344AbfJVKAI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 06:00:08 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 03:00:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="201622092"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2019 03:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ADB3A1C5; Tue, 22 Oct 2019 13:00:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/5] pinctrl: intel: Introduce intel_restore_padcfg() helper
Date:   Tue, 22 Oct 2019 13:00:00 +0300
Message-Id: <20191022100004.66532-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Deduplicate restoring PADCFGx registers by using a common helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 51 +++++++++++++--------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 83981ad66a71..181e5c8c1855 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1607,6 +1607,27 @@ intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
 	return curr;
 }
 
+static void intel_restore_padcfg(struct intel_pinctrl *pctrl, unsigned int pin,
+				 unsigned int reg, u32 saved)
+{
+	u32 mask = (reg == PADCFG0) ? PADCFG0_GPIORXSTATE : 0;
+	unsigned int n = reg / sizeof(u32);
+	struct device *dev = pctrl->dev;
+	void __iomem *padcfg;
+	u32 value;
+
+	padcfg = intel_get_padcfg(pctrl, pin, reg);
+	if (!padcfg)
+		return;
+
+	value = readl(padcfg) & ~mask;
+	if (value == saved)
+		return;
+
+	writel(saved, padcfg);
+	dev_dbg(dev, "restored pin %u padcfg%u %#08x\n", pin, n, readl(padcfg));
+}
+
 int intel_pinctrl_resume_noirq(struct device *dev)
 {
 	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
@@ -1620,37 +1641,13 @@ int intel_pinctrl_resume_noirq(struct device *dev)
 	pads = pctrl->context.pads;
 	for (i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc = &pctrl->soc->pins[i];
-		void __iomem *padcfg;
-		u32 val;
 
 		if (!intel_pinctrl_should_save(pctrl, desc->number))
 			continue;
 
-		padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG0);
-		val = readl(padcfg) & ~PADCFG0_GPIORXSTATE;
-		if (val != pads[i].padcfg0) {
-			writel(pads[i].padcfg0, padcfg);
-			dev_dbg(dev, "restored pin %u padcfg0 %#08x\n",
-				desc->number, readl(padcfg));
-		}
-
-		padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG1);
-		val = readl(padcfg);
-		if (val != pads[i].padcfg1) {
-			writel(pads[i].padcfg1, padcfg);
-			dev_dbg(dev, "restored pin %u padcfg1 %#08x\n",
-				desc->number, readl(padcfg));
-		}
-
-		padcfg = intel_get_padcfg(pctrl, desc->number, PADCFG2);
-		if (padcfg) {
-			val = readl(padcfg);
-			if (val != pads[i].padcfg2) {
-				writel(pads[i].padcfg2, padcfg);
-				dev_dbg(dev, "restored pin %u padcfg2 %#08x\n",
-					desc->number, readl(padcfg));
-			}
-		}
+		intel_restore_padcfg(pctrl, desc->number, PADCFG0, pads[i].padcfg0);
+		intel_restore_padcfg(pctrl, desc->number, PADCFG1, pads[i].padcfg1);
+		intel_restore_padcfg(pctrl, desc->number, PADCFG2, pads[i].padcfg2);
 	}
 
 	communities = pctrl->context.communities;
-- 
2.23.0

