Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5132310641
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhBEIGJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhBEIGD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:03 -0500
Received: from forward105o.mail.yandex.net (forward105o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F04C061793;
        Fri,  5 Feb 2021 00:05:22 -0800 (PST)
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id E22294203827;
        Fri,  5 Feb 2021 11:05:20 +0300 (MSK)
Received: from vla1-4e4ee944ff6b.qloud-c.yandex.net (vla1-4e4ee944ff6b.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:3192:0:640:4e4e:e944])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id DDE6D7080004;
        Fri,  5 Feb 2021 11:05:20 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-4e4ee944ff6b.qloud-c.yandex.net (mxback/Yandex) with ESMTP id EmakGzbKsi-5KHOfrIV;
        Fri, 05 Feb 2021 11:05:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512320;
        bh=C5tU/jiLrZmvj9xOWKPAfwt+7YcgCQ3SmmER8nQlmxc=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=DOgAfDXIHXQm6lp8n6o9EdKgZe9lkl9EYWzW9kYbNUwQcZQ86xshLa4bhC76uq/v/
         smhm76sS+RpTZd3n4vkXQEaUdBf1KoOLtMcVfPtVHf4kigsdrwMvxmPYJmQ4cGiVCQ
         73EUaafLOKLyU7B3hz0CiLGCRnkfJLM0fHKl6bsQ=
Authentication-Results: vla1-4e4ee944ff6b.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5Kn8lqqC;
        Fri, 05 Feb 2021 11:05:20 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] gpio: ep93xx: refactor base IRQ number
Date:   Fri,  5 Feb 2021 11:05:07 +0300
Message-Id: <20210205080507.16007-8-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- use predefined constants instead of plain numbers
- use provided bank IRQ number instead of defined constant
  for port F

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 41b5b1de14f6..252f7d765ff2 100644
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
@@ -304,14 +306,17 @@ _irq_name) \
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false, 64, "gpio-irq-a"),
+	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0x90, 0, true, false,
+			EP93XX_GPIO_A_IRQ_BASE, "gpio-irq-a"),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false, 72, "gpio-irq-b"),
+	EP93XX_GPIO_BANK("B", 0x04, 0x14, 0xac, 8, true, false,
+			 EP93XX_GPIO_B_IRQ_BASE, "gpio-irq-b"),
 	EP93XX_GPIO_BANK("C", 0x08, 0x18, 0x00, 40, false, false, 0, 0),
 	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 0x00, 24, false, false, 0, 0),
 	EP93XX_GPIO_BANK("E", 0x20, 0x24, 0x00, 32, false, false, 0, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0, "gpio-irq-b"),
+	EP93XX_GPIO_BANK("F", 0x30, 0x34, 0x4c, 16, false, true, 0,
+			 EP93XX_GPIO_F_IRQ_BASE, "gpio-irq-b"),
 	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 0x00, 48, false, false, 0, 0),
 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 0x00, 56, false, false, 0, 0),
 };
@@ -410,7 +415,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		/* Pick resources 1..8 for these IRQs */
 		for (i = 0; i < girq->num_parents; i++) {
 			girq->parents[i] = platform_get_irq(pdev, i + 1);
-			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
+			gpio_irq = bank->irq_base + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
 						 &ep93xx_gpio_irq_chip,
@@ -419,7 +424,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		girq->first = EP93XX_GPIO_F_IRQ_BASE;
+		girq->first = bank->irq_base;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.26.2

