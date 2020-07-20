Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B272262A0
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgGTOyk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:54:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgGTOyi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jul 2020 10:54:38 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CE2D22B4E;
        Mon, 20 Jul 2020 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595256877;
        bh=KHxz9t+8FOOhT2bgEpCh+cCxIFEM3aYfu3Mr44irGic=;
        h=From:To:Cc:Subject:Date:From;
        b=ceECXUVpFJePaukrP/YvG7DbA47RQx2PYZSFk3kdJ6mTaJDC8oaA7rNnjxCeoz60P
         ihnNQRLCisenLvSirgIHRnM9FQCRm5FGEUiZwVOuQY21nKpvyIchd8Prlqt7KmTs3D
         5j6XuKrwL7gsHW/WxKmceZq8l+G218Hg1voLhmhw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] pinctrl: samsung: Use bank name as irqchip name
Date:   Mon, 20 Jul 2020 16:54:12 +0200
Message-Id: <20200720145412.24221-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Use the bank name as the irqchip name. This name is later visible in
/proc/interrupts, what makes it possible to easily identify each
GPIO interrupt.

/proc/interrupts before this patch:
143:    0     exynos4210_wkup_irq_chip   7 Edge      hdmi
144:    0     exynos4210_wkup_irq_chip   6 Level     wm8994
145:    1     exynos4210_wkup_irq_chip   7 Edge      max77686-pmic, max77686-rtc
146:    1     exynos_gpio_irq_chip   3 Edge      3-0048

/proc/interrupts after this patch:
143:    0     gpx3   7 Edge      hdmi
144:    0     gpx3   6 Level     wm8994
145:    1     gpx0   7 Edge      max77686-pmic, max77686-rtc
146:    1     gpm2   3 Edge      3-0048

Handling of the eint_wake_mask_value has been reworked, because each bank
has now its own exynos_irq_chip structure allocated.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Hi Linus,

I have only one patch queued for Samsung pinctrl. Can you apply it
directly?

Best regards,
Krzysztof

