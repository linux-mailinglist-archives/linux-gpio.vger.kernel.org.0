Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60D5813A313
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 09:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgANIkD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 03:40:03 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41554 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgANIkD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 03:40:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id bd4so4953315plb.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 00:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cmRHW7xaszw0z6LuO2XN1PiyQlaOyRn78JrJJ835zUo=;
        b=lqRJaG4F68zMDE8katwfrw4uiIH3fHDrp3sIgQju+KkYIUfU33GbhifajwwGHR/aVH
         4iJzfJOJrY1v1VPTaSz2kjl80JJyzrAS/IDMPkMtMnqHa+t0hgDUZLODWobwOZncufJ9
         9bL/kAAKeYbsICmR5mn8z4LAGsISK3pY5DtUgHkHdXnqC9pW1s87A8Qq8A0nTYphQTJl
         4GC+nFmsy2Hfk7vGDCwOYOT95FKPy6IV005QAbCQSZjeNDbnw0h7x1roe36ix0M5MbZN
         uY2pAjq8rA9VSFvWN25J4UjH+TgUds43IA8ECe1d92rCOyCu7D5X+0yFLidMsN7NMkAq
         nRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cmRHW7xaszw0z6LuO2XN1PiyQlaOyRn78JrJJ835zUo=;
        b=Uyw+7hvMMAKUKwK+k0Xi6dZ091FmtVZYPq58tmNAxYjJ3sM6VZcnCTgA/1FjM+hNcb
         2moGQpWTiO3VYJSEWHjupeo1t/k4eiHTD7/17OqQIAesSALd0izbNSP8epSdzx5YjBD4
         v4Ta5RBxl6l7j6aAIaTedWeGRWxPzdNucKEggsItcw9yueSLreuCUpOAux97UXFQ49DI
         YxW3i6QEKYR3quNGkO8YBGw6k4Rph5tjjoL3OO4OLVptPAIcopi06KZwdW6QzkIZE4DB
         MoWnnE3zp9DmPI28GIMnWhVg17IDxBnLneO7OX+7HTMDfo73VOzCONaKdGj7AyYSAQxa
         mLDA==
X-Gm-Message-State: APjAAAWR9mG74UG/B4al+psl1ydZ9jdCzZo2WOcRcH3TT8GepvcugN9s
        MDClY6g17TBB2sbi21/h8eX5FpjlEro=
X-Google-Smtp-Source: APXvYqw1hy+uiU8UrFNPl6vMUcamBwna3jCkdBTxilevbU1LYMqAIB0IGzaygRvqTGTpRESZR0ZRdA==
X-Received: by 2002:a17:90a:db48:: with SMTP id u8mr27409045pjx.54.1578991202066;
        Tue, 14 Jan 2020 00:40:02 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id o16sm16284910pgl.58.2020.01.14.00.39.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:40:01 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Robert Richter <rrichter@marvell.com>,
        Kevin Hao <haokexin@gmail.com>
Subject: [PATCH 1/4] Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP"
Date:   Tue, 14 Jan 2020 16:28:18 +0800
Message-Id: <20200114082821.14015-2-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20200114082821.14015-1-haokexin@gmail.com>
References: <20200114082821.14015-1-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit a7fc89f9d5fcc10a5474cfe555f5a9e5df8b0f1f because
there are some bugs in this commit, and we don't have a simple way to
fix these bugs. So revert this commit to make the thunderx gpio work
on the stable kernel at least. We will switch to GPIOLIB_IRQCHIP
for thunderx gpio by following patches.

Fixes: a7fc89f9d5fc ("gpio: thunderx: Switch to GPIOLIB_IRQCHIP")
Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/Kconfig         |   1 -
 drivers/gpio/gpio-thunderx.c | 163 ++++++++++++++++++++++++++++---------------
 2 files changed, 107 insertions(+), 57 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 9e99d09a64c6..ce65919dee12 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -571,7 +571,6 @@ config GPIO_THUNDERX
 	tristate "Cavium ThunderX/OCTEON-TX GPIO"
 	depends on ARCH_THUNDER || (64BIT && COMPILE_TEST)
 	depends on PCI_MSI
-	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	help
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index d08d86a22b1f..462770479045 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -53,6 +53,7 @@ struct thunderx_line {
 struct thunderx_gpio {
 	struct gpio_chip	chip;
 	u8 __iomem		*register_base;
+	struct irq_domain	*irqd;
 	struct msix_entry	*msix_entries;	/* per line MSI-X */
 	struct thunderx_line	*line_entries;	/* per line irq info */
 	raw_spinlock_t		lock;
@@ -285,60 +286,54 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 	}
 }
 
