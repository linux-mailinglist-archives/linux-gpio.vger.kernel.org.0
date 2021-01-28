Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A4A3075EF
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhA1MYC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhA1MWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 07:22:51 -0500
Received: from forward105j.mail.yandex.net (forward105j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFB4C061786;
        Thu, 28 Jan 2021 04:21:44 -0800 (PST)
Received: from sas1-44e0060c3838.qloud-c.yandex.net (sas1-44e0060c3838.qloud-c.yandex.net [IPv6:2a02:6b8:c08:f21a:0:640:44e0:60c])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id F22A7B2404F;
        Thu, 28 Jan 2021 15:21:41 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-44e0060c3838.qloud-c.yandex.net (mxback/Yandex) with ESMTP id cMRMwpIY5F-LfHiMgu4;
        Thu, 28 Jan 2021 15:21:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836501;
        bh=gSqzfAVVe2QLlO6bgA/NbmqOwAH97wz2L/kiPuJirpw=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=qzSCQ59NZiMeJvPDmiSQVxoAjN7dthHcfgSqeKJ3V7D60hcWsMqvUa44nFSM+WGWi
         bcBQR0zzmkbbvWJkEXil1PAXX0NiEcqlOviJdqhBweYS86XCPust3rSuf9jR4Ja6c6
         TU1F4NUaFEhj3g/uBsbrrJJyk/CbPYGSQSTwwwq4=
Authentication-Results: sas1-44e0060c3838.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-Lfn8Fdfd;
        Thu, 28 Jan 2021 15:21:41 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] gpio: ep93xx: refactor ep93xx_gpio_add_bank
Date:   Thu, 28 Jan 2021 15:21:22 +0300
Message-Id: <20210128122123.25341-7-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
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
v2->v3
- use ->num_parents instead of ARRAY_SIZE()
---
 drivers/gpio/gpio-ep93xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index d69ec09cd618..df55aa13bd9a 100644
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
+		for (i = 0; i < girq->num_parents; i++) {
+			girq->parents[i] = platform_get_irq(pdev, i + 1);
 			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
 			irq_set_chip_data(gpio_irq, &epg->gc[5]);
 			irq_set_chip_and_handler(gpio_irq,
-- 
2.29.2

