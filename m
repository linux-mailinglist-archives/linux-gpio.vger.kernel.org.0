Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A47EFB1F
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbfKEK2s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:28:48 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45175 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730633AbfKEK2s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:28:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id n21so7555363ljg.12;
        Tue, 05 Nov 2019 02:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8C/i1Bz93rFLif9JRdBLqc1lgGk+Jj//nwWjEvEZ0Gs=;
        b=S4y20MGAsIldrYEuxTI2BTAyYIjvk8au/epA+Uj/cNHETri85pVfEx04ggLLyxxV7W
         IDLcB/UQqbyrGVDhgm0JqDKeGA0Z/jnJZkJUoJ9RE/ToHrAt+784UZMj9M95eSLFI4Il
         FVAfRDJNPmPWpkr9tvbK3/jae7W1RI2GwkHe64WCK+wkmPfl0xf/QbikGdDoNMdYyJIW
         bkNw1phhfhfRkCxyuYySIeZ8ACeqKL5udGZCpbL5EBjmgDFGJtfjQZ81OQeyQqnsAlTM
         fkMDPASwPR9eEMv4AyEX4v1a7CuRbumzMo9/6Agu7IK6Ev6HZ1pOwzxnwheHqBhjK3wQ
         r+YQ==
X-Gm-Message-State: APjAAAUSzUiwOj/wQcSfCg4JX0PMsDcvG39E0uocsZvsz/TF1ImKGt6i
        HEghOQueEI38Rwh8DohPPfU=
X-Google-Smtp-Source: APXvYqxwcvj0cepLwQF9EuSzd7CrvTwSjy/SfoUGngFRGPcgCkux7Rk+SrJXZ8114KtAmv8NFKh9jA==
X-Received: by 2002:a05:651c:313:: with SMTP id a19mr22603998ljp.199.1572949725913;
        Tue, 05 Nov 2019 02:28:45 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id s23sm8132349ljm.20.2019.11.05.02.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:28:45 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:28:36 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 35/62] gpio: gpio-rcar: Use new GPIO_LINE_DIRECTION
Message-ID: <05e85f2812eb4e6b92cdd9054ecba675d206db66.1572945879.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945879.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572945879.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-rcar.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 187984d26f47..d7e6e68c25af 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -279,7 +279,10 @@ static int gpio_rcar_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 
-	return !(gpio_rcar_read(p, INOUTSEL) & BIT(offset));
+	if (gpio_rcar_read(p, INOUTSEL) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int gpio_rcar_direction_input(struct gpio_chip *chip, unsigned offset)
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
