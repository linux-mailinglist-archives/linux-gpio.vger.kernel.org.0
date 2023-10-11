Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64DE7C5384
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbjJKMUi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbjJKMU3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:20:29 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2896819A2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:18 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405361bba99so62448195e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026189; x=1697630989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvqkdE0pFC3rt0ALCPspH5t69Bx+kT0SWwFi+Jjq8JI=;
        b=QZT2QNjmtsq4K2GdrJujpExlrFRrPGj3KERcfivGBjcMjq4lF4WxhrOuICYEB3xrBq
         RdIwARKiFOdjht488LPPwY7ntC3NrlkYtF3X+IZX2eMmaeKmxfhx6LxovjKwywQXBlUH
         uYEZFWhtRmVPupuj348uHMyPwZuJw0x++Jcxl0i3k/sA4VIva60/SImfOiArwX3QlgD0
         ZQhf0UCUbEBcjWJe1A0XyWok3ZRtD5Rg8E9+tRh+ceN1PBrgN8w2b0FFxsgEPwL2xqM6
         C2FqDD72WvUDh1d/QDK98nT5NBQlp2jg8pdybOqsoGC6nZbMFzURlbZe/1T5DcwfG9P5
         JyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026189; x=1697630989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvqkdE0pFC3rt0ALCPspH5t69Bx+kT0SWwFi+Jjq8JI=;
        b=I2gYVMTFAD2atFv/NL522VsK3/MDhVMQ+WmsO9uGwSnK2jJadwupbPUj6AHHx3gD4r
         Vne/EPyvocbmyxjdqW3fNlW2l7mzDMTedgkQeVooVWxbwfCE5aSADLtqbctWrr1jyTN4
         kwg+fqdUezbYkMAvVu8jOcZsEA6k9VRj29dKbI9chRyzBL03xNpPfW+QRAxBbxU7mz/C
         s+D+7LWdP/LsOtm+nhyeJ+7EGk0BTF0bpUXrInJb+T9lVQoLUemd/4NR+By4W3bq3quF
         cs/muf9Auzx0R9xT7pN1Ani6YF/nFezi9yel5HPmqurg+p4kYoy++4NzkfEO6GZ7wah9
         qbEQ==
X-Gm-Message-State: AOJu0YzW/EGqxaHstBNbtvCOOK6FQ32QThilvTDSApMeqwJalBktSFwk
        niKF5tXHfhh4QEbsWQSHBIhwAg==
X-Google-Smtp-Source: AGHT+IEY3ze74YLdjgYxoIb2hDThDJHsXjE7QOB83QYbmA/+gfM7BN03FF3RKA4WGnljEqr6LsiS+A==
X-Received: by 2002:a7b:c4d6:0:b0:406:7074:301d with SMTP id g22-20020a7bc4d6000000b004067074301dmr19196089wmk.11.1697026189083;
        Wed, 11 Oct 2023 05:09:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 45/62] pinctrl: change the signature of gpio_to_pin()
Date:   Wed, 11 Oct 2023 14:08:13 +0200
Message-Id: <20231011120830.49324-46-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Modify gpio_to_pin() to be in line with public GPIO helpers and take
a pair of GPIO chip & offset as arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index dbc59e409439..89df934d65bc 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -269,7 +269,8 @@ static int pinctrl_register_pins(struct pinctrl_dev *pctldev,
 /**
  * gpio_to_pin() - GPIO range GPIO number to pin number translation
  * @range: GPIO range used for the translation
- * @gpio: gpio pin to translate to a pin number
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
  *
  * Finds the pin number for a given GPIO using the specified GPIO range
  * as a base for translation. The distinction between linear GPIO ranges
@@ -280,13 +281,13 @@ static int pinctrl_register_pins(struct pinctrl_dev *pctldev,
  * result of successful pinctrl_get_device_gpio_range calls)!
  */
 static inline int gpio_to_pin(struct pinctrl_gpio_range *range,
-				unsigned int gpio)
+			      struct gpio_chip *gc, unsigned int offset)
 {
-	unsigned int offset = gpio - range->base;
+	unsigned int pin = gc->base + offset - range->base;
 	if (range->pins)
-		return range->pins[offset];
+		return range->pins[pin];
 	else
-		return range->pin_base + offset;
+		return range->pin_base + pin;
 }
 
 /**
@@ -777,7 +778,7 @@ bool pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&pctldev->mutex);
 
 	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gc->base + offset);
+	pin = gpio_to_pin(range, gc, offset);
 
 	result = pinmux_can_be_used_for_gpio(pctldev, pin);
 
@@ -812,7 +813,7 @@ int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&pctldev->mutex);
 
 	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gc->base + offset);
+	pin = gpio_to_pin(range, gc, offset);
 
 	ret = pinmux_request_gpio(pctldev, range, pin, gc->base + offset);
 
@@ -844,7 +845,7 @@ void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&pctldev->mutex);
 
 	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gc->base + offset);
+	pin = gpio_to_pin(range, gc, offset);
 
 	pinmux_free_gpio(pctldev, pin, range);
 
@@ -868,7 +869,7 @@ static int pinctrl_gpio_direction(struct gpio_chip *gc, unsigned int offset,
 	mutex_lock(&pctldev->mutex);
 
 	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gc->base + offset);
+	pin = gpio_to_pin(range, gc, offset);
 	ret = pinmux_gpio_direction(pctldev, range, pin, input);
 
 	mutex_unlock(&pctldev->mutex);
@@ -929,7 +930,7 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		return ret;
 
 	mutex_lock(&pctldev->mutex);
-	pin = gpio_to_pin(range, gc->base + offset);
+	pin = gpio_to_pin(range, gc, offset);
 	ret = pinconf_set_config(pctldev, pin, configs, ARRAY_SIZE(configs));
 	mutex_unlock(&pctldev->mutex);
 
-- 
2.39.2