---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 58 +++++++++++++-----------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 84501c785473..b9ea09fabf84 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -38,7 +38,7 @@ struct exynos_irq_chip {
 	u32 eint_con;
 	u32 eint_mask;
 	u32 eint_pend;
-	u32 eint_wake_mask_value;
+	u32 *eint_wake_mask_value;
 	u32 eint_wake_mask_reg;
 	void (*set_eint_wakeup_mask)(struct samsung_pinctrl_drv_data *drvdata,
 				     struct exynos_irq_chip *irq_chip);
@@ -207,7 +207,7 @@ static void exynos_irq_release_resources(struct irq_data *irqd)
 /*
  * irq_chip for gpio interrupts.
  */
-static struct exynos_irq_chip exynos_gpio_irq_chip = {
+static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst = {
 	.chip = {
 		.name = "exynos_gpio_irq_chip",
 		.irq_unmask = exynos_irq_unmask,
@@ -274,7 +274,7 @@ struct exynos_eint_gpio_save {
  * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
  * @d: driver data of samsung pinctrl driver.
  */
-int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
+__init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct samsung_pin_bank *bank;
 	struct device *dev = d->dev;
@@ -297,6 +297,15 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 	for (i = 0; i < d->nr_banks; ++i, ++bank) {
 		if (bank->eint_type != EINT_TYPE_GPIO)
 			continue;
+
+		bank->irq_chip = devm_kmemdup(dev, &exynos_gpio_irq_chip,
+					   sizeof(*bank->irq_chip), GFP_KERNEL);
+		if (!bank->irq_chip) {
+			ret = -ENOMEM;
+			goto err_domains;
+		}
+		bank->irq_chip->chip.name = bank->name;
+
 		bank->irq_domain = irq_domain_add_linear(bank->of_node,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
@@ -313,7 +322,6 @@ int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 			goto err_domains;
 		}
 
-		bank->irq_chip = &exynos_gpio_irq_chip;
 	}
 
 	return 0;
@@ -338,9 +346,9 @@ static int exynos_wkup_irq_set_wake(struct irq_data *irqd, unsigned int on)
 	pr_info("wake %s for irq %d\n", on ? "enabled" : "disabled", irqd->irq);
 
 	if (!on)
-		our_chip->eint_wake_mask_value |= bit;
+		*our_chip->eint_wake_mask_value |= bit;
 	else
-		our_chip->eint_wake_mask_value &= ~bit;
+		*our_chip->eint_wake_mask_value &= ~bit;
 
 	return 0;
 }
@@ -360,10 +368,10 @@ exynos_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 	pmu_regs = drvdata->retention_ctrl->priv;
 	dev_info(drvdata->dev,
 		 "Setting external wakeup interrupt mask: 0x%x\n",
-		 irq_chip->eint_wake_mask_value);
+		 *irq_chip->eint_wake_mask_value);
 
 	regmap_write(pmu_regs, irq_chip->eint_wake_mask_reg,
-		     irq_chip->eint_wake_mask_value);
+		     *irq_chip->eint_wake_mask_value);
 }
 
 static void
@@ -382,10 +390,11 @@ s5pv210_pinctrl_set_eint_wakeup_mask(struct samsung_pinctrl_drv_data *drvdata,
 
 	clk_base = (void __iomem *) drvdata->retention_ctrl->priv;
 
-	__raw_writel(irq_chip->eint_wake_mask_value,
+	__raw_writel(*irq_chip->eint_wake_mask_value,
 		     clk_base + irq_chip->eint_wake_mask_reg);
 }
 
+static u32 eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED;
 /*
  * irq_chip for wakeup interrupts
  */
@@ -403,7 +412,7 @@ static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+	.eint_wake_mask_value = &eint_wake_mask_value,
 	/* Only differences with exynos4210_wkup_irq_chip: */
 	.eint_wake_mask_reg = S5PV210_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = s5pv210_pinctrl_set_eint_wakeup_mask,
@@ -423,7 +432,7 @@ static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+	.eint_wake_mask_value = &eint_wake_mask_value,
 	.eint_wake_mask_reg = EXYNOS_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
@@ -442,7 +451,7 @@ static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst = {
 	.eint_con = EXYNOS7_WKUP_ECON_OFFSET,
 	.eint_mask = EXYNOS7_WKUP_EMASK_OFFSET,
 	.eint_pend = EXYNOS7_WKUP_EPEND_OFFSET,
-	.eint_wake_mask_value = EXYNOS_EINT_WAKEUP_MASK_DISABLED,
+	.eint_wake_mask_value = &eint_wake_mask_value,
 	.eint_wake_mask_reg = EXYNOS5433_EINT_WAKEUP_MASK,
 	.set_eint_wakeup_mask = exynos_pinctrl_set_eint_wakeup_mask,
 };
@@ -513,7 +522,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
  * exynos_eint_wkup_init() - setup handling of external wakeup interrupts.
  * @d: driver data of samsung pinctrl driver.
  */
-int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
+__init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
 	struct device_node *wkup_np = NULL;
@@ -521,7 +530,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 	struct samsung_pin_bank *bank;
 	struct exynos_weint_data *weint_data;
 	struct exynos_muxed_weint_data *muxed_data;
-	struct exynos_irq_chip *irq_chip;
+	const struct exynos_irq_chip *irq_chip;
 	unsigned int muxed_banks = 0;
 	unsigned int i;
 	int idx, irq;
@@ -531,12 +540,7 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 		match = of_match_node(exynos_wkup_irq_ids, np);
 		if (match) {
-			irq_chip = kmemdup(match->data,
-				sizeof(*irq_chip), GFP_KERNEL);
-			if (!irq_chip) {
-				of_node_put(np);
-				return -ENOMEM;
-			}
+			irq_chip = match->data;
 			wkup_np = np;
 			break;
 		}
@@ -549,6 +553,14 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		if (bank->eint_type != EINT_TYPE_WKUP)
 			continue;
 
+		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
+					      GFP_KERNEL);
+		if (!bank->irq_chip) {
+			of_node_put(wkup_np);
+			return -ENOMEM;
+		}
+		bank->irq_chip->chip.name = bank->name;
+
 		bank->irq_domain = irq_domain_add_linear(bank->of_node,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
@@ -557,8 +569,6 @@ int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENXIO;
 		}
 
-		bank->irq_chip = irq_chip;
-
 		if (!of_find_property(bank->of_node, "interrupts", NULL)) {
 			bank->eint_type = EINT_TYPE_WKUP_MUX;
 			++muxed_banks;
@@ -657,10 +667,6 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
 				irq_chip = bank->irq_chip;
 				irq_chip->set_eint_wakeup_mask(drvdata,
 							       irq_chip);
-			} else if (bank->irq_chip != irq_chip) {
-				dev_warn(drvdata->dev,
-					 "More than one external wakeup interrupt chip configured (bank: %s). This is not supported by hardware nor by driver.\n",
-					 bank->name);
 			}
 		}
 	}
-- 
2.17.1

