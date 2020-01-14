Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6CCE13A319
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 09:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgANIk2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 03:40:28 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39323 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728819AbgANIk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 03:40:27 -0500
Received: by mail-pl1-f196.google.com with SMTP id g6so4958755plp.6
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 00:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LW23/JMCyQEMDTbvdZaUJMd36ZXaQbBxWazIzMf6tFc=;
        b=caBZG7DIymtLJAJG+6Du6bJjrMFnThLb3p4gIJvyx8mRyf/8Kswd/lbmgwrsDzHphK
         YlsKWtg1HjGWNrfYHEvOpGUCB/jT3f4DlbTbUEgK3GLQe0xTEE40AvHtAa8uv9SstlCK
         waVUXhzav7UFuJuzdEwwGtthIPskC2xb8xkkFJuV694qxxpcAf95WpQJ7dnchIuIfMoW
         Dp3SwzevLhsBcNkMML3mThqCaziiO2eDxowCKHcDkFEHaTAb6CpdO6uKVew9itXJq6zq
         d1Zss3CzLovfLidrOl5xio4PtHwJZ9dlB0xKkSDyPKx8RJK6l/ZKB15a/Wwf/BjMxlWn
         Ne9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LW23/JMCyQEMDTbvdZaUJMd36ZXaQbBxWazIzMf6tFc=;
        b=kGiMXd0V+k5p9Xq3teqUNeeCsq8loDRiOK50H9oHzHeiN/fyCMJdA3E4DeMnLuQ8P9
         iOzHeVdHhMH6iy9UcdDT+4vPPMAFJ6HNyvpCfNd7kj9E/Jnbqhp44LI4ogSN0j/h/s3z
         Wv7mIsgHtGK0OUclL8/GewPCQIpZpEL+6+GSm+44akbPvJMkSzz/waMdH/Yq0b50GyRf
         akW4+r61UmqBkAIFjAUF0xvxmLtm/CjenElvHhbb2nknGezmRKQFGJQRCB2mVGwvOG17
         w+fjRDAwxxX6jNt9C2gzKLtjb3BE0G7jICjCDWP31HdAFM2HySAaZadSc3BzdMAuZmPg
         4t7g==
X-Gm-Message-State: APjAAAXFmfwqWa5tJG9yzgTeU1WAsoyyE0yH+9Z0v+gDvoaf+W5NbwPW
        nlQaX5q0jiyDZ3Tum9hHATH1HGY93rg=
X-Google-Smtp-Source: APXvYqwQIgxQ+r1mPiriNAktyR310vLVPibr2bqTQizGb1i+jlwIpk3EoXjqoB7Nn1G1XAYrpFg6/Q==
X-Received: by 2002:a17:902:7292:: with SMTP id d18mr16647751pll.205.1578991226971;
        Tue, 14 Jan 2020 00:40:26 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id o16sm16284910pgl.58.2020.01.14.00.40.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 00:40:26 -0800 (PST)
From:   Kevin Hao <haokexin@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Robert Richter <rrichter@marvell.com>,
        Kevin Hao <haokexin@gmail.com>
Subject: [PATCH 4/4] gpio: thunderx: Switch to GPIOLIB_IRQCHIP
Date:   Tue, 14 Jan 2020 16:28:21 +0800
Message-Id: <20200114082821.14015-5-haokexin@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20200114082821.14015-1-haokexin@gmail.com>
References: <20200114082821.14015-1-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The main parts of this patch are from commit a7fc89f9d5fc ("gpio:
thunderx: Switch to GPIOLIB_IRQCHIP") and patch [1]. And also adjust
thunderx_gpio_child_to_parent_hwirq() and add
thunderx_gpio_populate_parent_alloc_info() to make sure that
the correct hwirq are passed to the parent msi irqdomain.

[1] https://patchwork.ozlabs.org/patch/1210180/

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/gpio/Kconfig         |   1 +
 drivers/gpio/gpio-thunderx.c | 177 +++++++++++++++++++------------------------
 2 files changed, 78 insertions(+), 100 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ce65919dee12..9e99d09a64c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -571,6 +571,7 @@ config GPIO_THUNDERX
 	tristate "Cavium ThunderX/OCTEON-TX GPIO"
 	depends on ARCH_THUNDER || (64BIT && COMPILE_TEST)
 	depends on PCI_MSI
+	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	help
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 462770479045..9f66deab46ea 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/spinlock.h>
+#include <asm-generic/msi.h>
 
 
 #define GPIO_RX_DAT	0x0
@@ -53,7 +54,6 @@ struct thunderx_line {
 struct thunderx_gpio {
 	struct gpio_chip	chip;
 	u8 __iomem		*register_base;
-	struct irq_domain	*irqd;
 	struct msix_entry	*msix_entries;	/* per line MSI-X */
 	struct thunderx_line	*line_entries;	/* per line irq info */
 	raw_spinlock_t		lock;
@@ -286,54 +286,60 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
 	}
 }
 
-static void thunderx_gpio_irq_ack(struct irq_data *data)
+static void thunderx_gpio_irq_ack(struct irq_data *d)
 {
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
 
 	writeq(GPIO_INTR_INTR,
-	       txline->txgpio->register_base + intr_reg(txline->line));
+	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
 }
 
-static void thunderx_gpio_irq_mask(struct irq_data *data)
+static void thunderx_gpio_irq_mask(struct irq_data *d)
 {
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
 
 	writeq(GPIO_INTR_ENA_W1C,
-	       txline->txgpio->register_base + intr_reg(txline->line));
+	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
 }
 
-static void thunderx_gpio_irq_mask_ack(struct irq_data *data)
+static void thunderx_gpio_irq_mask_ack(struct irq_data *d)
 {
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
 
 	writeq(GPIO_INTR_ENA_W1C | GPIO_INTR_INTR,
-	       txline->txgpio->register_base + intr_reg(txline->line));
+	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
 }
 
-static void thunderx_gpio_irq_unmask(struct irq_data *data)
+static void thunderx_gpio_irq_unmask(struct irq_data *d)
 {
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
 
 	writeq(GPIO_INTR_ENA_W1S,
-	       txline->txgpio->register_base + intr_reg(txline->line));
+	       txgpio->register_base + intr_reg(irqd_to_hwirq(d)));
 }
 
