Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA06EEFA8D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730592AbfKEKME (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:12:04 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34375 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKMD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:12:03 -0500
Received: by mail-lj1-f193.google.com with SMTP id 139so21161633ljf.1;
        Tue, 05 Nov 2019 02:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+rAKPnYpwif3Knpm5vJ29yNfnLp6NB0L9g2u418JlWs=;
        b=OBINw19v1NZFPT1I429+PrZbOT3FT9heI9JNxDCSolyfhreu02cRP+MtUNuwuL2i3+
         IrALhb/GlKLwuJ/drBLup2SbAPjAmxTNnsTvJ6ffDixcWIpTOAxCZ7C5E6hUHIW1AHUb
         hIOypxx5ategy8i+Llx6U3LVXO7C8NbqUCeUd7xb2vplOT1XYIOqUvCa1rCLt31BX8El
         UZO1MWmOIeH4PSBzVoJ7Nn2jc53dbsvQ9XrsH1TqbXGSFiZ0VZ/wcs16D2/vBOoRi61X
         taOjQBkMfLvqb7Nx7zoKg1LBUbkIZ57oShdN8LBy6X4OTe53pQ2wJGjJJ+wMSpnl2Dat
         fXwg==
X-Gm-Message-State: APjAAAXYei41XVDIAxz6d16jLrroL8t2jo3Qc4hsnFIWwYWGIeaUaR6h
        YWf0aMIgDaI2r5knRcGHu2I=
X-Google-Smtp-Source: APXvYqzrmtvgVCtzMm5y7T9zMhWRVxEj7aN2RIgCT8RW1KDd+m50N54i0AVbzDPNOsSQTBHqJKcjPQ==
X-Received: by 2002:a2e:94c4:: with SMTP id r4mr22532943ljh.34.1572948721621;
        Tue, 05 Nov 2019 02:12:01 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 77sm12451799lfj.41.2019.11.05.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:12:01 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:11:51 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/62] gpio: gpio-amd-fch: Use new GPIO_LINE_DIRECTION
Message-ID: <db267be82e925a07ef42743849195a6e168e454b.1572945686.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945686.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945686.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

NOTE: This commit also changes the return value for direction get
to equal 1 for direction INPUT. Prior this commit the driver returned
non standard value BIT(23).

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-amd-fch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-amd-fch.c b/drivers/gpio/gpio-amd-fch.c
index 181df1581df5..4e44ba4d7423 100644
--- a/drivers/gpio/gpio-amd-fch.c
+++ b/drivers/gpio/gpio-amd-fch.c
@@ -92,7 +92,7 @@ static int amd_fch_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	ret = (readl_relaxed(ptr) & AMD_FCH_GPIO_FLAG_DIRECTION);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	return ret;
+	return ret ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
 static void amd_fch_gpio_set(struct gpio_chip *gc,
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
