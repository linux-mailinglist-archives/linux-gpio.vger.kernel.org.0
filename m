Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637312F9C73
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 11:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387994AbhARJZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 04:25:22 -0500
Received: from forward103p.mail.yandex.net ([77.88.28.106]:40335 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388277AbhARJH1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 04:07:27 -0500
Received: from myt6-5578c6b2b9c3.qloud-c.yandex.net (myt6-5578c6b2b9c3.qloud-c.yandex.net [IPv6:2a02:6b8:c12:37a8:0:640:5578:c6b2])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id 8A37F18C17B1;
        Mon, 18 Jan 2021 12:05:22 +0300 (MSK)
Received: from myt6-9bdf92ffd111.qloud-c.yandex.net (myt6-9bdf92ffd111.qloud-c.yandex.net [2a02:6b8:c12:468a:0:640:9bdf:92ff])
        by myt6-5578c6b2b9c3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id dLSFXTknEI-5MDO4bZ5;
        Mon, 18 Jan 2021 12:05:22 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1610960722;
        bh=eae+71nwdCl87dQPfVh8jK749vbX5rWsf1eR+dT00F0=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=p2LDhD9WmMAGk9IAIwWMUC73UpO78OT1UkOm6yWt+eFHRUNBmyIj/wHhmqtRxKoW1
         Zd9ll/JSQEsieEzp+/FgZq69gZ41+AA9fB5PrPKQZxEjkBy/C8kwAXwgCbTPVXWMeP
         4HK9TLwpufKDgQLlB0+cMBJSSzo6eNM5Yv/So8UI=
Authentication-Results: myt6-5578c6b2b9c3.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt6-9bdf92ffd111.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id mPweMU6MOS-5LIeMc8N;
        Mon, 18 Jan 2021 12:05:21 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpiolib: warning on gpiochip->to_irq defined
Date:   Mon, 18 Jan 2021 12:05:08 +0300
Message-Id: <20210118090508.21686-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228150052.2633-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip->to_irq method is redefined in gpiochip_add_irqchip.

A lot of gpiod driver's still define ->to_irq method, let's give
a gentle warning that they can no longer rely on it, so they can remove
it on ocassion.

Fixes: e0d8972898139 ("gpio: Implement tighter IRQ chip integration")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
v1->v2:
- Change chip_err to chip_warn
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5ce0c14c637b..5a9410c2537d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1489,6 +1489,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 		type = IRQ_TYPE_NONE;
 	}
 
+	if (gc->to_irq)
+		chip_warn(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
+
 	gc->to_irq = gpiochip_to_irq;
 	gc->irq.default_type = type;
 	gc->irq.lock_key = lock_key;
-- 
2.29.2

