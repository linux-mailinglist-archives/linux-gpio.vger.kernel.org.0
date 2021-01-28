Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FA53075F0
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhA1MYI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbhA1MWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 07:22:51 -0500
Received: from forward106p.mail.yandex.net (forward106p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AD2C061788;
        Thu, 28 Jan 2021 04:21:44 -0800 (PST)
Received: from sas1-121c281eae19.qloud-c.yandex.net (sas1-121c281eae19.qloud-c.yandex.net [IPv6:2a02:6b8:c08:cf03:0:640:121c:281e])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id D7DB91C81DB1;
        Thu, 28 Jan 2021 15:21:42 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-121c281eae19.qloud-c.yandex.net (mxback/Yandex) with ESMTP id QDw1zldknv-LgICE5iY;
        Thu, 28 Jan 2021 15:21:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836502;
        bh=TxePM7yigEWZGALCm3l//RosNPu0MYRdbDRTJyb50So=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=AGkP3Lv6J+8Sh2s9RHlv3t3oiL7QDQkThKt+VtwXQGobRSfG/YNhmlqe1tF9kH5F5
         XWSfwX/hpNpXZVZ6RWdys2P7VOFwOAm3IMFkjzjEcHXHIDWJB3VQexKS+oASxx0PL3
         03O2MjrruruIAEHthauQ0LcRh+wJPYVzc+KG50Dg=
Authentication-Results: sas1-121c281eae19.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-Lgn84O12;
        Thu, 28 Jan 2021 15:21:42 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] gpiod: ep93xx: refactor base IRQ number
Date:   Thu, 28 Jan 2021 15:21:23 +0300
Message-Id: <20210128122123.25341-8-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
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
 drivers/gpio/gpio-ep93xx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index df55aa13bd9a..b1501607e8ed 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -28,6 +28,8 @@
 /* Maximum value for irq capable line identifiers */
 #define EP93XX_GPIO_LINE_MAX_IRQ 23
 
+#define EP93XX_GPIO_A_IRQ_BASE 64
+#define EP93XX_GPIO_B_IRQ_BASE 72
 /*
  * Static mapping of GPIO bank F IRQS:
  * F0..F7 (16..24) to irq 80..87.
@@ -311,14 +313,14 @@ struct ep93xx_gpio_bank {
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
+	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, EP93XX_GPIO_A_IRQ_BASE),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
+	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, EP93XX_GPIO_B_IRQ_BASE),
 	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
 	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
 	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
+	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, EP93XX_GPIO_F_IRQ_BASE),
 	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
 };
@@ -414,7 +416,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 		/* Pick resources 1..8 for these IRQs */
 		for (i = 0; i < girq->num_parents; i++) {
 			girq->parents[i] = platform_get_irq(pdev, i + 1);
-			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
+			gpio_irq = bank->irq_base + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
 						 &ep93xx_gpio_irq_chip,
@@ -423,7 +425,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		girq->first = EP93XX_GPIO_F_IRQ_BASE;
+		girq->first = bank->irq_base;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.29.2

