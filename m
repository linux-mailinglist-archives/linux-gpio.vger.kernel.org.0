Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8E1184246
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 09:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgCMIP2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 04:15:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39420 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbgCMIP2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 04:15:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id f10so9495425ljn.6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2020 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ydJJOi+pcw3MQY3fHTdowPZ+B0MJdebI0Q5nb+Q4qg=;
        b=znfy/T5Ng6j474RMykCcvQ9n/LYNRc5PU5oOP5DrWL191lyuNoK6rTyQCdDtT1Y1PW
         TdBlXzlhVwR2ajfPW2sAzS7QI0av41Ysc5qOmKWpOyGpVkSwSxXgW7kz53vM8FEsnxjS
         vcB1g4X3L1aL1mmzyLWasvxq0nJBb3nK30fxpe/sIPsuYURfBf/nXmxxy+HjQUOMoFFt
         PLm+j5Ize4t7JNewXNc+s+1jy1CSrUpBCKylD5A46GQ+lHd/dngPtPBC0h/Ie2bgXUs5
         0pCalBRwdZhK56/ESt+uMQioaAVt9VKAyiFG7FmH8V6ZS/kdfZmM2O1Tl3/Q/TFoa8ix
         5Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ydJJOi+pcw3MQY3fHTdowPZ+B0MJdebI0Q5nb+Q4qg=;
        b=M1a1spnog1fOlovkvTU21nrNepb2kkmjn/PqdQDT0P/hN2fWkTvSuY+WI04jqZK/1o
         cpNdQpGewpJi8qhmh57ljBjy2Nd23LXVFUvnoU+YoUf5gUyeJXJpcXcBJhavXxJeG4RD
         slmn4rCoZBMoytPoo/4QZreu/LQ7cnxfqguluSdZBUXBTYsvXet2yIieTijwLQQ+JRGn
         rFdRpIxRrx7J7Ws8LtrOBZdrP/lwOmYnxkeVnSxhMhaar/iDsh8O/S/bWOpxzJP19Qbv
         2X3d8A+87wFhkyUMd+KuE9shp+gRvN9s6oTnuz4YsE0ur82qwlKl5r6zZ29XV7hdyl1P
         Uglw==
X-Gm-Message-State: ANhLgQ1K/OH6ERRIExGaHzD2uyVhWVLXn/ztGhrD1y2vjZpScMR1cgPQ
        bTydnj4saprAbfH1a0rNnsoqkrTCKiTQkg==
X-Google-Smtp-Source: ADFU+vuA2RtAhXcT6bF5EnvWaNPlutTUP/i/9Noqz+Wh18BbBRg2Pk4CYmTqvB0uRRX1SlIlH598Uw==
X-Received: by 2002:a2e:85cb:: with SMTP id h11mr3647742ljj.55.1584087325691;
        Fri, 13 Mar 2020 01:15:25 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id z5sm3587146lfq.71.2020.03.13.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 01:15:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Move devres calls to devres file
Date:   Fri, 13 Mar 2020 09:15:22 +0100
Message-Id: <20200313081522.35143-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

These two devres functions devm_gpiochip_[add|remove]()
were in the wrong file. They should be in gpiolib-devres.c
not gpiolib.c.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-devres.c | 46 +++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c        | 46 -----------------------------------
 2 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 72b6001c56ef..5c91c4365da1 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -478,3 +478,49 @@ void devm_gpio_free(struct device *dev, unsigned int gpio)
 		&gpio));
 }
 EXPORT_SYMBOL_GPL(devm_gpio_free);
+
+static void devm_gpio_chip_release(struct device *dev, void *res)
+{
+	struct gpio_chip *gc = *(struct gpio_chip **)res;
+
+	gpiochip_remove(gc);
+}
+
+/**
+ * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
+ * @dev: pointer to the device that gpio_chip belongs to.
+ * @gc: the GPIO chip to register
+ * @data: driver-private data associated with this chip
+ *
+ * Context: potentially before irqs will work
+ *
+ * The gpio chip automatically be released when the device is unbound.
+ *
+ * Returns:
+ * A negative errno if the chip can't be registered, such as because the
+ * gc->base is invalid or already associated with a different chip.
+ * Otherwise it returns zero as a success code.
+ */
+int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
+			   void *data)
+{
+	struct gpio_chip **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_gpio_chip_release, sizeof(*ptr),
+			     GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = gpiochip_add_data(gc, data);
+	if (ret < 0) {
+		devres_free(ptr);
+		return ret;
+	}
+
+	*ptr = gc;
+	devres_add(dev, ptr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 02f8b2b81199..00890f38f95f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1838,52 +1838,6 @@ void gpiochip_remove(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
 
-static void devm_gpio_chip_release(struct device *dev, void *res)
-{
-	struct gpio_chip *chip = *(struct gpio_chip **)res;
-
-	gpiochip_remove(chip);
-}
-
-/**
- * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
- * @dev: pointer to the device that gpio_chip belongs to.
- * @chip: the chip to register, with chip->base initialized
- * @data: driver-private data associated with this chip
- *
- * Context: potentially before irqs will work
- *
- * The gpio chip automatically be released when the device is unbound.
- *
- * Returns:
- * A negative errno if the chip can't be registered, such as because the
- * chip->base is invalid or already associated with a different chip.
- * Otherwise it returns zero as a success code.
- */
-int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *chip,
-			   void *data)
-{
-	struct gpio_chip **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_gpio_chip_release, sizeof(*ptr),
-			     GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = gpiochip_add_data(chip, data);
-	if (ret < 0) {
-		devres_free(ptr);
-		return ret;
-	}
-
-	*ptr = chip;
-	devres_add(dev, ptr);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
-
 /**
  * gpiochip_find() - iterator for locating a specific gpio_chip
  * @data: data to pass to match function
-- 
2.24.1

