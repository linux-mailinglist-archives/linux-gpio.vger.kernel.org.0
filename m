Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08799EFAA5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387945AbfKEKPj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:15:39 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34878 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387905AbfKEKPj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:15:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id y6so14678638lfj.2;
        Tue, 05 Nov 2019 02:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=walC2Enl01HKrXEGzHnnixoZYsP8+S2rbh+ZU/Vs3mg=;
        b=ejAOWQDgs3YeXLWANSztHjP2ESTnWBQ7hQMtfdUxuKWb/IZRnf4Q0PfLWw0SMj9EMw
         nAzD3uSf0pynA7B1q6E26OVo670ZiUjWYGBGWya3jfLLB4qFHEvtvhRq/jq1tB7HHsu4
         tgLYkG5ni3PJ2joOnfy+HsEtRc0ffy4PifHUXSwYEh1OnUU2YZDSV0W+oehThwogoQmx
         2bjIwylioN5qykf8SKlFiebXUzYGBDQ86ad/ofPiFKzfocllfad0ldJJdJ/INO8X5Kvz
         InNS4ZHVtvU8XHfrabLdiBM/2bC2zuXlbUEMkyxFrcWUc56hqhDno75aBx2k9HwVFxGf
         q0vA==
X-Gm-Message-State: APjAAAU1L6H8JKRGYdSCuvBvF4ziCdc5RWR1vmykCHQ2lMtphwKQocx7
        019CdO3Stux9kPdnXQgzLPo=
X-Google-Smtp-Source: APXvYqyXM8acSR/tShaeFs4N8qp3yrTd/qVQVvDV/xZ018yJxCU0p0BQzLkEXzCSxWk+svsCsw7RwA==
X-Received: by 2002:ac2:4898:: with SMTP id x24mr5781603lfc.63.1572948936753;
        Tue, 05 Nov 2019 02:15:36 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id j23sm7821917lji.41.2019.11.05.02.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:15:36 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:15:27 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/62] gpio: gpio-exar: Use new GPIO_LINE_DIRECTION
Message-ID: <5fc91797e7eeeb018bd65574063538abb5f4c8be.1572945749.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945749.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945749.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-exar.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index fae327d5b06e..da1ef0b1c291 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -77,7 +77,10 @@ static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
 		EXAR_OFFSET_MPIOSEL_HI : EXAR_OFFSET_MPIOSEL_LO;
 	unsigned int bit  = (offset + exar_gpio->first_pin) % 8;
 
-	return !!(exar_get(chip, addr) & BIT(bit));
+	if (exar_get(chip, addr) & BIT(bit))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
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
