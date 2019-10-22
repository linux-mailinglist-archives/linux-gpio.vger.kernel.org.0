Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EF4E015B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 12:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbfJVKAV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 06:00:21 -0400
Received: from mga17.intel.com ([192.55.52.151]:6892 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731439AbfJVKAV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 06:00:21 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 03:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; 
   d="scan'208";a="197074982"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 22 Oct 2019 03:00:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D2625410; Tue, 22 Oct 2019 13:00:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/5] pinctrl: intel: Use helper to restore register values on ->resume()
Date:   Tue, 22 Oct 2019 13:00:04 +0300
Message-Id: <20191022100004.66532-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
References: <20191022100004.66532-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We can restore only values that had been changed and do not spam kernel log
with unnecessary messages. Convert intel_gpio_update_pad_mode() to a helper
function that will be used across few callers.

Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 54a5eb33c9fa..b54b27228ad9 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1595,16 +1595,18 @@ intel_gpio_is_requested(struct gpio_chip *chip, int base, unsigned int size)
 	return requested;
 }
 
-static u32
-intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
+static bool intel_gpio_update_reg(void __iomem *reg, u32 mask, u32 value)
 {
 	u32 curr, updated;
 
-	curr = readl(hostown);
+	curr = readl(reg);
+
 	updated = (curr & ~mask) | (value & mask);
-	writel(updated, hostown);
+	if (curr == updated)
+		return false;
 
-	return curr;
+	writel(updated, reg);
+	return true;
 }
 
 static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
@@ -1613,14 +1615,13 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	const struct intel_community *community = &pctrl->communities[c];
 	const struct intel_padgroup *padgrp = &community->gpps[gpp];
 	struct device *dev = pctrl->dev;
-	u32 requested, value;
+	u32 requested;
 
 	if (padgrp->gpio_base < 0)
 		return;
 
 	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
-	value = intel_gpio_update_pad_mode(base + gpp * 4, requested, saved);
-	if (!((value ^ saved) & requested))
+	if (!intel_gpio_update_reg(base + gpp * 4, requested, saved))
 		return;
 
 	dev_dbg(dev, "restored hostown %u/%u %#08x\n", c, gpp, readl(base + gpp * 4));
@@ -1631,7 +1632,9 @@ static void intel_restore_intmask(struct intel_pinctrl *pctrl, unsigned int c,
 {
 	struct device *dev = pctrl->dev;
 
-	writel(saved, base + gpp * 4);
+	if (!intel_gpio_update_reg(base + gpp * 4, ~0U, saved))
+		return;
+
 	dev_dbg(dev, "restored mask %u/%u %#08x\n", c, gpp, readl(base + gpp * 4));
 }
 
@@ -1642,17 +1645,14 @@ static void intel_restore_padcfg(struct intel_pinctrl *pctrl, unsigned int pin,
 	unsigned int n = reg / sizeof(u32);
 	struct device *dev = pctrl->dev;
 	void __iomem *padcfg;
-	u32 value;
 
 	padcfg = intel_get_padcfg(pctrl, pin, reg);
 	if (!padcfg)
 		return;
 
-	value = readl(padcfg) & ~mask;
-	if (value == saved)
+	if (!intel_gpio_update_reg(padcfg, ~mask, saved))
 		return;
 
-	writel(saved, padcfg);
 	dev_dbg(dev, "restored pin %u padcfg%u %#08x\n", pin, n, readl(padcfg));
 }
 
-- 
2.23.0

