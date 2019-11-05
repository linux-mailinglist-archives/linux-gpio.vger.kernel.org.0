Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE5FEFB5C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388318AbfKEKdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:33:20 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34265 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388148AbfKEKdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:33:20 -0500
Received: by mail-lj1-f195.google.com with SMTP id 139so21237670ljf.1;
        Tue, 05 Nov 2019 02:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YznzjP8z3Q9UzNsHNg+GF8h1toinZV4vOSQBjK3U6Yw=;
        b=NQY4fX1se474mXMnFVg1kBXc2R35ewQm0ToNWjvLky5OPLFrVUEyw5Y0504AQGKx5d
         SjZjK2AQO6ybl3WwnI3HOEgDfJCfo2rlLh8fFYuh7YN+aTJA+oohBz7ocYi+VKTyb/jf
         2syv7vuJvI9XR4uZdXcVXtWr6FSwn7Anjje+zDwNnx5d247hRD8S4Xsy8BPdDKHcGXh1
         w78j0cgfXNIUdv4lffF1VBDSnqe5fvCyPu+qw33K0AEPujfuWmbMEoRuMCs4fITPoAV3
         mgVuYR4iton589gf9ugCInaMtTYXGv2ZDtyywJyGFq1dTK+su2v/yiiM/ETnGSCG5Q7y
         YVzA==
X-Gm-Message-State: APjAAAW+FDf2eMruMSsuZ4pQzHc1b5sgR/p44ffnCGr6CQ8k3i7aFfmj
        /QYyoJgdz73L7R7MHSL0LAU=
X-Google-Smtp-Source: APXvYqxIURJTRZMzfLW9ep7F7IrdCS30fclhI8B6N4prTIW0q0H6DNjn857NWngeWcqHsqJ7bwMIiQ==
X-Received: by 2002:a2e:8613:: with SMTP id a19mr9136159lji.138.1572949997879;
        Tue, 05 Nov 2019 02:33:17 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g3sm8860805ljj.59.2019.11.05.02.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:33:17 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:33:08 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     David Daney <david.daney@cavium.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 45/62] gpio: gpio-thunderx: Use new GPIO_LINE_DIRECTION
Message-ID: <9707829e8a36aaccc8572602b55bb9764412a550.1572945969.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945969.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945969.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-thunderx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index ddad5c7ea617..d08d86a22b1f 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -169,7 +169,10 @@ static int thunderx_gpio_get_direction(struct gpio_chip *chip, unsigned int line
 
 	bit_cfg = readq(txgpio->register_base + bit_cfg_reg(line));
 
-	return !(bit_cfg & GPIO_BIT_CFG_TX_OE);
+	if (bit_cfg & GPIO_BIT_CFG_TX_OE)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int thunderx_gpio_set_config(struct gpio_chip *chip,
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
