Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D56BEFB13
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388148AbfKEK1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:27:01 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46274 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388224AbfKEK1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:27:01 -0500
Received: by mail-lf1-f65.google.com with SMTP id 19so9527053lft.13;
        Tue, 05 Nov 2019 02:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c7AanZ8nsR0tYhgpw6owQy8CmSNJrjmkJAunlkfPFMw=;
        b=iZ9Fg3k0BiA07Jtug52sH9usxofEwsyH+qcmsjGRmvOFBu/0MfjqZfS0laS/3bV4hn
         FC11oKuln7943bZplMXE5soJoQJSTsdVoS6KPB4oZO1jV0mrcf3MZTd1XxdriRzrGrb8
         FAg/1k13B5EwmVdcd30lzoFUY+4JXsqgqB2YL/Tt6TAXHGZZoCREwQDqTNQHp2YeHRYr
         54BNKr3rNBvaLb142tglNCZfzfXY6J60Z6uKNb93X0tAFCyZ+g1QO9T8PQxHRzcKaHpV
         xJOcoKpFy1z0sHwwpJV2zYmbGsBDIHVn/KV8Gij4DilHRaBp4n4d7OYkYs4KJ8twEn0v
         HBHA==
X-Gm-Message-State: APjAAAXnFsUHkFm3oDRfAc7HChNzf3QDp331RpHiCEjk2KzbfQynDxp4
        fbLWXGQ/nyMUacdvQ0ABhsk=
X-Google-Smtp-Source: APXvYqyTlS24KTZI164vz+JNNkrAq5AbViNJ1xI4+KlGbFWmoxULKNPICG2K1vSYRKdhrjcxVUWQ5Q==
X-Received: by 2002:ac2:523c:: with SMTP id i28mr19680268lfl.165.1572949618779;
        Tue, 05 Nov 2019 02:26:58 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id p193sm16344663lfa.18.2019.11.05.02.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:26:58 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:26:49 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 31/62] gpio: gpio-pci-idio-16: Use new GPIO_LINE_DIRECTION
Message-ID: <2c63de5d80da514a2fe2bcae203c1536e129bb5a.1572945863.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945863.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945863.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-pci-idio-16.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 5aa136a6a3e0..df51dd08bdfe 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -61,9 +61,9 @@ static int idio_16_gpio_get_direction(struct gpio_chip *chip,
 	unsigned int offset)
 {
 	if (offset > 15)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int idio_16_gpio_direction_input(struct gpio_chip *chip,
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
