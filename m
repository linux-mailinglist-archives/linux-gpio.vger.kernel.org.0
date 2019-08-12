Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25F0F89F05
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 15:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbfHLNAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 09:00:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44479 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfHLNAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 09:00:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id e24so1505504ljg.11
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EG0tjExHy9EX3Z2PnpdBG0qykklEiCJc4FLl7qwoWkQ=;
        b=Wmi6jWChalheX1V786BUXEuqmzp44mZrrk+7eXLoMVh3RRMyU2W9GHCiCBTh5e9Ecj
         wwDlEL9d/D0SZoVMOhIKqS4CbEvXfelanH2c6SAXzf06LhkA3I/t+sJNhQDCCqefjBvt
         Juz7f8goN8keQCbrDZk5kQB4sN162RfZZkOr1r3xa5qyoFQuulAb/BTmNXwID2Umyl7P
         2ipB8rJSwhrqm8B3Bcu8r3LAMmf0XRbHPbCrDAPH4kUhLjbNbzfM3eKe1S9x31YSK3pl
         p7GWNtEeE4Yk3v71Kpounxlua5iAo6osF6bN82iAjUcOi2uBpp3MOott7r2wMjjiR2Pz
         E0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EG0tjExHy9EX3Z2PnpdBG0qykklEiCJc4FLl7qwoWkQ=;
        b=ffoTF/p4lOvSuh6RPGiy9lnsaqi20d+92h/1jnWucw4SZBOoaN2C31BXikzTvAKSEq
         4uvdaZnNBZU09QNF2avfUweYDrRTDLG93c6R8Z/+tsUgza+BIdigzyRjPRVgn7k7WOwk
         YVNF5vh7WH0WsBVU6CUkG4pqqfymEAXg6GjQuVgBWuYsjsYhy4oq+NnwMpBjb9rEkMXm
         H9rS+XbVHmQ4cFAmIGXxx9K7JH88vwet6QN38peX2MruGXtvqZUBtBiaOhIoEp+I4vD+
         xZXTi082gzyW5BcIpAPr2GUVXFS+XSZhoNqmJ8+IY8gwgxGC9xzhhXz+EB40x8PoVHDU
         yp7A==
X-Gm-Message-State: APjAAAUrgmBwKZ535FCnSj4Lf5Z7J3nJlEIMan+iTO1SX3JMdcZmq75V
        cq4i4HuJXcQKkr6Eyix7qGYwOXv5dH8=
X-Google-Smtp-Source: APXvYqxuiVV9Q1TgVetsej2GUlSlQsYSjJRcuBuP+3TAynUCgUcCJ0ywAMlOBRptTK3ZzAAODcx+JQ==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr18559313ljj.217.1565614804092;
        Mon, 12 Aug 2019 06:00:04 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id h84sm20951407ljf.42.2019.08.12.06.00.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 06:00:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH] gpio: ep93xx: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 15:00:00 +0200
Message-Id: <20190812130000.22252-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 140 +++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 67 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index a90870a60c15..226da8df6f10 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -269,56 +269,6 @@ static struct irq_chip ep93xx_gpio_irq_chip = {
 	.irq_set_type	= ep93xx_gpio_irq_type,
 };
 
-static int ep93xx_gpio_init_irq(struct platform_device *pdev,
-				struct ep93xx_gpio *epg)
-{
-	int ab_parent_irq = platform_get_irq(pdev, 0);
-	struct device *dev = &pdev->dev;
-	int gpio_irq;
-	int ret;
-	int i;
-
-	/* The A bank */
-	ret = gpiochip_irqchip_add(&epg->gc[0], &ep93xx_gpio_irq_chip,
-                                   64, handle_level_irq,
-                                   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev, "Could not add irqchip 0\n");
-		return ret;
-	}
-	gpiochip_set_chained_irqchip(&epg->gc[0], &ep93xx_gpio_irq_chip,
-				     ab_parent_irq,
-				     ep93xx_gpio_ab_irq_handler);
-
-	/* The B bank */
-	ret = gpiochip_irqchip_add(&epg->gc[1], &ep93xx_gpio_irq_chip,
-                                   72, handle_level_irq,
-                                   IRQ_TYPE_NONE);
-	if (ret) {
-		dev_err(dev, "Could not add irqchip 1\n");
-		return ret;
-	}
-	gpiochip_set_chained_irqchip(&epg->gc[1], &ep93xx_gpio_irq_chip,
-				     ab_parent_irq,
-				     ep93xx_gpio_ab_irq_handler);
-
-	/* The F bank */
-	for (i = 0; i < 8; i++) {
-		gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
-		irq_set_chip_data(gpio_irq, &epg->gc[5]);
-		irq_set_chip_and_handler(gpio_irq, &ep93xx_gpio_irq_chip,
-					 handle_level_irq);
-		irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
-	}
-
-	for (i = 1; i <= 8; i++)
-		irq_set_chained_handler_and_data(platform_get_irq(pdev, i),
-						 ep93xx_gpio_f_irq_handler,
-						 &epg->gc[i]);
-	return 0;
-}
-
-
 /*************************************************************************
  * gpiolib interface for EP93xx on-chip GPIOs
  *************************************************************************/
