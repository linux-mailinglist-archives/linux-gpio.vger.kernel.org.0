Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 726DCEFAC2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388060AbfKEKSc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:18:32 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33152 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387773AbfKEKSc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:18:32 -0500
Received: by mail-lf1-f66.google.com with SMTP id y127so14667642lfc.0;
        Tue, 05 Nov 2019 02:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MWnOw9JjnCHpqKPTN3pPGUJIwZRKUop8HSWrhdC3vT4=;
        b=fny6ZOJw2sljZkT8rfhB9aWLTsXs2tg3ATV/weshRnm2f+DS25uJ04FUuzBbT9ItIg
         fYf+d2X/tki171ENZ7fT/0JeWkJAT9SZPkDDUqgBrk9b7Q+7SKL9Ax/7uQubuy46WYGT
         cl0ozzpgDGj0fFXRIPrzNnrlyg8Th86qUfVobDzkuP/q2hU6IxtCywTCdCCs0ddfxSA7
         GTBvUUXpKaltbKM6+tGIPkgXr3UEqaDAuiODQbB7bTPYjioaIdXCI9g3siwFi51YvdD5
         Z1PomeCg+ZhaTuExdjKH2vb+PhjiP9wyd6n3fvRY0rHEaCykKADVeHpTryRcW9/jPAQt
         gGFw==
X-Gm-Message-State: APjAAAX0QTx7t/2peB8JWFKLs/QnrJNqoADbScsD2V1ohBmmgT/zqopz
        Bssix7Br8b8e7r3/xwTakg8=
X-Google-Smtp-Source: APXvYqwo01qbCE5SasJan7lMcNYD6khUpQEBG+b7p/f86el3GNyGSsQWQflPVOocDdx5U4gLU9o+AQ==
X-Received: by 2002:a19:4f4c:: with SMTP id a12mr177073lfk.18.1572949109612;
        Tue, 05 Nov 2019 02:18:29 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id d28sm8170785lfn.33.2019.11.05.02.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:18:29 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:18:20 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 18/62] gpio: gpio-lp873x: Use new GPIO_LINE_DIRECTION
Message-ID: <5f6487bef761bdfe1e243ce54eb9ffa5ce2c1351.1572945776.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945776.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945776.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-lp873x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 801995dd9b26..70fad87ff2db 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -33,7 +33,7 @@ static int lp873x_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
 	/* This device is output only */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int lp873x_gpio_direction_input(struct gpio_chip *chip,
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
