Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6BBEFB0F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbfKEK0i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:26:38 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36528 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388518AbfKEK0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:26:37 -0500
Received: by mail-lj1-f193.google.com with SMTP id k15so9054105lja.3;
        Tue, 05 Nov 2019 02:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IFjUGuI3ulVgt4ueQzweecNMeh52xwxpjnMtYpKO30k=;
        b=hxOc+w6zIYwCav103Eji3b7wV8rGPtAR4GZ6S89V6xhfQqMB/5wpcxjOEtd03aFyjF
         My6aTeMjRufTi55uqonU/VCjLBs6uA87ZPrTvsxvvE9ddvfMtODkdmCSOhHjxb9nF+Qo
         cUR0fVpCkYY61UNlyR8esyRRddFwpXchXZDug7b/9WYI3r6CpeRqUaQarhbgtOiN/VbW
         OQkpPjfwOFnFIV4PbibWV615LlNcT5grVZNam6dMrheoTZ2NO8eHOJpypE72+1kSw6ef
         5J/VAnDgAV6ll005syCHEgZ5272UO0GFBrwT9NtqhETAietMAswdK1sQSQDf5EwNi2XR
         +sSQ==
X-Gm-Message-State: APjAAAWxp+31RzGCLG36/kG4GbvnUrecEEavQJRJHDROY/37m2i5j//I
        wWJxvWasp3OEXyAVXZXlmbw=
X-Google-Smtp-Source: APXvYqy8beBRgRqwBS8w8DAGqAgb3XZDbjvNI0FnIKwapbeGVtCNnUPErWGV8yj+8sR4iVURMT5xNA==
X-Received: by 2002:a2e:6a19:: with SMTP id f25mr804262ljc.147.1572949595505;
        Tue, 05 Nov 2019 02:26:35 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f3sm2801192lfp.0.2019.11.05.02.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:26:34 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:26:26 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 30/62] gpio: gpio-pcie-idio-24: Use new GPIO_LINE_DIRECTION
Message-ID: <b0d91ce784f3587c0b99655a1400652f9514c312.1572945859.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945859.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945859.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-pcie-idio-24.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pcie-idio-24.c b/drivers/gpio/gpio-pcie-idio-24.c
index 52f1647a46fd..44c1e4fc489f 100644
--- a/drivers/gpio/gpio-pcie-idio-24.c
+++ b/drivers/gpio/gpio-pcie-idio-24.c
@@ -104,15 +104,18 @@ static int idio_24_gpio_get_direction(struct gpio_chip *chip,
 
 	/* FET Outputs */
 	if (offset < 24)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	/* Isolated Inputs */
 	if (offset < 48)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	/* TTL/CMOS I/O */
 	/* OUT MODE = 1 when TTL/CMOS Output Mode is set */
-	return !(ioread8(&idio24gpio->reg->ctl) & out_mode_mask);
+	if (ioread8(&idio24gpio->reg->ctl) & out_mode_mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int idio_24_gpio_direction_input(struct gpio_chip *chip,
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
