Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD1AEFB24
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388281AbfKEK3M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:29:12 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38782 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388335AbfKEK3L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:29:11 -0500
Received: by mail-lj1-f194.google.com with SMTP id v8so5525543ljh.5;
        Tue, 05 Nov 2019 02:29:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mEXk6XnbHnustkbALD4GoIWBLMq4ab5ZVfyYXu8ftbo=;
        b=mPBDFnc8d1wMmumejA46pceikuPBK/idHMNCymwspJvycLq49pf5nC0+FowA2zxPgd
         1e3GtylVfTq4HNbIGe6IxLwPcrlVPkYgz+TNRpbHoVsSbSvy7tL4jbRKFLiBi3VvljGn
         IQKUwoWYIyIpgkXJ745j/JJQZzDkKkt5hOIvgwMXZ9It+gnM2vR0iP9gfVsHbvm1Fej2
         wTdCtuNJ57fqdJy+ln7HiP/tQbeflh9QGY+4/G2U0Bntopjc6hqeP/sQOzCfXZKmO8cw
         Mv6QJ6QTNzmj8u9IEyRQ5lBCebg4BQfJROmHuHhEnMBBPg6j2/qspaF+eV//F0/gu3v6
         NXTw==
X-Gm-Message-State: APjAAAU0tOJ2DDpoKdAlG3GHRTVt8McTf+y5E7uia6veuZ+gyOpYscp/
        FMEL6iZJgnc5yMpEEk1ct2g=
X-Google-Smtp-Source: APXvYqxhwWsB2NR7HHLcVKSHMmbOFWRm2ae+FH1P5yZ43TEAAeNvs5K5SL1vG4Zk+QS9VZz1XDxGbw==
X-Received: by 2002:a2e:9712:: with SMTP id r18mr8772570lji.12.1572949749648;
        Tue, 05 Nov 2019 02:29:09 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id k9sm1384712lfj.97.2019.11.05.02.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:29:09 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:29:00 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 36/62] gpio: gpio-reg: Use new GPIO_LINE_DIRECTION
Message-ID: <bd1c54c7f27edb8cc96a52e97c35664bfb7523be.1572945884.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945884.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945884.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-reg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index fdc7a9d5b382..d35169bde25a 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -26,7 +26,8 @@ static int gpio_reg_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 
-	return r->direction & BIT(offset) ? 1 : 0;
+	return r->direction & BIT(offset) ? GPIO_LINE_DIRECTION_IN :
+					    GPIO_LINE_DIRECTION_OUT;
 }
 
 static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
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
