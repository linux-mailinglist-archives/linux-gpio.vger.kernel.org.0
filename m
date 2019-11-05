Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB10EFA80
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730718AbfKEKKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:10:14 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43729 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfKEKKO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:10:14 -0500
Received: by mail-lj1-f193.google.com with SMTP id y23so10197841ljh.10;
        Tue, 05 Nov 2019 02:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fv802MXiIEgtNhANZsRq80me8+LRZqlIZDAPkOIwK5k=;
        b=YkwIKRXq4+NhwPEPZX3L9Tt4hzsXNxOOwNecndZ6BfLmrxjpeJ/X82nXb52y0HpOJF
         7omNXLk5bzgJGXozSd2R6ExpvH5ZKHcfxpTFmD3HLHeivpD2EcY8WD2+Q546ShSs/+0H
         QLurrdXlJygG+dqzxbIa8ciZzEAwOyfivijquFbD0BHU3NFRQY8Ax/3+YJI1xq03Blg/
         X4ANHH1rrpoehN9p+sR3rp44owJpeWQZIf5UTF5nOOvdK/8gNRZeO5OiId4FzFAlMopY
         OUAsAUJdWQbv4u9BB2rippl9fORYvO8kwLD/zLXGKeA/4sjLFkHWg5wWk/m9g4QeFVB4
         f5dg==
X-Gm-Message-State: APjAAAVZ0TRzQ2CdBBs1sAhckvznUwQuVOPXST//jw9bKlMTyw1ZOvMG
        +qspbahkrb+VsMALEv4H4iY=
X-Google-Smtp-Source: APXvYqypJ4ohgkwFmoW2+C/VJbnu0sp5hklHbobamPpx5UssvHb3aczQtzeBUp6oZQZptNHV1EHXyw==
X-Received: by 2002:a2e:2c10:: with SMTP id s16mr23113324ljs.160.1572948611859;
        Tue, 05 Nov 2019 02:10:11 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u11sm8013448ljo.17.2019.11.05.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:10:11 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:09:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/62] gpio: gpio-104-dio-48e: Use new GPIO_LINE_DIRECTION
Message-ID: <d25edcc3a5d912be9d7c3a927bad6baf34a1331e.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945605.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-104-dio-48e.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index a44fa8af5b0d..400c09b905f8 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -59,7 +59,10 @@ static int dio48e_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	const unsigned port = offset / 8;
 	const unsigned mask = BIT(offset % 8);
 
-	return !!(dio48egpio->io_state[port] & mask);
+	if (dio48egpio->io_state[port] & mask)
+		return  GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int dio48e_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
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
