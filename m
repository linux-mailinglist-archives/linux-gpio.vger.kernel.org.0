Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63AAFEFAFE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388133AbfKEKZE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:25:04 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42162 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387945AbfKEKZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:25:04 -0500
Received: by mail-lj1-f196.google.com with SMTP id n5so10154273ljc.9;
        Tue, 05 Nov 2019 02:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bv+B7wRzEzNcU1QnMIvKDcqTaOyCGZVdxQ/FNOnMT1Y=;
        b=mrJB8d4fize7sCaAvs4m4PRauzDDEkp0qrkVrfXGPZL9vfBd0e+dosgyzJ/k09exN+
         +ISSjdfgcAeU1g1uo8G3WhcwnbqZEftMpSvEK7HDwtl3emrrI8U0ZmUZFAtlW76yROkW
         BU/wMfZwZrAP2lrU+6PkASZTEuLoWe4KLU6nVQXEO1j8+7g8h7YxQdFJq9YToi4Z1AO1
         vQMhjyQpl4M92t9VeJSg7LcvymlNtaAZedyQ4Yv9smFqz6Kn8PTK3BnWedHEAhURgsoC
         QqJT/k7zBC6c2PUbz/3JCL9EuN4ovYKoPjM/HpXyuayM6ZfuW3Kau0rk5MUvJwUzB0Sa
         jGeg==
X-Gm-Message-State: APjAAAVjsX8mWnA6rKwq4hEp4AZz2apBmcFwYmSWKcIPYe2PPblqKFl7
        /52FKYCSYjbRZgCaCvZZuPI=
X-Google-Smtp-Source: APXvYqzZ7jxkgUCp8oVkJ5xSQdMV9c3vS9yER47vq2zT2lEe8mlFrHp8mlWwkM4USZUxlTsllt+VMQ==
X-Received: by 2002:a2e:998a:: with SMTP id w10mr10343701lji.66.1572949501943;
        Tue, 05 Nov 2019 02:25:01 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f3sm2795260lfp.0.2019.11.05.02.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:25:01 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:24:57 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 27/62] gpio: gpio-mxs: Use new GPIO_LINE_DIRECTION
Message-ID: <1c440ef37fb8bd690a62e4138028d0f41ebe76f4.1572945841.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945841.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945841.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-mxs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 5e5437a2c607..c4a314c68555 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -248,7 +248,10 @@ static int mxs_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	u32 dir;
 
 	dir = readl(port->base + PINCTRL_DOE(port));
-	return !(dir & mask);
+	if (dir & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static const struct platform_device_id mxs_gpio_ids[] = {
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
