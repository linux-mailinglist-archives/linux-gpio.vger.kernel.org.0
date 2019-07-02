Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 805245D6FE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jul 2019 21:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfGBTkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 15:40:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34454 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfGBTkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 15:40:35 -0400
Received: by mail-lf1-f65.google.com with SMTP id b29so2306073lfq.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jul 2019 12:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82eMZxwOWHVRAy4QkqHiIVsrvrrm4gUfEQ6ASMxsICw=;
        b=MCr5IZ0rUq1B5TKNFO9MkSvECBmHEYoIJNyi3podRvKIzh3AU3AWTZtq05JaS0bNFK
         N/kS2gwX4xoaEf+2qqGoYrg2UgoNEZwcCeMod91Kq6yUzcbbDwp4ekgnluSEq2x4yVJ+
         265Sb0TbSx+dAqMW7ux628lcOWb3XmbY2+RKHmJf79jZ8lhG9DHrBrrC58h3YZbnMNiC
         9RmxUSzRIfyf3aYeRY65PMWMURmynG803JuEAFedrc4sKU7lXz/WuMHLnUZ3X+7rvJQC
         Jh+P27YVl9XOuyNVJxkS39QA75Jdnhdpr9hlgU6x2eC6SFsEV9XdPeB88ybZttqA0/EX
         n5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82eMZxwOWHVRAy4QkqHiIVsrvrrm4gUfEQ6ASMxsICw=;
        b=Dew38Qmuzi0E1fLunZSn/S2r1D3BsVEVibLSDEhMv9HONHGVmYer9/28MGqNTiHQ7I
         3ONZv+7HIo6AEk+p4qI4H2ht3s6UXP6OSSak9m/gXKP+9wfMz26YhKB0qqL6lQYkpD2j
         mSK/Onb4jhvXfcf1EkXeXDZGKlU1JLimPRGllPLUH6Gj4DcVm8mtgJ0Zip22Mq/mOZBF
         QrBjEMJl443IFFvF+JlvU66/JLfCokzg1QpE5FgXaimwJ5dZcTzQb1a7HBfbiiVHK4j2
         W4MiXQBsZze8/hsGv1dhm34emEsCXG0AX8hNfbpjwome4fS27Cjkc4ysCV2bKmLWTqPV
         xWUQ==
X-Gm-Message-State: APjAAAWnej8nEYj2h/KK5qCwniaqIqWGd3Uk/p63VFgLsChGHz5ut9JS
        svgUAvuFPI+aHg8Vf8nT5EoBiQ==
X-Google-Smtp-Source: APXvYqw+ZyNmDZ9e+HcPCT2h1vg2MdxUB7HsMfK8q8L1u+flQ5dL5cTL8K58vcRLlmL4jK6XiDyGLQ==
X-Received: by 2002:ac2:42c7:: with SMTP id n7mr9960246lfl.65.1562096433408;
        Tue, 02 Jul 2019 12:40:33 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
        by smtp.gmail.com with ESMTPSA id z83sm3970798ljb.73.2019.07.02.12.40.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 12:40:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH] gpio/spi: Fix spi-gpio regression on active high CS
Date:   Tue,  2 Jul 2019 21:39:59 +0200
Message-Id: <20190702193959.11150-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I ran into an intriguing bug caused by
commit ""spi: gpio: Don't request CS GPIO in DT use-case"
affecting all SPI GPIO devices with an active high
chip select line.

The commit switches the CS gpio handling over to the GPIO
core, which will parse and handle "cs-gpios" from the OF
node without even calling down to the driver to get the
job done.

However the GPIO core handles the standard bindings in
Documentation/devicetree/bindings/spi/spi-controller.yaml
that specifies that active high CS needs to be specified
using "spi-cs-high" in the DT node.

The code in drivers/spi/spi-gpio.c never respected this
and never tried to inspect subnodes to see if they contained
"spi-cs-high" like the gpiolib OF quirks does. Instead the
only way to get an active high CS was to tag it in the
device tree using the flags cell such as
cs-gpios = <&gpio 4 GPIO_ACTIVE_HIGH>;

This alters the quirks to not inspect the subnodes of SPI
masters on "spi-gpio" for the standard attribute "spi-cs-high",
making old device trees work as expected.

This semantic is a bit ambigous, but just allowing the
flags on the GPIO descriptor to modify polarity is what
the kernel at large mostly uses so let's encourage that.

Fixes: 249e2632dcd0 ("spi: gpio: Don't request CS GPIO in DT use-case")
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Mark: I will apply this to the GPIO tree, so I think it is
safe for you to drop my revert of Andrey's patch once this
hits mainline. I will try to expediate it, I feel a bit
responsible.
---
 drivers/gpio/gpiolib-of.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index aec7bd86ae7e..9c9b965d7d6d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -118,8 +118,15 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	 * Legacy handling of SPI active high chip select. If we have a
 	 * property named "cs-gpios" we need to inspect the child node
 	 * to determine if the flags should have inverted semantics.
+	 *
+	 * This does not apply to an SPI device named "spi-gpio", because
+	 * these have traditionally obtained their own GPIOs by parsing
+	 * the device tree directly and did not respect any "spi-cs-high"
+	 * property on the SPI bus children.
 	 */
-	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
+	if (IS_ENABLED(CONFIG_SPI_MASTER) &&
+	    !strcmp(propname, "cs-gpios") &&
+	    !of_device_is_compatible(np, "spi-gpio") &&
 	    of_property_read_bool(np, "cs-gpios")) {
 		struct device_node *child;
 		u32 cs;
-- 
2.21.0

