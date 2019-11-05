Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D20EEFB65
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388098AbfKEKeA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:34:00 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42286 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKeA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:34:00 -0500
Received: by mail-lj1-f195.google.com with SMTP id n5so10184991ljc.9;
        Tue, 05 Nov 2019 02:33:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=keaqhy9d34TQEbiO3k6s5maNJuxcjzHirXEbm5phWYo=;
        b=nSucmx4SD9U/NWWveZAuNvR2Ls+LJb8mJMuVQQez7p+NJQfdxC/BxPnsB2krBl9w0A
         66fqb2JRqWfrrEYrch+lvua3MS19tmg8VT2ANsxchxa8PmPxbi8hzsAVJRp9L5XoEt87
         OrWmYHfiPq0B3OMXVp8mACf6VQgE7XWI1st7Urs8ZDJ3OCPk8HmDEd5rxWI7iS7Isl0B
         PuYkYZ6xnbKcDQwugPAwgE5cexElOlupI7ZvWRuM6PDFOUyCFiJ4HAhh4RC+7KoTSyp2
         da0DcBMZ1yTFJMbMRYDPdrZ21LcZaEDvXvOJxfcOmY+R599M45Nt2Iozqj3HyeShlL2i
         +uBw==
X-Gm-Message-State: APjAAAXiQ3jbkMI9NVBzpzxXVuCkd3xgwbcezVJaCRkpaUROFnpm0YrU
        a07KBHrq1INCmI2OEF1cOyc=
X-Google-Smtp-Source: APXvYqwgbSXlPdlJ4PUcrV0/pfF7TSvlVuEHF3iO/graSEVEtcmoZUmJLTBbkEhjpUzbiWEt1MEicw==
X-Received: by 2002:a2e:9686:: with SMTP id q6mr21725888lji.72.1572950037872;
        Tue, 05 Nov 2019 02:33:57 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id c5sm8068887ljd.57.2019.11.05.02.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:33:57 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:33:48 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 47/62] gpio: gpio-tps65086: Use new GPIO_LINE_DIRECTION
Message-ID: <753410a45b37bde0e71f04150fce1e4a02e867c5.1572945976.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945976.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945976.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-tps65086.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps65086.c b/drivers/gpio/gpio-tps65086.c
index 2eea98ff4ea3..1e9d8262d0ff 100644
--- a/drivers/gpio/gpio-tps65086.c
+++ b/drivers/gpio/gpio-tps65086.c
@@ -21,7 +21,7 @@ static int tps65086_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned offset)
 {
 	/* This device is output only */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int tps65086_gpio_direction_input(struct gpio_chip *chip,
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
