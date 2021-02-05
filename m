Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75428310664
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhBEIG3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:06:29 -0500
Received: from forward102o.mail.yandex.net ([37.140.190.182]:52882 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231378AbhBEIGM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:12 -0500
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 3BBF166837F6;
        Fri,  5 Feb 2021 11:05:19 +0300 (MSK)
Received: from vla1-85d2a0988c40.qloud-c.yandex.net (vla1-85d2a0988c40.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:511a:0:640:85d2:a098])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 392D23A20010;
        Fri,  5 Feb 2021 11:05:19 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-85d2a0988c40.qloud-c.yandex.net (mxback/Yandex) with ESMTP id q3Bxqkxiwg-5JHiwiVJ;
        Fri, 05 Feb 2021 11:05:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512319;
        bh=Dp6HxZC/4K5OdVprRMjSdc4GwEMF/JOfPqAMm/0L38Y=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=HkKzNoR6SgmJX0Ld1WtB4MtOZRBehEDe03JrBUS4NIiP14GJ4JdH1ocotZrwwuyKP
         vHsHaOMEmL2rJkmZy0PK+dvQO0i+HyDKgvv18GxM/PIsvm+JuNQNt3SR5ZcYq6t1Z0
         Heq1CshG4p8Kd21T1MyVvzjZkkQfj7t3pg9pYUW8=
Authentication-Results: vla1-85d2a0988c40.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5In8Bom7;
        Fri, 05 Feb 2021 11:05:18 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
Date:   Fri,  5 Feb 2021 11:05:05 +0300
Message-Id: <20210205080507.16007-6-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix typo in comment.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 6208a8010ff5..d330bff4d9f9 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -398,7 +398,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 		/*
 		 * FIXME: convert this to use hierarchical IRQ support!
-		 * this requires fixing the root irqchip to be hierarchial.
+		 * this requires fixing the root irqchip to be hierarchical.
 		 */
 		girq->parent_handler = ep93xx_gpio_f_irq_handler;
 		girq->num_parents = 8;
-- 
2.26.2

