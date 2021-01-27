Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0872A3058C2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 11:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhA0KsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 05:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235950AbhA0KrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 05:47:17 -0500
Received: from forward102j.mail.yandex.net (forward102j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653EBC06174A;
        Wed, 27 Jan 2021 02:46:35 -0800 (PST)
Received: from iva6-6aa4ee7025da.qloud-c.yandex.net (iva6-6aa4ee7025da.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:6106:0:640:6aa4:ee70])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 5CC8DF233C9;
        Wed, 27 Jan 2021 13:46:33 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva6-6aa4ee7025da.qloud-c.yandex.net (mxback/Yandex) with ESMTP id f9h9r13gJ3-kXGWXiml;
        Wed, 27 Jan 2021 13:46:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744393;
        bh=dRtGy7GDCULMUNvIFTHiZshKgi9mwsQBzk/q5Xc/ppE=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=B+O61xsFjzdT+TBO8q3wwCa0orghyuqd5iaYaELqRFJY6/As1wtWKqO+16N3w41pi
         MKtU0/1/6dohVXYBFrBQv1hZJd8+u3rfX9yHl8AdmP1R/gCEEKyrR+pAlgNaPua8iq
         8UKv6EdpvHzJA96UUhEhmB7/hwFhiQVj4QzGpIc0=
Authentication-Results: iva6-6aa4ee7025da.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kWm89ilh;
        Wed, 27 Jan 2021 13:46:32 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] gpio: ep93xx: refactor ep93xx_gpio_add_bank
Date:   Wed, 27 Jan 2021 13:46:14 +0300
Message-Id: <20210127104617.1173-7-nikita.shubin@maquefel.me>
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

- replace plain numbers with girq->num_parents in devm_kcalloc
- replace plain numbers with ARRAY_SIZE(girq->parents) for port F
- refactor i - 1 to i + 1 to make loop more readable
- combine getting IRQ's loop and setting handler's into single loop

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8f66e3ca0cfb..e4270b4e5f26 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -384,7 +384,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 
 		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
 		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(dev, 1,
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
 					     sizeof(*girq->parents),
 					     GFP_KERNEL);
 		if (!girq->parents)
@@ -406,15 +406,14 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
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
+		for (i = 0; i < ARRAY_SIZE(girq->parents); i++) {
+			girq->parents[i] = platform_get_irq(pdev, i + 1);
 			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
-- 
2.29.2

