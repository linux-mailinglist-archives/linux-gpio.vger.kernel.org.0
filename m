Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4C9EFB32
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388266AbfKEKbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:31:10 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44250 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388093AbfKEKbK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:31:10 -0500
Received: by mail-lj1-f196.google.com with SMTP id g3so15056548ljl.11;
        Tue, 05 Nov 2019 02:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ggSCNAhKWDAQfnI1StH0nU3POuONxOaNf53ZjEk0tRo=;
        b=kXA47VE1jn35t7REZkc4DfgsBLUShx5soMmHRDa2ywLDOQJ9LY7pLoj10S9OVHeAOO
         uPm+OV9QxpJ20f8TFaHwrmyXa5JjxzAg5fckC/6mwZpaITIjmCJ/Br4TwPWdK3jpc7ip
         13liA0mLqcpp5JEnktahH9Dix9M8qZ22G/w5IeYqxe7wyAPrBRlPJl6nOxz9vaYQX0RW
         8RFs6+ZwNHAWg17ymvVoYhGnBL+sY2475lHoMV5WoVkeZAQQbKSAFEdB1CPAPdB2zkzN
         uP2GI8rSTUuWKTZD78vIn3DFs88cluXxd4nUJLv9BCALNo6GOZQuLlCYuJ2s4TN35WOe
         k9Fg==
X-Gm-Message-State: APjAAAXdUptCPQiicshlSZYyLjiiz5ZtE9LjhjmhmFDwh5H4vVzxoq1O
        9K6R1xxU+tBzFD/8SSkH0FE=
X-Google-Smtp-Source: APXvYqz0UZmZK1gDDAdaOfCCRbxurzlfXmRgO3ZpZ9vcag4bLsqt98u9MkIOWp/ylNFSuRY4eaGaIA==
X-Received: by 2002:a2e:9016:: with SMTP id h22mr14151346ljg.137.1572949868198;
        Tue, 05 Nov 2019 02:31:08 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id k19sm8781244ljg.18.2019.11.05.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:31:07 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:30:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 40/62] gpio: gpio-siox: Use new GPIO_LINE_DIRECTION
Message-ID: <91a796dd2811b58f4be30875f5ef644f0e43f241.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945896.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-siox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 006a7e6a75f2..311f66757b92 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -203,9 +203,9 @@ static int gpio_siox_direction_output(struct gpio_chip *chip,
 static int gpio_siox_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	if (offset < 12)
-		return 1; /* input */
+		return GPIO_LINE_DIRECTION_IN;
 	else
-		return 0; /* output */
+		return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int gpio_siox_probe(struct siox_device *sdevice)
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
