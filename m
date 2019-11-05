Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3046BEFB8F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388411AbfKEKjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:39:37 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35943 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388264AbfKEKjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:39:37 -0500
Received: by mail-lf1-f66.google.com with SMTP id a6so11320408lfo.3;
        Tue, 05 Nov 2019 02:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Bizwg8330y6fUj6/+5U3kZ2lxdTnhdQBp6d/W5zZBxA=;
        b=hekT7G5SkCwoRgY0P+H1P0yH4mMkRl6t3Tarf0iqsXY8+EdiVf73v/aaC43hPB/Umm
         uDokYjQkjia+pe/0q201Z14vFUuH2qz5nz9zCiONKPwOEVXLTfMPyVKvQuZwENHFiYs2
         DbvY4HCJWYGu5WGePyWk79gGi3ZUdo0GtoA8+R2JTVLZ0KchFCsTaMA7aoF6Fv5ekdDJ
         TgodFzhzSybmUKTHKdpLZH7g1hKsZNPHeeP1rULJd7BDMcIclzwELM7m/R5HpjelEsBK
         CF43RF9VxgAnsymhyAp8RVR9/3Q0Bkiw6VuP674pjGvu1gWoKEIFT4l0PbjLxsMhgDEa
         XFvw==
X-Gm-Message-State: APjAAAWAO7ppycBqyz+z4W35AoWd03pzNQCVWxmpprcJDL+ihzEmwBvU
        M+HwWTZ6XrlgcvhhAfNTh/zbqZSSFF4=
X-Google-Smtp-Source: APXvYqwjJzFvA5HZL5EExi1fiCZwGMCJtamNT6cvHxK3meaBU1h2beVHTIjBpetttyqi7rBEpQDU7A==
X-Received: by 2002:ac2:52b3:: with SMTP id r19mr19528958lfm.109.1572950374987;
        Tue, 05 Nov 2019 02:39:34 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id a5sm1055909ljm.56.2019.11.05.02.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:39:34 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:39:24 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Nandor Han <nandor.han@ge.com>, Semi Malinen <semi.malinen@ge.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 58/62] gpio: gpio-xra1403: Use new GPIO_LINE_DIRECTION
Message-ID: <5acd4b616773589cc7245c6e6dd1fc32c36a0edf.1572946009.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946008.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946008.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-xra1403.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index 05f1998c11a4..31b5072b2df0 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -83,7 +83,10 @@ static int xra1403_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	return !!(val & BIT(offset % 8));
+	if (val & BIT(offset % 8))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int xra1403_get(struct gpio_chip *chip, unsigned int offset)
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
