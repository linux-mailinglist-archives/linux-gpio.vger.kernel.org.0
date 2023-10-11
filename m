Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259927C53B1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346313AbjJKMWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346945AbjJKMWS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:22:18 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3EF121
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:12 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50435a9f800so8832562e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026185; x=1697630985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quON8EwoIJw5m45II3ErPq5D8iS+63rbVlCGeP/qYpc=;
        b=qa0aUeUQCZnfWWGQBCNYaqjyEMh62PLFtsb6eTxhESsOZGl9sL+/Ttxb+SbNhIJ88B
         RB6I5emIPaDNAMRxV+hxJOR/dEyW/ZwJeIzm1XOO+QYGA7ICxRCnxxG/rwmMntD0BFuh
         1p4Ps8aY/IcQaK6MakzIrl61akasMmqor+YEt1tW+zopyjFt95JSeVqCMywc+w/6QlWf
         CMTtev6vD7AnU+N018k12ZbPJt3pE1SzZ6SsYVXjZOkZPw4OkWHPH0oxyhFV9nEs0YGQ
         s/eV5Ekv7toxQkapaXy+OOeU8rWOV+TyRns7OrUu6f0VcPZ610rIQBSA4omI7YfJyL4Q
         UADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026185; x=1697630985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quON8EwoIJw5m45II3ErPq5D8iS+63rbVlCGeP/qYpc=;
        b=PyTqFYkOFNFtTssY0YbDjtHNwMDsyJwWy7AXd6CkdzKjh+r0RpqFYCc1tx8fdsolFc
         /6g1+1UoBPvnqpn93KI5si0a/o+mYPyWpJPlkhOuvCjvg0yLTaxFM41+AL98fyR7XKdd
         ouxI3V7SWX31jMF4odsPKyziHrkvQu2XPZgsNd4dlA0Y4xDYkMU93vkP8IvzwC+HQVnb
         FXwZ8BYe2p+w6LToN9BVr3kFAo0iAdsqvKo+TavV6DGm3Oyz/OWYtItN3daKyvDHm0g5
         1teeXjHyHwtssltllu+M1xygauLVbmCvEzo3JN/55gGAfPhzhh5Lzj8GLRfdIpOIPK5l
         a5kw==
X-Gm-Message-State: AOJu0YwCcyqN7tAWkQWZ2y3lqWWVHM/2cispm345kKE08xIM9cC6KOyO
        ik+KSd9XL5+Qm87SJFBtzHLonnV1ECLg+GpttHM=
X-Google-Smtp-Source: AGHT+IG0d2pSB/wWQL+1jmWl3DKvoD3msvj9GdiSM/36D6PMBIyQVJeZv0O3+c7jkmh4y7i9XQjFDQ==
X-Received: by 2002:a05:6512:1104:b0:503:9ea:3a67 with SMTP id l4-20020a056512110400b0050309ea3a67mr21807088lfg.26.1697026184894;
        Wed, 11 Oct 2023 05:09:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 41/62] treewide: rename pinctrl_gpio_set_config_new()
Date:   Wed, 11 Oct 2023 14:08:09 +0200
Message-Id: <20231011120830.49324-42-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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
index 0c499cff3fad..d703e24a8d24 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1994,7 +1994,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return pinctrl_gpio_set_config_new(gc, offset, config);
+	return pinctrl_gpio_set_config(gc, offset, config);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 0c583626e50c..7552cf358e5d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -904,7 +904,7 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
 
 /**
- * pinctrl_gpio_set_config_new() - Apply config to given GPIO pin
+ * pinctrl_gpio_set_config() - Apply config to given GPIO pin
  * @gc: GPIO chip structure from the GPIO subsystem
  * @offset: hardware offset of the GPIO relative to the controller
  * @config: the configuration to apply to the GPIO
@@ -913,7 +913,7 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
  * they need to call the underlying pin controller to change GPIO config
  * (for example set debounce time).
  */
-int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
+int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config)
 {
 	unsigned long configs[] = { config };
@@ -933,7 +933,7 @@ int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config_new);
+EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 8c40f35d9232..e072d0765a1a 100644
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
@@ -126,7 +126,7 @@ static inline int pinctrl_gpio_set_config(unsigned gpio, unsigned long config)
 }
 
 static inline int
-pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
+pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
 	return 0;
-- 
2.39.2

