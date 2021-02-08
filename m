Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBBA312CC4
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhBHJIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 04:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbhBHJAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 04:00:50 -0500
Received: from forward104p.mail.yandex.net (forward104p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8AEC061797;
        Mon,  8 Feb 2021 01:00:07 -0800 (PST)
Received: from iva5-92838732ac93.qloud-c.yandex.net (iva5-92838732ac93.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:5c9c:0:640:9283:8732])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id 12AA44B02840;
        Mon,  8 Feb 2021 12:00:06 +0300 (MSK)
Received: from iva5-057a0d1fbbd8.qloud-c.yandex.net (iva5-057a0d1fbbd8.qloud-c.yandex.net [2a02:6b8:c0c:7f1c:0:640:57a:d1f])
        by iva5-92838732ac93.qloud-c.yandex.net (mxback/Yandex) with ESMTP id ORo1Eve0am-05FiD2eC;
        Mon, 08 Feb 2021 12:00:05 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612774806;
        bh=b/Ry2Xk9aF/rndRuF3W44rB8uOXHH3UAMyk1tmA0CIQ=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=Df0LmBi+Pm4n0AwzjNj/4+dnJB4juLVWMSS5wkM3dPxssIJDg3+3Tzaq82hbkj4LP
         qCFtA5Wyg3q5eUSlddR94N58DuJ96Y0G5MHwM52K83jSN8N29H54OpCStN7v5cverJ
         i9LIx2rth4K5LOdExgodHoutC+/VXbBvthSZ9J6s=
Authentication-Results: iva5-92838732ac93.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva5-057a0d1fbbd8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id N9nOuejTfy-05JmNOnk;
        Mon, 08 Feb 2021 12:00:05 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
Date:   Mon,  8 Feb 2021 11:59:52 +0300
Message-Id: <20210208085954.30050-6-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208085954.30050-1-nikita.shubin@maquefel.me>
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix typo in comment.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index f8b21e1d55ed..9ac8a8b830c1 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -395,7 +395,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 		/*
 		 * FIXME: convert this to use hierarchical IRQ support!
-		 * this requires fixing the root irqchip to be hierarchial.
+		 * this requires fixing the root irqchip to be hierarchical.
 		 */
 		girq->parent_handler = ep93xx_gpio_f_irq_handler;
 		girq->num_parents = 8;
-- 
2.26.2

