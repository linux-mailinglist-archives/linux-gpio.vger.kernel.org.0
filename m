Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D94312CC6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbhBHJI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:08:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbhBHJAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:50 -0500
Received: from forward104p.mail.yandex.net (forward104p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7752C061794;
        Mon,  8 Feb 2021 01:00:07 -0800 (PST)
Received: from iva6-862b1c8daa54.qloud-c.yandex.net (iva6-862b1c8daa54.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:6107:0:640:862b:1c8d])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id 1F62B4B0277B;
        Mon,  8 Feb 2021 12:00:05 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva6-862b1c8daa54.qloud-c.yandex.net (mxback/Yandex) with ESMTP id C3XTG39PHs-04Ga07VR;
        Mon, 08 Feb 2021 12:00:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774805;
        bh=kAj0mp7ZAXZrwLAHI3+98JSCy6v2QpaSUnUNgLKZJgw=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=n2h/BE0HS4yE5iwpjDfJscxgz4ykXU/fPQ7FziGNhHr3nmxtktAjvUCjQ0Ln+f1+z
         fLXCtUjOft0TH10tAxUitH9eFgHcZY8G8gC/5WHHpWkYY9obHT8EsxHF4cfOkjXw/J
         wg8tjs3Mop55AugbaOMlmPfs5+v1Iw0K4+cuyqvw=
Authentication-Results: iva6-862b1c8daa54.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-04JmmF6Q;
        Mon, 08 Feb 2021 12:00:04 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/7] gpio: ep93xx: drop to_irq binding
Date:   Mon,  8 Feb 2021 11:59:51 +0300
Message-Id: <20210208085954.30050-5-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208085954.30050-1-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
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
index 942da366220a..f8b21e1d55ed 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -327,11 +327,6 @@ static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	return EP93XX_GPIO_F_IRQ_BASE + offset;
-}
-
 static void ep93xx_init_irq_chip(struct device *dev, struct irq_chip *ic, const char *label)
 {
 	ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s", label);
@@ -422,7 +417,6 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		}
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
-		gc->to_irq = ep93xx_gpio_f_to_irq;
 		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
-- 
2.26.2

