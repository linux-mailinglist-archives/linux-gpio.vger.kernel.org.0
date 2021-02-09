Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7646315039
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhBINcL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:11 -0500
Received: from forward104o.mail.yandex.net ([37.140.190.179]:38428 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231327AbhBINcJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:09 -0500
Received: from iva4-66d7931d4d60.qloud-c.yandex.net (iva4-66d7931d4d60.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:78a3:0:640:66d7:931d])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id B987F940876;
        Tue,  9 Feb 2021 16:31:24 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva4-66d7931d4d60.qloud-c.yandex.net (mxback/Yandex) with ESMTP id tQU3zPfplQ-VOIaxjde;
        Tue, 09 Feb 2021 16:31:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877484;
        bh=aJvzXXLz8Fe5HdokcQEWZcrpg+/kk5XCdinRvVVSvP4=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=thjhnJg1IOd+MXkVZ5VQNHZZWD57de2StTVnntOMKdMyDWbrB1V2DakCJs1zs5xTk
         yHJvldOB4EMB70QK3I1+JE7585iUvNbgAnDXl0xxkJCecOOQyT/nC3F2/uhMSrz9Ri
         KLDysrLBbSWSw/OhsItKwAaU2LHnlj0BfMMtbrXI=
Authentication-Results: iva4-66d7931d4d60.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VNoaSKwt;
        Tue, 09 Feb 2021 16:31:24 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/7] gpio: ep93xx: refactor ep93xx_gpio_add_bank
Date:   Tue,  9 Feb 2021 16:31:09 +0300
Message-Id: <20210209133110.7383-7-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
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
index 9760df7d1172..56ddf6b9baba 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -370,7 +370,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
 		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(dev, 1,
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
 					     sizeof(*girq->parents),
 					     GFP_KERNEL);
 		if (!girq->parents)
@@ -392,15 +392,14 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
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

