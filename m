Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635F6EFB8C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388374AbfKEKig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:38:36 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38015 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388373AbfKEKig (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:38:36 -0500
Received: by mail-lj1-f193.google.com with SMTP id v8so5558622ljh.5;
        Tue, 05 Nov 2019 02:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s8ODvdqAZRazfdkpUgOz7TM+7P7c8p+tYSwvrCqT1dg=;
        b=j8fouLmvJTPDpebc+t3rKnIhxTHcz709z+dTtXSeoGnUfiSLA+BqE7VOvg4U73pEES
         lFw8cc696kRRr+CwqhgJVMbTir2cZ+8eAM8MxHuUoV7bONFadla6r4XzlhGDqzewmnTY
         RpmM9RvDuccXraoj5tyA68aifKjqmubJEXIQCLQeAfSt8YZ6JWsepDwxftEVV5VPDUQH
         kO7pC53kX7aOW8OMIp6W/lA8Lce3O+2IdsETTfLRvpGp2DRZo1TQW7a3nNBlm1dfxS9z
         aTLwARKBMNghgw05/bRIyrmN7OQL3iOJ6ZsYwEhmRI0urFB42jcNOduAVVlsOB2yXe23
         5MMA==
X-Gm-Message-State: APjAAAVB7VAwlCoLJFrMtk8/Vnjm09Pu3NVnAS4zgPa7jZP5Xa/Q1Vi+
        RWJiUnp8p3m20SHzRSGzjRU=
X-Google-Smtp-Source: APXvYqxk4hLjFQDWV6mJNmoKfBDvBWYTiIvR37Iz/Jnc95U2FIYpMosRsugjzbgHk/rSzxK2WyPsRg==
X-Received: by 2002:a2e:9985:: with SMTP id w5mr15873592lji.162.1572950314094;
        Tue, 05 Nov 2019 02:38:34 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u2sm2558364ljg.34.2019.11.05.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:38:33 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:38:24 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 57/62] gpio: gpio-xgene: Use new GPIO_LINE_DIRECTION
Message-ID: <00ccd2df52f60b22c5065c8b2b222414a49710e4.1572946004.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946004.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946004.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-xgene.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 2918363884de..c03ab83e5464 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -80,7 +80,10 @@ static int xgene_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	bank_offset = GPIO_SET_DR_OFFSET + GPIO_BANK_OFFSET(offset);
 	bit_offset = GPIO_BIT_OFFSET(offset);
 
-	return !!(ioread32(chip->base + bank_offset) & BIT(bit_offset));
+	if (ioread32(chip->base + bank_offset) & BIT(bit_offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int xgene_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
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
