Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74AD1EFB88
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388761AbfKEKhv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:37:51 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34831 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388148AbfKEKhu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:37:50 -0500
Received: by mail-lf1-f65.google.com with SMTP id y6so14730926lfj.2;
        Tue, 05 Nov 2019 02:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZOr8gn5Md29slHc9dz+o6msYZk3PlUS/KTL1STZbfz8=;
        b=JPi3/QwVNsNp9+0+U8tnewxH4xd5SZsvcYHXzD3Axmrg9j5e6EZE5GEAF3GM2OdIRO
         8BRFxM60e0XQSIur7FhRG83uY2J4+9psexjdg4ukmVB9qEPknS4oEsb3HuH1tAYnt6FQ
         SJR6qvCqAW6AehE1Ku5m0YXCrPtqDU5m7KH2a9Pyxg4Or0tyUqCviJcFXHkBw09lbgAH
         iehlULiW2a8pIIOeRVsQowfYUrA/f+GYyPgZIUQl5W/mrOSUdY8NiLW89ynZ39HraCD2
         l7uzVosLNjJXhcVSczOu8QrhyFvB+hv6OZdi5y6TDwa9j1zOGHQaMuioDsjoRzz3uqzW
         U/oA==
X-Gm-Message-State: APjAAAXPi8LD9O90oCFzQWfcCQ3eR8SFb5BNXB9quzBHzelL21stjdYS
        CL1X/LJ0IvosD/7RMwYoHZc=
X-Google-Smtp-Source: APXvYqyFFPY4uwfIBoaAbN8k+nMA9Tl677+x4pfFhIcc7COznf1BMefrMbO0qfV5zo3qNPxFAy5wKw==
X-Received: by 2002:a19:1ce:: with SMTP id 197mr20428940lfb.16.1572950267920;
        Tue, 05 Nov 2019 02:37:47 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b4sm8306856ljp.84.2019.11.05.02.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:37:47 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:37:37 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 55/62] gpio: gpio-wcove: Use new GPIO_LINE_DIRECTION
Message-ID: <f7d60ef48bf3c7a13dd8f3c467e8d1d190115ab7.1572946000.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946000.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946000.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-wcove.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 444fe9e7f04a..8b481b3c1ebe 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -170,13 +170,16 @@ static int wcove_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	int ret, reg = to_reg(gpio, CTRL_OUT);
 
 	if (reg < 0)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(wg->regmap, reg, &val);
 	if (ret)
 		return ret;
 
-	return !(val & CTLO_DIR_OUT);
+	if (val & CTLO_DIR_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int wcove_gpio_get(struct gpio_chip *chip, unsigned int gpio)
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
