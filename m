Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60A95EFAC4
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbfKEKSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:18:51 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41871 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387773AbfKEKSv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:18:51 -0500
Received: by mail-lf1-f68.google.com with SMTP id j14so14664273lfb.8;
        Tue, 05 Nov 2019 02:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5gus+KR3sBpb4vknCv+W8pubEEE/OvcGK9FKgThRyFQ=;
        b=G82si8kNgBB3A358by++fNrfXOeLaTwGKJLJ2+OjIfZ9nJqT0cMejLVowFHgnfuN6u
         9tPh1dwQ5FlK7V570lDylOX59Ukl6QisfNc7D+qd40mLjO2Vv9IOgTwxwGBfMG65Jg9t
         nx2AQ2KhNlwC+jB7h+f4ZSRg3Cz/ygjGkN7TAQZk0UwVAYm/WEQTQR2nWytXWo9lXp4V
         APDJelwbtr8ftbZa9UuksjRLI6FP6BbIZhDgrMdEoDQkrTWlOAyWMOL76T8gWFBL/EeH
         GCVvhbOh8u/XGWiAK76T7y7Pupt2PlarOm69WQirccI4/zoeOpRjxOLXhh63kflRBRt4
         nS+A==
X-Gm-Message-State: APjAAAVVuMx50bjOyJf0FjCWgYsmXTtpgwccd9SuvWoPnOdze8E5pElY
        x2AjD+zzlWcQ8K1UNLG0GXo=
X-Google-Smtp-Source: APXvYqz98bIXlxkvqrYIgZWuwwgoMvfsHuz+u/5RBNqRE+TjdtCEJaJLGSMwa3UOkYYIU5aQMaZSNw==
X-Received: by 2002:ac2:5f0a:: with SMTP id 10mr19898888lfq.57.1572949129155;
        Tue, 05 Nov 2019 02:18:49 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 27sm9248601ljv.82.2019.11.05.02.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:18:48 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:18:44 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 19/62] gpio: gpio-lp87565: Use new GPIO_LINE_DIRECTION
Message-ID: <554305b9329d5ada25361156432b8c2cb8930390.1572945778.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945778.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945778.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lp87565.c b/drivers/gpio/gpio-lp87565.c
index a121c8f10610..e1244520cf7d 100644
--- a/drivers/gpio/gpio-lp87565.c
+++ b/drivers/gpio/gpio-lp87565.c
@@ -57,7 +57,10 @@ static int lp87565_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(val & BIT(offset));
+	if (val & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int lp87565_gpio_direction_input(struct gpio_chip *chip,
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
