Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839AF1F9BA6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 17:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730794AbgFOPN7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 11:13:59 -0400
Received: from mga02.intel.com ([134.134.136.20]:34150 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730711AbgFOPN6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:13:58 -0400
IronPort-SDR: wQnOgIUPOgE6dR/sj+KsCKWoUAht95p5gE56UI7RDI/42t2/aWoJ6bXrRFfQmDmbO2FaoqIcYk
 PWYslwnQMHGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:13:58 -0700
IronPort-SDR: V+l+0IxahTytf3SnB7uaeGhiJ488+Lvc+bZkzRWzA/5OqWzGOSHcizX3l2i8EzueqW11c86DIa
 oDA0yQDOkeNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,515,1583222400"; 
   d="scan'208";a="420404429"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2020 08:13:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 00DE592; Mon, 15 Jun 2020 18:13:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 1/3] pinctrl: intel: Make use of for_each_requested_gpio_in_range()
Date:   Mon, 15 Jun 2020 18:13:51 +0300
Message-Id: <20200615151353.88194-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
References: <20200615151353.88194-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio_in_range() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 35c88fcb75a2..b64997b303e0 100644
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
@@ -1661,12 +1648,16 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	const struct intel_community *community = &pctrl->communities[c];
 	const struct intel_padgroup *padgrp = &community->gpps[gpp];
 	struct device *dev = pctrl->dev;
-	u32 requested;
+	const char *dummy;
+	u32 requested = 0;
+	unsigned int i;
 
 	if (padgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 		return;
 
-	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
+	for_each_requested_gpio_in_range(&pctrl->chip, i, padgrp->gpio_base, padgrp->size, dummy)
+		requested |= BIT(i);
+
 	if (!intel_gpio_update_reg(base + gpp * 4, requested, saved))
 		return;
 
-- 
2.27.0.rc2

