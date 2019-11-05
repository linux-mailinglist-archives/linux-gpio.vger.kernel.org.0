Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A958EFB05
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388353AbfKEKZ7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:25:59 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36827 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEKZ7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:25:59 -0500
Received: by mail-lf1-f67.google.com with SMTP id a6so11287962lfo.3;
        Tue, 05 Nov 2019 02:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q3EU3PFDxzbABDOEU3Nh58uvPPNzhd0ptTKha1CeP5E=;
        b=g5Vt16P/1dvdw0bs1f2D9dDgwooSBC106LecK/43nY64sjFWP1fGZ/YQMlO0dbD09o
         DqBmPxQcIktDBB06bQVOr2DGCbAjlKD/o9/RS1i1UuwmOE2MW20ytV8FZqvczZHHhOqJ
         kT5JCqC9FJ++ipFYx0nalDSu4C9pqsjzUZBDVlpJETzPDq0l293VNaAa2vqhP+/oXpMG
         i/OFl/3XOeBlFj8vOGg8DJ0vmYETQJ8095X3nQvBt3+EtRdN2JUSsV2NYuoMFhKD9tah
         6dfUtYBb0VY8kn3ezikFsBWq9lwLTNpVa7S+glWLwAVnONfmyRLVy9WrFJaLDrjP8BzY
         g75A==
X-Gm-Message-State: APjAAAUqnuFUU+dzZk+typM5TpFNC7zlnUVKqBne3CsuLuRxSLzwHHqe
        ZGlnF6z8n0AOEcWZMdYuTGo=
X-Google-Smtp-Source: APXvYqzUg5ML8A6OCKXgQJp9pNhL+np8kVlPZqbb7r3PlE53j0mB2zKW91q7uiNNlZ60rsp1iWEXjw==
X-Received: by 2002:a19:6759:: with SMTP id e25mr19266682lfj.80.1572949557418;
        Tue, 05 Nov 2019 02:25:57 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v21sm6540529ljh.53.2019.11.05.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:25:57 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:25:48 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 29/62] gpio: gpio-pca953x: Use new GPIO_LINE_DIRECTION
Message-ID: <88f0dbb0b6dd84ffafa9294808b78526b1a9c160.1572945854.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945854.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945854.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-pca953x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index de5d1383f28d..82122c3c688a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -449,7 +449,10 @@ static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 	if (ret < 0)
 		return ret;
 
-	return !!(reg_val & bit);
+	if (reg_val & bit)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
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
