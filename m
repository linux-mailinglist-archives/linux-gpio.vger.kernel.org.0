Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF5FD69D02
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2019 22:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbfGOUp4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 16:45:56 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45884 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbfGOUp4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jul 2019 16:45:56 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so17610997lje.12
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jul 2019 13:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZYBOs3aLnhuf2faNdh8yo+pXx5Re8ii69AgHIOGgYXM=;
        b=xXQ84woWd6JtRurNXZ+LWho0SzsWefI+syk6IeKlgUlmeeUzs2BjNwuqUnKZRddNm8
         R/8MscBULhDQ1LucF1wVgpmPD8/8h5jeWM0nMeujOR+KiL/JYABHQvqO+DmUCKXmJd3W
         8NGP3HVRZDsy5/Q5qSkwGTa4n5cCwOH9BxJhC+D6ekrNFgmjbIGDlEAJvUlaDOrcCcBz
         0kuXdZAxbkGS4LgqZV6J3UWgk3Hy86LFvW+88jvM96vIadGu6OQ1SMHAOgV1VtEQDbCx
         /HIym52XN0QAkAKAwAcY4Jk1wKEAu2GCw956zXsOW8N4785cyOzUwmZLAh/IspxzWyv/
         vLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZYBOs3aLnhuf2faNdh8yo+pXx5Re8ii69AgHIOGgYXM=;
        b=AbM4UIsmfNwJ56RiaD1Jnbf4cmdcdRneTwMoHTPZf4zexzsiNtQUVltMQOT0L+u0Zk
         nbjMmmjPYKYd1hYQbvzjsZD5DB6o+okVlr7vHK1nSkQKQQ3cw6adpOH1znz1JYT2zBJ0
         gvzdixlGwL+Xwe4LWzmyoiykKVz7gvK62en6Li2CXHacsOtE7eRTaUYsPhbvoMEWjQJY
         WgmLrlhK3buM9i9PCRDvYf18lXxJQLsVA5cDPrNcIDL8YG22UU3VAcTEgbmIKJH2WCA1
         U2C9vjtWiDX1pU0XWQUfiRGNQRkX4zYtmlp4EAmfiZiKyVQARuSjxS5Tnjj9EaNJxhnm
         vStw==
X-Gm-Message-State: APjAAAXMREJFyvlHIFmd6mS3dPG+ziMTWqnw9yDRkjPO3/gKuXh5pRxX
        aaysBX/Rfxq7YUic+3DF2ZEnz27/YqM=
X-Google-Smtp-Source: APXvYqycBzyi6XjJyj5PoLiqzXEqn1fJu1mTyuzyCrEWAPx1KE6EEg0I/5C7kPkBB2DAM4DfT3Zgbg==
X-Received: by 2002:a2e:5b0f:: with SMTP id p15mr14682754ljb.82.1563223554303;
        Mon, 15 Jul 2019 13:45:54 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id b1sm3338326ljj.26.2019.07.15.13.45.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 13:45:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-spi@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] Revert "gpio/spi: Fix spi-gpio regression on active high CS"
Date:   Mon, 15 Jul 2019 22:45:29 +0200
Message-Id: <20190715204529.9539-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This reverts commit fbbf145a0e0a0177e089c52275fbfa55763e7d1d.

It seems I was misguided in my fixup, which was working at the
time but did not work on the final v5.2.

The patch tried to avoid a quirk the gpiolib code not to treat
"spi-gpio" CS gpios "special" by enforcing them to be active
low, in the belief that since the "spi-gpio" driver was
parsing the device tree on its own, it did not care to inspect
the "spi-cs-high" attribute on the device nodes.

That's wrong. The SPI core was inspecting them inside the
of_spi_parse_dt() funtion and setting SPI_CS_HIGH on the
nodes, and the driver inspected this flag when driving the
line.

As of now, the core handles the GPIO and it will consistently
set the GPIO descriptor to 1 to enable CS, strictly requireing
the gpiolib to invert it. And the gpiolib should indeed
enforce active low on the CS line.

Device trees should of course put the right flag on the GPIO
handles, but it used to not matter. If we don't enforce active
low on "gpio-gpio" we may run into ABI backward compatibility
issues, so revert this.

Cc: linux-spi@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
I am sorry that this at one point fixed a problem for me, it
doesn't anymore and I don't know why it ever did. :(
---
 drivers/gpio/gpiolib-of.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f974075ff00e..a8f02f551d6b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -118,15 +118,8 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	 * Legacy handling of SPI active high chip select. If we have a
 	 * property named "cs-gpios" we need to inspect the child node
 	 * to determine if the flags should have inverted semantics.
-	 *
-	 * This does not apply to an SPI device named "spi-gpio", because
-	 * these have traditionally obtained their own GPIOs by parsing
-	 * the device tree directly and did not respect any "spi-cs-high"
-	 * property on the SPI bus children.
 	 */
-	if (IS_ENABLED(CONFIG_SPI_MASTER) &&
-	    !strcmp(propname, "cs-gpios") &&
-	    !of_device_is_compatible(np, "spi-gpio") &&
+	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
 	    of_property_read_bool(np, "cs-gpios")) {
 		struct device_node *child;
 		u32 cs;
-- 
2.21.0

