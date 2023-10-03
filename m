Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27D7B6C67
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240423AbjJCOxP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240421AbjJCOwW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:52:22 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1F5EA
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:59 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-406609df1a6so10455855e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344714; x=1696949514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUDbJq7kLr1Ed1gQSQD2nNwqIA0dLWtZ5bH6El/HhcI=;
        b=q5lG3WWGATSDLkLDLwXFTNFVYMLjgpPRWxp8aAxAkTtc5bvTV3SpF0PpCby/KQyMCq
         9sQNir8GdKpa5f7pDCjwbKo6yN9smWEg1/ll0qBIJ8tb4lhso1dkPTGQGbW3PLTg5ILQ
         Z84ic6EBkpWSvdqoQg9Kj3+sWn8T4hEQMpoI11nSa5wuNRlQVMZCwK5E19Ce+9GA13Lh
         54GVT8/H1Yz++gGEwFhDApHzL2q8SxrJkHQG4LpI04ZmG4X1yWY6KOJPpRTIe4dkl70y
         0v20Y3EEM6D4HRazpaXnMRsM9mgJsabWwLDvpGgjilOb4wivBPlGAdcrgLVhPwYFgOyj
         K9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344714; x=1696949514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUDbJq7kLr1Ed1gQSQD2nNwqIA0dLWtZ5bH6El/HhcI=;
        b=CJg1q/otxIaICK01MyjL+hrY6CoozXtw4yNMVO3TWd3TJJxWDSol6FugykGjO7qqWk
         ZmsuSJRhRUP5VPHFWJ9iphj7FNO2c3szG5bDDIVZCSFyj+OFcKjOJVFHMsGS+RbEzTbt
         o5VRUSMh32xypyWyZ6S/CpaqBJxA8GFdNCYNFg6u0dNxFM9wZjQIvFsDhM2rj3z0bjta
         7zIsNmN/Lvr2Fok3PCNaiKAf54YYdC2ZOt6cgwLQaBF/GjNDUBhCoU8AxBnak7Nu/ZHP
         nG/hxBZbVk8pTfRwBRbKu11COGHV+OOYlRtD4AG2zG21W/+/6JcklQAp19oeaP6BvrnL
         s74g==
X-Gm-Message-State: AOJu0YzB5NqemHrCpDVUPTj0NJwSwig01fOOcVo5dvFulgDnEeS3rB6A
        iYwTWkDMou4aXvo/PqJsXLdMYA==
X-Google-Smtp-Source: AGHT+IEiGfGsgzT4CietkBFYLkKgj0HKoQXpqEDUepqy/8ULLhb/4dvd9vMXnAuw8ukLXvcPTcevtg==
X-Received: by 2002:a05:600c:2311:b0:403:9b7:a720 with SMTP id 17-20020a05600c231100b0040309b7a720mr12572356wmo.1.1696344714113;
        Tue, 03 Oct 2023 07:51:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 36/36] treewide: rename pinctrl_gpio_set_config_new()
Date:   Tue,  3 Oct 2023 16:51:14 +0200
Message-Id: <20231003145114.21637-37-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that pinctrl_gpio_set_config() is no longer used, let's drop the
'_new' suffix from its improved variant.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-aspeed.c       | 2 +-
 drivers/gpio/gpiolib.c           | 2 +-
 drivers/pinctrl/core.c           | 6 +++---
 include/linux/pinctrl/consumer.h | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 4c417c8486dd..04c03402db6d 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	else if (param == PIN_CONFIG_BIAS_DISABLE ||
 			param == PIN_CONFIG_BIAS_PULL_DOWN ||
 			param == PIN_CONFIG_DRIVE_STRENGTH)
-		return pinctrl_gpio_set_config_new(chip, offset, config);
+		return pinctrl_gpio_set_config(chip, offset, config);
 	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index d7c23be24904..d9db880593b6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1883,7 +1883,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return pinctrl_gpio_set_config_new(gc, offset, config);
+	return pinctrl_gpio_set_config(gc, offset, config);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 5f40abef5c1e..6d427c22e57b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -889,7 +889,7 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
 
 /**
- * pinctrl_gpio_set_config_new() - Apply config to given GPIO pin
+ * pinctrl_gpio_set_config() - Apply config to given GPIO pin
  * @gc: GPIO chip structure from the GPIO subsystem
  * @offset: hardware offset of the GPIO relative to the controller
  * @config: the configuration to apply to the GPIO
@@ -898,7 +898,7 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
  * they need to call the underlying pin controller to change GPIO config
  * (for example set debounce time).
  */
-int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
+int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config)
 {
 	unsigned long configs[] = { config };
@@ -918,7 +918,7 @@ int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config_new);
+EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index e7d660e98e86..73de70362b98 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -33,7 +33,7 @@ int pinctrl_gpio_direction_input(struct gpio_chip *gc,
 				 unsigned int offset);
 int pinctrl_gpio_direction_output(struct gpio_chip *gc,
 				  unsigned int offset);
-int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
+int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
 
 struct pinctrl * __must_check pinctrl_get(struct device *dev);
@@ -97,7 +97,7 @@ pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 }
 
 static inline int
-pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
+pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
 	return 0;
-- 
2.39.2

