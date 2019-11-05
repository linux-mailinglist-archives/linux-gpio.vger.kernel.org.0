Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3B9EFB97
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388400AbfKEKlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:41:08 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42291 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388098AbfKEKlI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:41:08 -0500
Received: by mail-lf1-f65.google.com with SMTP id z12so14719808lfj.9;
        Tue, 05 Nov 2019 02:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ab8TgE96NXL7wNNnxX7ASO1X5IKhAsP6Q26bpn2VZYY=;
        b=AQLHBY5nV3T7qF4yECjhV2phBZt//J5R7ab4xvBKY22Seck8w29lOJ2RiaqHIgDH2b
         P6vykzwFT/Fcl+Xq2sJie3gLh9SwwOQVUtmhkkjkzUxkwS86Ni34xZI5rMKLalIYAqgt
         oo+WdlzJj5vEXlbnLT2hBBqycJqgfSWRMIvYh0D2sZjCuSj/XqFXU4a+/JAAke2KXOMJ
         d33w6zoCzoU9B4NdlmL66h8LiQAnQqdCfGo7wTI117067iy3ExpeZ/Bjp84l3ru87GJy
         oSOrJiWeVS+dyUjnK5HFgUJ3L53+Xmm/jzH0wkLsXP1AgRHtWzD7TLKTDlNMm3ZDI68E
         T5SQ==
X-Gm-Message-State: APjAAAW1ifKmRCeWUO1IBR+2QN0EtKQVi/W18IvNjblHDdUYXqe97JAh
        gyYzLUU1XEv0WLwM+dLH8Xc=
X-Google-Smtp-Source: APXvYqyd7BPLVlXltvwQx3q/6/93eoazHHJAhFGgTMBf28mtqzAfCdmqA/1SC1YAlBltoIfJMpVCgA==
X-Received: by 2002:a19:40cf:: with SMTP id n198mr20334435lfa.189.1572950466340;
        Tue, 05 Nov 2019 02:41:06 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id b67sm18399134ljf.5.2019.11.05.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:41:05 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:40:56 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 61/62] gpio: gpio-sa1100: Use new GPIO_LINE_DIRECTION
Message-ID: <95cc1f0c0925da53696fe8b69109cfc6c2d35794.1572946026.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946026.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946026.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-sa1100.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index 46b7cf23fb0f..edff5e81489f 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -53,7 +53,10 @@ static int sa1100_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	void __iomem *gpdr = sa1100_gpio_chip(chip)->membase + R_GPDR;
 
-	return !(readl_relaxed(gpdr) & BIT(offset));
+	if (readl_relaxed(gpdr) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int sa1100_direction_input(struct gpio_chip *chip, unsigned offset)
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
