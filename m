Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEFFEFA97
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfKEKNu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:13:50 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36814 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfKEKNu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:13:50 -0500
Received: by mail-lj1-f196.google.com with SMTP id k15so9009186lja.3;
        Tue, 05 Nov 2019 02:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g9ArBOXxeak8/k5hSwiQQAZ4PDJGGb7ikKTk3zxYWmg=;
        b=tomx9NQftiLn+a2W3wl4WMOYL5PAA/24QD2qNun14kVTCj84hG78nDF1zUe3j9fKWK
         jXP6RdhNG8xSl/9ZCGMbqwXPtKpTlWxT0hmQEVLAVE+s3/u3sG9mj/DbPTeyeTA+x6/8
         LNuDltZSYuaWlml75GZnEg98tqsnY9qvCCpV2/bRQws3O4IgR544pPVxAz6KjmNx6Cpw
         TWZRyyrAtuIbYs2TX2Vl/Zhs6wZ0HDuaMW/raOfhIRrMX9wUOx4mn/91yx74ZmJ3JNMH
         2uSS1OGUC8QWTg+zKFhDWoJjLfmLti5mhXDYvvJNLHHMNt0fQhczl4yKd/6MHHuOpZY8
         zpIA==
X-Gm-Message-State: APjAAAVnw3SGix03wcsqczHRPAva/OdAp0cqEVZOpYbp8X49VBF+HWJx
        R+QXKm2/Qoi25qfxcxAJK0Y=
X-Google-Smtp-Source: APXvYqzWpYdnXcrQSYUHBgRUVk/US5wIbhEDj2OK7J6ZkqkjQjGF9l24/9i2KDbdvYaIM1Iynim/8A==
X-Received: by 2002:a2e:970a:: with SMTP id r10mr6680643lji.142.1572948828331;
        Tue, 05 Nov 2019 02:13:48 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b67sm18268337ljf.5.2019.11.05.02.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:13:47 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:13:38 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/62] gpio: gpio-bd70528: Use new GPIO_LINE_DIRECTION
Message-ID: <e3aa60c61175eb7360402bb99a9dcce145b02a7e.1572945725.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945725.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945725.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-bd70528.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-bd70528.c b/drivers/gpio/gpio-bd70528.c
index 0c1ead12d883..734be6b752d0 100644
--- a/drivers/gpio/gpio-bd70528.c
+++ b/drivers/gpio/gpio-bd70528.c
@@ -54,8 +54,10 @@ static int bd70528_get_direction(struct gpio_chip *chip, unsigned int offset)
 		dev_err(bdgpio->chip.dev, "Could not read gpio direction\n");
 		return ret;
 	}
+	if (val & BD70528_GPIO_OUT_EN_MASK)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return !(val & BD70528_GPIO_OUT_EN_MASK);
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int bd70528_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -166,9 +168,9 @@ static int bd70528_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 * locking would make no sense.
 	 */
 	ret = bd70528_get_direction(chip, offset);
-	if (ret == 0)
+	if (ret == GPIO_LINE_DIRECTION_OUT)
 		ret = bd70528_gpio_get_o(bdgpio, offset);
-	else if (ret == 1)
+	else if (ret == GPIO_LINE_DIRECTION_IN)
 		ret = bd70528_gpio_get_i(bdgpio, offset);
 	else
 		dev_err(bdgpio->chip.dev, "failed to read GPIO direction\n");
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
