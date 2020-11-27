Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C96E2C677C
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 15:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbgK0OJE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 09:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730725AbgK0OJD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 09:09:03 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2E8C0613D1;
        Fri, 27 Nov 2020 06:09:03 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id x22so5218984wmc.5;
        Fri, 27 Nov 2020 06:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qf+5RFgQt3T0AFOApT+aQ52+Q4U6KAHXOm4T5x1A4EU=;
        b=HSYNDQN0hlQZMxCimZ9fH5qlz2aAvsv/XCe9uxdZ4p7HgVRY5GdvMCjF/UmBtiLs5L
         3IeNqFec3H7QPmsW2KKFo+qxSwh+4vtYPCEUcjYjZ+rZr/sNcm3RmTQ/DA4neYgwGm2q
         pfz2PVMPb/rRhyksdf4H24aXYDc3XOowlqfMyTpoxbT5qywxVAv/FE9AqqemZiPvn4gq
         bxoVmpj8cAdMX6qpcekBzM6py3vHwA/agIhQrLzB5uh7xyaY/JWzodLrAuVZNWaHBqkK
         3634FE2/XhfwmmjKCcnaAPf7jmfWGyuUPqSXisLqI0K6XZsSC3Gm+3EE5Zn8YHDaY7fW
         RYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qf+5RFgQt3T0AFOApT+aQ52+Q4U6KAHXOm4T5x1A4EU=;
        b=S6tZSCn/haH5xpaRmhwFG1jcFTGEz/8VbU26+L45jv2qhu48PBAAG5HWCr54U6J/Gx
         1pRYG+q8d+/cyCcgjDFBWRvlQxmNBrN3RTstBXRhGDTFEjbyipcm9SMrw/WMFxEbplJw
         FB5levLo8jiQNVZBTO7JXzN3AmwZOIkG8tIC4N92+Nj1sW6RH4kdn3s7ZmGfOMBIejRd
         TDmg07T38Oc9nfu9iy5kD/d/Lyk1RxFhtcGW07fCscanLxljl0aZU3cw096CGPwicU6x
         1epfaIDu6CbCi0NA99+KcuHvS/Eh3JkDPFx00zo6TNQ+1LaY1I4VdyPVP/1aJt1r3PrX
         Qezg==
X-Gm-Message-State: AOAM531EJviT8KpXvb86KfmyB/+lFAgBQAT0rX51Ibk/JhAnjx4lyX/I
        SrTCGzknpdZST8jDRyI2c/IqIXh1kFo=
X-Google-Smtp-Source: ABdhPJy9eZK7/KPmZJyg5EpE2wWPt0icMD7QLuB5qO2waSiwb/PBwVqw5N9ZTUsiZfrLFXccfZIHyw==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr9402178wmf.189.1606486141920;
        Fri, 27 Nov 2020 06:09:01 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h4sm14631375wrq.3.2020.11.27.06.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 06:09:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] gpio: tegra: Convert to gpio_irq_chip
