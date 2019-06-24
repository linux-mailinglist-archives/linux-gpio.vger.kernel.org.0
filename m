Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823E650BF7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 15:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfFXNZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 09:25:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33070 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729145AbfFXNZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 09:25:50 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so12643678ljg.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvkEGh7ir7mmkkbpaDzcUH0nZuivAvkrC1Svkm3hBJg=;
        b=RXbZ+Ryz/YZDB1xCj6nlgT8INrIjdsVptbm0ipS6cOKtFsk08MWiXScTWrLyOq32+h
         fClN+yDmL4HtfAG/Y2BpeHBuHmFSRkaxFNSH7Y/yh4L453qhMujIOV3A93dN7P8LLjWE
         SiWHaGSbgDhaBu52bUilYFXRKOyVoeZUfbEDO4Cw0d9oA7ismDJYlXoB19lK0Ul4JRt+
         RvpY3GjjrRGf7DmsKwgTpZ/oYQAM97wzLPKUZvVBVwSgD55VKrp3v3v2yoWxfSUsMuc9
         T38uLiD/P3MFixZbXUu1E4PFOUoczdP3wwINej0Cxilw9jiAp0SdQGPDfp3AlwScU+h6
         pTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvkEGh7ir7mmkkbpaDzcUH0nZuivAvkrC1Svkm3hBJg=;
        b=LT2IhFRq5pVT7ynnpl5CrrmnQVZmkXSE8cboHVOreUNwBtnrexVXWqIxJYZeEcSCUD
         tx3Mp80aPy7+0tOZIba0mF6F9vJ7l5Iozw2mK9f9YodkJ+51a0uoDdtk+BM9w244s4US
         XWsj/CU2i2hYPOMJbkC9pA1iPnvqztsk0VzOi14VFvvGe1wPRLO3UYgEAHEtn9zR6UpB
         EAginjC11ODLeOHZinWQgPxhC5EsLaN6/Kcw7lvSFh68rL8CDHqL7Sm/hU3Ta+D4KSRn
         uMBG3hj9jmmolUoLBLt2e2mW0XPI45D8+g9as+FkpNK1mW90S2Oai0OYx5HX2kWematJ
         JE+g==
X-Gm-Message-State: APjAAAWMFWgWrlm0fxjSIS4ud3f/KtMFhUvGjNxk9xkphLjq891LTZwH
        aXXdiBT1EPCABDeTMcJkc1sHk/ObwH4=
X-Google-Smtp-Source: APXvYqwCOlTP5VziSCT4r8yqUhQtp5iQYfnT7J30EGIDdh7qneiBHqwF3MLAuqjpfp9YpPLcYfu4Jw==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr35361968lja.230.1561382747448;
        Mon, 24 Jun 2019 06:25:47 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id t4sm416102ljh.9.2019.06.24.06.25.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 06:25:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Subject: [PATCH 4/4 v1] RFT: gpio: uniphier: Switch to GPIOLIB_IRQCHIP
Date:   Mon, 24 Jun 2019 15:25:31 +0200
Message-Id: <20190624132531.6184-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new infrastructure for hierarchical irqchips in
gpiolib.

I have no chance to test or debug this so I need
help.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Brian Masney <masneyb@onstation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig         |   1 +
 drivers/gpio/gpio-uniphier.c | 172 +++++++++--------------------------
 2 files changed, 45 insertions(+), 128 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ee34716a39aa..806d642498a6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -552,6 +552,7 @@ config GPIO_UNIPHIER
 	tristate "UniPhier GPIO support"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
 	  Say yes here to support UniPhier GPIOs.
diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 93cdcc41e9fb..e960836b9c01 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -6,7 +6,6 @@
 #include <linux/bits.h>
 #include <linux/gpio/driver.h>
 #include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -30,7 +29,6 @@
 struct uniphier_gpio_priv {
 	struct gpio_chip chip;
 	struct irq_chip irq_chip;
-	struct irq_domain *domain;
 	void __iomem *regs;
 	spinlock_t lock;
 	u32 saved_vals[0];
@@ -162,49 +160,33 @@ static void uniphier_gpio_set_multiple(struct gpio_chip *chip,
 	}
 }
 
