Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F330AEFB82
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388098AbfKEKhS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:37:18 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41492 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388148AbfKEKhS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:37:18 -0500
Received: by mail-lf1-f65.google.com with SMTP id j14so14707320lfb.8;
        Tue, 05 Nov 2019 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YxCUxQ2AH3iW52PLmjYcbS92SUaB2Uqnrk/wUaP6I30=;
        b=Tys2fINN6uleXfedxziGRoKug1kFeam9wi9MslJBw2SDMdwKyUvgPQ8tOo5HKqZmuy
         8DvYIYalgh/2YDYY49FyndLu0FkrHxoJ6XtA8Sppg8bPRhiGr8zpoNIAKJnz7wnuNJCT
         5kXCscFiOjaLHgXoTi+yZKOpOfuzvZhegi5JevZlR/fpWIRIbRgLEdqOwTbvHnLg+gck
         qIaCroxRFMFZ69mcn1PRHOWLOqV2JT13RvkWPW3yDWslImQYq8lUVhfUI7umtUpG2lK/
         b+W5aPmoHz+UE5RfYGIXsinBdY1EwgmE26skXfFaE16EbLAweIwwgsh74B2WpC/fBL5M
         Zi9A==
X-Gm-Message-State: APjAAAVn9OwC/Q/vuNtIs+qrUIQL4pUL78netBLbA/ipQ248bXYwCbY+
        Mc0Rkt3FggixuXQqsumkT9k=
X-Google-Smtp-Source: APXvYqx0soK/6+YFJvOUfM4wZlhc4IAIKRp28eUSkfFwUnucV6JkAgnyyv+E9I2zDPSIn3+uI5KyXA==
X-Received: by 2002:a19:cc47:: with SMTP id c68mr19812904lfg.95.1572950234631;
        Tue, 05 Nov 2019 02:37:14 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id u11sm8041749ljo.17.2019.11.05.02.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:37:14 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:37:04 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 54/62] gpio: gpio-uniphier: Use new GPIO_LINE_DIRECTION
Message-ID: <189eeb5f43c2cbf3ca37e95410d8f2728b2d03fd.1572945998.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945998.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945998.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-uniphier.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 93cdcc41e9fb..bd203e8fa58e 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -113,7 +113,10 @@ static int uniphier_gpio_offset_read(struct gpio_chip *chip,
 static int uniphier_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	return uniphier_gpio_offset_read(chip, offset, UNIPHIER_GPIO_PORT_DIR);
+	if (uniphier_gpio_offset_read(chip, offset, UNIPHIER_GPIO_PORT_DIR))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int uniphier_gpio_direction_input(struct gpio_chip *chip,
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
