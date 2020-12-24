Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA742E2643
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 12:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727759AbgLXLXF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 06:23:05 -0500
Received: from forward101p.mail.yandex.net ([77.88.28.101]:46234 "EHLO
        forward101p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727320AbgLXLXE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Dec 2020 06:23:04 -0500
Received: from sas1-46fc755e9ad1.qloud-c.yandex.net (sas1-46fc755e9ad1.qloud-c.yandex.net [IPv6:2a02:6b8:c08:168c:0:640:46fc:755e])
        by forward101p.mail.yandex.net (Yandex) with ESMTP id CBA5E3282A27;
        Thu, 24 Dec 2020 14:22:16 +0300 (MSK)
Received: from sas2-1cbd504aaa99.qloud-c.yandex.net (sas2-1cbd504aaa99.qloud-c.yandex.net [2a02:6b8:c14:7101:0:640:1cbd:504a])
        by sas1-46fc755e9ad1.qloud-c.yandex.net (mxback/Yandex) with ESMTP id OOszU6btW6-MGDGocsQ;
        Thu, 24 Dec 2020 14:22:16 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1608808936;
        bh=6ef1Y/wT/YxAUYOSfWMBMRXmZUruYuAkUBovxu7izrA=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=CoCN9Atwi/Bty+21ZBJa5mf4undEl8l7VWoMT+Vf90hFViqdKqqdQQRQl9L3ebxyG
         4yhys8pvqYO2NzPxzSXHV+86MZFCtxYhRd6dpzHDbHzzL3vplaxXU4hjmUki0nP8LO
         Pnbhp8xb4SGR9Zh6mH+xy/EHl2X+1BzJ1se1Re7E=
Authentication-Results: sas1-46fc755e9ad1.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas2-1cbd504aaa99.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wXm6oVjgK4-MGJeQTE8;
        Thu, 24 Dec 2020 14:22:16 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/3] gpio: ep93xx: drop to_irq binding
Date:   Thu, 24 Dec 2020 14:22:02 +0300
Message-Id: <20201224112203.7174-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224112203.7174-1-nikita.shubin@maquefel.me>
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As ->to_irq is redefined in gpiochip_add_irqchip, having it defined in
driver is useless, so let's drop it.

Also i think it is worth to give a gentle warning in
gpiochip_add_irqchip, to prevent people relying on to_irq.

For example

WARN_ON_ONCE(gc->to_irq,
"to_irq is redefined in gpiochip_add_irqchip" \
"and you shouldn't rely on it\n");

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index d6db0ff16581..90afe07213ce 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -325,11 +325,6 @@ static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	return EP93XX_GPIO_F_IRQ_BASE + offset;
-}
-
 static int ep93xx_gpio_add_ab_irq_chip(struct gpio_chip *gc,
 					struct platform_device *pdev,
 					struct ep93xx_irq_chip *eic,
@@ -407,7 +402,6 @@ static int ep93xx_gpio_add_f_irq_chip(struct gpio_chip *gc,
 	}
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
-	gc->to_irq = ep93xx_gpio_f_to_irq;
 
 	return 0;
 }
-- 
2.26.2

