Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA571EFAC8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388396AbfKEKTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:19:18 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44107 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388283AbfKEKTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:19:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id v4so14670588lfd.11;
        Tue, 05 Nov 2019 02:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hmymdAmmLz7/1ts3Oc63nVM1gU1OUHbrPD3E1JaeYNM=;
        b=fFrp9MCP/g5SF/3M3SVUqV648obTuYYoXK0LBzl5NVJJw+XXRKkhr2PkZfABcXMWRm
         RsdPBQSr1pOLIBgDHWlEPG3pwdt/OLr//W++68yJVLy4Q/ixCcWsZbhfIcy/Ybvm7uKz
         jZcaPF8TnqfVUOm6l3Cezgl47ryBAjUq9UlrgmJ0Ma4nJzvJq26Hk7KKVi+192QpjZds
         gsQozH9P8AfkMq1nX5C4arkro2cEbljywjrdMPF9xnD08Ms7soFgNRixGpuwawNObuZ3
         QuRsU8LY5sofnC3KGGon0WAsJI4gF/ZVadAa69iEPNwZ22RF6d3lvQqv2KNWqCjYzbP+
         lb4w==
X-Gm-Message-State: APjAAAV2lTywVGpNdK1OhVYpXWdzYsZxVBbRWPSoPq+vHCJBdAB0aNMU
        2RNSTn4g04XRQXNcRQSW/Uk=
X-Google-Smtp-Source: APXvYqwA3ByHsXKNFTqbUXeoIjiBwAvnWHc+B8RB60mVSLtRlUkTAzBu16JIPrIeS4QzEPOsnHHLbg==
X-Received: by 2002:a19:4314:: with SMTP id q20mr19474289lfa.146.1572949155808;
        Tue, 05 Nov 2019 02:19:15 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id h16sm8502164ljb.10.2019.11.05.02.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:19:15 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:19:06 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 20/62] gpio: gpio-madera: Use new GPIO_LINE_DIRECTION
Message-ID: <313330e496479b15f6dbc59d95bfa08c280415f1.1572945780.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945780.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945780.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-madera.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 7086f8b5388f..8f38303fcbc4 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -34,7 +34,10 @@ static int madera_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !!(val & MADERA_GP1_DIR_MASK);
+	if (val & MADERA_GP1_DIR_MASK)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int madera_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
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