-static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+static void uniphier_gpio_irq_mask(struct irq_data *d)
 {
-	struct irq_fwspec fwspec;
-
-	if (offset < UNIPHIER_GPIO_IRQ_OFFSET)
-		return -ENXIO;
-
-	fwspec.fwnode = of_node_to_fwnode(chip->parent->of_node);
-	fwspec.param_count = 2;
-	fwspec.param[0] = offset - UNIPHIER_GPIO_IRQ_OFFSET;
-	/*
-	 * IRQ_TYPE_NONE is rejected by the parent irq domain. Set LEVEL_HIGH
-	 * temporarily. Anyway, ->irq_set_type() will override it later.
-	 */
-	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
-
-	return irq_create_fwspec_mapping(&fwspec);
-}
-
-static void uniphier_gpio_irq_mask(struct irq_data *data)
-{
-	struct uniphier_gpio_priv *priv = data->chip_data;
-	u32 mask = BIT(data->hwirq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
+	u32 mask = BIT(d->hwirq);
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, 0);
 
-	return irq_chip_mask_parent(data);
+	return irq_chip_mask_parent(d);
 }
 
-static void uniphier_gpio_irq_unmask(struct irq_data *data)
+static void uniphier_gpio_irq_unmask(struct irq_data *d)
 {
-	struct uniphier_gpio_priv *priv = data->chip_data;
-	u32 mask = BIT(data->hwirq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
+	u32 mask = BIT(d->hwirq);
 
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_EN, mask, mask);
 
-	return irq_chip_unmask_parent(data);
+	return irq_chip_unmask_parent(d);
 }
 
