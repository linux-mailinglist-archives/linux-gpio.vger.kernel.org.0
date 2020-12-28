Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36672E41B5
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 16:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441045AbgL1PLr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 10:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408243AbgL1PLO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 10:11:14 -0500
X-Greylist: delayed 448 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Dec 2020 07:10:25 PST
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603B2C06179C;
        Mon, 28 Dec 2020 07:10:25 -0800 (PST)
Received: from myt4-e3ad475e0976.qloud-c.yandex.net (myt4-e3ad475e0976.qloud-c.yandex.net [IPv6:2a02:6b8:c12:240b:0:640:e3ad:475e])
        by forward104j.mail.yandex.net (Yandex) with ESMTP id 29E934A1251;
        Mon, 28 Dec 2020 18:02:10 +0300 (MSK)
Received: from myt5-ca5ec8faf378.qloud-c.yandex.net (myt5-ca5ec8faf378.qloud-c.yandex.net [2a02:6b8:c12:2514:0:640:ca5e:c8fa])
        by myt4-e3ad475e0976.qloud-c.yandex.net (mxback/Yandex) with ESMTP id JEUUKoOEkX-2AHaDoXU;
        Mon, 28 Dec 2020 18:02:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1609167730;
        bh=8rF2MWGAOEsWs06S9iHqzALnLEi1PQMJ8OPtBzR9Nqs=;
        h=Date:Subject:To:From:Message-Id:Cc;
        b=B6fKFPSvKV6fwY6lhdpbE2UvTRig+gCaW1QNNAJIgwjz/s2lRVw9kXSfO+ijUnSPE
         pqMK1SxqvVhqYzBEWrrxyPBuXdg/tFgC+FqYxwBBNcRA5sPcwlQnCHlFWSkaa/Hxct
         geFarzIYTgG2s/AUS90cDwPM8lUMXGvm06FCjFzw=
Authentication-Results: myt4-e3ad475e0976.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by myt5-ca5ec8faf378.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ZBhtlKloNv-29JGqOcW;
        Mon, 28 Dec 2020 18:02:09 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: warning on gpiochip->to_irq defined
Date:   Mon, 28 Dec 2020 18:00:52 +0300
Message-Id: <20201228150052.2633-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip->to_irq method is redefined in gpiochip_add_irqchip.

A lot of gpiod driver's still define ->to_irq method, let's give
a gentle warning that they can no longer rely on it, so they can remove
it on ocassion.

Fixes: e0d8972898139 ("gpio: Implement tighter IRQ chip integration")
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpiolib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5ce0c14c637b..44538d1a771a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1489,6 +1489,9 @@ static int gpiochip_add_irqchip(struct gpio_chip *gc,
 		type = IRQ_TYPE_NONE;
 	}
 
+	if (gc->to_irq)
+		chip_err(gc, "to_irq is redefined in %s and you shouldn't rely on it\n", __func__);
+
 	gc->to_irq = gpiochip_to_irq;
 	gc->irq.default_type = type;
 	gc->irq.lock_key = lock_key;
-- 
2.29.2

