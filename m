Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC737EFB92
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388422AbfKEKkE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:40:04 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36983 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388264AbfKEKkD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:40:03 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so14725406lfp.4;
        Tue, 05 Nov 2019 02:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SqYAx6w5c0772F3GSZyg2HvLQtnEIBsQqDUMSv50JU8=;
        b=OJVTuHVFrtjfmpYXgXlnhkqv9uEwXJmEV0TCA4Y6DBQynlfndAbTtf5nN+iycxd+zW
         BvUqM/m2WFJ2L564qbRyh2a3chVF42T8Mx0q0A3VZXx3c+cU8MVzGmYtkn4+OVNNW03v
         encnF/c27k9Sf4opSFWYwrMoXJ5t4T2WeIcEQPcq5UaFNLKtuuoEry5v2vB1X7FTdiz0
         AoMvjHVn4OT9gfXhNQ7Wwz9SOK0dszYd9zb8s0yGve/0Tg6lsjBFpAPLtIL/tT0ovjJY
         TCqaqH8PzI4y3NRLJOgBLLWTLhRHy8UJzXkB6qBgCuYJwyXk9yCd8huIwuAAr8A8ADKu
         36eQ==
X-Gm-Message-State: APjAAAVrjpmLd9W8WsBuRfLjvCBWF+klBerI0+71m6VeUffaPlMOdO2m
        rotO1VgE0kEwbUk6Wt3foxA=
X-Google-Smtp-Source: APXvYqzlcUL6R5tzqQKDVW9rVlZFlee8vqfZ6zC6BBcQ7rkD2nw/+T1eVNHVcDxbsQWqu1fO6bunEQ==
X-Received: by 2002:a19:3fcd:: with SMTP id m196mr20142827lfa.118.1572950401460;
        Tue, 05 Nov 2019 02:40:01 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id t135sm8863494lff.70.2019.11.05.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:40:01 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:39:51 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 59/62] gpio: gpio-xtensa: Use new GPIO_LINE_DIRECTION
Message-ID: <e80ca8e4be2d0ec15dad7d903b95a66221e5f3d4.1572946011.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946011.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946011.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-xtensa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 43d3fa5f511a..08d7c3b32038 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -72,7 +72,7 @@ static inline void disable_cp(unsigned long flags, unsigned long cpenable)
 
 static int xtensa_impwire_get_direction(struct gpio_chip *gc, unsigned offset)
 {
-	return 1; /* input only */
+	return GPIO_LINE_DIRECTION_IN; /* input only */
 }
 
 static int xtensa_impwire_get_value(struct gpio_chip *gc, unsigned offset)
@@ -95,7 +95,7 @@ static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
 
 static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
 {
-	return 0; /* output only */
+	return GPIO_LINE_DIRECTION_OUT; /* output only */
 }
 
 static int xtensa_expstate_get_value(struct gpio_chip *gc, unsigned offset)
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
