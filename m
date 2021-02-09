Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49067315034
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbhBINcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:07 -0500
Received: from forward105p.mail.yandex.net ([77.88.28.108]:50204 "EHLO
        forward105p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231217AbhBINcF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:05 -0500
Received: from iva8-f240adbdb32e.qloud-c.yandex.net (iva8-f240adbdb32e.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:1090:0:640:f240:adbd])
        by forward105p.mail.yandex.net (Yandex) with ESMTP id 090084D40336;
        Tue,  9 Feb 2021 16:31:22 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva8-f240adbdb32e.qloud-c.yandex.net (mxback/Yandex) with ESMTP id LxUrp0zlDJ-VLHaWaEY;
        Tue, 09 Feb 2021 16:31:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877481;
        bh=lduRyAoxgIxVCQylqzBQTH5yxMhYzLooO1actsXv0Zw=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=oL3DjYHxhTQ4LDWWRt3fqlJc9jsGukxLvaI2EN/TyVzrhtq7QYrvna+1hiVsV4EZX
         4ZFP3/3LVUmZR18oJpcjXepC3mPh6CzTt2vAhzZKYW+DYWobZpmpmSFNyFKxmx9NTK
         Lksw5woq70189/arxsZDH79LgwYVKJ43gCGJ92B0=
Authentication-Results: iva8-f240adbdb32e.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VLoaIiCG;
        Tue, 09 Feb 2021 16:31:21 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/7] gpio: ep93xx: Fix wrong irq numbers in port F
Date:   Tue,  9 Feb 2021 16:31:06 +0300
Message-Id: <20210209133110.7383-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Port F IRQ's should be statically mapped to EP93XX_GPIO_F_IRQ_BASE.

So we need to specify girq->first otherwise:

"If device tree is used, then first_irq will be 0 and
IRQ's get mapped dynamically on the fly"

And that's not the thing we want.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 94d9fa0d6aa7..3dea4ce929ab 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -416,6 +416,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		gc->to_irq = ep93xx_gpio_f_to_irq;
+		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.26.2

