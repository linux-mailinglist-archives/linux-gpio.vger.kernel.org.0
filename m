Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F43B305969
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:17:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236437AbhA0LQ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:16:59 -0500
Received: from forward105p.mail.yandex.net ([77.88.28.108]:46567 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235819AbhA0KsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 05:48:11 -0500
Received: from iva4-f37646ae0ac9.qloud-c.yandex.net (iva4-f37646ae0ac9.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:129b:0:640:f376:46ae])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id 69BD94D40536;
        Wed, 27 Jan 2021 13:46:31 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva4-f37646ae0ac9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id xs0kKcIVQu-kVGSt2VN;
        Wed, 27 Jan 2021 13:46:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744391;
        bh=BYLI0uaOO2NhX0FCc/Twqb9p7Ic5Pl5n2ndNJuC6t8o=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=k6h5YjVlVLfSCY2172+sWmMJSCYvTO3Fqo7mWw02iHI74PcUeCciRUgBKrx+z+UdB
         PQ2vZypJnUDr9cGZ84xUn2XseqWLFfB07SdM04vl84nKBT942bpZ0QZh/LE6WiIiiC
         n+5kzNPnpkQEPQB8lZ5mfGsQgIYz9zlJE4gIWQQk=
Authentication-Results: iva4-f37646ae0ac9.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kUm8BALV;
        Wed, 27 Jan 2021 13:46:30 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] gpio: ep93xx: drop to_irq binding
Date:   Wed, 27 Jan 2021 13:46:12 +0300
Message-Id: <20210127104617.1173-5-nikita.shubin@maquefel.me>
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

As ->to_irq is redefined in gpiochip_add_irqchip, having it defined in
driver is useless, so let's drop it.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 9c3d049e5af7..dee19372ebbd 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -337,11 +337,6 @@ static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	return EP93XX_GPIO_F_IRQ_BASE + offset;
-}
-
 static void ep93xx_init_irq_chips(struct ep93xx_gpio *epg)
 {
 	int i;
@@ -429,7 +424,6 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		gc->to_irq = ep93xx_gpio_f_to_irq;
 		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
-- 
2.29.2