-static int thunderx_gpio_irq_set_type(struct irq_data *data,
+static int thunderx_gpio_irq_set_type(struct irq_data *d,
 				      unsigned int flow_type)
 {
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
-	struct thunderx_gpio *txgpio = txline->txgpio;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
+	struct thunderx_line *txline =
+		&txgpio->line_entries[irqd_to_hwirq(d)];
 	u64 bit_cfg;
 
-	irqd_set_trigger_type(data, flow_type);
+	irqd_set_trigger_type(d, flow_type);
 
 	bit_cfg = txline->fil_bits | GPIO_BIT_CFG_INT_EN;
 
 	if (flow_type & IRQ_TYPE_EDGE_BOTH) {
-		irq_set_handler_locked(data, handle_fasteoi_ack_irq);
+		irq_set_handler_locked(d, handle_fasteoi_ack_irq);
 		bit_cfg |= GPIO_BIT_CFG_INT_TYPE;
 	} else {
-		irq_set_handler_locked(data, handle_fasteoi_mask_irq);
+		irq_set_handler_locked(d, handle_fasteoi_mask_irq);
 	}
 
 	raw_spin_lock(&txgpio->lock);
@@ -362,33 +368,6 @@ static void thunderx_gpio_irq_disable(struct irq_data *data)
 	irq_chip_disable_parent(data);
 }
 
-static int thunderx_gpio_irq_request_resources(struct irq_data *data)
-{
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
-	struct thunderx_gpio *txgpio = txline->txgpio;
-	int r;
-
-	r = gpiochip_lock_as_irq(&txgpio->chip, txline->line);
-	if (r)
-		return r;
-
-	r = irq_chip_request_resources_parent(data);
-	if (r)
-		gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
-
-	return r;
-}
-
-static void thunderx_gpio_irq_release_resources(struct irq_data *data)
-{
-	struct thunderx_line *txline = irq_data_get_irq_chip_data(data);
-	struct thunderx_gpio *txgpio = txline->txgpio;
-
-	irq_chip_release_resources_parent(data);
-
-	gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
-}
-
 /*
  * Interrupts are chained from underlying MSI-X vectors.  We have
  * these irq_chip functions to be able to handle level triggering
@@ -405,48 +384,42 @@ static struct irq_chip thunderx_gpio_irq_chip = {
 	.irq_unmask		= thunderx_gpio_irq_unmask,
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
-	.irq_request_resources	= thunderx_gpio_irq_request_resources,
-	.irq_release_resources	= thunderx_gpio_irq_release_resources,
 	.irq_set_type		= thunderx_gpio_irq_set_type,
 
 	.flags			= IRQCHIP_SET_TYPE_MASKED
 };
 
-static int thunderx_gpio_irq_translate(struct irq_domain *d,
-				       struct irq_fwspec *fwspec,
-				       irq_hw_number_t *hwirq,
-				       unsigned int *type)
+static int thunderx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					       unsigned int child,
+					       unsigned int child_type,
+					       unsigned int *parent,
+					       unsigned int *parent_type)
 {
-	struct thunderx_gpio *txgpio = d->host_data;
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
+	struct irq_data *irqd;
+	unsigned int irq;
 
-	if (WARN_ON(fwspec->param_count < 2))
+	irq = txgpio->msix_entries[child].vector;
+	irqd = irq_domain_get_irq_data(gc->irq.parent_domain, irq);
+	if (!irqd)
 		return -EINVAL;
-	if (fwspec->param[0] >= txgpio->chip.ngpio)
-		return -EINVAL;
-	*hwirq = fwspec->param[0];
-	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+	*parent = irqd_to_hwirq(irqd);
+	*parent_type = IRQ_TYPE_LEVEL_HIGH;
 	return 0;
 }
 
-static int thunderx_gpio_irq_alloc(struct irq_domain *d, unsigned int virq,
-				   unsigned int nr_irqs, void *arg)
+static void *thunderx_gpio_populate_parent_alloc_info(struct gpio_chip *chip,
+						      unsigned int parent_hwirq,
+						      unsigned int parent_type)
 {
-	struct thunderx_line *txline = arg;
-
-	return irq_domain_set_hwirq_and_chip(d, virq, txline->line,
-					     &thunderx_gpio_irq_chip, txline);
-}
-
-static const struct irq_domain_ops thunderx_gpio_irqd_ops = {
-	.alloc		= thunderx_gpio_irq_alloc,
-	.translate	= thunderx_gpio_irq_translate
-};
+	msi_alloc_info_t *info;
 
-static int thunderx_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return NULL;
 
-	return irq_find_mapping(txgpio->irqd, offset);
+	info->hwirq = parent_hwirq;
+	return info;
 }
 
 static int thunderx_gpio_probe(struct pci_dev *pdev,
@@ -456,6 +429,7 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	struct device *dev = &pdev->dev;
 	struct thunderx_gpio *txgpio;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	int ngpio, i;
 	int err = 0;
 
@@ -500,8 +474,8 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	}
 
 	txgpio->msix_entries = devm_kcalloc(dev,
-					  ngpio, sizeof(struct msix_entry),
-					  GFP_KERNEL);
+					    ngpio, sizeof(struct msix_entry),
+					    GFP_KERNEL);
 	if (!txgpio->msix_entries) {
 		err = -ENOMEM;
 		goto out;
@@ -542,27 +516,6 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	if (err < 0)
 		goto out;
 
-	/*
-	 * Push GPIO specific irqdomain on hierarchy created as a side
-	 * effect of the pci_enable_msix()
-	 */
-	txgpio->irqd = irq_domain_create_hierarchy(irq_get_irq_data(txgpio->msix_entries[0].vector)->domain,
-						   0, 0, of_node_to_fwnode(dev->of_node),
-						   &thunderx_gpio_irqd_ops, txgpio);
-	if (!txgpio->irqd) {
-		err = -ENOMEM;
-		goto out;
-	}
-
-	/* Push on irq_data and the domain for each line. */
-	for (i = 0; i < ngpio; i++) {
-		err = irq_domain_push_irq(txgpio->irqd,
-					  txgpio->msix_entries[i].vector,
-					  &txgpio->line_entries[i]);
-		if (err < 0)
-			dev_err(dev, "irq_domain_push_irq: %d\n", err);
-	}
-
 	chip->label = KBUILD_MODNAME;
 	chip->parent = dev;
 	chip->owner = THIS_MODULE;
@@ -577,11 +530,35 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	chip->set = thunderx_gpio_set;
 	chip->set_multiple = thunderx_gpio_set_multiple;
 	chip->set_config = thunderx_gpio_set_config;
-	chip->to_irq = thunderx_gpio_to_irq;
+	girq = &chip->irq;
+	girq->chip = &thunderx_gpio_irq_chip;
+	girq->fwnode = of_node_to_fwnode(dev->of_node);
+	girq->parent_domain =
+		irq_get_irq_data(txgpio->msix_entries[0].vector)->domain;
+	girq->child_to_parent_hwirq = thunderx_gpio_child_to_parent_hwirq;
+	girq->populate_parent_alloc_arg = thunderx_gpio_populate_parent_alloc_info;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
 	err = devm_gpiochip_add_data(dev, chip, txgpio);
 	if (err)
 		goto out;
 
+	/* Push on irq_data and the domain for each line. */
+	for (i = 0; i < ngpio; i++) {
+		struct irq_fwspec fwspec;
+
+		fwspec.fwnode = of_node_to_fwnode(dev->of_node);
+		fwspec.param_count = 2;
+		fwspec.param[0] = i;
+		fwspec.param[1] = IRQ_TYPE_NONE;
+		err = irq_domain_push_irq(girq->domain,
+					  txgpio->msix_entries[i].vector,
+					  &fwspec);
+		if (err < 0)
+			dev_err(dev, "irq_domain_push_irq: %d\n", err);
+	}
+
 	dev_info(dev, "ThunderX GPIO: %d lines with base %d.\n",
 		 ngpio, chip->base);
 	return 0;
@@ -596,10 +573,10 @@ static void thunderx_gpio_remove(struct pci_dev *pdev)
 	struct thunderx_gpio *txgpio = pci_get_drvdata(pdev);
 
 	for (i = 0; i < txgpio->chip.ngpio; i++)
-		irq_domain_pop_irq(txgpio->irqd,
+		irq_domain_pop_irq(txgpio->chip.irq.domain,
 				   txgpio->msix_entries[i].vector);
 
-	irq_domain_remove(txgpio->irqd);
+	irq_domain_remove(txgpio->chip.irq.domain);
 
 	pci_set_drvdata(pdev, NULL);
 }
-- 
2.14.4

