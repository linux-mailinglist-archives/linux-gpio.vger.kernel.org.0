Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAD4554E1C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 14:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfFYMAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 08:00:37 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33373 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbfFYMAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 08:00:36 -0400
Received: by mail-lj1-f195.google.com with SMTP id h10so16000276ljg.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCnx7+vEWLxoTxYjo8W0VzMykCqCie/YUZR23ZSHHoU=;
        b=FPsq9zsCkdIRmRNh3B5i7NWjkFfSNp0R1TamD4DOGSlV4NFndxvA/0u3752z1Cvead
         PQCIV+8kwCn5ulEGMULGr2QhWYKOI6+EOkZ1wAXAsVB+tBrt98K7whEESfSWm7Y3QWMX
         QuWzQw0NLgfyvgyVH4Er0aSYRbh5nZh9f3NLUVxYKRkXFtftbg9OkIa7vyG/BP+Xcm9R
         yODtisrFHVrXAr6EcJLj+NvL6eT1NEy+xBRqY9d+7ELQv7k7bqQkHtdxzuRhP0wSWZxd
         WMZX8zFJpqxRuMQXNW3uG6miJg+wnnigdTz0nHy1QnO8YNUXSbt0NgxL1RHi1Nulh41Q
         JKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iCnx7+vEWLxoTxYjo8W0VzMykCqCie/YUZR23ZSHHoU=;
        b=SXLn5OZkVngi27rwesY+XHDErXhGFc8U2EWVp+VlWo6FW7P4PiAdKq4oap59eAAPsV
         PtF40w3jYBbG1azSI2SJTUYzYIb+hLzBsmhYRnppekF6pPM3UmI0/eY/fTXxzhqjbMC7
         nEz+7xxm13LZ/v3Bu2ujyczMI8bEuIqAStVNRa0FGnPmg1ogIA/16IYnvLjbNqInQ7tF
         67DfK9JBwIIODy06vExy7Vu4x5siGcIlzDx7bgRFCqg21sB3QsZ2Xh50soIlAe3SONhy
         gHjWOuA14H3Cm2ZXBakGvRtFw9VHAckAr20Up3ovyynTMELf02Lsygi5djdtVvEaMTPQ
         zStw==
X-Gm-Message-State: APjAAAWpVBNJ6N9DWFE7XF1DNCjddlpdgiqbRh6De5H2QVwuDb4kDhXX
        YEW4Uf8QB3ZOBCYuBoUt07S2F6tqJEQ=
X-Google-Smtp-Source: APXvYqz2FcBz7ubr/TBgd6ZTN92sVGtKQvPOx4LVKJrp5N6QXOj5PgTK7uotUmr59TIBMJas3aVnXA==
X-Received: by 2002:a2e:206:: with SMTP id 6mr78488027ljc.59.1561464033067;
        Tue, 25 Jun 2019 05:00:33 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id i23sm2226169ljb.7.2019.06.25.05.00.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 05:00:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alban Bedel <albeu@free.fr>, linux-mips@linux-mips.org
Subject: [PATCH] gpio: ath79: Pass irqchip when adding gpiochip
Date:   Tue, 25 Jun 2019 14:00:30 +0200
Message-Id: <20190625120030.16432-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip.

For chained irqchips this is a pretty straight-forward
conversion.

Take this opportunity to add a local dev pointer and
use devm_gpiochip_add() so we can get rid of the remove()
callback altogether.

Cc: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 66 ++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 0a553d676042..190839b69dc0 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -225,14 +225,16 @@ MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
 	struct ath79_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct ath79_gpio_ctrl *ctrl;
+	struct gpio_irq_chip *girq;
 	struct resource *res;
 	u32 ath79_gpio_count;
 	bool oe_inverted;
 	int err;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, ctrl);
@@ -240,7 +242,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (np) {
 		err = of_property_read_u32(np, "ngpios", &ath79_gpio_count);
 		if (err) {
-			dev_err(&pdev->dev, "ngpios property is not valid\n");
+			dev_err(dev, "ngpios property is not valid\n");
 			return err;
 		}
 		oe_inverted = of_device_is_compatible(np, "qca,ar9340-gpio");
@@ -248,25 +250,24 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		ath79_gpio_count = pdata->ngpios;
 		oe_inverted = pdata->oe_inverted;
 	} else {
-		dev_err(&pdev->dev, "No DT node or platform data found\n");
+		dev_err(dev, "No DT node or platform data found\n");
 		return -EINVAL;
 	}
 
 	if (ath79_gpio_count >= 32) {
-		dev_err(&pdev->dev, "ngpios must be less than 32\n");
+		dev_err(dev, "ngpios must be less than 32\n");
 		return -EINVAL;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -EINVAL;
-	ctrl->base = devm_ioremap_nocache(
-		&pdev->dev, res->start, resource_size(res));
+	ctrl->base = devm_ioremap_nocache(dev, res->start, resource_size(res));
 	if (!ctrl->base)
 		return -ENOMEM;
 
 	raw_spin_lock_init(&ctrl->lock);
-	err = bgpio_init(&ctrl->gc, &pdev->dev, 4,
+	err = bgpio_init(&ctrl->gc, dev, 4,
 			ctrl->base + AR71XX_GPIO_REG_IN,
 			ctrl->base + AR71XX_GPIO_REG_SET,
 			ctrl->base + AR71XX_GPIO_REG_CLEAR,
@@ -274,45 +275,33 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 			oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
 			0);
 	if (err) {
-		dev_err(&pdev->dev, "bgpio_init failed\n");
+		dev_err(dev, "bgpio_init failed\n");
 		return err;
 	}
 	/* Use base 0 to stay compatible with legacy platforms */
 	ctrl->gc.base = 0;
 
-	err = gpiochip_add_data(&ctrl->gc, ctrl);
-	if (err) {
-		dev_err(&pdev->dev,
-			"cannot add AR71xx GPIO chip, error=%d", err);
-		return err;
+	/* Optional interrupt setup */
+	if (!np || of_property_read_bool(np, "interrupt-controller")) {
+		girq = &ctrl->gc.irq;
+		girq->chip = &ath79_gpio_irqchip;
+		girq->parent_handler = ath79_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = platform_get_irq(pdev, 0);
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_simple_irq;
 	}
 
-	if (np && !of_property_read_bool(np, "interrupt-controller"))
-		return 0;
-
-	err = gpiochip_irqchip_add(&ctrl->gc, &ath79_gpio_irqchip, 0,
-				handle_simple_irq, IRQ_TYPE_NONE);
+	err = devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
 	if (err) {
-		dev_err(&pdev->dev, "failed to add gpiochip_irqchip\n");
-		goto gpiochip_remove;
+		dev_err(dev,
+			"cannot add AR71xx GPIO chip, error=%d", err);
+		return err;
 	}
-
-	gpiochip_set_chained_irqchip(&ctrl->gc, &ath79_gpio_irqchip,
-				platform_get_irq(pdev, 0),
-				ath79_gpio_irq_handler);
-
-	return 0;
-
-gpiochip_remove:
-	gpiochip_remove(&ctrl->gc);
-	return err;
-}
-
-static int ath79_gpio_remove(struct platform_device *pdev)
-{
-	struct ath79_gpio_ctrl *ctrl = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&ctrl->gc);
 	return 0;
 }
 
@@ -322,7 +311,6 @@ static struct platform_driver ath79_gpio_driver = {
 		.of_match_table	= ath79_gpio_of_match,
 	},
 	.probe = ath79_gpio_probe,
-	.remove = ath79_gpio_remove,
 };
 
 module_platform_driver(ath79_gpio_driver);
-- 
2.20.1

