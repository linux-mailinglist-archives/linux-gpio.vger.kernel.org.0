Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E504E3058ED
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236053AbhA0K4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236217AbhA0Ks1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 05:48:27 -0500
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E886C06174A;
        Wed, 27 Jan 2021 02:48:12 -0800 (PST)
Received: from iva6-c549df431312.qloud-c.yandex.net (iva6-c549df431312.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:611f:0:640:c549:df43])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id 7B0E04A343A;
        Wed, 27 Jan 2021 13:46:30 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva6-c549df431312.qloud-c.yandex.net (mxback/Yandex) with ESMTP id bBxsaB1Qxs-kUGGk9Ff;
        Wed, 27 Jan 2021 13:46:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744390;
        bh=j90hgJ/glY5iXUpLlIe5dqmuAis8qn4vOWe+6aan5l4=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=bP/dZ1oJ1XQd8tecCOstElH3GUsRTIttLLitkQxhIK7H7Y6+gsCMO++51Vj0O1aE7
         h5uAkX3QevOoQ4JvSvYkZVZVu61MkkZfWLD9JgfOFNYeHgFjtAZSOMj+Iz34fzLFan
         uG+ym5IQ5kTkmNJAzSBrC0IXHjdVzx8ldn8x128E=
Authentication-Results: iva6-c549df431312.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kTm8GXSQ;
        Wed, 27 Jan 2021 13:46:29 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] gpio: ep93xx: Fix wrong irq numbers in port F
Date:   Wed, 27 Jan 2021 13:46:11 +0300
Message-Id: <20210127104617.1173-4-nikita.shubin@maquefel.me>
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

Port F irq's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.

So we need to specify girq->first otherwise:

"If device tree is used, then first_irq will be 0 and
irqs get mapped dynamically on the fly"

And that's not the thing we want.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 2eea02c906e0..9c3d049e5af7 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -430,6 +430,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		gc->to_irq = ep93xx_gpio_f_to_irq;
+		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.29.2

