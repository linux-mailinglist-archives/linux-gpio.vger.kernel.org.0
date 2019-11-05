Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13E24EFB1B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388093AbfKEK2U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:28:20 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41623 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEK2U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:28:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id m9so21138456ljh.8;
        Tue, 05 Nov 2019 02:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IM6/hCDcGMqvIg/AwNcP2jEs0lH1LP+44rKli/dOwmA=;
        b=JwMgtBZnEJ9nVAtIt3YQg2o7BJwk/s992rtYKU/ohRldRNUObRxS2jLznYEJYMB0YT
         WgHYRrJb2krx/mwsCSpVL5S6iOm1oyF81lpK5aQXAqQROowEVfh2i6myNgb38i+q0azh
         BNWAdMbB8qNkBK+JXDOzKS03eqE0q+ecsGgTLJFhYJgGthEENS7ZtNvh7BMb51sUmoP3
         cYc8/fnhw283aHr9qiSfvbbV5irIjFK77JJuGXdZTs9a8VgzhFkotUGDiAMXPsINyqE+
         vjy3XUIYB3oR2kbuO8TCoqumYb9GAVI/E5W8iXUE4hqQb9o672xyRKfPFzxGety+Wj+T
         sEuQ==
X-Gm-Message-State: APjAAAWKystnXgsJlZxQdJtEHB7YOV2ErlA07pyyRhYRUf2JM9t/Vvg3
        8d4TWIISGuREabO49krfrWI=
X-Google-Smtp-Source: APXvYqxedWqwpibNee1F3pdyV0UbO7UJx5A0vtGukno687Fxa5nIr8MrVSqk4r/Wt/lFEQklGzs3/A==
X-Received: by 2002:a05:651c:1202:: with SMTP id i2mr22513311lja.218.1572949697900;
        Tue, 05 Nov 2019 02:28:17 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id t16sm7260851ljc.106.2019.11.05.02.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:28:17 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:28:12 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 34/62] gpio: gpio-raspberrypi-exp: Use new GPIO_LINE_DIRECTION
Message-ID: <92a9de8da96f57c156ccd24dc37a330e352f6963.1572945875.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945875.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945875.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-raspberrypi-exp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
index b77ea16ffa03..bb100e0124e6 100644
--- a/drivers/gpio/gpio-raspberrypi-exp.c
+++ b/drivers/gpio/gpio-raspberrypi-exp.c
@@ -147,7 +147,10 @@ static int rpi_exp_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 			get.gpio);
 		return ret ? ret : -EIO;
 	}
-	return !get.direction;
+	if (get.direction)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int rpi_exp_gpio_get(struct gpio_chip *gc, unsigned int off)
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
