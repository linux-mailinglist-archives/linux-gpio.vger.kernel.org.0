Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27D4EFACF
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387773AbfKEKTq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:19:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44003 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388281AbfKEKTq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:19:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id y23so10232540ljh.10;
        Tue, 05 Nov 2019 02:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sWnRhLUvBnnlXa9gZ9XH8xo1NuNCA2taaToJuxQFH3o=;
        b=Z0lGIcFnt8Y8aRHf6p50pzCDiBcVVmdVuHuM/uZlkF7N8Qj0IJkZ81zopVSNqFOBJO
         FwUHexBbNTzMkRoDZU5+N+h7CNbUKJJaPu7pEWsqRmB5MLs8y2TlKxCciZ46aZCTgbA+
         NmNBTSijYiwQehspOPwYD4/+WGh4ZBAzNGUr6SagGpvpudmSyvyOk3HBFwdR6ufNccCz
         TKH8L7OgP634b8k6TejM4fdIdYFjXCtQCX5BQCT1t5c2q78h+8O426jP+i2dhF+4C0Hx
         NtsxoUhtGEApkBqanPDhFJrDywJNio5pGLuknkNmZXZkiySo82xxsOhMlVcZvJvYHsHx
         29pQ==
X-Gm-Message-State: APjAAAWEKmkXlgd70BZVyEREqxLH+qzbOjeAtVtSjRkbEBcWq3zjBiPZ
        0rKCpyJXI8O3E5suT2r13Ew=
X-Google-Smtp-Source: APXvYqyZ/t5sC5Rt1hcuadq6uWUQjKX9muCvQ3n8q13yRCJoHU8trY9BEtNW6aopi38d03r8U9x+3g==
X-Received: by 2002:a2e:8e28:: with SMTP id r8mr21646597ljk.21.1572949184057;
        Tue, 05 Nov 2019 02:19:44 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id x16sm9708480ljd.69.2019.11.05.02.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:19:43 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:19:39 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 21/62] gpio: gpio-max3191x: Use new GPIO_LINE_DIRECTION
Message-ID: <e045f3f42785fb81871b0090ee482c0d2905964c.1572945789.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945789.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945789.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-max3191x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 4b4b2ceb82fc..0696d5a21431 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -94,7 +94,7 @@ DECLARE_CRC8_TABLE(max3191x_crc8);
 
 static int max3191x_get_direction(struct gpio_chip *gpio, unsigned int offset)
 {
-	return 1; /* always in */
+	return GPIO_LINE_DIRECTION_IN; /* always in */
 }
 
 static int max3191x_direction_input(struct gpio_chip *gpio, unsigned int offset)
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
