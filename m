Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6379195FF6
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 15:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfHTNZy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 09:25:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42596 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728248AbfHTNZy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 09:25:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id l14so5104869ljj.9
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 06:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIp/xscKrOpc0mHF9aIZK3SGm0WN9133iiFhSpcLQEY=;
        b=nnYptNI1F3EgmzxHVNTZdcrOBJMH8nzAqjNQer/Kk63WeDakUq4CllNXMXssIVY6k5
         tMab4Ef/se+k8jSk445bZUECrpPABVhhS5r1mZ9j3h7cYA48BoF+FY1OaAFI7BuHED5A
         W0aMQ4G2ZT9zSTUjm1NsAq7fZj8Zb1LKsGSvW4zJR64rvfqx0eBcZu4YtVIqyfURzLJ5
         QY2WvkXjpjua35i7qmvIzHblENfYyPnKKOhMekp7ow1cNfJMPG/Xjim9v31ka0T9AfXV
         mVx60/WJfhvtkvLRUxS6N6tot9x2yYD4A8CSMVRlqGIEBVs1EnXdbAChpKE2k3WlvaYg
         783w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIp/xscKrOpc0mHF9aIZK3SGm0WN9133iiFhSpcLQEY=;
        b=uTvg63d2h/TA2NgUzSs8KywHZmbvlFoWowqo7/ZGfouq8YI0zgwnX/U/83Vc9JxqzB
         1FlAvpX3AUbTEEi+WOLXlFyPUjcrSBSYbO0VUCoAmGdHD1wm6rJB5YU140x6WAHDy5n2
         WAZmZOtrl7iOy8Zf5nfbNiwm6lPEQ6uSQf2k43kTz0JVHbIXrU3cWDvxr9bSQHEhDnsY
         7W1qZLNxRAptGHdQ1BI34J9gyP4glCQBhmpgsSLrp+KdrMQPrVUWI8SJQLAZEGtaczkR
         ovkY+zBo6vFFTd+IxSxbpz6jiTTnLUvKhr/uKXZkMJzYGVuWUg+A/xXCkPbABWfDesDm
         g6Lw==
X-Gm-Message-State: APjAAAV/obCIOzsmUtFXrWSZwXesb6zSHc6u5dWc190mbTwEozwXjkkL
        Os/NmaCJ93+9Q9Vx3nUhg0ecie7VgBo=
X-Google-Smtp-Source: APXvYqxFi2RBuVm58UGqYRMTudio7q4dOLkYxDKiiMpX/3ezLRg2XNg9GO1sklwnoS/W+s6hr5YvSg==
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr1917372ljk.90.1566307552108;
        Tue, 20 Aug 2019 06:25:52 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id v16sm2836898lje.58.2019.08.20.06.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 06:25:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pinctrl: rza2: Include the appropriate headers
Date:   Tue, 20 Aug 2019 15:25:48 +0200
Message-Id: <20190820132548.4012-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver is implementing a GPIO driver so include
<linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
When testing it turns out it also relies on implicit
inclusion of <linux/io.h> (readw etc) so make sure to
include that as well.

The GPIOF_* flags used in the driver is not for driver use,
these are consumer flags. Replace these with literal 0/1.

Cc: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Remove the use of GPIOF_* consumer flags in the driver.

Geert: assuming you will pick this up if you're happy
with it.
---
 drivers/pinctrl/pinctrl-rza2.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
index 5b951c7422cc..ecb5d7ee5078 100644
--- a/drivers/pinctrl/pinctrl-rza2.c
+++ b/drivers/pinctrl/pinctrl-rza2.c
@@ -11,7 +11,8 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/pinmux.h>
@@ -115,7 +116,7 @@ static void rza2_pin_to_gpio(void __iomem *pfc_base, unsigned int offset,
 	mask16 = RZA2_PDR_MASK << (pin * 2);
 	reg16 &= ~mask16;
 
-	if (dir == GPIOF_DIR_IN)
+	if (dir)
 		reg16 |= RZA2_PDR_INPUT << (pin * 2);	/* pin as input */
 	else
 		reg16 |= RZA2_PDR_OUTPUT << (pin * 2);	/* pin as output */
@@ -134,10 +135,10 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
 	reg16 = (reg16 >> (pin * 2)) & RZA2_PDR_MASK;
 
 	if (reg16 == RZA2_PDR_OUTPUT)
-		return GPIOF_DIR_OUT;
+		return 0;
 
 	if (reg16 == RZA2_PDR_INPUT)
-		return GPIOF_DIR_IN;
+		return 1;
 
 	/*
 	 * This GPIO controller has a default Hi-Z state that is not input or
@@ -145,7 +146,7 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
 	 */
 	rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_IN);
 
-	return GPIOF_DIR_IN;
+	return 1;
 }
 
 static int rza2_chip_direction_input(struct gpio_chip *chip,
@@ -153,7 +154,7 @@ static int rza2_chip_direction_input(struct gpio_chip *chip,
 {
 	struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
 
-	rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_IN);
+	rza2_pin_to_gpio(priv->base, offset, 1);
 
 	return 0;
 }
@@ -191,7 +192,7 @@ static int rza2_chip_direction_output(struct gpio_chip *chip,
 	struct rza2_pinctrl_priv *priv = gpiochip_get_data(chip);
 
 	rza2_chip_set(chip, offset, val);
-	rza2_pin_to_gpio(priv->base, offset, GPIOF_DIR_OUT);
+	rza2_pin_to_gpio(priv->base, offset, 0);
 
 	return 0;
 }
-- 
2.21.0

