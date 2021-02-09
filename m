Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41AC5315036
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbhBINcJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:09 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:38372 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231290AbhBINcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:07 -0500
Received: from iva7-79032ba5307a.qloud-c.yandex.net (iva7-79032ba5307a.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:320d:0:640:7903:2ba5])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id DF251940841;
        Tue,  9 Feb 2021 16:31:22 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva7-79032ba5307a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 4xUL0yc1Kv-VMHuFLAD;
        Tue, 09 Feb 2021 16:31:22 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877482;
        bh=6S6Er/Wd3A9qOjKgdKrJomCOg7AI6A4lzn/1huv+h7A=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=YVHSsBpFM4D9avKnHedyXb1ghhuxR5pJP3rXoMAapSBh2etQoajEjp1wREfbi4qmQ
         YXgQWUpz6PRRLuVIHrAC96qkjPOQHGZKaQX24hUONW/xrrFu5WPJQHO9+3rov+zu5a
         bDFoTXbpD9/VN/+lruRhBiHY3S3KuK88lK36dy8Q=
Authentication-Results: iva7-79032ba5307a.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VMoaSXTp;
        Tue, 09 Feb 2021 16:31:22 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/7] gpio: ep93xx: drop to_irq binding
Date:   Tue,  9 Feb 2021 16:31:07 +0300
Message-Id: <20210209133110.7383-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As ->to_irq is redefined in gpiochip_add_irqchip, having it defined in
driver is useless, so let's drop it.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 3dea4ce929ab..a69bf3100f99 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -318,11 +318,6 @@ static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	return EP93XX_GPIO_F_IRQ_BASE + offset;
-}
-
 static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic)
 {
 	ic->irq_ack = ep93xx_gpio_irq_ack;
@@ -415,7 +410,6 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		gc->to_irq = ep93xx_gpio_f_to_irq;
 		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
-- 
2.26.2