Date:   Fri, 27 Nov 2020 15:08:52 +0100
Message-Id: <20201127140852.123192-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127140852.123192-1-thierry.reding@gmail.com>
References: <20201127140852.123192-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra GPIO driver to use the gpio_irq_chip infrastructure.
This allows a bit of boiler plate to be removed and while at it enables
support for hierarchical domains, which is useful to support PMC wake
events on Tegra210 and earlier.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 218 +++++++++++++++++++++++++-------------
 1 file changed, 146 insertions(+), 72 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index e19ebff6018c..b8a4fd07c559 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -60,7 +60,6 @@ struct tegra_gpio_info;
 
 struct tegra_gpio_bank {
 	unsigned int bank;
-	unsigned int irq;
 
 	/*
 	 * IRQ-core code uses raw locking, and thus, nested locking also
@@ -81,7 +80,6 @@ struct tegra_gpio_bank {
 	u32 dbc_enb[4];
 #endif
 	u32 dbc_cnt[4];
-	struct tegra_gpio_info *tgi;
 };
 
 struct tegra_gpio_soc_config {
@@ -93,12 +91,12 @@ struct tegra_gpio_soc_config {
 struct tegra_gpio_info {
 	struct device				*dev;
 	void __iomem				*regs;
-	struct irq_domain			*irq_domain;
 	struct tegra_gpio_bank			*bank_info;
 	const struct tegra_gpio_soc_config	*soc;
 	struct gpio_chip			gc;
 	struct irq_chip				ic;
 	u32					bank_count;
+	unsigned int				*irqs;
 };
 
 static inline void tegra_gpio_writel(struct tegra_gpio_info *tgi,
@@ -274,17 +272,10 @@ static int tegra_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return tegra_gpio_set_debounce(chip, offset, debounce);
 }
 
-static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
-
-	return irq_find_mapping(tgi->irq_domain, offset);
-}
-
 static void tegra_gpio_irq_ack(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_writel(tgi, 1 << GPIO_BIT(gpio), GPIO_INT_CLR(tgi, gpio));
@@ -292,8 +283,8 @@ static void tegra_gpio_irq_ack(struct irq_data *d)
 
 static void tegra_gpio_irq_mask(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 0);
@@ -301,8 +292,8 @@ static void tegra_gpio_irq_mask(struct irq_data *d)
 
 static void tegra_gpio_irq_unmask(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_mask_write(tgi, GPIO_MSK_INT_ENB(tgi, gpio), gpio, 1);
@@ -311,11 +302,14 @@ static void tegra_gpio_irq_unmask(struct irq_data *d)
 static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	unsigned int gpio = d->hwirq, port = GPIO_PORT(gpio), lvl_type;
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+	struct tegra_gpio_bank *bank;
 	unsigned long flags;
-	u32 val;
 	int ret;
+	u32 val;
+
+	bank = &tgi->bank_info[GPIO_BANK(d->hwirq)];
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -367,13 +361,16 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
 		irq_set_handler_locked(d, handle_edge_irq);
 
-	return 0;
+	if (d->parent_data)
+		ret = irq_chip_set_type_parent(d, type);
+
+	return ret;
 }
 
 static void tegra_gpio_irq_shutdown(struct irq_data *d)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 	unsigned int gpio = d->hwirq;
 
 	tegra_gpio_irq_mask(d);
@@ -382,13 +379,25 @@ static void tegra_gpio_irq_shutdown(struct irq_data *d)
 
 static void tegra_gpio_irq_handler(struct irq_desc *desc)
 {
-	unsigned int port, pin, gpio;
+	struct tegra_gpio_info *tgi = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_domain *domain = tgi->gc.irq.domain;
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct tegra_gpio_bank *bank = NULL;
+	unsigned int port, pin, gpio, i;
 	bool unmasked = false;
-	u32 lvl;
 	unsigned long sta;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct tegra_gpio_bank *bank = irq_desc_get_handler_data(desc);
-	struct tegra_gpio_info *tgi = bank->tgi;
+	u32 lvl;
+
+	for (i = 0; i < tgi->bank_count; i++) {
+		if (tgi->irqs[i] == irq) {
+			bank = &tgi->bank_info[i];
+			break;
+		}
+	}
+
+	if (WARN_ON(bank == NULL))
+		return;
 
 	chained_irq_enter(chip, desc);
 
@@ -411,14 +420,44 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 				chained_irq_exit(chip, desc);
 			}
 
-			generic_handle_irq(irq_find_mapping(tgi->irq_domain,
-							    gpio + pin));
+			irq = irq_find_mapping(domain, gpio + pin);
+			if (WARN_ON(irq == 0))
+				continue;
+
+			generic_handle_irq(irq);
 		}
 	}
 
 	if (!unmasked)
 		chained_irq_exit(chip, desc);
+}
+
+static int tegra_gpio_child_to_parent_hwirq(struct gpio_chip *chip, unsigned int hwirq,
+					    unsigned int type, unsigned int *parent_hwirq,
+					    unsigned int *parent_type)
+{
+	*parent_hwirq = chip->irq.child_offset_to_irq(chip, hwirq);
+	*parent_type = type;
 
+	return 0;
+}
+
+static void *tegra_gpio_populate_parent_fwspec(struct gpio_chip *chip, unsigned int parent_hwirq,
+					       unsigned int parent_type)
+{
+	struct irq_fwspec *fwspec;
+
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
+	fwspec->param_count = 3;
+	fwspec->param[0] = 0;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = parent_type;
+
+	return fwspec;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -497,14 +536,13 @@ static int tegra_gpio_suspend(struct device *dev)
 
 static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
-	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+	struct tegra_gpio_bank *bank;
 	unsigned int gpio = d->hwirq;
 	u32 port, bit, mask;
-	int err;
 
-	err = irq_set_irq_wake(bank->irq, enable);
-	if (err)
-		return err;
+	bank = &tgi->bank_info[GPIO_BANK(d->hwirq)];
 
 	port = GPIO_PORT(gpio);
 	bit = GPIO_BIT(gpio);
@@ -515,10 +553,41 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	else
 		bank->wake_enb[port] &= ~mask;
 
+	if (d->parent_data)
+		return irq_chip_set_wake_parent(d, enable);
+
 	return 0;
 }
 #endif
 
+static int tegra_gpio_irq_set_affinity(struct irq_data *data, const struct cpumask *dest,
+				       bool force)
+{
+	if (data->parent_data)
+		return irq_chip_set_affinity_parent(data, dest, force);
+
+	return -EINVAL;
+}
+
+static int tegra_gpio_irq_request_resources(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+
+	tegra_gpio_enable(tgi, d->hwirq);
+
+	return gpiochip_reqres_irq(chip, d->hwirq);
+}
+
+static void tegra_gpio_irq_release_resources(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
+
+	gpiochip_relres_irq(chip, d->hwirq);
+	tegra_gpio_enable(tgi, d->hwirq);
+}
+
 #ifdef	CONFIG_DEBUG_FS
 
 #include <linux/debugfs.h>
@@ -568,14 +637,18 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
-static struct lock_class_key gpio_lock_class;
-static struct lock_class_key gpio_request_class;
+static const struct of_device_id tegra_pmc_of_match[] = {
+	{ .compatible = "nvidia,tegra210-pmc", },
+	{ /* sentinel */ },
+};
 
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
-	struct tegra_gpio_info *tgi;
 	struct tegra_gpio_bank *bank;
