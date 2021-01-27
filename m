Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E33058C4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbhA0KsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236008AbhA0KrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 05:47:17 -0500
Received: from forward102j.mail.yandex.net (forward102j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB03CC061574;
        Wed, 27 Jan 2021 02:46:35 -0800 (PST)
Received: from iva1-236c86026a3d.qloud-c.yandex.net (iva1-236c86026a3d.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:928a:0:640:236c:8602])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 5AEB1F2324E;
        Wed, 27 Jan 2021 13:46:34 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva1-236c86026a3d.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 2bxbuQTlKw-kYGSjA0k;
        Wed, 27 Jan 2021 13:46:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744394;
        bh=U9IySu7F9dCEH8iRL26QyhPXIHB9TedVtFyRE/O5o9Y=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=B8i9IOujugkljC708Oxelv2N3xk0XEkc6Kw753pZ6EB+iKHythEWDABQqdSHegkxb
         p5xcpVwEwwP1L7pByCwM8fJUadPy/HLFMA658dnrfsbvxUfE+b85FoScM+UcDJVzq7
         /M/+ih2pZ+dqwmiZSTUms8uXvF6NpRTtkS3uE298=
Authentication-Results: iva1-236c86026a3d.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kXm8ZHOJ;
        Wed, 27 Jan 2021 13:46:33 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] gpio: ep93xx: separate IRQ's setup
Date:   Wed, 27 Jan 2021 13:46:15 +0300
Message-Id: <20210127104617.1173-8-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127104617.1173-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
 <20210127104617.1173-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate IRQ's setup for port A,B,F.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 104 +++++++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index e4270b4e5f26..b212c007240e 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -353,6 +353,64 @@ static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
 	}
 }
 
+static int ep93xx_gpio_add_ab_irq_chip(struct platform_device *pdev,
+					struct gpio_irq_chip *girq,
+					unsigned int irq_base)
+{
+	struct device *dev = &pdev->dev;
+	int ab_parent_irq = platform_get_irq(pdev, 0);
+
+	girq->parent_handler = ep93xx_gpio_ab_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, girq->num_parents,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->parents[0] = ab_parent_irq;
+	girq->first = irq_base;
+
+	return 0;
+}
+
+static int ep93xx_gpio_add_f_irq_chip(struct platform_device *pdev,
+					struct gpio_irq_chip *girq,
+					unsigned int irq_base)
+{
+	int gpio_irq;
+	int i;
+	struct device *dev = &pdev->dev;
+
+	/*
+	 * FIXME: convert this to use hierarchical IRQ support!
+	 * this requires fixing the root irqchip to be hierarchical.
+	 */
+	girq->parent_handler = ep93xx_gpio_f_irq_handler;
+	girq->num_parents = 8;
+	girq->parents = devm_kcalloc(dev, girq->num_parents,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+	/* Pick resources 1..8 for these IRQs */
+	for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
+		girq->parents[i] = platform_get_irq(pdev, i + 1);
+		gpio_irq = irq_base + i;
+		irq_set_chip_data(gpio_irq, &epg->gc[5]);
+		irq_set_chip_and_handler(gpio_irq,
+					 &ep93xx_gpio_irq_chip,
+					 handle_level_irq);
+		irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
+	}
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->first = irq_base;
+
+	return 0;
+}
+
 static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 				struct platform_device *pdev,
 				struct ep93xx_gpio *epg,
@@ -380,50 +438,16 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 	}
 
 	if (bank->has_irq) {
-		int ab_parent_irq = platform_get_irq(pdev, 0);
-
-		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
-		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(dev, girq->num_parents,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents)
-			return -ENOMEM;
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_level_irq;
-		girq->parents[0] = ab_parent_irq;
-		girq->first = bank->irq_base;
+		err = ep93xx_gpio_add_ab_irq_chip(pdev, girq, bank->irq_base);
+		if (err)
+			return err;
 	}
 
 	/* Only bank F has especially funky IRQ handling */
 	if (bank->has_hierarchical_irq) {
-		int gpio_irq;
-		int i;
-
-		/*
-		 * FIXME: convert this to use hierarchical IRQ support!
-		 * this requires fixing the root irqchip to be hierarchical.
-		 */
-		girq->parent_handler = ep93xx_gpio_f_irq_handler;
-		girq->num_parents = 8;
-		girq->parents = devm_kcalloc(dev, girq->num_parents,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents)
-			return -ENOMEM;
-		/* Pick resources 1..8 for these IRQs */
-		for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
-			girq->parents[i] = platform_get_irq(pdev, i + 1);
-			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
-			irq_set_chip_data(gpio_irq, &epg->gc[5]);
-			irq_set_chip_and_handler(gpio_irq,
-						 &ep93xx_gpio_irq_chip,
-						 handle_level_irq);
-			irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
-		}
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_level_irq;
-		girq->first = EP93XX_GPIO_F_IRQ_BASE;
+		err = ep93xx_gpio_add_f_irq_chip(pdev, girq, EP93XX_GPIO_F_IRQ_BASE);
+		if (err)
+			return err;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.29.2