@@ -328,26 +278,33 @@ struct ep93xx_gpio_bank {
 	int		dir;
 	int		base;
 	bool		has_irq;
+	bool		has_hierarchical_irq;
+	unsigned int	irq_base;
 };
 
-#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq)	\
+#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq, _has_hier, _irq_base) \
 	{							\
 		.label		= _label,			\
 		.data		= _data,			\
 		.dir		= _dir,				\
 		.base		= _base,			\
 		.has_irq	= _has_irq,			\
+		.has_hierarchical_irq = _has_hier,		\
+		.irq_base	= _irq_base,			\
 	}
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true), /* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true), /* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false),
-	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false),
-	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false),
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, true), /* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false),
-	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false),
+	/* Bank A has 8 IRQs */
+	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
+	/* Bank B has 8 IRQs */
+	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
+	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
+	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
+	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
+	/* Bank F has 8 IRQs */
+	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
+	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
+	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
 };
 
 static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
@@ -369,12 +326,15 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
 
-static int ep93xx_gpio_add_bank(struct gpio_chip *gc, struct device *dev,
+static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
+				struct platform_device *pdev,
 				struct ep93xx_gpio *epg,
 				struct ep93xx_gpio_bank *bank)
 {
 	void __iomem *data = epg->base + bank->data;
 	void __iomem *dir = epg->base + bank->dir;
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
 	int err;
 
 	err = bgpio_init(gc, dev, 1, data, NULL, NULL, dir, NULL, 0);
@@ -384,8 +344,59 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc, struct device *dev,
 	gc->label = bank->label;
 	gc->base = bank->base;
 
-	if (bank->has_irq)
+	girq = &gc->irq;
+	if (bank->has_irq || bank->has_hierarchical_irq) {
 		gc->set_config = ep93xx_gpio_set_config;
+		girq->chip = &ep93xx_gpio_irq_chip;
+	}
+
+	if (bank->has_irq) {
+		int ab_parent_irq = platform_get_irq(pdev, 0);
+
+		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+		girq->parents[0] = ab_parent_irq;
+		girq->first = bank->irq_base;
+	}
+
+	/* Only bank F has especially funky IRQ handling */
+	if (bank->has_hierarchical_irq) {
+		int gpio_irq;
+		int i;
+
+		/*
+		 * FIXME: convert this to use hierarchical IRQ support!
+		 * this requires fixing the root irqchip to be hierarchial.
+		 */
+		girq->parent_handler = ep93xx_gpio_f_irq_handler;
+		girq->num_parents = 8;
+		girq->parents = devm_kcalloc(dev, 8,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		/* Pick resources 1..8 for these IRQs */
+		for (i = 1; i <= 8; i++)
+			girq->parents[i - 1] = platform_get_irq(pdev, i);
+		for (i = 0; i < 8; i++) {
+			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
+			irq_set_chip_data(gpio_irq, &epg->gc[5]);
+			irq_set_chip_and_handler(gpio_irq,
+						 &ep93xx_gpio_irq_chip,
+						 handle_level_irq);
+			irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
+		}
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_level_irq;
+		gc->to_irq = ep93xx_gpio_f_to_irq;
+	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
 }
@@ -407,16 +418,11 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 		struct gpio_chip *gc = &epg->gc[i];
 		struct ep93xx_gpio_bank *bank = &ep93xx_gpio_banks[i];
 
-		if (ep93xx_gpio_add_bank(gc, &pdev->dev, epg, bank))
+		if (ep93xx_gpio_add_bank(gc, pdev, epg, bank))
 			dev_warn(&pdev->dev, "Unable to add gpio bank %s\n",
 				 bank->label);
-		/* Only bank F has especially funky IRQ handling */
-		if (i == 5)
-			gc->to_irq = ep93xx_gpio_f_to_irq;
 	}
 
-	ep93xx_gpio_init_irq(pdev, epg);
-
 	return 0;
 }
 
-- 
2.21.0

