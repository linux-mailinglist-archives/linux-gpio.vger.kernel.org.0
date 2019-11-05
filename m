Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B35EEFB7B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388372AbfKEKgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:36:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37739 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388203AbfKEKgm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:36:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so14717680lfp.4;
        Tue, 05 Nov 2019 02:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9yLkU1fLDmwhfGazMEbjx8+zoiVm198gC0Qaljm2x2o=;
        b=i8aCE8/OTInRkL/tgy0lTG4w0R9au2STvDjZDBuA+ksJsjLKxVlo2BUTG1kRD2aMps
         tIMBlth6ucfzSQIoyEi//h8u9hJ5/Da9hI+/BTSUsknAqmPlEyiiv8TaJF2Lovblm+uU
         M9ecc7YNUkt1ptLc9eBOXyS3OKpmJVt60IADiQL6+qXv7gquR4uIWvRC9JQSdCWJ4bFu
         gOnXeRVuJOHbmyTea9d8iD/RmpSixlDz8/PKQs0D+t4ipghFlkC25BiOb5fj3qo8inKP
         GI5voV/N6D1vQdkfxkXKoBusSyQ0bn5cGJifptWlRS1oPeU5Toz5rNlft+1tGycfs7kT
         VWVA==
X-Gm-Message-State: APjAAAXqnThHkgD05kLDh5gUeVfc7cR/JMpZ5sliz6NASOH1YNaONsGs
        BWCPV8GrdlhgZk9WiGWiCtM=
X-Google-Smtp-Source: APXvYqz/3SmBJsp1m1eSum2/AkWPa8VKjYZUMq9IEmo3t2XuFUCQAy5HiCuaQxMEKNkJuZHfFnEttA==
X-Received: by 2002:a19:7f15:: with SMTP id a21mr20456938lfd.169.1572950199922;
        Tue, 05 Nov 2019 02:36:39 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 141sm8945533ljj.37.2019.11.05.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:36:39 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:36:30 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 53/62] gpio: gpio-twl6040: Use new GPIO_LINE_DIRECTION
Message-ID: <e4f7f35b24e9be68305f2883ba1e59ff3fe0d159.1572945996.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945996.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945996.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-twl6040.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index c845b2ff1f43..648fb418d775 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -34,8 +34,7 @@ static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
 
 static int twl6040gpo_get_direction(struct gpio_chip *chip, unsigned offset)
 {
-	/* This means "out" */
-	return 0;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
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
