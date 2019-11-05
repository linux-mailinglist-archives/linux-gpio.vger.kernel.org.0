Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD7FEFB3D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388318AbfKEKcK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:32:10 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40854 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388203AbfKEKcK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:32:10 -0500
Received: by mail-lf1-f67.google.com with SMTP id f4so14699552lfk.7;
        Tue, 05 Nov 2019 02:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QtDw/btxhGfHgbNVKiIJpWaEUnUxstTseBtZmP+0Wjs=;
        b=V82zZ7ow7BeuIybQlL2EKANaSRw5Lb/xwRzAuxk1K22aXIp6x+i2v7/mkYH3u6Fn/F
         7DZIEfgSyM00ZvsdvQ49YtvAasmpHB6rT4s13ZHdB5ZQKPpTeVv69tskCuUn76UPfOnF
         dP3zMnTV3p0uy3mIxsIbIzQq9jOo0AugYdgWq4/b3cpNJifvvt0hQRyID3ViX4jfYNdz
         CykBTvv9/zttlGpaL1JBV5V349Gwn5muZz+jiuTilCWZB9X/QjKtjUWjFycRfRA47cbG
         CNyNC4sUvV8yFhIa5e8mhTt409rcx6tIOGTiKjN/ZHOGxBUgnp5n6TMdAOsTCfWs+mJv
         eLeg==
X-Gm-Message-State: APjAAAWawxJ7Hnl6yLKakrGXqk29fSQdDvsGlTRGfjsGwkWaAgKTx3Hw
        KVBudBeZX28LkVDQYLkIhL1GZ03lznw=
X-Google-Smtp-Source: APXvYqwD5x7b/6AgJsViO97VLS00tB8ShKMJsh/7Rw8yqgRIERxgonl7PxCD118W9fOD8wlSrBWiYg==
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr948965lfd.105.1572949927499;
        Tue, 05 Nov 2019 02:32:07 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g21sm2329676ljh.2.2019.11.05.02.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:32:07 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:31:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 42/62] gpio: gpio-tc3589x: Use new GPIO_LINE_DIRECTION
Message-ID: <1aba3d3714807587fd4265c7c8abb42b665f2e04.1572945957.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945957.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945957.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-tc3589x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 75b1135b383a..6be0684cfa49 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -97,7 +97,10 @@ static int tc3589x_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(ret & BIT(pos));
+	if (ret & BIT(pos))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tc3589x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
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
