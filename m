Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC745EFB6C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388197AbfKEKej (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:34:39 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35547 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKej (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:34:39 -0500
Received: by mail-lf1-f65.google.com with SMTP id y6so14723456lfj.2;
        Tue, 05 Nov 2019 02:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UGM+pDYo96qs+1n4Tb8RbGly4iALdbyniGajedA7jHk=;
        b=PmM0637foMfG7KiQy4I8MMeLj/t1CyzgiTS0mTDhvh2qm4MR2AIMhNw2bh2io29772
         PWgEGcoYd26nghCr6N7yXG8QTMeveSsgtZgAXL/8JD123EK+a5+bINh2DRSoqRiI/qeV
         xhJwlxmcs4gpzkT0ZcBYAURhodwQ8m0EUn2itepMSzYHNCzojhzHl+Q1c4ZtClg+StYm
         GU9M8pG/i6GHf+cmSL+Ea8VTWdGAc9bamKsGSR0mW/naX7jycHbo8YLe0mTTemZzT3JV
         vpeKHhEAkvvnT9KpaG88Teea93iXdZzSzi5JEW92wgTRV8ydg6qSzl+NnLNSVKv5REiL
         TVJg==
X-Gm-Message-State: APjAAAVagL+R4Y234UNzbrcYyakAmI+22Rc3rJk6wtIqYAsndgfsjlPS
        wGTeBRtwOPiTpHfrGcYxcuE=
X-Google-Smtp-Source: APXvYqxnyRKexvDm1n2SDoApnKEC/g855BPd2woo1Nhp0HmCn3FOUmqq9cx9A7sz3wPoHqvZJFUO3Q==
X-Received: by 2002:ac2:4822:: with SMTP id 2mr20127015lft.115.1572950077489;
        Tue, 05 Nov 2019 02:34:37 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g25sm10973730ljk.36.2019.11.05.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:34:37 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:34:28 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 49/62] gpio: gpio-tps68470: Use new GPIO_LINE_DIRECTION
Message-ID: <819708cadd2b365216242df920e1fe17b731a2d3.1572945982.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945981.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945981.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-tps68470.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index aff6e504c666..f7f5f770e0fb 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -47,7 +47,6 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-/* Return 0 if output, 1 if input */
 static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 				       unsigned int offset)
 {
@@ -57,7 +56,7 @@ static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 
 	/* rest are always outputs */
 	if (offset >= TPS68470_N_REGULAR_GPIO)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(regmap, TPS68470_GPIO_CTL_REG_A(offset), &val);
 	if (ret) {
@@ -67,7 +66,8 @@ static int tps68470_gpio_get_direction(struct gpio_chip *gc,
 	}
 
 	val &= TPS68470_GPIO_MODE_MASK;
-	return val >= TPS68470_GPIO_MODE_OUT_CMOS ? 0 : 1;
+	return val >= TPS68470_GPIO_MODE_OUT_CMOS ? GPIO_LINE_DIRECTION_OUT :
+						    GPIO_LINE_DIRECTION_IN;
 }
 
 static void tps68470_gpio_set(struct gpio_chip *gc, unsigned int offset,
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