-static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+static int uniphier_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	struct uniphier_gpio_priv *priv = data->chip_data;
-	u32 mask = BIT(data->hwirq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
+	u32 mask = BIT(d->hwirq);
 	u32 val = 0;
 
 	if (type == IRQ_TYPE_EDGE_BOTH) {
@@ -216,7 +198,7 @@ static int uniphier_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	/* To enable both edge detection, the noise filter must be enabled. */
 	uniphier_gpio_reg_update(priv, UNIPHIER_GPIO_IRQ_FLT_EN, mask, val);
 
-	return irq_chip_set_type_parent(data, type);
+	return irq_chip_set_type_parent(d, type);
 }
 
 static int uniphier_gpio_irq_get_parent_hwirq(struct uniphier_gpio_priv *priv,
@@ -245,82 +227,6 @@ static int uniphier_gpio_irq_get_parent_hwirq(struct uniphier_gpio_priv *priv,
 	return -ENOENT;
 }
 
-static int uniphier_gpio_irq_domain_translate(struct irq_domain *domain,
-					      struct irq_fwspec *fwspec,
-					      unsigned long *out_hwirq,
-					      unsigned int *out_type)
-{
-	if (WARN_ON(fwspec->param_count < 2))
-		return -EINVAL;
-
-	*out_hwirq = fwspec->param[0];
-	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
-
-	return 0;
-}
-
-static int uniphier_gpio_irq_domain_alloc(struct irq_domain *domain,
-					  unsigned int virq,
-					  unsigned int nr_irqs, void *arg)
-{
-	struct uniphier_gpio_priv *priv = domain->host_data;
-	struct irq_fwspec parent_fwspec;
-	irq_hw_number_t hwirq;
-	unsigned int type;
-	int ret;
-
-	if (WARN_ON(nr_irqs != 1))
-		return -EINVAL;
-
-	ret = uniphier_gpio_irq_domain_translate(domain, arg, &hwirq, &type);
-	if (ret)
-		return ret;
-
-	ret = uniphier_gpio_irq_get_parent_hwirq(priv, hwirq);
-	if (ret < 0)
-		return ret;
-
-	/* parent is UniPhier AIDET */
-	parent_fwspec.fwnode = domain->parent->fwnode;
-	parent_fwspec.param_count = 2;
-	parent_fwspec.param[0] = ret;
-	parent_fwspec.param[1] = (type == IRQ_TYPE_EDGE_BOTH) ?
-						IRQ_TYPE_EDGE_FALLING : type;
-
-	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
-					    &priv->irq_chip, priv);
-	if (ret)
-		return ret;
-
-	return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
-}
-
-static int uniphier_gpio_irq_domain_activate(struct irq_domain *domain,
-					     struct irq_data *data, bool early)
-{
-	struct uniphier_gpio_priv *priv = domain->host_data;
-	struct gpio_chip *chip = &priv->chip;
-
-	return gpiochip_lock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
-}
-
-static void uniphier_gpio_irq_domain_deactivate(struct irq_domain *domain,
-						struct irq_data *data)
-{
-	struct uniphier_gpio_priv *priv = domain->host_data;
-	struct gpio_chip *chip = &priv->chip;
-
-	gpiochip_unlock_as_irq(chip, data->hwirq + UNIPHIER_GPIO_IRQ_OFFSET);
-}
-
-static const struct irq_domain_ops uniphier_gpio_irq_domain_ops = {
-	.alloc = uniphier_gpio_irq_domain_alloc,
-	.free = irq_domain_free_irqs_common,
-	.activate = uniphier_gpio_irq_domain_activate,
-	.deactivate = uniphier_gpio_irq_domain_deactivate,
-	.translate = uniphier_gpio_irq_domain_translate,
-};
-
 static void uniphier_gpio_hw_init(struct uniphier_gpio_priv *priv)
 {
 	/*
@@ -338,6 +244,26 @@ static unsigned int uniphier_gpio_get_nbanks(unsigned int ngpio)
 	return DIV_ROUND_UP(ngpio, UNIPHIER_GPIO_LINES_PER_BANK);
 }
 
+static int uniphier_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					       unsigned int child,
+					       unsigned int child_type,
+					       unsigned int *parent,
+					       unsigned int *parent_type)
+{
+	struct uniphier_gpio_priv *priv = gpiochip_get_data(gc);
+	int ret;
+
+	ret = uniphier_gpio_irq_get_parent_hwirq(priv, child);
+	if (ret < 0)
+		return ret;
+	*parent = ret;
+	if (child_type == IRQ_TYPE_EDGE_BOTH)
+		*parent_type = IRQ_TYPE_EDGE_FALLING;
+	else
+		*parent_type = child_type;
+	return 0;
+}
+
 static int uniphier_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -345,6 +271,7 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent_domain;
 	struct uniphier_gpio_priv *priv;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	struct irq_chip *irq_chip;
 	unsigned int nregs;
 	u32 ngpios;
@@ -386,7 +313,6 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	chip->get = uniphier_gpio_get;
 	chip->set = uniphier_gpio_set;
 	chip->set_multiple = uniphier_gpio_set_multiple;
-	chip->to_irq = uniphier_gpio_to_irq;
 	chip->base = -1;
 	chip->ngpio = ngpios;
 
@@ -398,34 +324,25 @@ static int uniphier_gpio_probe(struct platform_device *pdev)
 	irq_chip->irq_set_affinity = irq_chip_set_affinity_parent;
 	irq_chip->irq_set_type = uniphier_gpio_irq_set_type;
 
+	girq = &chip->irq;
+	girq->chip = irq_chip;
+	girq->fwnode = of_node_to_fwnode(dev->of_node);
+	girq->parent_domain = parent_domain;
+	girq->child_to_parent_hwirq = uniphier_gpio_child_to_parent_hwirq;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
 	uniphier_gpio_hw_init(priv);
 
 	ret = devm_gpiochip_add_data(dev, chip, priv);
 	if (ret)
 		return ret;
 
-	priv->domain = irq_domain_create_hierarchy(
-					parent_domain, 0,
-					UNIPHIER_GPIO_IRQ_MAX_NUM,
-					of_node_to_fwnode(dev->of_node),
-					&uniphier_gpio_irq_domain_ops, priv);
-	if (!priv->domain)
-		return -ENOMEM;
-
 	platform_set_drvdata(pdev, priv);
 
 	return 0;
 }
 
-static int uniphier_gpio_remove(struct platform_device *pdev)
-{
-	struct uniphier_gpio_priv *priv = platform_get_drvdata(pdev);
-
-	irq_domain_remove(priv->domain);
-
-	return 0;
-}
-
 static int __maybe_unused uniphier_gpio_suspend(struct device *dev)
 {
 	struct uniphier_gpio_priv *priv = dev_get_drvdata(dev);
@@ -485,7 +402,6 @@ MODULE_DEVICE_TABLE(of, uniphier_gpio_match);
 
 static struct platform_driver uniphier_gpio_driver = {
 	.probe = uniphier_gpio_probe,
-	.remove = uniphier_gpio_remove,
 	.driver = {
 		.name = "uniphier-gpio",
 		.of_match_table = uniphier_gpio_match,
-- 
2.21.0