-	unsigned int gpio, i, j;
+	struct tegra_gpio_info *tgi;
+	struct gpio_irq_chip *irq;
+	struct device_node *np;
+	unsigned int i, j;
 	int ret;
 
 	tgi = devm_kzalloc(&pdev->dev, sizeof(*tgi), GFP_KERNEL);
@@ -604,7 +677,6 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	tgi->gc.direction_output	= tegra_gpio_direction_output;
 	tgi->gc.set			= tegra_gpio_set;
 	tgi->gc.get_direction		= tegra_gpio_get_direction;
-	tgi->gc.to_irq			= tegra_gpio_to_irq;
 	tgi->gc.base			= 0;
 	tgi->gc.ngpio			= tgi->bank_count * 32;
 	tgi->gc.parent			= &pdev->dev;
@@ -619,6 +691,9 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
 #endif
+	tgi->ic.irq_set_affinity	= tegra_gpio_irq_set_affinity;
+	tgi->ic.irq_request_resources	= tegra_gpio_irq_request_resources;
+	tgi->ic.irq_release_resources	= tegra_gpio_irq_release_resources;
 
 	platform_set_drvdata(pdev, tgi);
 
@@ -630,11 +705,9 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	if (!tgi->bank_info)
 		return -ENOMEM;
 
-	tgi->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
-						tgi->gc.ngpio,
-						&irq_domain_simple_ops, NULL);
-	if (!tgi->irq_domain)
-		return -ENODEV;
+	tgi->irqs = devm_kcalloc(&pdev->dev, tgi->bank_count, sizeof(*tgi->irqs), GFP_KERNEL);
+	if (!tgi->irqs)
+		return -ENOMEM;
 
 	for (i = 0; i < tgi->bank_count; i++) {
 		ret = platform_get_irq(pdev, i);
@@ -643,8 +716,34 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 		bank = &tgi->bank_info[i];
 		bank->bank = i;
-		bank->irq = ret;
-		bank->tgi = tgi;
+
+		tgi->irqs[i] = ret;
+
+		for (j = 0; j < 4; j++) {
+			raw_spin_lock_init(&bank->lvl_lock[j]);
+			spin_lock_init(&bank->dbc_lock[j]);
+		}
+	}
+
+	irq = &tgi->gc.irq;
+	irq->chip = &tgi->ic;
+	irq->fwnode = of_node_to_fwnode(pdev->dev.of_node);
+	irq->child_to_parent_hwirq = tegra_gpio_child_to_parent_hwirq;
+	irq->populate_parent_alloc_arg = tegra_gpio_populate_parent_fwspec;
+	irq->handler = handle_simple_irq;
+	irq->default_type = IRQ_TYPE_NONE;
+	irq->parent_handler = tegra_gpio_irq_handler;
+	irq->parent_handler_data = tgi;
+	irq->num_parents = tgi->bank_count;
+	irq->parents = tgi->irqs;
+
+	np = of_find_matching_node(NULL, tegra_pmc_of_match);
+	if (np) {
+		irq->parent_domain = irq_find_host(np);
+		of_node_put(np);
+
+		if (!irq->parent_domain)
+			return -EPROBE_DEFER;
 	}
 
 	tgi->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -660,33 +759,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &tgi->gc, tgi);
-	if (ret < 0) {
-		irq_domain_remove(tgi->irq_domain);
+	if (ret < 0)
 		return ret;
-	}
-
-	for (gpio = 0; gpio < tgi->gc.ngpio; gpio++) {
-		int irq = irq_create_mapping(tgi->irq_domain, gpio);
-		/* No validity check; all Tegra GPIOs are valid IRQs */
-
-		bank = &tgi->bank_info[GPIO_BANK(gpio)];
-
-		irq_set_chip_data(irq, bank);
-		irq_set_lockdep_class(irq, &gpio_lock_class, &gpio_request_class);
-		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
-	}
-
-	for (i = 0; i < tgi->bank_count; i++) {
-		bank = &tgi->bank_info[i];
-
-		irq_set_chained_handler_and_data(bank->irq,
-						 tegra_gpio_irq_handler, bank);
-
-		for (j = 0; j < 4; j++) {
-			raw_spin_lock_init(&bank->lvl_lock[j]);
-			spin_lock_init(&bank->dbc_lock[j]);
-		}
-	}
 
 	tegra_gpio_debuginit(tgi);
 
-- 
2.29.2

