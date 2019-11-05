Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ACE9EFB27
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388248AbfKEK3r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:29:47 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46741 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKEK3r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:29:47 -0500
Received: by mail-lj1-f194.google.com with SMTP id e9so7878218ljp.13;
        Tue, 05 Nov 2019 02:29:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T/zJmmC9BfN7o1sqvqhhANQRkLvNhk04+tink2hcu/o=;
        b=NRrZNRWtQFeuY8BCZag2f7Rog0KuEtFi5nLKSyqmYaX3f05q5ssPIIBOCVgWWNRgmC
         myMhAjD8xwfg8cIGFf2CQ/bM80caWovyZNlgeOVrzqjANokNO2OsKUcHcvGSMlb9qFya
         YJ3HD6q5IQSEFjmWELLZd8EVW/wr8vX9uK7gJ/pvh/hskaR6+mKnP5BpV2c5BdGclYYN
         KZCQYP/dNMaqPnxH3SCeARNWFJNsucv8JlIe7MkkyugvqWGFpEat/8Qr8QMH4n4pAzsH
         GOqUAC6jsgcCa55vg0rSiQtnDFpFJsz+GwftFZVrnEFWxklmhr2AR+DkSHXkMb0KLsr9
         jjWw==
X-Gm-Message-State: APjAAAXllbbP2+gFT1xJA/IG2foJ71fA5j/cl1H3WRzYb+MB4GPwB8tI
        BpU8407yym2d6vCXWVGNdk8=
X-Google-Smtp-Source: APXvYqwAiLmM1AWBNWgvSloHZxacz7vhjYQV56y3Fw7fttafgeaQyw/oMgcvECS8UnmExC/IFeNwWQ==
X-Received: by 2002:a2e:874a:: with SMTP id q10mr23012443ljj.14.1572949785377;
        Tue, 05 Nov 2019 02:29:45 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id s7sm8246972ljo.98.2019.11.05.02.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:29:44 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:29:36 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 37/62] gpio: gpio-sama5d2-piobu: Use new GPIO_LINE_DIRECTION
Message-ID: <4e20b399f7ef56a7df25f97a86b4e89e131083d0.1572945890.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945890.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945890.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-sama5d2-piobu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index 7d718557092e..b04c561f3280 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -119,7 +119,8 @@ static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return (ret == PIOBU_IN) ? 1 : 0;
+	return (ret == PIOBU_IN) ? GPIO_LINE_DIRECTION_IN :
+				   GPIO_LINE_DIRECTION_OUT;
 }
 
 /**
@@ -154,9 +155,9 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
 	/* if pin is input, read value from PDS else read from SOD */
 	int ret = sama5d2_piobu_get_direction(chip, pin);
 
-	if (ret == 1)
+	if (ret == GPIO_LINE_DIRECTION_IN)
 		ret = sama5d2_piobu_read_value(chip, pin, PIOBU_PDS);
-	else if (!ret)
+	else if (ret == GPIO_LINE_DIRECTION_OUT)
 		ret = sama5d2_piobu_read_value(chip, pin, PIOBU_SOD);
 
 	if (ret < 0)
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
