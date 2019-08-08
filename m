Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7903861F1
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 14:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390079AbfHHMdB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 08:33:01 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46213 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389844AbfHHMdA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 08:33:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id z15so62444154lfh.13
        for <linux-gpio@vger.kernel.org>; Thu, 08 Aug 2019 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6j2s4f6jQJuHPasrXYF7RrNBQqL8kwSajU7ijH7uh7Y=;
        b=Vz7n0fyXndxRLV4SgJvKO4M5hht3Hu0y+nhhvmwn+LALe74xuWXC/nWfD7fMDA8oEX
         GW8oL0yeY5UUmiCFEhaaUmsw/7pL3vXaJO0AfAeiKjIe9nTs953IHt0EBJlguFL+btiL
         Wi6OOhWOzb4sUBV6KA269ifxrE9jpvH562IUgcGazor3y/PWgBZGBm5c+5o6+ioCCAF0
         h9h7aejhuJhO0u9nfHMAjacX74A1q3Y8ABpIWmbk3gdXd6dbg/saQir6iPo35yGT45C4
         SglN6fd5CPHJAbu9vA3b3GxK99C7LmNHrOn98a+3GtaVx4/uSQ8K9t+TQZyqmPrbxDuX
         /Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6j2s4f6jQJuHPasrXYF7RrNBQqL8kwSajU7ijH7uh7Y=;
        b=d9g+b+/gtpIHId7Q+jZ39E0BifDNxasUjWo32pbbxRhGyG4215HFRHKl33mDaQ1RZv
         neqE4j38lm6nMkfmb+xCqh77+khnrs236Qcpr7FbOK7bhuQbSm7b3Bgdmrz6DgVmAn1s
         Shs3YKFifD9kobqHaTwwMG3Toj0uVwjAQHvcvAoiNMQuMoKiBdYqS6AMDPktC1SbB3pf
         h3RGk7IRBe/3pUF35s9GYA2aanhrWW5TQdQecEPS4pKD6ciuCGMhxMI8t7ZrRt+ZQ//2
         eTTcAQd4uD4ubFgNRHSjRKrPhtJguzwANuhCRNlqyfQcjV/7ofDqX2D6fRUV+3u1Wgs/
         HbXA==
X-Gm-Message-State: APjAAAWhXAbd0M+se2iR9e0ZicJXdJOFlppPw8Hjnjr8pQP7Axox2AZu
        0XEJYv5bQAXKsCXQw7/71bDQiqF60eE=
X-Google-Smtp-Source: APXvYqyfcjX7pP2Br3HQ626l4UmzK2ilEFxK5gQXzJN5iFwLi4IYuQ7deB5KEZntedvlcqNbcTwT2w==
X-Received: by 2002:a19:4a50:: with SMTP id x77mr9051038lfa.91.1565267578286;
        Thu, 08 Aug 2019 05:32:58 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h10sm16976423lfp.33.2019.08.08.05.32.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 05:32:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Daney <david.daney@cavium.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 4/6 v2] RFT: gpio: thunderx: Switch to GPIOLIB_IRQCHIP
Date:   Thu,  8 Aug 2019 14:32:40 +0200
Message-Id: <20190808123242.5359-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808123242.5359-1-linus.walleij@linaro.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new infrastructure for hierarchical irqchips in
gpiolib.

The major part of the rewrite was dues to the fact that
the driver was passing around a per-irq pointer to
struct thunderx_line * data container, and the central
handlers will assume struct gpio_chip * to be passed
to we need to use the hwirq as index to look up the
struct thunderx_line * for each IRQ.

The pushing and pop:ing of the irqdomain was confusing
because I've never seen this before, but I tried to
replicate it as best I could.

I have no chance to test or debug this so I need
help.

