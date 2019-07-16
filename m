Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0336B6B098
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 22:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388615AbfGPUq6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 16:46:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40282 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbfGPUq6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 16:46:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id m8so21313289lji.7
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jul 2019 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VDtv/K1StBArURVJJzLaJem8yNVgXpi8Ipr2vGaPzvo=;
        b=hpsI6btjemMsbAKAPbm50uTJ1RxmTedQv8WlK+XIZLT/5npg9OHRc4lYkwZmvWGKWP
         cmoYfAtxqOt5dYym4UC1nd+efKjyoYJgKqQKpeP4ZiPv4fL4t8kE6fIZsOaV4BwQjn0V
         ivJWqTqw+u2bz8FTt+q/TzXm4h1dHnE4HiZhD+HSBRCKUlUreODQxske1KrWqlp/CUvh
         joft6PDj/PAFzBJa9UpzqwNVB751E1tcglAo0bH7N0x0Eo9eGiDTz6rjWrBd8/MzIjpR
         gqFVOeHwx+X21HEjne1TGfCwoNaPY9qb/zB7w9N04zz2+4gWTFZXtkZOjrkJUmUTc1cP
         cb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VDtv/K1StBArURVJJzLaJem8yNVgXpi8Ipr2vGaPzvo=;
        b=CHQouuRx15T8NSQzwKdQ0+yl8QENCURlOZqTW58tYkS9LAXZkv6oXwiVhvbX6DgdbE
         wrx/lMzn8pH5YTRCbdn/wyyI3MMAQanB2NPBpQMw3Rem3YwogMxoMc4RQRRr44Eb9aAT
         jCwKEekk4w+GBt7vbqqt2ZsiK4CahplrL0eaFMaPzJUpHNe3rWo/hQ/rUoVC69DOKAh5
         ZidNzTVnCK0SUl9OW7tZGpa6lER667xwzxODYLMDT4SH4rthdv1duI+RvSUbe/GN9oHK
         21jWoqi1dxrVE+tHtSwAKmxRMnEwreyVavsu3GNRI9Ek5JZqWwv3bDUO/E/5P/lP6Tv2
         jH1g==
X-Gm-Message-State: APjAAAXEDH0tN9IL9IOvavRJ04+RwKg9wukm1T/LBcPbxdCpUCBMiYnc
        TDwF8ArOD/dhl/hBZs4RkdWpmU7Wk1E=
X-Google-Smtp-Source: APXvYqzzcvFxahcEMff8Eo+XDI5IN29FlKyYZM6gdWhl+mmbb0tBUgKplVIbAMFnXPqhK+kx5R6eXw==
X-Received: by 2002:a2e:5b0f:: with SMTP id p15mr18095389ljb.82.1563310016005;
        Tue, 16 Jul 2019 13:46:56 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id z22sm3998540ljz.20.2019.07.16.13.46.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 13:46:54 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH] spi: gpio: Add SPI_MASTER_GPIO_SS flag
Date:   Tue, 16 Jul 2019 22:46:51 +0200
Message-Id: <20190716204651.7743-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The GPIO SPI master has some code in its local CS
callback to set the initial sck GPIO value. This was
lost in the commit converting it to use SPI core
GPIO handling as this callback isn't called if the
internal GPIO handling is active.

Add the special SPI_MASTER_GPIO_SS to ascertain it
gets called anyway so we get the initial SCK setting
right. There is some platform provided GPIO handling
there as well but this will be skipped as the cs_gpios
will be NULL.

My test targets seem not to care about the initial
SCK value so I am uncertain if this is a regression,
but to preserve the previous semantic we better do
this.

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Fixes: 249e2632dcd0 ("spi: gpio: Don't request CS GPIO in DT use-case")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/spi/spi-gpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index eca9d52ecf65..9eb82150666e 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -410,6 +410,12 @@ static int spi_gpio_probe(struct platform_device *pdev)
 
 	bb = &spi_gpio->bitbang;
 	bb->master = master;
+	/*
+	 * There is some additional business, apart from driving the CS GPIO
+	 * line, that we need to do on selection. This makes the local
+	 * callback for chipselect always get called.
+	 */
+	master->flags |= SPI_MASTER_GPIO_SS;
 	bb->chipselect = spi_gpio_chipselect;
 	bb->set_line_direction = spi_gpio_set_direction;
 
-- 
2.21.0