-static void thunderx_gpio_irq_ack(struct irq_data *d)
+static void thunderx_gpio_irq_ack(struct irq_data *data)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 
 	writeq(GPIO_INTR_INTR,
-	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
+	       txline->txgpio->register_base + intr_reg(txline->line));
 }
 
-static void thunderx_gpio_irq_mask(struct irq_data *d)
+static void thunderx_gpio_irq_mask(struct irq_data *data)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 
 	writeq(GPIO_INTR_ENA_W1C,
-	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
+	       txline->txgpio->register_base + intr_reg(txline->line));
 }
 
-static void thunderx_gpio_irq_mask_ack(struct irq_data *d)
+static void thunderx_gpio_irq_mask_ack(struct irq_data *data)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 
 	writeq(GPIO_INTR_ENA_W1C | GPIO_INTR_INTR,
-	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
+	       txline->txgpio->register_base + intr_reg(txline->line));
 }
 
-static void thunderx_gpio_irq_unmask(struct irq_data *d)
+static void thunderx_gpio_irq_unmask(struct irq_data *data)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
 
 	writeq(GPIO_INTR_ENA_W1S,
-	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
+	       txline->txgpio->register_base + intr_reg(txline->line));
 }
 
-static int thunderx_gpio_irq_set_type(struct irq_data *d,
+static int thunderx_gpio_irq_set_type(struct irq_data *data,
 				      unsigned int flow_type)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
-	struct thunderx_line *txline =
-		&txgpio->line_entries[irqd_to_hwirq(d)];
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct thunderx_gpio *txgpio = txline->txgpio;
 	u64 bit_cfg;
 
-	irqd_set_trigger_type(d, flow_type);
+	irqd_set_trigger_type(data, flow_type);
 
 	bit_cfg = txline->fil_bits | GPIO_BIT_CFG_INT_EN;
 
 	if (flow_type & IRQ_TYPE_EDGE_BOTH) {
-		irq_set_handler_locked(d, handle_fasteoi_ack_irq);
+		irq_set_handler_locked(data, handle_fasteoi_ack_irq);
 		bit_cfg |= GPIO_BIT_CFG_INT_TYPE;
 	} else {
-		irq_set_handler_locked(d, handle_fasteoi_mask_irq);
+		irq_set_handler_locked(data, handle_fasteoi_mask_irq);
 	}
 
 	raw_spin_lock(&txgpio->lock);
@@ -367,6 +362,33 @@ static void thunderx_gpio_irq_disable(struct irq_data *data)
 	irq_chip_disable_parent(data);
 }
 
