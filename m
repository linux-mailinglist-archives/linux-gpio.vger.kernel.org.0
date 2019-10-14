Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3C4D5DBD
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 10:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730474AbfJNInw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 04:43:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:61088 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730439AbfJNInw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Oct 2019 04:43:52 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 01:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="278805632"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 14 Oct 2019 01:43:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4F118E3; Mon, 14 Oct 2019 11:43:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/3] pinctrl: intel: Introduce intel_restore_padcfg() helper
Date:   Mon, 14 Oct 2019 11:43:46 +0300
Message-Id: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
index bc013599a9a3..18467e2efe99 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1588,6 +1588,27 @@ intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
 	return curr;
 }
 
+static void intel_restore_padcfg(struct intel_pinctrl *pctrl, unsigned int pin,
+				 unsigned int reg, u32 value)
+{
+	struct device *dev = pctrl->dev;
+	unsigned int n = reg / sizeof(u32);
+	void __iomem *padcfg;
+	u32 mask = (reg == PADCFG0) ? PADCFG0_GPIORXSTATE : 0;
+	u32 val;
+
+	padcfg = intel_get_padcfg(pctrl, pin, reg);
+	if (!padcfg)
+		return;
+
+	val = readl(padcfg) & ~mask;
+	if (val == value)
+		return;
+
+	writel(value, padcfg);
+	dev_dbg(dev, "restored pin %u padcfg%u %#08x\n", pin, n, readl(padcfg));
+}
+
 int intel_pinctrl_resume_noirq(struct device *dev)
 {
 	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
@@ -1601,37 +1622,13 @@ int intel_pinctrl_resume_noirq(struct device *dev)
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

