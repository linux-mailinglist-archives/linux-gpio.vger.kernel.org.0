Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD96EFB19
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388396AbfKEK1w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:27:52 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36688 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388093AbfKEK1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:27:52 -0500
Received: by mail-lj1-f195.google.com with SMTP id k15so9058125lja.3;
        Tue, 05 Nov 2019 02:27:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bKWJvXabVxDLrzTtaVaaINFhEmEoNK3Y3Me2BG2EuT0=;
        b=isDhszbG6z1eAhgbONROZQD46lluVBaH4zdQKZZA7d/nAl2UoVaAllI5dobVnb1KHO
         /wtXSg2tTIBytiwdkUTunUdDgX+AruXiK+7OzJ9HmdcBPqySrWiOkhbMj2d18U2Z2WUa
         PX5eWdM4OAdp+CHR9ZD59IZPd51GOTcQK+obBhxNfUpJU/d/o4T/U1RT0Qq8k4T9ni71
         hiFTG9Sz7tCYbq1jQD5e478h3QBquXJoUJjspTEsa44qFfbwlJ9w1UHJDe1kA4ssvMe8
         wvl3IQzoe2HVyVUEyxNjR0NwfC79m/7ZSaR+kzJKrFtQwCq49vwqjU01Ge5FqGNyTSrl
         93qA==
X-Gm-Message-State: APjAAAXicapDphwp+taEodgOuO5uU4ExBTBOKbkjU4VHEdMmIl6H6idx
        ATldSFFUOLb9p2SUNYjjWiE=
X-Google-Smtp-Source: APXvYqwTAYmj2PfkRK5CTWFqso1R5rjt46qiYvt23gDsKyo4PitSujmjf4gJwdMDJJIojbBvLB5Lbw==
X-Received: by 2002:a2e:6c03:: with SMTP id h3mr5976462ljc.86.1572949669747;
        Tue, 05 Nov 2019 02:27:49 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id h16sm8513360ljb.10.2019.11.05.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:27:49 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:27:39 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 33/62] gpio: gpio-pl061: Use new GPIO_LINE_DIRECTION
Message-ID: <7217327d1ea69f886a2cdb8abf201a2cc7bb02d3.1572945872.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945872.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945872.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-pl061.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 722ce5cf861e..5df7782e348f 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -63,7 +63,10 @@ static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 
-	return !(readb(pl061->base + GPIODIR) & BIT(offset));
+	if (readb(pl061->base + GPIODIR) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
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