+static int thunderx_gpio_irq_request_resources(struct irq_data *data)
+{
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct thunderx_gpio *txgpio = txline->txgpio;
+	int r;
+
+	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
+	if (r)
+		return r;
+
+	r = irq_chip_request_resources_parent(data);
+	if (r)
+		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
+
+	return r;
+}
+
+static void thunderx_gpio_irq_release_resources(struct irq_data *data)
+{
+	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct thunderx_gpio *txgpio = txline->txgpio;
+
+	irq_chip_release_resources_parent(data);
+
+	gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
+}
+
 /*
  * Interrupts are chained from underlying MSI-X vectors.  We have
  * these irq_chip functions to be able to handle level triggering
@@ -383,24 +405,50 @@ static struct irq_chip thunderx_gpio_irq_chip = {
 	.irq_unmask		= thunderx_gpio_irq_unmask,
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
+	.irq_request_resources	= thunderx_gpio_irq_request_resources,
+	.irq_release_resources	= thunderx_gpio_irq_release_resources,
 	.irq_set_type		= thunderx_gpio_irq_set_type,
 
 	.flags			= IRQCHIP_SET_TYPE_MASKED
 };
 
-static int thunderx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
-					       unsigned int child,
-					       unsigned int child_type,
-					       unsigned int *parent,
-					       unsigned int *parent_type)
+static int thunderx_gpio_irq_translate(struct irq_domain *d,
+				       struct irq_fwspec *fwspec,
+				       irq_hw_number_t *hwirq,
+				       unsigned int *type)
 {
-	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
-
-	*parent = txgpio->base_msi + (2 * child);
-	*parent_type = IRQ_TYPE_LEVEL_HIGH;
+	struct thunderx_gpio *txgpio = d->host_data;
+
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+	if (fwspec->param[0] >= txgpio->chip.ngpio)
+		return -EINVAL;
+	*hwirq = fwspec->param[0];
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
 	return 0;
 }
 
+static int thunderx_gpio_irq_alloc(struct irq_domain *d, unsigned int virq,
+				   unsigned int nr_irqs, void *arg)
+{
+	struct thunderx_line *txline = arg;
+
+	return irq_domain_set_hwirq_and_chip(d, virq, txline->line,
+					     &thunderx_gpio_irq_chip, txline);
+}
+
+static const struct irq_domain_ops thunderx_gpio_irqd_ops = {
+	.alloc		= thunderx_gpio_irq_alloc,
+	.translate	= thunderx_gpio_irq_translate
+};
+
+static int thunderx_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
+
+	return irq_find_mapping(txgpio->irqd, offset);
+}
+
 static int thunderx_gpio_probe(struct pci_dev *pdev,
 			       const struct pci_device_id *id)
 {
@@ -408,7 +456,6 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	struct device *dev = &pdev->dev;
 	struct thunderx_gpio *txgpio;
 	struct gpio_chip *chip;
-	struct gpio_irq_chip *girq;
 	int ngpio, i;
 	int err = 0;
 
@@ -453,8 +500,8 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	}
 
 	txgpio->msix_entries = devm_kcalloc(dev,
-					    ngpio, sizeof(struct msix_entry),
-					    GFP_KERNEL);
+					  ngpio, sizeof(struct msix_entry),
+					  GFP_KERNEL);
 	if (!txgpio->msix_entries) {
 		err = -ENOMEM;
 		goto out;
@@ -495,6 +542,27 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	if (err < 0)
 		goto out;
 
+	/*
+	 * Push GPIO specific irqdomain on hierarchy created as a side
+	 * effect of the pci_enable_msix()
+	 */
+	txgpio->irqd = irq_domain_create_hierarchy(irq_get_irq_data(txgpio->msix_entries[0].vector)->domain,
+						   0, 0, of_node_to_fwnode(dev->of_node),
+						   &thunderx_gpio_irqd_ops, txgpio);
+	if (!txgpio->irqd) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	/* Push on irq_data and the domain for each line. */
+	for (i = 0; i < ngpio; i++) {
+		err = irq_domain_push_irq(txgpio->irqd,
+					  txgpio->msix_entries[i].vector,
+					  &txgpio->line_entries[i]);
+		if (err < 0)
+			dev_err(dev, "irq_domain_push_irq: %d\n", err);
+	}
+
 	chip->label = KBUILD_MODNAME;
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
@@ -509,28 +577,11 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	chip->set = thunderx_gpio_set;
 	chip->set_multiple = thunderx_gpio_set_multiple;
 	chip->set_config = thunderx_gpio_set_config;
-	girq = &chip->irq;
-	girq->chip = &thunderx_gpio_irq_chip;
-	girq->fwnode = of_node_to_fwnode(dev->of_node);
-	girq->parent_domain =
-		irq_get_irq_data(txgpio->msix_entries[0].vector)->domain;
-	girq->child_to_parent_hwirq = thunderx_gpio_child_to_parent_hwirq;
-	girq->handler = handle_bad_irq;
-	girq->default_type = IRQ_TYPE_NONE;
-
+	chip->to_irq = thunderx_gpio_to_irq;
 	err = devm_gpiochip_add_data(dev, chip, txgpio);
 	if (err)
 		goto out;
 
-	/* Push on irq_data and the domain for each line. */
-	for (i = 0; i < ngpio; i++) {
-		err = irq_domain_push_irq(chip->irq.domain,
-					  txgpio->msix_entries[i].vector,
-					  chip);
-		if (err < 0)
-			dev_err(dev, "irq_domain_push_irq: %d\n", err);
-	}
-
 	dev_info(dev, "ThunderX GPIO: %d lines with base %d.\n",
 		 ngpio, chip->base);
 	return 0;
@@ -545,10 +596,10 @@ static void thunderx_gpio_remove(struct pci_dev *pdev)
 	struct thunderx_gpio *txgpio = pci_get_drvdata(pdev);
 
 	for (i = 0; i < txgpio->chip.ngpio; i++)
-		irq_domain_pop_irq(txgpio->chip.irq.domain,
+		irq_domain_pop_irq(txgpio->irqd,
 				   txgpio->msix_entries[i].vector);
 
-	irq_domain_remove(txgpio->chip.irq.domain);
+	irq_domain_remove(txgpio->irqd);
 
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.14.4

