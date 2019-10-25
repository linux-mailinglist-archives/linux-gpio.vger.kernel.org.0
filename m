Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BE7E4E4F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 16:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502701AbfJYOG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 10:06:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:8910 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407342AbfJYOGZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Oct 2019 10:06:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 07:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="350034970"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 25 Oct 2019 07:06:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D178B1CC; Fri, 25 Oct 2019 17:06:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: baytrail: Move IRQ valid mask initialization to a dedicated callback
Date:   Fri, 25 Oct 2019 17:06:21 +0300
Message-Id: <20191025140621.43417-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is a logical continuation of the commit 5fbe5b5883f8 ("gpio: Initialize
the irqchip valid_mask with a callback") to split IRQ initialization to
hardware and valid mask setup parts.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 25 ++++++++++--------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index beb26550c25f..08e2b940cc11 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1432,22 +1432,10 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned long *valid_mask,
 				    unsigned int ngpios)
 {
-	/*
-	 * FIXME: currently the valid_mask is filled in as part of
-	 * initializing the irq_chip below in byt_gpio_irq_init_hw().
-	 * when converting this driver to the new way of passing the
-	 * gpio_irq_chip along when adding the gpio_chip, move the
-	 * mask initialization into this callback instead. Right now
-	 * this callback is here to make sure the mask gets allocated.
-	 */
-}
-
-static int byt_gpio_irq_init_hw(struct gpio_chip *gc)
-{
-	struct byt_gpio *vg = gpiochip_get_data(gc);
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	struct device *dev = &vg->pdev->dev;
 	void __iomem *reg;
-	u32 base, value;
+	u32 value;
 	int i;
 
 	/*
@@ -1468,13 +1456,20 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *gc)
 
 		value = readl(reg);
 		if (value & BYT_DIRECT_IRQ_EN) {
-			clear_bit(i, gc->irq.valid_mask);
+			clear_bit(i, valid_mask);
 			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
 		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
 			dev_dbg(dev, "disabling GPIO %d\n", i);
 		}
 	}
+}
+
+static int byt_gpio_irq_init_hw(struct gpio_chip *gc)
+{
+	struct byt_gpio *vg = gpiochip_get_data(gc);
+	void __iomem *reg;
+	u32 base, value;
 
 	/* clear interrupt status trigger registers */
 	for (base = 0; base < vg->soc_data->npins; base += 32) {
-- 
2.23.0

