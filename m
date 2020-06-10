Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F60E1F5B42
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 20:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgFJSfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 14:35:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:8840 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729053AbgFJSfs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:48 -0400
IronPort-SDR: LOvYvuy9IsFAtWxDXtjSoHaibsuzXi4KGXskJl70l2wBAGQrAbd78buNk5u71lc/p78V+U+xu5
 FQY/JoCSOlog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:47 -0700
IronPort-SDR: +1gzS9+bkYijG859YNZszJ5/5lkaKC4+QmPwzGihrPJYRLsNDsEn+wKOBSNAduCPbVURAoWegt
 WUeEg8Fl3OAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="259367417"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2020 11:35:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 00E2F277; Wed, 10 Jun 2020 21:35:44 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 03/10] pinctrl: intel: Make use of IRQ_RETVAL()
Date:   Wed, 10 Jun 2020 21:35:36 +0300
Message-Id: <20200610183543.89414-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-intel.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index d0b658ba2136..208299ede9d8 100644
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
+	int ret = 0;
 	int i;
 
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

