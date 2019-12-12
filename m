Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E0911CAA5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 11:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfLLK0J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 05:26:09 -0500
Received: from mga06.intel.com ([134.134.136.31]:21017 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728410AbfLLK0J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 05:26:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 02:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,305,1571727600"; 
   d="scan'208";a="220663831"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2019 02:26:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5C29223E; Thu, 12 Dec 2019 12:26:05 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        hdegoede@redhat.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/5] pinctrl: baytrail: Keep pointer to struct device instead of its container
Date:   Thu, 12 Dec 2019 12:25:55 +0200
Message-Id: <20191212102557.87754-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
References: <20191212102557.87754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to keep pointer to struct platform_device, which is container
of struct device, because the latter is what have been used everywhere outside
of ->probe() path. In any case we may derive pointer to the container when
needed.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 58 ++++++++++++------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index ea61a19857c1..bd33b39082d9 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -106,9 +106,9 @@ struct byt_gpio_pin_context {
 	}
 
 struct byt_gpio {
+	struct device *dev;
 	struct gpio_chip chip;
 	struct irq_chip irqchip;
-	struct platform_device *pdev;
 	struct pinctrl_dev *pctl_dev;
 	struct pinctrl_desc pctl_desc;
 	const struct intel_pinctrl_soc_data *soc_data;
@@ -668,7 +668,7 @@ static void byt_set_group_simple_mux(struct byt_gpio *vg,
 
 		padcfg0 = byt_gpio_reg(vg, group.pins[i], BYT_CONF0_REG);
 		if (!padcfg0) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Group %s, pin %i not muxed (no padcfg0)\n",
 				 group.name, i);
 			continue;
@@ -698,7 +698,7 @@ static void byt_set_group_mixed_mux(struct byt_gpio *vg,
 
 		padcfg0 = byt_gpio_reg(vg, group.pins[i], BYT_CONF0_REG);
 		if (!padcfg0) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Group %s, pin %i not muxed (no padcfg0)\n",
 				 group.name, i);
 			continue;
@@ -785,13 +785,12 @@ static int byt_gpio_request_enable(struct pinctrl_dev *pctl_dev,
 		value |= gpio_mux;
 		writel(value, reg);
 
-		dev_warn(&vg->pdev->dev, FW_BUG
-			 "pin %u forcibly re-configured as GPIO\n", offset);
+		dev_warn(vg->dev, FW_BUG "pin %u forcibly re-configured as GPIO\n", offset);
 	}
 
 	raw_spin_unlock_irqrestore(&byt_lock, flags);
 
-	pm_runtime_get(&vg->pdev->dev);
+	pm_runtime_get(vg->dev);
 
 	return 0;
 }
@@ -803,7 +802,7 @@ static void byt_gpio_disable_free(struct pinctrl_dev *pctl_dev,
 	struct byt_gpio *vg = pinctrl_dev_get_drvdata(pctl_dev);
 
 	byt_gpio_clear_triggering(vg, offset);
-	pm_runtime_put(&vg->pdev->dev);
+	pm_runtime_put(vg->dev);
 }
 
 static int byt_gpio_set_direction(struct pinctrl_dev *pctl_dev,
@@ -1013,7 +1012,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			if (val & BYT_INPUT_EN) {
 				val &= ~BYT_INPUT_EN;
 				writel(val, val_reg);
-				dev_warn(&vg->pdev->dev,
+				dev_warn(vg->dev,
 					 "pin %u forcibly set to input mode\n",
 					 offset);
 			}
@@ -1035,7 +1034,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			if (val & BYT_INPUT_EN) {
 				val &= ~BYT_INPUT_EN;
 				writel(val, val_reg);
-				dev_warn(&vg->pdev->dev,
+				dev_warn(vg->dev,
 					 "pin %u forcibly set to input mode\n",
 					 offset);
 			}
@@ -1412,7 +1411,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
 
 		if (!reg) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Pin %i: could not retrieve interrupt status register\n",
 				 base);
 			continue;
@@ -1434,7 +1433,6 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 				    unsigned int ngpios)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
-	struct device *dev = &vg->pdev->dev;
 	void __iomem *reg;
 	u32 value;
 	int i;
@@ -1449,7 +1447,7 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Pin %i: could not retrieve conf0 register\n",
 				 i);
 			continue;
@@ -1458,10 +1456,10 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
 		value = readl(reg);
 		if (value & BYT_DIRECT_IRQ_EN) {
 			clear_bit(i, valid_mask);
-			dev_dbg(dev, "excluding GPIO %d from IRQ domain\n", i);
+			dev_dbg(vg->dev, "excluding GPIO %d from IRQ domain\n", i);
 		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
 			byt_gpio_clear_triggering(vg, i);
-			dev_dbg(dev, "disabling GPIO %d\n", i);
+			dev_dbg(vg->dev, "disabling GPIO %d\n", i);
 		}
 	}
 }
