Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3D15EFB6E
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388224AbfKEKe6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:34:58 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35756 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388093AbfKEKe5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:34:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id r7so12509823ljg.2;
        Tue, 05 Nov 2019 02:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FrFi5HfnouG1RBd+RMzEOjpVqG4ERoAlDRRnVq5Xc0c=;
        b=WJ1v1X1nVPrmsLPZti1X+5wkX5I97ZnHmyfYIaKr4gXuSayj5rK1NP38xa3HpKBpT9
         H5/aU1qIOVQIPbebYf/xVA0An39/9h1BMnirobxx8hEhDvLAZnqgbGGoVF5jRDE0ZIhy
         dXQH8x75PD6GsCnybiTuZRH2C8i/ISd7Myar6MWjZwCuCHjRGM4p0+z08nbaMY8Mn8yL
         S2W52Kq2lbqAgrTugFeLgdpAwGr75oYwKPe6Kb5QVR15kK2bae/w4jRDRYforNbNqb2Y
         ra/ug+9GAdTOxHAWoU88i9tanjvhnrXf36+wCROTfjNKvqrTyDOh6CPOH3q2odwkQsub
         ZagA==
X-Gm-Message-State: APjAAAVpAXP7ImtUuDIDS8jo2K1Ef2EgU4inPvEgz6Cgr5ueZxI7CFgc
        7MNuwJqR9jMRJ0GWarR6wg14XioQx3c=
X-Google-Smtp-Source: APXvYqxb/BjZPXkRe0iWbxwxaUpe4J+HrvFUvxIRGnBdg6X8IwtEN1EoYd25TOzwm66Gai5MUZsBZg==
X-Received: by 2002:a2e:9e45:: with SMTP id g5mr5407554ljk.58.1572950095677;
        Tue, 05 Nov 2019 02:34:55 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id q15sm7790852lfb.84.2019.11.05.02.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:34:55 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:34:50 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 50/62] gpio: gpio-tqmx86: Use new GPIO_LINE_DIRECTION
Message-ID: <b9d94bb3ddac30baa6052fac1a40b3f1075727fb.1572945986.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945986.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945986.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-tqmx86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index a3109bcaa0ac..5022e0ad0fae 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -101,7 +101,10 @@ static int tqmx86_gpio_direction_output(struct gpio_chip *chip,
 static int tqmx86_gpio_get_direction(struct gpio_chip *chip,
 				     unsigned int offset)
 {
-	return !!(TQMX86_DIR_INPUT_MASK & BIT(offset));
+	if (TQMX86_DIR_INPUT_MASK & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static void tqmx86_gpio_irq_mask(struct irq_data *data)
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
