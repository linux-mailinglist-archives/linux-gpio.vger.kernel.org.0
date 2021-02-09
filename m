Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD2B31503B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhBINcM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:12 -0500
Received: from forward101o.mail.yandex.net ([37.140.190.181]:58702 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231372AbhBINcK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:10 -0500
Received: from iva8-6377ea28ef3a.qloud-c.yandex.net (iva8-6377ea28ef3a.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:6f19:0:640:6377:ea28])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 980D03C00701;
        Tue,  9 Feb 2021 16:31:25 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva8-6377ea28ef3a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id yc8VEB54Y4-VPHqF0LB;
        Tue, 09 Feb 2021 16:31:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877485;
        bh=+/uxnxwE2Nyf3yhoKeSMi41J9tcJnV5GDK4jB7MzCqk=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=XBkb8WvD78ej/4a1PrX/F3/oEXLYtlvP/iuJYODq0BlhTswJ5dAEq/em2i6aLhJsT
         NGmVhzhExTMwJIKpuq03pHPAkcAokB0miGpLEzWOBD0LH1iHJ1bnFA4pGdl0JdG9mJ
         /I4EB9IWfxpER5rclsS/w2fUozrrgXNSj5H0MUdU=
Authentication-Results: iva8-6377ea28ef3a.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VOoaOhTX;
        Tue, 09 Feb 2021 16:31:24 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/7] gpio: ep93xx: refactor base IRQ number
Date:   Tue,  9 Feb 2021 16:31:10 +0300
Message-Id: <20210209133110.7383-8-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- use predefined constants instead of plain numbers
- use provided bank IRQ number instead of defined constant
  for port F

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 56ddf6b9baba..ef148b26b587 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -31,6 +31,8 @@
 /* Maximum value for irq capable line identifiers */
 #define EP93XX_GPIO_LINE_MAX_IRQ 23
 
+#define EP93XX_GPIO_A_IRQ_BASE 64
+#define EP93XX_GPIO_B_IRQ_BASE 72
 /*
  * Static mapping of GPIO bank F IRQS:
  * F0..F7 (16..24) to irq 80..87.
@@ -292,14 +294,14 @@ struct ep93xx_gpio_bank {
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64),
+	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, EP93XX_GPIO_A_IRQ_BASE),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72),
+	EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, EP93XX_GPIO_B_IRQ_BASE),
 	EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0),
 	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0),
 	EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0),
+	EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, EP93XX_GPIO_F_IRQ_BASE),
 	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0),
 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0),
 };
@@ -400,7 +402,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		/* Pick resources 1..8 for these IRQs */
 		for (i = 0; i < girq->num_parents; i++) {
 			girq->parents[i] = platform_get_irq(pdev, i + 1);
-			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
+			gpio_irq = bank->irq_base + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
 						 girq->chip,
@@ -409,7 +411,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		girq->first = EP93XX_GPIO_F_IRQ_BASE;
+		girq->first = bank->irq_base;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.26.2

