Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E91A312CCC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhBHJIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbhBHJAz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:55 -0500
Received: from forward101j.mail.yandex.net (forward101j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B974C0617A9;
        Mon,  8 Feb 2021 01:00:09 -0800 (PST)
Received: from iva1-6891ef6bb416.qloud-c.yandex.net (iva1-6891ef6bb416.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:929a:0:640:6891:ef6b])
        by forward101j.mail.yandex.net (Yandex) with ESMTP id 1D8131BE159F;
        Mon,  8 Feb 2021 12:00:08 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva1-6891ef6bb416.qloud-c.yandex.net (mxback/Yandex) with ESMTP id PyeKurnvJn-07IqkU4M;
        Mon, 08 Feb 2021 12:00:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774808;
        bh=B0IIOt3cj9+Gh6aHiITYj112foxYpEHsZahL1VsljjM=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=Tj/JrZckxfM9Gpijf4UmNkR5Q032U29PDiJvMU9GlyYu9GYH5HDbe3EdrhO5QqE+c
         9Q682bY4539OOXXTre+dhU9YiM3Tp9L1g4lgDL08IPUfQV/JBTz3LruAPcJ/B3rD4u
         YfOa3hc2ZA24bKyXxZZ1r/aOcZvkfgRu/owWQu6k=
Authentication-Results: iva1-6891ef6bb416.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-07Jm5NWj;
        Mon, 08 Feb 2021 12:00:07 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 7/7] gpio: ep93xx: refactor base IRQ number
Date:   Mon,  8 Feb 2021 11:59:54 +0300
Message-Id: <20210208085954.30050-8-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208085954.30050-1-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
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
index e75f7a9e40a0..9cc2c2b4309f 100644
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
@@ -301,14 +303,14 @@ struct ep93xx_gpio_bank {
 
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
@@ -407,7 +409,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		/* Pick resources 1..8 for these IRQs */
 		for (i = 0; i < girq->num_parents; i++) {
 			girq->parents[i] = platform_get_irq(pdev, i + 1);
-			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
+			gpio_irq = bank->irq_base + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
 						 &ep93xx_gpio_irq_chip,
@@ -416,7 +418,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		girq->first = EP93XX_GPIO_F_IRQ_BASE;
+		girq->first = bank->irq_base;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.26.2

