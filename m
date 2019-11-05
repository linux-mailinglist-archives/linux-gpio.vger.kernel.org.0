Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA0F1EFAAE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388221AbfKEKQi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:16:38 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36172 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388283AbfKEKQh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:16:37 -0500
Received: by mail-lj1-f194.google.com with SMTP id k15so9019038lja.3;
        Tue, 05 Nov 2019 02:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5NebXbMF475Y2htZZ2GLrgonGKORB655pO+Ly4MPZ/c=;
        b=HbBsIP8bGjK68mXDk3D+K3cvb8WLoXnvcgukZSTv4WIse1wd1I/5NtOcRCHgDD/Y0H
         VP2f6+Ib4s5q8rLQZx8/Hy/reikkzi7p8Jx/B8v21wEeJ2F/OukMgXQkaelf5IYKdPMk
         LsDBHWh3HZ6Yo1yX5p9oy8lMFMCFUiwyeJ4RvSqGVEPq48aeORrHg3HaCKEyYTxC9V3Q
         v4KhYoHGyU2HYkjeoM9gO8C6cDPMRu5mzMUAzMSBl2f0Dm4AEPL3h+L5BEG71aDtmAA4
         2iheRHaQi7K0FPh5vSWxWYnirVBZJFYZx3uehourwgN3dv966GCY/LVD2gAGySgq3AHq
         SwMw==
X-Gm-Message-State: APjAAAUk3ZQ/IyO9UcDcevP4X2BGRd5YIQP2woZdVFkpFxthfFkSRdmH
        W5CERImd1Dyu3EpoY5KybRA=
X-Google-Smtp-Source: APXvYqz7U8CFllFFvKlYIbQOiu2fh46CluHXoIm/6trz4KiiV6mVRJGukNHMZmUwWod0ZT5Wc+01AQ==
X-Received: by 2002:a2e:9083:: with SMTP id l3mr7742362ljg.127.1572948995435;
        Tue, 05 Nov 2019 02:16:35 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id g13sm1074895lfj.91.2019.11.05.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:16:35 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:16:25 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 14/62] gpio: gpio-gpio-mm: Use new GPIO_LINE_DIRECTION
Message-ID: <ddb3030b090543401c8c8348938e5bbf5bd9e25e.1572945762.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945762.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945762.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-gpio-mm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 78a1db24e931..c22d6f94129c 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -52,7 +52,10 @@ static int gpiomm_gpio_get_direction(struct gpio_chip *chip,
 	const unsigned int port = offset / 8;
 	const unsigned int mask = BIT(offset % 8);
 
-	return !!(gpiommgpio->io_state[port] & mask);
+	if (gpiommgpio->io_state[port] & mask)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int gpiomm_gpio_direction_input(struct gpio_chip *chip,
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