@@ -1477,7 +1475,7 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 		reg = byt_gpio_reg(vg, base, BYT_INT_STAT_REG);
 
 		if (!reg) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Pin %i: could not retrieve irq status reg\n",
 				 base);
 			continue;
@@ -1488,7 +1486,7 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 		   might be misconfigured in bios */
 		value = readl(reg);
 		if (value)
-			dev_err(&vg->pdev->dev,
+			dev_err(vg->dev,
 				"GPIO interrupt error, pins misconfigured. INT_STAT%u: 0x%08x\n",
 				base / 32, value);
 	}
@@ -1499,7 +1497,7 @@ static int byt_gpio_irq_init_hw(struct gpio_chip *chip)
 static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
 {
 	struct byt_gpio *vg = gpiochip_get_data(chip);
-	struct device *dev = &vg->pdev->dev;
+	struct device *dev = vg->dev;
 	int ret;
 
 	ret = gpiochip_add_pin_range(chip, dev_name(dev), 0, 0, vg->soc_data->npins);
@@ -1511,6 +1509,7 @@ static int byt_gpio_add_pin_ranges(struct gpio_chip *chip)
 
 static int byt_gpio_probe(struct byt_gpio *vg)
 {
+	struct platform_device *pdev = to_platform_device(vg->dev);
 	struct gpio_chip *gc;
 	struct resource *irq_rc;
 	int ret;
@@ -1518,22 +1517,22 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 	/* Set up gpio chip */
 	vg->chip	= byt_gpio_chip;
 	gc		= &vg->chip;
-	gc->label	= dev_name(&vg->pdev->dev);
+	gc->label	= dev_name(vg->dev);
 	gc->base	= -1;
 	gc->can_sleep	= false;
 	gc->add_pin_ranges = byt_gpio_add_pin_ranges;
-	gc->parent	= &vg->pdev->dev;
+	gc->parent	= vg->dev;
 	gc->ngpio	= vg->soc_data->npins;
 
 #ifdef CONFIG_PM_SLEEP
-	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
+	vg->saved_context = devm_kcalloc(vg->dev, gc->ngpio,
 				       sizeof(*vg->saved_context), GFP_KERNEL);
 	if (!vg->saved_context)
 		return -ENOMEM;
 #endif
 
 	/* set up interrupts  */
-	irq_rc = platform_get_resource(vg->pdev, IORESOURCE_IRQ, 0);
+	irq_rc = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_rc && irq_rc->start) {
 		struct gpio_irq_chip *girq;
 
@@ -1550,7 +1549,7 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		girq->init_valid_mask = byt_init_irq_valid_mask;
 		girq->parent_handler = byt_gpio_irq_handler;
 		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(&vg->pdev->dev, girq->num_parents,
+		girq->parents = devm_kcalloc(vg->dev, girq->num_parents,
 					     sizeof(*girq->parents), GFP_KERNEL);
 		if (!girq->parents)
 			return -ENOMEM;
@@ -1559,9 +1558,9 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 		girq->handler = handle_bad_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
+	ret = devm_gpiochip_add_data(vg->dev, gc, vg);
 	if (ret) {
-		dev_err(&vg->pdev->dev, "failed adding byt-gpio chip\n");
+		dev_err(vg->dev, "failed adding byt-gpio chip\n");
 		return ret;
 	}
 
@@ -1571,10 +1570,11 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 static int byt_set_soc_data(struct byt_gpio *vg,
 			    const struct intel_pinctrl_soc_data *soc_data)
 {
+	struct platform_device *pdev = to_platform_device(vg->dev);
 	int i;
 
 	vg->soc_data = soc_data;
-	vg->communities_copy = devm_kcalloc(&vg->pdev->dev,
+	vg->communities_copy = devm_kcalloc(vg->dev,
 					    soc_data->ncommunities,
 					    sizeof(*vg->communities_copy),
 					    GFP_KERNEL);
@@ -1586,7 +1586,7 @@ static int byt_set_soc_data(struct byt_gpio *vg,
 
 		*comm = vg->soc_data->communities[i];
 
-		comm->pad_regs = devm_platform_ioremap_resource(vg->pdev, 0);
+		comm->pad_regs = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(comm->pad_regs))
 			return PTR_ERR(comm->pad_regs);
 	}
@@ -1628,7 +1628,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 	if (!vg)
 		return -ENOMEM;
 
-	vg->pdev = pdev;
+	vg->dev = &pdev->dev;
 	ret = byt_set_soc_data(vg, soc_data);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to set soc data\n");
@@ -1672,7 +1672,7 @@ static int byt_gpio_suspend(struct device *dev)
 
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Pin %i: could not retrieve conf0 register\n",
 				 i);
 			continue;
@@ -1704,7 +1704,7 @@ static int byt_gpio_resume(struct device *dev)
 
 		reg = byt_gpio_reg(vg, pin, BYT_CONF0_REG);
 		if (!reg) {
-			dev_warn(&vg->pdev->dev,
+			dev_warn(vg->dev,
 				 "Pin %i: could not retrieve conf0 register\n",
 				 i);
 			continue;
-- 
2.24.0

