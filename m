Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29777EFAA7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbfKEKQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:16:11 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43494 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387821AbfKEKQL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:16:11 -0500
Received: by mail-lj1-f196.google.com with SMTP id y23so10219458ljh.10;
        Tue, 05 Nov 2019 02:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T4ZwAgVsF5UAXI9IJZ7jU758iU3dJ2CxGJePIO1JlcQ=;
        b=P1O8ojFIcfSd3ZvV9T2ehmpbWgiKUtEgw3D8rMqaNaFIAWhs8sJCMojp7E3YtK7E0d
         g809LaFhL8yvPOhWDM/E3y/QCgb8d5snvoXb6pZ/IW2C5jHoHzssHA5tdZIbLpIo+xf2
         FyVkRh+H609SlsbKrFQQnsbSXyXH3GH5MOLiSbaQ3QhepcVJhfNQeBRiTS78E3jUvrqO
         CH/hKBDS1hma+Sp5SL4jHkW2Wv+LbXS+Sr2wY7jtKpvBBHDyK9PL1KISpqXZiNqi5bKl
         T4B2oA82wwOxJ1luUMVZuTpZbCMLTCJk4XVzGDyScVUNg668SwlCul97AL8KuT7srSAo
         FmWQ==
X-Gm-Message-State: APjAAAUlHvH38cAx7yzT8bZnVz+Acn2TMdyx08lQnJrfA6p7lvX5AEST
        9lqSXaaiVEFLD7/D7YowRU0IlqHc83g=
X-Google-Smtp-Source: APXvYqyDh5X/XbJXr5hL3wLwuoVqFLl3fGMwhTee2m5K5R0LOfkjRGP2kCb+c2ZhHodJ2oyRN04wMA==
X-Received: by 2002:a2e:99c6:: with SMTP id l6mr12423169ljj.229.1572948968694;
        Tue, 05 Nov 2019 02:16:08 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v21sm8178929lfe.68.2019.11.05.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:16:08 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:16:03 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/62] gpio: gpio-f7188x: Use new GPIO_LINE_DIRECTION
Message-ID: <0a1fe4365ef599adde42396f0bb735c8623f679c.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945757.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-f7188x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index fdc639f856f1..cadd02993539 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -250,7 +250,10 @@ static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 
 	superio_exit(sio->addr);
 
-	return !(dir & 1 << offset);
+	if (dir & 1 << offset)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int f7188x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
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
