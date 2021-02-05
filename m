Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1070631063C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 09:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhBEIGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 03:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhBEIGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 03:06:00 -0500
Received: from forward102p.mail.yandex.net (forward102p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EE3C06178B;
        Fri,  5 Feb 2021 00:05:19 -0800 (PST)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 846F31D42DC7;
        Fri,  5 Feb 2021 11:05:17 +0300 (MSK)
Received: from vla1-2e2fe8fd096a.qloud-c.yandex.net (vla1-2e2fe8fd096a.qloud-c.yandex.net [IPv6:2a02:6b8:c0d:3495:0:640:2e2f:e8fd])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 803C23A20002;
        Fri,  5 Feb 2021 11:05:17 +0300 (MSK)
Received: from vla1-1bc5b51c612f.qloud-c.yandex.net (vla1-1bc5b51c612f.qloud-c.yandex.net [2a02:6b8:c0d:89c:0:640:1bc5:b51c])
        by vla1-2e2fe8fd096a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id kq3TvhGqOL-5HI4TAcp;
        Fri, 05 Feb 2021 11:05:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612512317;
        bh=L3i2GMpCyjFi2r2lWDiygR7hyvUJiR70+wZlbupXrw4=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=bKMBPtC1fMKSDNbS5HIRqxJIkORcpOoor9qm/DMFyEj865JxHfowdZMTIYwUQBZ/S
         eC2OTY13u+pF24ia9LjQT2NC6WeBSMJLdSvhWr8zBBeauxH97ZSlTwmeAzBXCyFcEc
         jNSDA+zJchNPm1hcTr0bfWSrkp8gSpF/dDgRGE0s=
Authentication-Results: vla1-2e2fe8fd096a.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by vla1-1bc5b51c612f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 8MWdPhaokU-5Gn8ZJw6;
        Fri, 05 Feb 2021 11:05:17 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] gpio: gpio-ep93xx: Fix wrong irq numbers in port F
Date:   Fri,  5 Feb 2021 11:05:03 +0300
Message-Id: <20210205080507.16007-4-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
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
index 3c9f7233e62d..38eeaa5c0e1e 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -426,6 +426,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_level_irq;
 		gc->to_irq = ep93xx_gpio_f_to_irq;
+		girq->first = EP93XX_GPIO_F_IRQ_BASE;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
-- 
2.26.2

