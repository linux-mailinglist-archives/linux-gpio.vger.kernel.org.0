Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C498EFA94
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388224AbfKEKNN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:13:13 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34546 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387832AbfKEKNM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:13:12 -0500
Received: by mail-lj1-f193.google.com with SMTP id 139so21165752ljf.1;
        Tue, 05 Nov 2019 02:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U3vzg7JtiRq6nihOTFmfvTDWxL5xsAMJm30LLF8lj+U=;
        b=Cqg58o+v1IBJnMZvKRzaRyMtm15h9U00WJPCXGqYaBLO62cRV81I5ULA5AkrdUXvZ1
         4EHjJ94EhqMTy1G3yff6MPsaNo4JfOE0JtTe5HfimdzfMwTUfl/JvUvpfWrVvNXjOHo7
         xaGKcQETr4Wmn6R1CpRuTu1vi8vzNy4qe/J4S0egkEN/VhLifAXYxqpsourfc3BE0EHe
         5i6JwqJaLDPeWec8FblhxsXikGtyYDO3fcWcA6I/dnDEWT+Q3hrtiC54n6TZFQRfmA+D
         UP5s+Z86b2dS1s4gIkk86bYHODBEKKF2SJEbN5kAvg9HJOOO3f3FkYy1RIVjnDNiEz13
         PAbw==
X-Gm-Message-State: APjAAAWWfYoa4JtfkTBu8Xd14cKNwJBAFMGQrl+lmkAZVVUXCdQzLoE8
        55venR6TB54ct/3qtNRjkLo=
X-Google-Smtp-Source: APXvYqxMQYIO0zOq4D+1esjyAJ62F5VggRgJVkXzcHx8gC74WTor+3HJU9RnEZkSVIxEjzQtodmJGw==
X-Received: by 2002:a2e:984f:: with SMTP id e15mr6631596ljj.109.1572948790980;
        Tue, 05 Nov 2019 02:13:10 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id z20sm11291230ljj.85.2019.11.05.02.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:13:10 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:13:01 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Ray Jui <rjui@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/62] gpio: gpio-bcm-kona: Use new GPIO_LINE_DIRECTION
Message-ID: <47840e5f6268d598ed511dcdefcfeb9435109c21.1572945719.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945719.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945719.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

t's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-bcm-kona.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 9fa6d3a967d2..4122683eb1f9 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -127,7 +127,7 @@ static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
 	u32 val;
 
 	val = readl(reg_base + GPIO_CONTROL(gpio)) & GPIO_GPCTR0_IOTR_MASK;
-	return !!val;
+	return val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
 static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
@@ -144,7 +144,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
 	/* this function only applies to output pin */
-	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		goto out;
 
 	reg_offset = value ? GPIO_OUT_SET(bank_id) : GPIO_OUT_CLEAR(bank_id);
@@ -170,7 +170,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	reg_base = kona_gpio->reg_base;
 	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
 
-	if (bcm_kona_gpio_get_dir(chip, gpio) == 1)
+	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIO_LINE_DIRECTION_IN)
 		reg_offset = GPIO_IN_STATUS(bank_id);
 	else
 		reg_offset = GPIO_OUT_STATUS(bank_id);
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
