Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0427EFAA0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388326AbfKEKPF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:15:05 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41881 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387945AbfKEKPF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:15:05 -0500
Received: by mail-lj1-f195.google.com with SMTP id m9so21091990ljh.8;
        Tue, 05 Nov 2019 02:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tw+wdPHgodKyjQmZqWJROQdwHuE4kDseErXxhJDpGpg=;
        b=Vv0B9Je3T8g7H79rCiFfwJcOYRtE5FCivVP06MQOXwzKp+t+LErHrGmtZsEuyIj989
         ly3H8nYEsppXMa61TBQhN43d2E1CJDMMD1HKupidkGRX5fFGlXbkPb+g7Yisa/cKc5Q9
         cDTbDOILNg3B3J5vjxqhYPeD1zR21IvQ597O2L/Y92H4Ijjig/36xYYbrsnxPyH8yWty
         8RO3PVe73AKZCfyAq7hrLp9QE7rZfULHjLAKRxxSuFUSnSyMDs9K2xn5VhjoOS9eRnos
         Eg6MFe9MXYS8PkxpoTUzWMxjBZct2UDwAP3dN7ceLY8zCncNqqgwGGgOvz4CtW3uMCaM
         8pUQ==
X-Gm-Message-State: APjAAAVWP9esim4nYb1yqRbB5GPv5US/tHCGB3qeuyWWAtgHAC1qkP82
        jf9q6KKAJv4KRFma6eX0e08=
X-Google-Smtp-Source: APXvYqxm5jFPRWAPDhlK95/Fz6BeQgQNzN6l8o6QNsvAGoEUPPbAR1BFRAC1Dqa/B1h9CuDFStXDtw==
X-Received: by 2002:a2e:8508:: with SMTP id j8mr6150112lji.136.1572948902581;
        Tue, 05 Nov 2019 02:15:02 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id p4sm9223926ljp.103.2019.11.05.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:15:02 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:14:53 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/62] gpio: gpio-dln2: Use new GPIO_LINE_DIRECTION
Message-ID: <9e53174ad7796c26507f7e11d03ed011a507af80.1572945741.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945741.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945741.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-dln2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 8a33c2fc174d..26b40c8b8a12 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -200,9 +200,9 @@ static int dln2_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
 
 	if (test_bit(offset, dln2->output_enabled))
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -214,7 +214,7 @@ static int dln2_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (dir < 0)
 		return dir;
 
-	if (dir == 1)
+	if (dir == GPIO_LINE_DIRECTION_IN)
 		return dln2_gpio_pin_get_in_val(dln2, offset);
 
 	return dln2_gpio_pin_get_out_val(dln2, offset);
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
