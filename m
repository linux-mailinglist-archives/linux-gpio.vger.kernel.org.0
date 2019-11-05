Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 160D8EFA8F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbfKEKMo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:12:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45072 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387832AbfKEKMo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:12:44 -0500
Received: by mail-lj1-f196.google.com with SMTP id n21so7498444ljg.12;
        Tue, 05 Nov 2019 02:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V7qLFq4K93vUH8fK9wNC+b3dmkN6TfhoYmCQsWeu7yY=;
        b=GRl+eYtlXh8Tlc9+vvBqJKMumuMmm9CUAZg97vp9HS0Jjc4xZ2+wE96e7QgheAyl8O
         KdoMBP8P1sF0oy4N1Z7KAFSYEl9TAhjpvl+JT93UXSmHgr50B5KuzTwFjmOeYjQE2dKt
         BsNd9fKTeIeDDYpu0imlve4AOFnJP5J3XgVl/XdmWtrb6wVMnbJ/48IlNuX7Ktj7l2Yi
         umdW1aV2gxqxIAK7SgVfblZpLZ4Ic61jAUzIVr53yikLSdJMUEH2FFuPZ8A1KbokmUrR
         K7nn8GzUzr2K622UmbIt7irEI8GGlrcjBruSdsnqCWXUrMZDzFPBzjBiW/YMfUIZmd1W
         YUlg==
X-Gm-Message-State: APjAAAXz4pjNOaK9PGjGDi9OzW9O5dfzuV7+L2QH07wKyNWG70w0SbY4
        lwJEYJd6vpGjpnq5nR8eGN4=
X-Google-Smtp-Source: APXvYqwjjYsGhWJv9rnRxQZ46vKzy4j+wiUPekzGtjMuNsXdHE3646nl8SjkCccQfYCbSzyJz8M77w==
X-Received: by 2002:a2e:28a:: with SMTP id y10mr20290638lje.155.1572948760228;
        Tue, 05 Nov 2019 02:12:40 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id k9sm1362903lfj.97.2019.11.05.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:12:39 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:12:30 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/62] gpio: gpio-aspeed: Use new GPIO_LINE_DIRECTION
Message-ID: <493e2f9ed5aff112519adcdf2d3044bf54c2d91a.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945709.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-aspeed.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 09e53c5f3b0a..f1037b61f763 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -487,10 +487,10 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	u32 val;
 
 	if (!have_input(gpio, offset))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	if (!have_output(gpio, offset))
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
@@ -498,8 +498,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
-	return !val;
-
+	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
 }
 
 static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
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
