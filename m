Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6313075E5
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhA1MWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:22:46 -0500
Received: from forward100p.mail.yandex.net ([77.88.28.100]:38372 "EHLO
        forward100p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231590AbhA1MWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 28 Jan 2021 07:22:24 -0500
Received: from sas2-3d0e723302f6.qloud-c.yandex.net (sas2-3d0e723302f6.qloud-c.yandex.net [IPv6:2a02:6b8:c08:6c80:0:640:3d0e:7233])
        by forward100p.mail.yandex.net (Yandex) with ESMTP id 2FFCA5981269;
        Thu, 28 Jan 2021 15:21:40 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas2-3d0e723302f6.qloud-c.yandex.net (mxback/Yandex) with ESMTP id SzMlFKvUZz-LeHmRjsC;
        Thu, 28 Jan 2021 15:21:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836500;
        bh=C5a9SAwNEUbR0EuvrWoukVA4pIVxaiS8G+ziQFPV0KI=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=itNi+t5nvny7pHGe6/qW2iTQ8KWsNovm2Xvj6ZoiyL0DI6UkhBhpNy9SEauETszZX
         z1f1nIxpnbcpdfubWT7apxteCdIVjmM8O5qxbNyYgy/Qe0mp4mlTHLl+I6YNfj1L8x
         fHQL1zlZL5lnJQtqUuU/gqsYScw5Lor5I+S2grx8=
Authentication-Results: sas2-3d0e723302f6.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-Ldn81BQu;
        Thu, 28 Jan 2021 15:21:39 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] gpio: ep93xx: drop to_irq binding
Date:   Thu, 28 Jan 2021 15:21:20 +0300
Message-Id: <20210128122123.25341-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
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
index dc88115e34da..ee1cb3b894db 100644
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

