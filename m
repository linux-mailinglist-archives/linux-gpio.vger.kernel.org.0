Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72648EFAB3
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730734AbfKEKRD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:17:03 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39750 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730731AbfKEKRD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:17:03 -0500
Received: by mail-lj1-f196.google.com with SMTP id y3so21154259ljj.6;
        Tue, 05 Nov 2019 02:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+sHcdtrZTBwc34LiGUorirsct5eGtKWVq7xkReFo+rQ=;
        b=eVyFTS646HFtqFKKkYP1HKa0zNmjbgpFzVop2qtCVw07c6KLoHXnlvjHidx8bpVmj/
         tcAinruoroRefSzAAEbnvnp9Rl0hw9SPFXeisiA13h/gS/184vu/doBo78CtjIuhGPj9
         PQSnx64+9GiARQx+3QUfwidzfkS+oGdEnjPIo1YTHzeZfOK+2aBH5FqXmT59p/tz2x5z
         +/xy1x0KMc08Y1qG1rgymcHfNFwG034WSTe2a7M3YSNVkMqpi0DyyO9swnuZikr5tOGN
         TGbR1RFyYw5S5wsAnO2TK+HKYfJmwSWmSm5M0t9+bxwNeDOEoxMmbtDDiSlTKy7vxX33
         5lYA==
X-Gm-Message-State: APjAAAX5C6969eARi51+IaF5eb5swLEsDj2M2CzFgYq+4Y4m0UbpKC4x
        3bCh6DQWuP0g1YFicxAWbBb2qq9bL1w=
X-Google-Smtp-Source: APXvYqzlPsx9lLZhoXwjDrDDa+UIfdVfVBkd9ZQhKbIu4od77GxRxDTdIssjyfWvzw8Y6WMXB7k2jA==
X-Received: by 2002:a05:651c:1117:: with SMTP id d23mr6976059ljo.90.1572949021549;
        Tue, 05 Nov 2019 02:17:01 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v203sm9360168lfa.25.2019.11.05.02.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:17:01 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:16:51 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 15/62] gpio: gpio-htc-egpio: Use new GPIO_LINE_DIRECTION
Message-ID: <71f01027d66abd0624b2dc247f09dac942061eef.1572945766.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945766.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945766.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-htc-egpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 6eb56f7ab9c9..100b328fb66e 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -220,7 +220,10 @@ static int egpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 	egpio = gpiochip_get_data(chip);
 
-	return !test_bit(offset, &egpio->is_out);
+	if (test_bit(offset, &egpio->is_out))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static void egpio_write_cache(struct egpio_info *ei)
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
