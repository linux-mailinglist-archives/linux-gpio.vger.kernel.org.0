Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29FABFAC30
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 09:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfKMIoH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 03:44:07 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44149 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfKMIoH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 03:44:07 -0500
Received: by mail-lf1-f67.google.com with SMTP id z188so1216595lfa.11;
        Wed, 13 Nov 2019 00:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=pk2ACtTMGZnn9qrghFL91NzkenrOmZ1SxROTK/TzMYU=;
        b=Y4O6dxdihEi/BcjNK2HUEp/Kk2ZpuJRo5tqxHxpaoeCNaLfUgKVlai3h4Hvy5KGo7c
         1mXnunAItNHkp3zD2KHtYK9Gwovkhs+g3zNE+6xgBB2z4Ei/14QCWtzSNfYKgy2PaAo5
         6iGsKcu4LBOBaIq7bQ3m41WReY9uZrFelAKD9p3xp/aqoyvUP1KOTHWnaaupUWFBM+jF
         Lce9y7usbJQH3eNrUvGZPIaf/BEUjaPVRJLf9cu2uAmJ99DI2JVaPTNiQ9uigwY3j9w7
         xGrG64xnJxyO1Ktd/LzM7Dj+TjI3HeLs2AVrLUbpCZSgbsi27rkx4PRkBk7M6EQkjU4G
         7WkA==
X-Gm-Message-State: APjAAAVvIBzcnojSww/8C+RhLGG9u5j+x74HjqE5vaqp2olSNu+iGDXK
        j7weVSF4Way5yDsrdDS9Tnw=
X-Google-Smtp-Source: APXvYqwmjxoqsEszgveYdnVc7I9g0Ls7istQIQ05Vi+RPhw8VDf/BKPtzPM7yuRfLEHUv26dTX08Cw==
X-Received: by 2002:ac2:4a8a:: with SMTP id l10mr1744553lfp.185.1573634644858;
        Wed, 13 Nov 2019 00:44:04 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id i22sm533940ljg.94.2019.11.13.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 00:44:04 -0800 (PST)
Date:   Wed, 13 Nov 2019 10:43:52 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: mmio: remove untrue leftover comment
Message-ID: <20191113084352.GA25535@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The comment should have been removed when new GPIO direction
definitions were taken in use as the function logic was changed. It
is now perfectly valid and Ok to hit the return from the bottom of
the direction getting function.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Sorry guys. Just noticed that I should've removed this comment in
original patch series.

 drivers/gpio/gpio-mmio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index cd07c948649f..f729e3e9e983 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -386,7 +386,6 @@ static int bgpio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 		if (!(gc->read_reg(gc->reg_dir_in) & bgpio_line2mask(gc, gpio)))
 			return GPIO_LINE_DIRECTION_OUT;
 
-	/* This should not happen */
 	return GPIO_LINE_DIRECTION_IN;
 }
 

base-commit: 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c
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
