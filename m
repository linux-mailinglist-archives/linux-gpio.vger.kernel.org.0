Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1FF1F7A1A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2020 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgFLOuN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Jun 2020 10:50:13 -0400
Received: from mga07.intel.com ([134.134.136.100]:5661 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLOuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:11 -0400
IronPort-SDR: X9w6q/f6zaRs5LfzZuYVCk2mAAH4mkfrjzlUV7Ky5C1YjBn/CR7CSWiOvlmIQluBjxFtpzCDpN
 dnuR/uo8aMtw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:11 -0700
IronPort-SDR: O+w8GD550IQEJje15QuzD1htFXiDQjpW6EViGIHCYL9dWGAsPPiGLZ/HsGyQFofCoI7njlt42n
 AD9AFtsFOf2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="260847915"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 358586D6; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 09/13] pinctrl: intel: Make use of for_each_requested_gpio()
Date:   Fri, 12 Jun 2020 17:50:02 +0300
Message-Id: <20200612145006.9145-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 35c88fcb75a2..74f0157c99fb 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1628,19 +1628,6 @@ static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
 	}
 }
 
-static u32
-intel_gpio_is_requested(struct gpio_chip *chip, int base, unsigned int size)
-{
-	u32 requested = 0;
-	unsigned int i;
-
-	for (i = 0; i < size; i++)
-		if (gpiochip_is_requested(chip, base + i))
-			requested |= BIT(i);
-
-	return requested;
-}
-
 static bool intel_gpio_update_reg(void __iomem *reg, u32 mask, u32 value)
 {
 	u32 curr, updated;
@@ -1661,12 +1648,15 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	const struct intel_community *community = &pctrl->communities[c];
 	const struct intel_padgroup *padgrp = &community->gpps[gpp];
 	struct device *dev = pctrl->dev;
-	u32 requested;
+	u32 requested = 0;
+	unsigned int i;
 
 	if (padgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 		return;
 
-	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
+	for_each_requested_gpio(&pctrl->chip, i, padgrp->gpio_base, padgrp->size)
+		requested |= BIT(i);
+
 	if (!intel_gpio_update_reg(base + gpp * 4, requested, saved))
 		return;
 
-- 
2.27.0.rc2

