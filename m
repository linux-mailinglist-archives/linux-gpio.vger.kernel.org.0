Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56850EFB79
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388264AbfKEKgQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:36:16 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36682 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388203AbfKEKgQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:36:16 -0500
Received: by mail-lf1-f67.google.com with SMTP id a6so11312547lfo.3;
        Tue, 05 Nov 2019 02:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aDe93T/tJJZZs2/qCglAtr+mZfMdAJ0EoRe6S3iAKh0=;
        b=kxjDDJ6tUdzfvReroAcsKt2gKp09B8fTvCbUTZ7Ga/mTq32tailmB9/4RcT2HVgQLS
         cPwnvRjkIBmZqErPAhwbv2AGKDqUrRv95D9xJtyCBaaySNsrUUA5XCoA+z2mkSXuEe2G
         PHoOkddroTrxkBPx3CQg3ZhzKrM2TnA6IuZ1r2cFkvqvyFCbQuSoCNvWWfyMX/vsVX84
         CqYL7MUwMZFjk0xqXDa8NHBrkLfji6q3U22RVUihqA87/ElVW9zJ60QLUGcMK4+AWMKg
         kGW1CAYoJpceqrXxBlHIY4AMiURwbPM4oWuntw1lSIWGDqxOMd45nXVPKLjphvAxwo8J
         Qdig==
X-Gm-Message-State: APjAAAWltdkqkBzQL9Y55uQLgSnWLOAjrKjuZGklhV0YCQtlr2Y2apMw
        V+b+ol6L4Eh7hqXYadlj2+Y=
X-Google-Smtp-Source: APXvYqzB+9niy3lA3hCm8wIN9/qUKqYmeLZYKZ4/42Zhj8qOL0zBwFRasMt9b8iiOAqAbjL82gWitw==
X-Received: by 2002:a19:ad49:: with SMTP id s9mr1101208lfd.1.1572950174046;
        Tue, 05 Nov 2019 02:36:14 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v203sm9382876lfa.25.2019.11.05.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:36:13 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:36:04 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 52/62] gpio: gpio-twl4030: Use new GPIO_LINE_DIRECTION
Message-ID: <9b56a109e4ff847dda74d13405bdc69635435c24.1572945993.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945993.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945993.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-twl4030.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index fbfb648d3502..de249726230e 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -165,10 +165,10 @@ static int twl4030_get_gpio_direction(int gpio)
 	if (ret < 0)
 		return ret;
 
-	/* 1 = output, but gpiolib semantics are inverse so invert */
-	ret = !(ret & d_msk);
+	if (ret & d_msk)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return ret;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int twl4030_set_gpio_dataout(int gpio, int enable)
@@ -380,10 +380,10 @@ static int twl_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
 	/*
-	 * Default 0 = output
+	 * Default GPIO_LINE_DIRECTION_OUT
 	 * LED GPIOs >= TWL4030_GPIO_MAX are always output
 	 */
-	int ret = 0;
+	int ret = GPIO_LINE_DIRECTION_OUT;
 
 	mutex_lock(&priv->mutex);
 	if (offset < TWL4030_GPIO_MAX) {
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
