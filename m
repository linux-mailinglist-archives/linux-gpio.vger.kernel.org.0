Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0BE2D545F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 08:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbgLJHOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 02:14:52 -0500
Received: from forward106p.mail.yandex.net ([77.88.28.109]:60851 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725833AbgLJHOp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Dec 2020 02:14:45 -0500
X-Greylist: delayed 440 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Dec 2020 02:14:38 EST
Received: from myt6-9be80d028464.qloud-c.yandex.net (myt6-9be80d028464.qloud-c.yandex.net [IPv6:2a02:6b8:c12:5219:0:640:9be8:d02])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 8DC261C83CF3;
        Thu, 10 Dec 2020 10:06:19 +0300 (MSK)
Received: from iva8-b81aeb0c8234.qloud-c.yandex.net (iva8-b81aeb0c8234.qloud-c.yandex.net [2a02:6b8:c0c:da9:0:640:b81a:eb0c])
        by myt6-9be80d028464.qloud-c.yandex.net (mxback/Yandex) with ESMTP id VgOqERvMqT-6JDCaftZ;
        Thu, 10 Dec 2020 10:06:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1607583979;
        bh=AI5SeoejacCczgdU2/tvz99VlW6LkUVH+Sr2RwGLWJU=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=g/bl7xl5/6VCSn2OV5r88PPvdnECzRtjR4ByUoBQBlB4EM140e0PiB4Y8eZ3nCTl1
         HLlcWBs2bmSANoCvuD/F/CSTf9r05OeCYkCWw9QuGVPaSOtNivjZub0cQIF8s0hOgQ
         LoIVv8dONfI4EgW/HCU27qUR4BvH1m6nHUR1fTFc=
Authentication-Results: myt6-9be80d028464.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva8-b81aeb0c8234.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id WTdnBhyMCe-6InWjpBE;
        Thu, 10 Dec 2020 10:06:18 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: irq hooks: fix recursion in gpiochip_irq_unmask
Date:   Thu, 10 Dec 2020 10:05:14 +0300
Message-Id: <20201210070514.13238-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

irqchip shared with multiple gpiochips, leads to recursive call of
gpiochip_irq_mask/gpiochip_irq_unmask which was assigned to
rqchip->irq_mask/irqchip->irq_unmask, these happens becouse of
only irqchip->irq_enable == gpiochip_irq_enable is checked.

Let's add an additional check to make sure shared irqchip is detected
even if irqchip->irq_enable wasn't defined.

Fixes: a8173820f441 ("gpio: gpiolib: Allow GPIO IRQs to lazy disable")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 589eceecf374..5ce0c14c637b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1419,7 +1419,8 @@ static void gpiochip_set_irq_hooks(struct gpio_chip *gc)
 	if (WARN_ON(gc->irq.irq_enable))
 		return;
 	/* Check if the irqchip already has this hook... */
-	if (irqchip->irq_enable == gpiochip_irq_enable) {
+	if (irqchip->irq_enable == gpiochip_irq_enable ||
+		irqchip->irq_mask == gpiochip_irq_mask) {
 		/*
 		 * ...and if so, give a gentle warning that this is bad
 		 * practice.
-- 
2.26.2

