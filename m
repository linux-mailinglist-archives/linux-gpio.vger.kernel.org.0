Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDEBEFB8A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 11:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388803AbfKEKiO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 05:38:14 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42057 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388374AbfKEKiO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2019 05:38:14 -0500
Received: by mail-lf1-f67.google.com with SMTP id z12so14713264lfj.9;
        Tue, 05 Nov 2019 02:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nJ6ANRG4pbR4+HqyrGeSzszKl3XTe6lJI+o24N9wGWw=;
        b=L0GNnq2pnNskVx6OlnDBaHGIAYfOY1oNMFEIGloAASLr5mfgNj3j8m40JpGdYdZRbw
         6TnfVR9Tt2CDGzB64y/GDucPJj74wKV6F0H7ThQ+UKQICCQrhgCrdBqWUTcJW0nk0xjO
         bVnAoV2LinSYalgpXosqreYnFHQ7zvuVoCrOk+0h2cOzEN/f9uhx7p3kATE8w4PZr0AL
         i+uQuvWF45/ktZ15z9oE4V3hMxRz6MqVgJygCJOLT7QuMKrdaL8AsUtBCcddT0ec1pqZ
         MW7UuRGCA1hGhZL6vZcSCIUGpfDw3LcEWFspx+Xx4gDRZAWLPGZnyWenOIAChe7x8Us4
         P5Aw==
X-Gm-Message-State: APjAAAWJIS0HzyR/ZGmKjApcH9FOsdZSv+DgAsV1PUhrie+pi/KjdCkO
        h47IacFaCINpkKGh2d54PDM=
X-Google-Smtp-Source: APXvYqwbSd/8oCj5H04CwFUezNEsbtyOfEzGpkX8QydNUVnTkCGjm6l9UirlKXzmgj6PeRg5s4ZHjA==
X-Received: by 2002:a19:651b:: with SMTP id z27mr19939447lfb.117.1572950291758;
        Tue, 05 Nov 2019 02:38:11 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f5sm7614386ljn.24.2019.11.05.02.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 02:38:11 -0800 (PST)
Date:   Tue, 5 Nov 2019 12:38:02 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 56/62] gpio: gpio-ws16c48: Use new GPIO_LINE_DIRECTION
Message-ID: <d6282dfe2329e558fb704e5e48ba49777a784522.1572946002.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572946002.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572946002.git.matti.vaittinen@fi.rohmeurope.com>
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
 drivers/gpio/gpio-ws16c48.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ws16c48.c b/drivers/gpio/gpio-ws16c48.c
index e0ef66b6a237..fe456bea81f6 100644
--- a/drivers/gpio/gpio-ws16c48.c
+++ b/drivers/gpio/gpio-ws16c48.c
@@ -56,7 +56,10 @@ static int ws16c48_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	const unsigned port = offset / 8;
 	const unsigned mask = BIT(offset % 8);
 
-	return !!(ws16c48gpio->io_state[port] & mask);
+	if (ws16c48gpio->io_state[port] & mask)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int ws16c48_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
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
