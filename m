Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88BE5F070E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 21:36:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbfKEUgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 15:36:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:56275 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbfKEUgF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 15:36:05 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 12:36:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="205105312"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2019 12:36:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F1598458; Tue,  5 Nov 2019 22:35:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v2 7/7] pinctrl: baytrail: Pass irqchip when adding gpiochip
Date:   Tue,  5 Nov 2019 22:35:57 +0200
Message-Id: <20191105203557.78562-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward conversion.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 43 ++++++++++++++----------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b4d0e945e8c2..1234fe5f2a27 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1450,9 +1450,9 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 	 */
 }
 
-static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
+static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 {
-	struct gpio_chip *gc = &vg->chip;
+	struct byt_gpio *vg = gpiochip_get_data(chip);
 	struct device *dev = &vg->pdev->dev;
 	void __iomem *reg;
 	u32 base, value;
@@ -1476,7 +1476,7 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 
 		value = readl(reg);
 		if (value & BYT_DIRECT_IRQ_EN) {
-			clear_bit(i, gc->irq.valid_mask);
+			clear_bit(i, chip->irq.valid_mask);
 			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
 		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
@@ -1504,6 +1504,8 @@ static void byt_gpio_irq_init_hw(struct byt_gpio *vg)
 				"GPIO interrupt error, pins misconfigured. INT_STAT%u: 0x%08x\n",
 				base / 32, value);
 	}
+
+	return 0;
 }
 
 static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
@@ -1542,26 +1544,31 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	if (!vg->saved_context)
 		return -ENOMEM;
 #endif
-	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
-	if (ret) {
-		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
-		return ret;
-	}
 
 	/* set up interrupts  */
 	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
 	if (irq_rc && irq_rc->start) {
-		byt_gpio_irq_init_hw(vg);
-		ret = gpiochip_irqchip_add(gc, &byt_irqchip, 0,
-					   handle_bad_irq, IRQ_TYPE_NONE);
-		if (ret) {
-			dev_err(&vg->pdev->dev, "failed to add irqchip\n");
-			return ret;
-		}
+		struct gpio_irq_chip *girq;
+
+		girq = &gc->irq;
+		girq->chip = &byt_irqchip;
+		girq->init_hw = byt_gpio_irq_init_hw;
+		girq->parent_handler = byt_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&vg->pdev->dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = (unsigned int)irq_rc->start;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+	}
 
-		gpiochip_set_chained_irqchip(gc, &byt_irqchip,
-					     (unsigned)irq_rc->start,
-					     byt_gpio_irq_handler);
+	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
+	if (ret) {
+		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
+		return ret;
 	}
 
 	return ret;
-- 
2.24.0.rc1

