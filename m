Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8ED1EFB57
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388197AbfKEKcz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:32:55 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46124 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388266AbfKEKcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:32:55 -0500
Received: by mail-lj1-f193.google.com with SMTP id e9so7889068ljp.13;
        Tue, 05 Nov 2019 02:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VO1f9hDw/tgKeWcbAynqsTffjXVteVhWCkWyZdg7Deo=;
        b=CaRq/9gm/O1YJFbgsBNHNmpCdnZZyL7pyhupEsrGeRZjVwuDcsOxmTLSt/QEOKiK90
         wjW7pewnrlXhrRWHOCEemTxltKqgwlq6ftDjhynfk8NgmIZcWr0mFyPCQu8ayQ/MuLQC
         RI0a7Mp92k2kJq+FmbTj0mjCupMrfKe2/dIsT7EmBzyTw99Pjp4mpIqscve0Pvvq8Akn
         w6yTnY+xXVApP1oh/HRekNEEJYpwG2DoG09lNLZSrSeaI4PEJyOWhFUy+ZKQ5TVXzoh7
         T0T0ROrVDOr76IGPuaxgsLqBNCMbOSHduF64qnsFBdeH7Mjeuc6PFw9yx+F4I0eoJrmJ
         68aA==
X-Gm-Message-State: APjAAAW7TsXF4b+4opDbl0o4hT2Z4JOMy/hA7Ug/ATGbX4UyuHM+M3E/
        BmODHiIRhbr1Bx0sAgBSX/EZMznVZMo=
X-Google-Smtp-Source: APXvYqw8pB3z6lXTqoG1F0oOtmA14+Qqmw/7gl1KIZZx+iWX9YaqyeNnaoAg9A+lh7XYr3iBnTQKpg==
X-Received: by 2002:a2e:a418:: with SMTP id p24mr9462747ljn.112.1572949972861;
        Tue, 05 Nov 2019 02:32:52 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y20sm14045090ljd.99.2019.11.05.02.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:32:52 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:32:43 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 44/62] gpio: gpio-tegra: Use new GPIO_LINE_DIRECTION
Message-ID: <2bbc8e8f3b308ab41e9c3e923d92f1565eb7396f.1572945965.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945965.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945965.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-tegra.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 8a01d3694b28..6fdfe4c5303e 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -215,7 +215,10 @@ static int tegra_gpio_get_direction(struct gpio_chip *chip,
 
 	oe = tegra_gpio_readl(tgi, GPIO_OE(tgi, offset));
 
-	return !(oe & pin_mask);
+	if (oe & pin_mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
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
