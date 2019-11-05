Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9814DEFB01
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388098AbfKEKZi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:25:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45786 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEKZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:25:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id n21so7544506ljg.12;
        Tue, 05 Nov 2019 02:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIE7PHR5n6kkKpkKiiyu4APe9Fu8muktBLyL9wQHbZs=;
        b=T/MgBrF8HqH0HavKNPg0BfFSIdhIhru9dR4Tp5HlufFedPpNd/9LdhmYUIVC4Yvsjc
         cpQoCUn8cwmHS/sQtEaOXIkSboWkiiN5y2mEkM7gkbfeguxW7FuH44vESTwAFn0dctRZ
         aLBu0i6spQSOArOzcy2TT+TP2EFqC27cIp6FPMmLvYt83EiBTjNGKT5r9I3PLMtYHeiJ
         nn8Imwci4SPoh4gFO+IKhWIZGC8RHZ+lsF9pOMpGO6jKSvKtq49c4tbowJfyH7/NDy7Z
         Elnl0tVfHePOhGeZR8AHc7MkUX/IQ4hh+Kqhb53tzZk01cHspo55X/fh97RMqyHvlF5/
         Pcdg==
X-Gm-Message-State: APjAAAXWwXX1PceKQYGK/FRYU+YuS7bLTgaMbK4Aq0TedekqcedWvKGS
        SrwnHbri1f6Tko3hL1v2mTs=
X-Google-Smtp-Source: APXvYqz6MruEmXlY92dMfYrIVsfqdShngh3dj/+yBjpkU/WTQDGGf2OC6O0LQkqz7fwWBx69iNptPg==
X-Received: by 2002:a05:651c:20f:: with SMTP id y15mr7302098ljn.31.1572949536259;
        Tue, 05 Nov 2019 02:25:36 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g23sm2586949lja.104.2019.11.05.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:25:35 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:25:26 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 28/62] gpio: gpio-omap: Use new GPIO_LINE_DIRECTION
Message-ID: <b27b35f4db5f05994e64e3bb78f0c632bef61e6f.1572945849.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945849.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945849.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-omap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index d0f27084a942..3bd8adaeed9e 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -805,8 +805,10 @@ static int omap_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
 
-	return !!(readl_relaxed(bank->base + bank->regs->direction) &
-		  BIT(offset));
+	if (readl_relaxed(bank->base + bank->regs->direction) & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
