Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B22223058D0
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236261AbhA0KuP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:50:15 -0500
Received: from forward106p.mail.yandex.net ([77.88.28.109]:41015 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236122AbhA0KsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 05:48:12 -0500
Received: from iva1-cda173853631.qloud-c.yandex.net (iva1-cda173853631.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:9295:0:640:cda1:7385])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id F3C851C80257;
        Wed, 27 Jan 2021 13:46:35 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva1-cda173853631.qloud-c.yandex.net (mxback/Yandex) with ESMTP id ZqjnhxIYpW-kZGKfvVS;
        Wed, 27 Jan 2021 13:46:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744395;
        bh=FiicsN/zzDBdhkm0oMT0jjcfCfrDa8oBEJ8mo65rn54=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=oem9tIOm5Rh94ppFX1Bl+bD1PSNA23Slnz03HWbAdj4auRPeFXvoVNlibVyR7G/jg
         50Ts2d/Hg0yv9iOS6qb9ooHvT6P3cgyPSy8bHZ0HMgCDZyzbpfJe5ePbOyYLZduB69
         NJdNqD+By6/0O7pfV7PdmGFG9ZUVFgowgNeYce0Y=
Authentication-Results: iva1-cda173853631.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kZm8M6nb;
        Wed, 27 Jan 2021 13:46:35 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 9/9] gpio: ep93xx: replace bools with idx for IRQ ports
Date:   Wed, 27 Jan 2021 13:46:17 +0300
Message-Id: <20210127104617.1173-10-nikita.shubin@maquefel.me>
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

Replace boolean values used for determining if gpiochip is IRQ capable
or not with index.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 47 ++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 2aee13b5067d..f75a33b79504 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -44,6 +44,8 @@ struct ep93xx_gpio {
 	struct irq_chip		ic[EP93XX_GPIO_IRQ_CHIPS_NUM];
 };
 
+#define EP93XX_GPIO_A_PORT_INDEX 0
+#define EP93XX_GPIO_B_PORT_INDEX 1
 /*
  * F Port index in GPIOCHIP'S array is 5
  * but we use index 2 for stored values and offsets
@@ -291,38 +293,36 @@ static struct irq_chip ep93xx_gpio_irq_chip = {
  * gpiolib interface for EP93xx on-chip GPIOs
  *************************************************************************/
 struct ep93xx_gpio_bank {
+	u8		idx;
 	const char	*label;
 	int		data;
 	int		dir;
 	int		base;
-	bool		has_irq;
-	bool		has_hierarchical_irq;
 	unsigned int	irq_base;
 };
 
-#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq, _has_hier, _irq_base) \
+#define EP93XX_GPIO_BANK(_index, _label, _data, _dir, _base, _irq_base) \
 	{							\
+		.idx		= _index,			\
 		.label		= _label,			\
 		.data		= _data,			\
 		.dir		= _dir,				\
 		.base		= _base,			\
-		.has_irq	= _has_irq,			\
-		.has_hierarchical_irq = _has_hier,		\
 		.irq_base	= _irq_base,			\
 	}
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, EP93XX_GPIO_A_IRQ_BASE),
+	EP93XX_GPIO_BANK(0, "A", 0x00, 0x10, 0, EP93XX_GPIO_A_IRQ_BASE),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, EP93XX_GPIO_B_IRQ_BASE),
-	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
-	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
-	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
+	EP93XX_GPIO_BANK(1, "B", 0x04, 0x14, 8, EP93XX_GPIO_B_IRQ_BASE),
+	EP93XX_GPIO_BANK(2, "C", 0x08, 0x18, 40, 0),
+	EP93XX_GPIO_BANK(3, "D", 0x0c, 0x1c, 24, 0),
+	EP93XX_GPIO_BANK(4, "E", 0x20, 0x24, 32, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, EP93XX_GPIO_F_IRQ_BASE),
-	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
-	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
+	EP93XX_GPIO_BANK(5, "F", 0x30, 0x34, 16, EP93XX_GPIO_F_IRQ_BASE),
+	EP93XX_GPIO_BANK(6, "G", 0x38, 0x3c, 48, 0),
+	EP93XX_GPIO_BANK(7, "H", 0x40, 0x44, 56, 0),
 };
 
 static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
@@ -356,10 +356,11 @@ static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
 }
 
 static int ep93xx_gpio_add_ab_irq_chip(struct platform_device *pdev,
-					struct gpio_irq_chip *girq,
+					struct gpio_chip *gc,
 					unsigned int irq_base)
 {
 	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq = &gc->irq;
 	int ab_parent_irq = platform_get_irq(pdev, 0);
 
 	girq->parent_handler = ep93xx_gpio_ab_irq_handler;
@@ -378,12 +379,13 @@ static int ep93xx_gpio_add_ab_irq_chip(struct platform_device *pdev,
 }
 
 static int ep93xx_gpio_add_f_irq_chip(struct platform_device *pdev,
-					struct gpio_irq_chip *girq,
+					struct gpio_chip *gc,
 					unsigned int irq_base)
 {
 	int gpio_irq;
 	int i;
 	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq = &gc->irq;
 
 	/*
 	 * FIXME: convert this to use hierarchical IRQ support!
@@ -397,10 +399,10 @@ static int ep93xx_gpio_add_f_irq_chip(struct platform_device *pdev,
 	if (!girq->parents)
 		return -ENOMEM;
 	/* Pick resources 1..8 for these IRQs */
-	for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
+	for (i = 0; i < girq->num_parents; i++) {
 		girq->parents[i] = platform_get_irq(pdev, i + 1);
 		gpio_irq = irq_base + i;
-		irq_set_chip_data(gpio_irq, &epg->gc[5]);
+		irq_set_chip_data(gpio_irq, gc);
 		irq_set_chip_and_handler(gpio_irq,
 					 &ep93xx_gpio_irq_chip,
 					 handle_level_irq);
@@ -433,21 +435,22 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 	gc->base = bank->base;
 
 	girq = &gc->irq;
-	if (bank->has_irq || bank->has_hierarchical_irq) {
+	if (bank->irq_base != 0) {
 		gc->set_config = ep93xx_gpio_set_config;
 		port = ep93xx_gpio_port(epg, gc);
 		girq->chip = &epg->ic[port];
 	}
 
-	if (bank->has_irq) {
-		err = ep93xx_gpio_add_ab_irq_chip(pdev, girq, bank->irq_base);
+	if (bank->idx == EP93XX_GPIO_A_PORT_INDEX ||
+		bank->idx == EP93XX_GPIO_B_PORT_INDEX) {
+		err = ep93xx_gpio_add_ab_irq_chip(pdev, gc, bank->irq_base);
 		if (err)
 			return err;
 	}
 
 	/* Only bank F has especially funky IRQ handling */
-	if (bank->has_hierarchical_irq) {
-		err = ep93xx_gpio_add_f_irq_chip(pdev, girq, bank->irq_base);
+	if (bank->idx == EP93XX_GPIO_F_PORT_INDEX) {
+		err = ep93xx_gpio_add_f_irq_chip(pdev, gc, bank->irq_base);
 		if (err)
 			return err;
 	}
-- 
2.29.2