Cc: David Daney <david.daney@cavium.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog RFT v1-> RFT v2:
- Rebased.
---
 drivers/gpio/Kconfig         |   1 +
 drivers/gpio/gpio-thunderx.c | 163 ++++++++++++-----------------------
 2 files changed, 57 insertions(+), 107 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b34e9b11a7ef..3125aca2db9f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -539,6 +539,7 @@ config GPIO_THUNDERX
 	tristate "Cavium ThunderX/OCTEON-TX GPIO"
 	depends on ARCH_THUNDER || (64BIT && COMPILE_TEST)
 	depends on PCI_MSI
+	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	select IRQ_FASTEOI_HIERARCHY_HANDLERS
 	help
diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 715371b5102a..ddad5c7ea617 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -53,7 +53,6 @@ struct thunderx_line {
 struct thunderx_gpio {
 	struct gpio_chip	chip;
 	u8 __iomem		*register_base;
-	struct irq_domain	*irqd;
 	struct msix_entry	*msix_entries;	/* per line MSI-X */
 	struct thunderx_line	*line_entries;	/* per line irq info */
 	raw_spinlock_t		lock;
@@ -283,54 +282,60 @@ static void thunderx_gpio_set_multiple(struct gpio_chip *chip,
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
@@ -359,33 +364,6 @@ static void thunderx_gpio_irq_disable(struct irq_data *data)
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
@@ -402,48 +380,22 @@ static struct irq_chip thunderx_gpio_irq_chip = {
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
-
-	if (WARN_ON(fwspec->param_count < 2))
-		return -EINVAL;
-	if (fwspec->param[0] >= txgpio->chip.ngpio)
-		return -EINVAL;
-	*hwirq = fwspec->param[0];
-	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
-	return 0;
-}
-
-static int thunderx_gpio_irq_alloc(struct irq_domain *d, unsigned int virq,
-				   unsigned int nr_irqs, void *arg)
-{
-	struct thunderx_line *txline = arg;
+	struct thunderx_gpio *txgpio = gpiochip_get_data(gc);
 
-	return irq_domain_set_hwirq_and_chip(d, virq, txline->line,
-					     &thunderx_gpio_irq_chip, txline);
-}
-
-static const struct irq_domain_ops thunderx_gpio_irqd_ops = {
-	.alloc		= thunderx_gpio_irq_alloc,
-	.translate	= thunderx_gpio_irq_translate
-};
-
-static int thunderx_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-{
-	struct thunderx_gpio *txgpio = gpiochip_get_data(chip);
-
-	return irq_find_mapping(txgpio->irqd, offset);
+	*parent = txgpio->base_msi + (2 * child);
+	*parent_type = IRQ_TYPE_LEVEL_HIGH;
+	return 0;
 }
 
 static int thunderx_gpio_probe(struct pci_dev *pdev,
@@ -453,6 +405,7 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	struct device *dev = &pdev->dev;
 	struct thunderx_gpio *txgpio;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	int ngpio, i;
 	int err = 0;
 
@@ -497,8 +450,8 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	}
 
 	txgpio->msix_entries = devm_kcalloc(dev,
-					  ngpio, sizeof(struct msix_entry),
-					  GFP_KERNEL);
+					    ngpio, sizeof(struct msix_entry),
+					    GFP_KERNEL);
 	if (!txgpio->msix_entries) {
 		err = -ENOMEM;
 		goto out;
@@ -539,27 +492,6 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
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
@@ -574,11 +506,28 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
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
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
 	err = devm_gpiochip_add_data(dev, chip, txgpio);
 	if (err)
 		goto out;
 
+	/* Push on irq_data and the domain for each line. */
+	for (i = 0; i < ngpio; i++) {
+		err = irq_domain_push_irq(chip->irq.domain,
+					  txgpio->msix_entries[i].vector,
+					  chip);
+		if (err < 0)
+			dev_err(dev, "irq_domain_push_irq: %d\n", err);
+	}
+
 	dev_info(dev, "ThunderX GPIO: %d lines with base %d.\n",
 		 ngpio, chip->base);
 	return 0;
@@ -593,10 +542,10 @@ static void thunderx_gpio_remove(struct pci_dev *pdev)
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
2.21.0

