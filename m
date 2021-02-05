Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B8131063F
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhBEIGE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:06:04 -0500
Received: from forward101o.mail.yandex.net ([37.140.190.181]:57780 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230133AbhBEIGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:02 -0500
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 5B7D73C03740;
        Fri,  5 Feb 2021 11:05:18 +0300 (MSK)
Received: from vla1-ae662a693c21.qloud-c.yandex.net (vla1-ae662a693c21.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:2915:0:640:ae66:2a69])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id 575C77080009;
        Fri,  5 Feb 2021 11:05:18 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-ae662a693c21.qloud-c.yandex.net (mxback/Yandex) with ESMTP id iilsBm1FJI-5IHmpm7V;
        Fri, 05 Feb 2021 11:05:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512318;
        bh=+WtcWBh58n5WNwBJ+Z/NkhGBdSYSmclbOjEUFB/CcOE=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=ahbC8NAwD+LjDX/63GTuQdw9YYfH/toKKnlgWpEsD0B2XSymcNJw3T/G6oYG+W426
         315h16PCAbsPcaxByKccKIcyYAM4BtfNZfInwFf+22qe5tSbWNCoqp+ClgbOSIVjP3
         NxI7kOTPaZSXAp8RqHx+juTqhhenuyl3Z7AZ/BCg=
Authentication-Results: vla1-ae662a693c21.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5Hn8rYH6;
        Fri, 05 Feb 2021 11:05:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] gpio: ep93xx: drop to_irq binding
Date:   Fri,  5 Feb 2021 11:05:04 +0300
Message-Id: <20210205080507.16007-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
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
index 38eeaa5c0e1e..6208a8010ff5 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -330,11 +330,6 @@ static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	return EP93XX_GPIO_F_IRQ_BASE + offset;
-}
-
 static void ep93xx_init_irq_chip(struct irq_chip *ic, const char *irq_name)
 {
 	ic->name = irq_name;
@@ -425,7 +420,6 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		gc->to_irq = ep93xx_gpio_f_to_irq;
 		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
-- 
2.26.2

