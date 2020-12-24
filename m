Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56242E2663
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 12:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgLXLbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 06:31:16 -0500
Received: from forward105o.mail.yandex.net ([37.140.190.183]:57726 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbgLXLbQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Dec 2020 06:31:16 -0500
X-Greylist: delayed 493 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Dec 2020 06:31:15 EST
Received: from sas1-fe2d9cd6d0e9.qloud-c.yandex.net (sas1-fe2d9cd6d0e9.qloud-c.yandex.net [IPv6:2a02:6b8:c14:3920:0:640:fe2d:9cd6])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 94A2D4202774;
        Thu, 24 Dec 2020 14:22:17 +0300 (MSK)
Received: from sas2-1cbd504aaa99.qloud-c.yandex.net (sas2-1cbd504aaa99.qloud-c.yandex.net [2a02:6b8:c14:7101:0:640:1cbd:504a])
        by sas1-fe2d9cd6d0e9.qloud-c.yandex.net (mxback/Yandex) with ESMTP id ormH2w7xxY-MHDSPN8x;
        Thu, 24 Dec 2020 14:22:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1608808937;
        bh=5vk3A2dN5ebQ4b00f+Y2Y2deucbfh3V9Ia5kveh3BCU=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=L2s4m/GuH/0aSszcLOY+lmSIZZiU6UsduVskSiA/gG2SrGy3gKAMUBOXNnmWftqBf
         oRYj3YIRxK7vlVlSXhcqyDuib95mtkx8YtJhgs7gQgLfmVZvsIg3ASwKgVKbeN/6y7
         8lDCyxjrfoZIQCDcn35JyNGHfsL5loF9f7w4a2w0=
Authentication-Results: sas1-fe2d9cd6d0e9.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas2-1cbd504aaa99.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wXm6oVjgK4-MHJecsqI;
        Thu, 24 Dec 2020 14:22:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] gpio: ep93xx: specify gpio_irq_chip->first
Date:   Thu, 24 Dec 2020 14:22:03 +0300
Message-Id: <20201224112203.7174-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224112203.7174-1-nikita.shubin@maquefel.me>
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
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
index 90afe07213ce..a321a7441294 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -402,6 +402,7 @@ static int ep93xx_gpio_add_f_irq_chip(struct gpio_chip *gc,
 	}
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
+	girq->first = EP93XX_GPIO_F_IRQ_BASE;
 
 	return 0;
 }
-- 
2.26.2

