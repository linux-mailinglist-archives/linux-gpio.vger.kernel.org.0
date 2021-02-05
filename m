Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3776B310644
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhBEIG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbhBEIGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:02 -0500
Received: from forward101o.mail.yandex.net (forward101o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11CA1C0613D6;
        Fri,  5 Feb 2021 00:05:22 -0800 (PST)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 20F573C02DBA;
        Fri,  5 Feb 2021 11:05:20 +0300 (MSK)
Received: from vla1-977d04bfd94d.qloud-c.yandex.net (vla1-977d04bfd94d.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:3020:0:640:977d:4bf])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 1C1303A20002;
        Fri,  5 Feb 2021 11:05:20 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-977d04bfd94d.qloud-c.yandex.net (mxback/Yandex) with ESMTP id VHRza60bZi-5JH01gO7;
        Fri, 05 Feb 2021 11:05:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512320;
        bh=dNqi01d8QzHphiScOYF0PoGYfIs0vwlJHIgHUmqjP9k=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=hL9uVhABSYCAyq5EK80SP87y1HIzpWO63eb3Biw18Gk0wMcXXYI6apOUXegSoOKvx
         9Fb4ZN5xkaJvqSpxVcYHTnzoV3buHF6bym48at4nsTaVwyj9vVwUncLJXmnNWYu+P5
         nPZq8/c9DBWq7MS1OlvnIUKRku/9u1ks/AlyFAoU=
Authentication-Results: vla1-977d04bfd94d.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5Jn8AvRb;
        Fri, 05 Feb 2021 11:05:19 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] gpio: ep93xx: refactor ep93xx_gpio_add_bank
Date:   Fri,  5 Feb 2021 11:05:06 +0300
Message-Id: <20210205080507.16007-7-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

- replace plain numbers with girq->num_parents in devm_kcalloc
- replace plain numbers with girq->num_parents for port F
- refactor i - 1 to i + 1 to make loop more readable
- combine getting IRQ's loop and setting handler's into single loop

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index d330bff4d9f9..41b5b1de14f6 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -380,7 +380,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
 		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(dev, 1,
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
 					     sizeof(*girq->parents),
 					     GFP_KERNEL);
 		if (!girq->parents)
@@ -402,15 +402,14 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		 */
 		girq->parent_handler = ep93xx_gpio_f_irq_handler;
 		girq->num_parents = 8;
-		girq->parents = devm_kcalloc(dev, 8,
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
 					     sizeof(*girq->parents),
 					     GFP_KERNEL);
 		if (!girq->parents)
 			return -ENOMEM;
 		/* Pick resources 1..8 for these IRQs */
-		for (i = 1; i <= 8; i++)
-			girq->parents[i - 1] = platform_get_irq(pdev, i);
-		for (i = 0; i < 8; i++) {
+		for (i = 0; i < girq->num_parents; i++) {
+			girq->parents[i] = platform_get_irq(pdev, i + 1);
 			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
-- 
2.26.2

