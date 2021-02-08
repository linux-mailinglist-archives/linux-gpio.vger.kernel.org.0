Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F4001312CC7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhBHJId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbhBHJAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:50 -0500
Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::606])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC553C0617A7;
        Mon,  8 Feb 2021 01:00:08 -0800 (PST)
Received: from iva3-4f441b146a71.qloud-c.yandex.net (iva3-4f441b146a71.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:498c:0:640:4f44:1b14])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 26C445F82683;
        Mon,  8 Feb 2021 12:00:07 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva3-4f441b146a71.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 537mwW8XWl-06IWgjc3;
        Mon, 08 Feb 2021 12:00:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774807;
        bh=Dvew1cyWJB7ZvuR0min90f0IAtlia3k6CTMpUE02mQs=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=rm1yEwgGcBT57bCRzirWjiRr21wzo1JNQmrLeW68En+htxtJxVQ6g9XxryjLXyr2q
         6IX88r0rW6XobBUYB+6I4yAUfNLTXso4NINdK6UwMEFCdiV5DYMIdPyWVX/LHtYF+2
         a0khONknSlzw7ZAxa8kaCJgWHc91alQIKmGFSX58=
Authentication-Results: iva3-4f441b146a71.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-06JmU6jS;
        Mon, 08 Feb 2021 12:00:06 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] gpio: ep93xx: refactor ep93xx_gpio_add_bank
Date:   Mon,  8 Feb 2021 11:59:53 +0300
Message-Id: <20210208085954.30050-7-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208085954.30050-1-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 9ac8a8b830c1..e75f7a9e40a0 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -377,7 +377,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
 		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(dev, 1,
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
 					     sizeof(*girq->parents),
 					     GFP_KERNEL);
 		if (!girq->parents)
@@ -399,15 +399,14 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
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

