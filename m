Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944811F7A17
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgFLOuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:10 -0400
Received: from mga02.intel.com ([134.134.136.20]:34514 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgFLOuJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:09 -0400
IronPort-SDR: CDbh+94VDpZb3VEx7oLsbZl2gWxpFucXQLN6trnW5GEPEamYQR6l10xPryVDPt6RLrsG3jmfbp
 urpxUCpwlu0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:09 -0700
IronPort-SDR: mnRw0lag6v6LlSGMaZ9f/D0MRaOp5RZwQFWY+X4LGIcY60O3LSscGo6sL2Uw5GDvgIOfpOaS1Q
 bTqHLb8vWvpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="259896445"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2020 07:50:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 088F4316; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 03/13] pinctrl: intel: Make use of IRQ_RETVAL()
Date:   Fri, 12 Jun 2020 17:49:56 +0300
Message-Id: <20200612145006.9145-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of using bitwise operations against returned values,
which is a bit fragile, convert IRQ handler to count amount of
GPIO groups, where at least one interrupt happened, and convert
it to returned value by IRQ_RETVAL() macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d0b658ba2136..e05273a00ff2 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1093,12 +1093,12 @@ static int intel_gpio_irq_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
-static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
-	const struct intel_community *community)
+static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
+					    const struct intel_community *community)
 {
 	struct gpio_chip *gc = &pctrl->chip;
-	irqreturn_t ret = IRQ_NONE;
-	int gpp;
+	unsigned int gpp;
+	int ret = 0;
 
 	for (gpp = 0; gpp < community->ngpps; gpp++) {
 		const struct intel_padgroup *padgrp = &community->gpps[gpp];
@@ -1118,9 +1118,9 @@ static irqreturn_t intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 			irq = irq_find_mapping(gc->irq.domain,
 					       padgrp->gpio_base + gpp_offset);
 			generic_handle_irq(irq);
-
-			ret |= IRQ_HANDLED;
 		}
+
+		ret += pending ? 1 : 0;
 	}
 
 	return ret;
@@ -1130,16 +1130,16 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 {
 	const struct intel_community *community;
 	struct intel_pinctrl *pctrl = data;
-	irqreturn_t ret = IRQ_NONE;
-	int i;
+	unsigned int i;
+	int ret = 0;
 
 	/* Need to check all communities for pending interrupts */
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		community = &pctrl->communities[i];
-		ret |= intel_gpio_community_irq_handler(pctrl, community);
+		ret += intel_gpio_community_irq_handler(pctrl, community);
 	}
 
-	return ret;
+	return IRQ_RETVAL(ret);
 }
 
 static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
-- 
2.27.0.rc2

