Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D472EFA8A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730731AbfKEKLq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:11:46 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37553 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfKEKLq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:11:46 -0500
Received: by mail-lf1-f67.google.com with SMTP id b20so14658822lfp.4;
        Tue, 05 Nov 2019 02:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l3mWot1MU6Ufccp1QgJSmXq7QZ/vbcwqX3vY3ec8Qno=;
        b=cL8z5UqBODlp+WiyA5xTlX514odhphhBSEu/ywHLq3vsZobJjTY3P28qnAk5oHItAL
         LSG184DMDGcB2fP1Bc6rtNew41Mn2Yf3q5nyYoCwooW6YcYsHweknRNb0LIWJDuaOKGi
         /Jio7KcocKrUJPWkaTvi87y+HWWEca6cOlQgsGgFPSzSMJ2eZyWwVXnTTMxuJ5FtpsMI
         y5i9bTc68Dxo2k+FUwpOC5ryEFvEIxiEg8udCDlYJJlNYnMyv45DTUsd2m6xCjhJPDhC
         knUkmvtGygI0SgtpcWg8wNi8ISyxoJz8fMlhqzTmNPmtRRHqIbMsVFnX0GQV/efx+apx
         bm1Q==
X-Gm-Message-State: APjAAAVzKJ+ndnw987F+7hGjNo7jQ+PhFsASmWHcb2ADLTBVUtFwSJgm
        q6A0UvIEyb60/7eq+VZFCMnnv8LpH6U=
X-Google-Smtp-Source: APXvYqxdJlWBNPk07vV9m7DwwWOmFRbdkRzKvji75HOvhj13DR5bkq5xpbpFT1aHOvCIOP8DJ/aMlw==
X-Received: by 2002:ac2:44af:: with SMTP id c15mr20212013lfm.39.1572948704431;
        Tue, 05 Nov 2019 02:11:44 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id e2sm8494450ljp.48.2019.11.05.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:11:43 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:11:34 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/62] gpio: gpio-74xx-mmio: Use new GPIO_LINE_DIRECTION
Message-ID: <208e7b0c1d8e282cdd91d3d31f6c2054b45032fd.1572945644.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945644.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945644.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-74xx-mmio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index 83a2286d93f6..173e06758e6c 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -77,7 +77,10 @@ static int mmio_74xx_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
-	return !(priv->flags & MMIO_74XX_DIR_OUT);
+	if (priv->flags & MMIO_74XX_DIR_OUT)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return  GPIO_LINE_DIRECTION_IN;
 }
 
 static int mmio_74xx_dir_in(struct gpio_chip *gc, unsigned int gpio)
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
