Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5AAEEFAE1
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388283AbfKEKWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:22:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42870 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388224AbfKEKWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:22:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id n5so10146372ljc.9;
        Tue, 05 Nov 2019 02:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wn8DHqYZvLKcYPK20gCqPBfrT5YvPpFnu0f4gb8PdR0=;
        b=DL0mI8WoJmyFn9KK1v4UCJ+vyEw12y8hr4hlLvs/eovilpZiCk87tsIuoO5SUC/4m0
         gYHLKdpfk8ecdCWqwdAVq8wOI332uVL3dCuqr/Lk8njOBhePZRamtajM4DNXMWBqyrc0
         vpaHu07LFDv0mg6yMVkcFjWiVVCtseCwJyrrm/DTtlB8IQ0+e2zci5lxrzyN+XG6CROO
         /nKZSnq6C/nxyqY6N9rRDO1SzACFmHAc0C75mt5GOYuxQQnLXw6CYYcVUoFyLfyABAsn
         PbkMiERLcE/r5imSMc3HEUKnhgMLOME56tKjaNZulegPZgZB03azLZtre++pOJqL4KaC
         K7TA==
X-Gm-Message-State: APjAAAX+Xjw0TZswKngRWzBxW/xFCEi9Jfop9+Wmfe3PzwIBTHoizOZZ
        u5BeV16VsGe6oVsD38kGO/w=
X-Google-Smtp-Source: APXvYqwAAyPPQRtQKI8lv1ES4/GgGI+1EybKOl6LvlSe1oqrd77LyjusQj2ihN9kfAMHBVwR2A15DA==
X-Received: by 2002:a2e:96c3:: with SMTP id d3mr8414236ljj.248.1572949364370;
        Tue, 05 Nov 2019 02:22:44 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id n25sm8376073lfg.42.2019.11.05.02.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:22:43 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:22:39 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 23/62] gpio: gpio-merrifield: Use new GPIO_LINE_DIRECTION
Message-ID: <b51e1b6929c5a1c0df7413f1188cb0c763b03d80.1572945805.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945805.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945805.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-merrifield.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 2f1e9da81c1e..d4fa6e9560f3 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -162,7 +162,10 @@ static int mrfld_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	void __iomem *gpdr = gpio_reg(chip, offset, GPDR);
 
-	return !(readl(gpdr) & BIT(offset % 32));
+	if (readl(gpdr) & BIT(offset % 32))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
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
