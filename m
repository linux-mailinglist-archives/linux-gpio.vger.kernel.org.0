Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC376315033
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhBINcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhBINcE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:04 -0500
Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::606])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2940AC061786;
        Tue,  9 Feb 2021 05:31:23 -0800 (PST)
Received: from iva5-9febf89e551b.qloud-c.yandex.net (iva5-9febf89e551b.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7a23:0:640:9feb:f89e])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 276295F80763;
        Tue,  9 Feb 2021 16:31:21 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva5-9febf89e551b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id SBE1yoU5u7-VKI0pqlp;
        Tue, 09 Feb 2021 16:31:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877480;
        bh=oSCxM0stiR+3f2VqYJDegwfWeztBw98XkBlyFoS19sc=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=M3UVir7RjgYkpCYvBZeYrMsET+gPNVzsltyCrwSyDRqB4LvJ7WPSSfCFc/gKZPVBr
         SREdYUTClKrdvn7qQgxwO9Yb4j7ebcRfslVdcIHC10WtNP4aOXpBK8hNs/gxQ4838K
         +fNKzENBf7Tsdef0OZnussQgUO3wGiMSuiHlIZ84=
Authentication-Results: iva5-9febf89e551b.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VKoaXPQY;
        Tue, 09 Feb 2021 16:31:20 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
Date:   Tue,  9 Feb 2021 16:31:05 +0300
Message-Id: <20210209133110.7383-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes the following warnings which results in interrupts disabled on
port B/F:

gpio gpiochip1: (B): detected irqchip that is shared with multiple gpiochips: please fix the driver.
gpio gpiochip5: (F): detected irqchip that is shared with multiple gpiochips: please fix the driver.

- added separate irqchip for each interrupt capable gpiochip
- provided unique names for each irqchip

Fixes: d2b091961510 ("gpio: ep93xx: Pass irqchip when adding gpiochip")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
v5->v6:
- add devm_kasprintf() return value check and move it out from 
ep93xx_init_irq_chip()
- removed ep93xx_gpio_irq_chip
- pass girq->chip instead of removed ep93xx_gpio_irq_chip to
irq_set_chip_and_handler for port F
---
 drivers/gpio/gpio-ep93xx.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 64d6c2b4282e..94d9fa0d6aa7 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -38,6 +38,7 @@
 #define EP93XX_GPIO_F_IRQ_BASE 80
 
 struct ep93xx_gpio_irq_chip {
+	struct irq_chip ic;
 	u8 irq_offset;
 	u8 int_unmasked;
 	u8 int_enabled;
@@ -263,15 +264,6 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static struct irq_chip ep93xx_gpio_irq_chip = {
-	.name		= "GPIO",
-	.irq_ack	= ep93xx_gpio_irq_ack,
-	.irq_mask_ack	= ep93xx_gpio_irq_mask_ack,
-	.irq_mask	= ep93xx_gpio_irq_mask,
-	.irq_unmask	= ep93xx_gpio_irq_unmask,
-	.irq_set_type	= ep93xx_gpio_irq_type,
-};
-
 /*************************************************************************
  * gpiolib interface for EP93xx on-chip GPIOs
  *************************************************************************/
@@ -331,6 +323,15 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
 
+static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic)
+{
+	ic->irq_ack = ep93xx_gpio_irq_ack;
+	ic->irq_mask_ack = ep93xx_gpio_irq_mask_ack;
+	ic->irq_mask = ep93xx_gpio_irq_mask;
+	ic->irq_unmask = ep93xx_gpio_irq_unmask;
+	ic->irq_set_type = ep93xx_gpio_irq_type;
+}
+
 static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 				struct platform_device *pdev,
 				struct ep93xx_gpio *epg,
@@ -352,6 +353,8 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 	girq = &gc->irq;
 	if (bank->has_irq || bank->has_hierarchical_irq) {
+		struct irq_chip *ic;
+
 		gc->set_config = ep93xx_gpio_set_config;
 		egc->eic = devm_kcalloc(dev, 1,
 					sizeof(*egc->eic),
@@ -359,7 +362,12 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		if (!egc->eic)
 			return -ENOMEM;
 		egc->eic->irq_offset = bank->irq;
-		girq->chip = &ep93xx_gpio_irq_chip;
+		ic = &egc->eic->ic;
+		ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s", bank->label);
+		if (!ic->name)
+			return -ENOMEM;
+		ep93xx_init_irq_chip(dev, ic);
+		girq->chip = ic;
 	}
 
 	if (bank->has_irq) {
@@ -401,7 +409,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
-						 &ep93xx_gpio_irq_chip,
+						 girq->chip,
 						 handle_level_irq);
 			irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
 		}
-- 
2.26.2

