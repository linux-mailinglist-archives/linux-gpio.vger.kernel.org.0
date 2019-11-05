Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1D5EFA9B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbfKEKOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:14:34 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42741 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730699AbfKEKOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:14:34 -0500
Received: by mail-lj1-f193.google.com with SMTP id n5so10117145ljc.9;
        Tue, 05 Nov 2019 02:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sgRER2GYufZWIyTdQOoGwRBfIIq1xVCwP+DGjXPxhLc=;
        b=Y7rFzLgZpX7TUin2U8nGCoA9hD8JU3aJbKJ4Bbi8Z51j5j7aqF0B407jmVAWq+hMCA
         mGLGxhrrpIh+SiikTBpARfCthZckWYh1h+s1dgGsZ9+ADr62+/tN43e1QUC4NJIOwB3W
         kpoF3vMgwlPn3nqivKer1fTyBAzzXwPlRRdy6teWNalyLfYN3v0E/QxLWSetIPMbwCOm
         e2s6Hu2HaUlcVS9frGOaVZ6p0B6b3ilIsDGzhLStUqbp9vsQCPOqQKNOdu+Y/vKRRQem
         owL+2MyTYzijbcvDPksxPXPTsDsoEge3g+c6ipDGsdHpGVVms08ly7FkRjkJlJBKPCUb
         fIBw==
X-Gm-Message-State: APjAAAUJJKxcvWhsf7tk1UqS76jTHGwv1EpGA46jo0ST81M2jpNzzX3z
        jCmF9buxy2ftdZqDNTTilGfNrEVJRmY=
X-Google-Smtp-Source: APXvYqwE4ANDsQZUs2OibgHsxyfenXEROHlXWR5+RLW0h19avgiFRurwS7VraARAmCbepvAREu/jrg==
X-Received: by 2002:a05:651c:390:: with SMTP id e16mr22497104ljp.196.1572948872186;
        Tue, 05 Nov 2019 02:14:32 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v6sm14267659ljd.15.2019.11.05.02.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:14:31 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:14:22 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH 10/62] gpio: gpio-bd9571mwv: Use new GPIO_LINE_DIRECTION
Message-ID: <07ed3f5b199c81fcb214b9e0e6e37bfed079e2f7.1572945734.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945734.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945734.git.matti.vaittinen@fi.rohmeurope.com>
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
different values depending on GPIO pin for the INPUT state.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-bd9571mwv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index 5224a946e8ab..c0abc9c6851b 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -37,8 +37,10 @@ static int bd9571mwv_gpio_get_direction(struct gpio_chip *chip,
 	ret = regmap_read(gpio->bd->regmap, BD9571MWV_GPIO_DIR, &val);
 	if (ret < 0)
 		return ret;
+	if (val & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
 
-	return val & BIT(offset);
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int bd9571mwv_gpio_direction_input(struct gpio_chip *chip,
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
