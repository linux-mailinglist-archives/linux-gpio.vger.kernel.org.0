Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFED5EFB39
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388266AbfKEKbn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:31:43 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37566 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEKbn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:31:43 -0500
Received: by mail-lj1-f195.google.com with SMTP id l20so2515236lje.4;
        Tue, 05 Nov 2019 02:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XvBRdkAyPv510oW/DoNbu2ek/YuJ4fUz43i4Kiqpz7Y=;
        b=hcTe4lI8nL2t+6GXb6/YyCu+VOPUXYYK58B/9bGEK5CGzWpMxhFHmc1UMw5Kt7ayPR
         lSxpUxfmD8B8acwlgsy3xyto6UOgWu9kbjpeMgPtlc/R/S1jJpnz/YwiWN6NA8RIu+XN
         f3tz0K5DuWTtk5jSVz9teHx6hjHC8KJsuVuo21VikPcRFonmjdDLsy1x5h7ME94AUhJd
         KlEQRRJVdrMVinY2zbhTWuKFy0rwLjGKKXSma47wRlSPr8CUv4WXZhJxGxYiUS0Sv1qh
         4ukFlWf4ELpONH1bFlBbJbNVU6QhQ7qaSKs4xfcy82sMddnQ+Nz9MEzKKhpixOY1DxFv
         a9XA==
X-Gm-Message-State: APjAAAW7cfgeQ1c3jFY4l6bpJCVUuA9vDmZ9rRVF9TUA8Myilifbs+sY
        eJ4HtmIB5wS7m9ALAHgMZ2xJgg0133I=
X-Google-Smtp-Source: APXvYqwzcMTXY37jn+kevU5PVaRTL4Bx5Du38GnP8Dod/bvdxDLo0L2M/SRsDTpCtbdPGxLa8OU4Sg==
X-Received: by 2002:a2e:5c09:: with SMTP id q9mr21797881ljb.22.1572949901044;
        Tue, 05 Nov 2019 02:31:41 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y189sm13700469lfc.9.2019.11.05.02.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:31:40 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:31:36 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 41/62] gpio: gpio-stmpe: Use new GPIO_LINE_DIRECTION
Message-ID: <ce14d5fa5cd4d07b1014220f660068c662ebc42b.1572945905.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945905.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945905.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-stmpe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 994d542daf53..542706a852e6 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -84,7 +84,10 @@ static int stmpe_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !(ret & mask);
+	if (ret & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int stmpe_gpio_direction_output(struct gpio_chip *chip,
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
