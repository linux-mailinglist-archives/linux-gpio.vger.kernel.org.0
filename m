Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAA6BEFB55
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:33:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388791AbfKEKcs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:32:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41150 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388197AbfKEKc3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:32:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id m9so21152707ljh.8;
        Tue, 05 Nov 2019 02:32:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SWK7CmtDOwfIKHnYFex+RYaQFNRKO4DynQcps+PBeiI=;
        b=VlfWhKmurDjB713J372aYN1n+G0s7jc7UBAPEI66/HLWoR40H+jlorYkG1Lgx0VhKQ
         WDM7pe6lakjC5Hv9Ovmpbs995hduIPEOzoDYfT+Vjg9VQjs5x/NBUIa33Wq7V+q+ZGSi
         yJvHPWBL8uBuebyOQML3YI8H4VR7gM1RWQzjExMcwEQjFfFcRGvwdf5aIXdlMm5RKZTf
         nCrPryZ+xwQSyFu4qaSCMbX7pAZEaU0GVk0XOj+fK8ijlLnEVNGfeT3v2VWvsBGtO/0B
         FE4L/bUdVGtC7m2fJ93flhWM9zBwCeHYU067Q0xlipsvViNXbytW+GQKLo+V+z1U/E9M
         QD/A==
X-Gm-Message-State: APjAAAUWwZBQqzAFe+SnadIkVRgzBHw50gHML/EqriOGTpADwgfRGxee
        CzEOf0Witln6xilFq0jSktg=
X-Google-Smtp-Source: APXvYqxNFy+PODpiOaCWYsmMSRxOPQyAQX+ysX3uJq4o7gYTBHKqILDOlOjn3voEwwi1/VoXJvQFRg==
X-Received: by 2002:a2e:2c19:: with SMTP id s25mr6898561ljs.26.1572949947281;
        Tue, 05 Nov 2019 02:32:27 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 9sm8154722ljf.21.2019.11.05.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:32:26 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:32:17 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 43/62] gpio: gpio-tegra186: Use new GPIO_LINE_DIRECTION
Message-ID: <b0c39b6da0969e3fe860b939d161d481d843e55a.1572945959.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945959.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945959.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-tegra186.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index a9058fda187e..e0598d58b81b 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -110,9 +110,9 @@ static int tegra186_gpio_get_direction(struct gpio_chip *chip,
 
 	value = readl(base + TEGRA186_GPIO_ENABLE_CONFIG);
 	if (value & TEGRA186_GPIO_ENABLE_CONFIG_OUT)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int tegra186_gpio_direction_input(struct gpio_chip *chip,
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
