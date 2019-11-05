Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2DAEFB71
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388373AbfKEKfY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:35:24 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35824 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKfY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:35:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id r7so12511422ljg.2;
        Tue, 05 Nov 2019 02:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=seFkp1IZMoaCpINCyBggIq3d5rV9dHAo2mzbfomifFA=;
        b=AlP/zM3E3CSoVv9OSQN/nzSnvMHDoo6aW9Jv4tc7gdk4dYOu9JYLLkTovx6wA5GPSh
         zLYNQ8Bu6Li6jJ6Avo8e49VJqQ69/wnwZcQDKe+yYVuesdj02g5/Xku8XR9Nq8nptx0e
         7PtFcf1C4g48r4T8LS8z4ePsEpIVYkTVpMoJmmxOxyJgB1STLLInmi7pUgK/k8RYYBkP
         JwmVokRXkHrjbUcJXLOQDLnt5QgpgAcYObyuQptoQROhCTxL0/Dh1a+dkO11TAFCRqJ+
         CcoWk1EEqun/SWdP3KX2K/168MNgfuemlFAkG1eWBzOcoHNztxkasg7DXWGbLRpT5V91
         +1dw==
X-Gm-Message-State: APjAAAVYa/4cIyU8U2xJHsgV3RYoDRR3exwfuK2kDaDl61BHcbDyDOCZ
        LffUL6PylcCghPlK1+sHLEbvf6wfsbA=
X-Google-Smtp-Source: APXvYqx5LbKy++Wt3AkzkzRSYnkOW4u7weH4ER88PpMQYQDglP05a0P2ixKM1pXhsj3KcblKxZmAnw==
X-Received: by 2002:a05:651c:1066:: with SMTP id y6mr22485081ljm.96.1572950122152;
        Tue, 05 Nov 2019 02:35:22 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id e22sm10671979ljg.73.2019.11.05.02.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:35:21 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:35:12 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 51/62] gpio: gpio-ts4900: Use new GPIO_LINE_DIRECTION
Message-ID: <9b5fb88572442bc498be94461bf8daa8c04ae7a1.1572945989.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945989.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945989.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-ts4900.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 1da8d0586329..d885032cf814 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -44,7 +44,10 @@ static int ts4900_gpio_get_direction(struct gpio_chip *chip,
 
 	regmap_read(priv->regmap, offset, &reg);
 
-	return !(reg & TS4900_GPIO_OE);
+	if (reg & TS4900_GPIO_OE)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int ts4900_gpio_direction_input(struct gpio_chip *chip,
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
