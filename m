Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13203312CC3
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhBHJIC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbhBHJAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:47 -0500
Received: from forward106p.mail.yandex.net (forward106p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19017C06178C;
        Mon,  8 Feb 2021 01:00:06 -0800 (PST)
Received: from iva3-863a678c0048.qloud-c.yandex.net (iva3-863a678c0048.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:380:0:640:863a:678c])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 1F6081C82902;
        Mon,  8 Feb 2021 12:00:04 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva3-863a678c0048.qloud-c.yandex.net (mxback/Yandex) with ESMTP id eQZnP3ETh6-03HOaIIi;
        Mon, 08 Feb 2021 12:00:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774804;
        bh=TMVXM8lOITeIf4e94RQ4XSv0Ym1M40k+VpYRONppqTc=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=r6FdlVPJmHY2uDxlpxsS/ehgPm+yeNLAiP0q+UlfKBl26LUsS52g9VGH1VCEYYHmn
         K1uJCISbW7edCeTmD/zKFW0l+XoB/CKfauK3i7r0DSONvyGHfMMgF3Za8ltqx/p2Ti
         DgGWNROMG7YEkqd8Ke3juvOL1DdxiRXNKmBpGYg8=
Authentication-Results: iva3-863a678c0048.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-03Jm76fA;
        Mon, 08 Feb 2021 12:00:03 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/7] gpio: ep93xx: Fix wrong irq numbers in port F
Date:   Mon,  8 Feb 2021 11:59:50 +0300
Message-Id: <20210208085954.30050-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208085954.30050-1-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port F IRQ's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.

So we need to specify girq->first otherwise:

"If device tree is used, then first_irq will be 0 and
IRQ's get mapped dynamically on the fly"

And that's not the thing we want.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 3d8eb8769470..942da366220a 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -423,6 +423,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		gc->to_irq = ep93xx_gpio_f_to_irq;
+		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.26.2

