Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67467C53C0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346715AbjJKMXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346843AbjJKMXJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:23:09 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB30E19A6
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40684f53d11so69020765e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026190; x=1697630990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV4PS0wlUJUsPnHQ+15CSYkWjpePpNEtuLC0jO+O4fA=;
        b=SmIHmEHKMnG2f/01uVvH1kD0bW639bRCf6KaJd2vlyfTV9XvDKyGtnaFBZS4txs77Q
         DIx8+KV6HWPDMFV1N7VvdlvR0mKtld+Wv/MfH7Vn6kP0r8mRUc0F6Fc8zO12p+X8g8an
         ZIO4WrKU1cBzw43RAsKlL1FLcf/lxCmht4NHZ0Odh47tvak9MMiHnd+igSq3c2ZCLaAx
         kLRddvtWUhv0Vo4crOkw6PDuLuUluY3q9m2ytcF5kLM2NNeXUdyTvAGrKVLmh64+2Hrb
         xsHxr8+ynKcMOQXOpRZ2brgtB4EeMOnUSjivFmm+pmiF38zfq/52AJbkuhUlmn/9YCeP
         7M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026190; x=1697630990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PV4PS0wlUJUsPnHQ+15CSYkWjpePpNEtuLC0jO+O4fA=;
        b=JsFiJwOUxtQoRIqNFZzeUp7TCgj/vltKx0gjUkl1M5T9e750aTnCz8Ist3ItTJ8DFf
         fDPN52GubqfPMPByjw7kgkfRnFQr/lX1I+717tSmbIaIkdYe0Z/RWVxBMJ8hHJm+AueR
         OVR4leh7DAOKERx6WpGMebdj+PVRJFy2ncUs5go3+Md22BW1UcKdc5J53Gm4QJN2c33Y
         HR/2yG/e87TknECg3Qoysw38/Nbrzxoe/dxouKRpUm4aXiA3YkmIwqvGqNudKXRoJ9nQ
         CNdvsJziVZH3w6y6JF4zfn9rKIVVeLI2ewUqPNtx1zSmlnwkBjeXQHtJOvdyTLRrxb8z
         Z1cA==
X-Gm-Message-State: AOJu0Yzt5bu4ej8WfjremCX5jqQlMd8wAgMUcAO/+GdNGc8dPupLq8+d
        qaFFEQlvAzbUcFxBMnLpH81n4w==
X-Google-Smtp-Source: AGHT+IEKkuO4KWkKGW5OySKb472C3QwclFRZfn913ZUhBxKsM11lqZrt/xgzMcaE2ugp1JieZ9X8UQ==
X-Received: by 2002:a7b:c7c5:0:b0:404:4b6f:d70d with SMTP id z5-20020a7bc7c5000000b004044b6fd70dmr19405847wmk.17.1697026189872;
        Wed, 11 Oct 2023 05:09:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 46/62] pinctrl: change the signature of pinctrl_ready_for_gpio_range()
Date:   Wed, 11 Oct 2023 14:08:14 +0200
Message-Id: <20231011120830.49324-47-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Modify pinctrl_ready_for_gpio_range() to be in line with public GPIO
helpers and take a pair of GPIO chip & offset as arguments

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 89df934d65bc..e3da8aeee01d 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -322,7 +322,8 @@ pinctrl_match_gpio_range(struct pinctrl_dev *pctldev, struct gpio_chip *gc,
 /**
  * pinctrl_ready_for_gpio_range() - check if other GPIO pins of
  * the same GPIO chip are in range
- * @gpio: gpio pin to check taken from the global GPIO pin space
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
  *
  * This function is complement of pinctrl_match_gpio_range(). If the return
  * value of pinctrl_match_gpio_range() is NULL, this function could be used
@@ -333,19 +334,11 @@ pinctrl_match_gpio_range(struct pinctrl_dev *pctldev, struct gpio_chip *gc,
  * is false, it means that pinctrl device may not be ready.
  */
 #ifdef CONFIG_GPIOLIB
-static bool pinctrl_ready_for_gpio_range(unsigned gpio)
+static bool pinctrl_ready_for_gpio_range(struct gpio_chip *gc,
+					 unsigned int offset)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range = NULL;
-	/*
-	 * FIXME: "gpio" here is a number in the global GPIO numberspace.
-	 * get rid of this from the ranges eventually and get the GPIO
-	 * descriptor from the gpio_chip.
-	 */
-	struct gpio_chip *chip = gpiod_to_chip(gpio_to_desc(gpio));
-
-	if (WARN(!chip, "no gpio_chip for gpio%i?", gpio))
-		return false;
 
 	mutex_lock(&pinctrldev_list_mutex);
 
@@ -355,8 +348,8 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio)
 		mutex_lock(&pctldev->mutex);
 		list_for_each_entry(range, &pctldev->gpio_ranges, node) {
 			/* Check if any gpio range overlapped with gpio chip */
-			if (range->base + range->npins - 1 < chip->base ||
-			    range->base > chip->base + chip->ngpio - 1)
+			if (range->base + range->npins - 1 < gc->base ||
+			    range->base > gc->base + gc->ngpio - 1)
 				continue;
 			mutex_unlock(&pctldev->mutex);
 			mutex_unlock(&pinctrldev_list_mutex);
@@ -370,7 +363,11 @@ static bool pinctrl_ready_for_gpio_range(unsigned gpio)
 	return false;
 }
 #else
-static bool pinctrl_ready_for_gpio_range(unsigned gpio) { return true; }
+static inline bool
+pinctrl_ready_for_gpio_range(struct gpio_chip *gc, unsigned int offset)
+{
+	return true;
+}
 #endif
 
 /**
@@ -805,7 +802,7 @@ int pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
 
 	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
 	if (ret) {
-		if (pinctrl_ready_for_gpio_range(gc->base + offset))
+		if (pinctrl_ready_for_gpio_range(gc, offset))
 			ret = 0;
 		return ret;
 	}
-- 
2.39.2

