Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0CA7C5340
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346770AbjJKML7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346881AbjJKMLB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:11:01 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34BF10F3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:59 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4064867903cso68967555e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026179; x=1697630979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vydHvbKqcmaUPhEEktsrjJB4doUamk1HoU6kP37WGGw=;
        b=UOD4sFFjbtImvcz93jTXokzZKbi5Tb1TYtMmDYYKnrSXR7P1ZkW1nNrvcXqX57hoCr
         q3kyEWb1pfsmJ1MFlG6PwD4c4SJjKHP0cXtb5J+luUvDu/e3EG4GBP7nwe/PajRpcS9L
         tijFIIDEDm6MzKICZSfem9c/E9iC5uK0EOUb3KrpPrxGvnHcEpjUsi+2tCJOPl2iSV25
         0lK3RW9eSzZbOMyBHUaxJUiAuXfMCNdmwd44PwPfXrrDgcwn8PNCIDDsG0XVQsJGFgLZ
         /4HCBImJTHGQxCbmw71p4lj3UkTCBZf0T9HYv7+DNaiEnbJtyWBfF7BvcKr31l5G1d1n
         EkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026179; x=1697630979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vydHvbKqcmaUPhEEktsrjJB4doUamk1HoU6kP37WGGw=;
        b=ReK6rR7CE486hCN2e1U3MEYnLyqJaGFb+0SLtKUho8Slx2ZHYFxcM8d0kWGgkNDsOV
         QR0zu23IfOW86TWoHUwwbgSjhmLDWg5YtR1pKSU/Ofs8J+xra8+sxetFDwzJA+TDClmb
         m+F2gJJh/sOkgT3Ubae1lIR3SJQ+mGyowjuAoi8WIMFyt2bqD33Q/2LqZapmQknCydFK
         rSdxe/YITY26PDXc0g8Kk7k8IyP6GCEywVQP/ckGXhN/hEDZYYiAL2HtCcUuqLpPMl6d
         j3wUk/VMkpG2h9dBqwUTr6vLKy0QKcdfjyzX69JzOL2rguyqDu6utQJC8q5wV3Bvj8dF
         jvWA==
X-Gm-Message-State: AOJu0YwDvV+xvBEaq86EepcH6LkZd2iN7O+coJMbuCNnMA5v9RUyv8ZO
        nSObCgeHq8gFRIhxyvZ66hqgGw==
X-Google-Smtp-Source: AGHT+IHS2BfN8j1VltP7HJeTJ/PpoQRbbJmLvzona4YL/sOu5+nrUs6QWshdLDvA/nFAbRdW7WG2bQ==
X-Received: by 2002:a05:600c:468d:b0:407:4944:76dc with SMTP id p13-20020a05600c468d00b00407494476dcmr8283375wmo.20.1697026179201;
        Wed, 11 Oct 2023 05:09:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 35/62] pinctrl: remove pinctrl_gpio_set_config()
Date:   Wed, 11 Oct 2023 14:08:03 +0200
Message-Id: <20231011120830.49324-36-brgl@bgdev.pl>
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

There are no more users of pinctrl_gpio_set_config() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 38 ++++++++++++++------------------
 include/linux/pinctrl/consumer.h |  1 -
 2 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 9f8027f381b6..99514119c2bd 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -904,27 +904,6 @@ int pinctrl_gpio_direction_output_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-int pinctrl_gpio_set_config(unsigned gpio, unsigned long config)
-{
-	unsigned long configs[] = { config };
-	struct pinctrl_gpio_range *range;
-	struct pinctrl_dev *pctldev;
-	int ret, pin;
-
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
-	if (ret)
-		return ret;
-
-	mutex_lock(&pctldev->mutex);
-	pin = gpio_to_pin(range, gpio);
-	ret = pinconf_set_config(pctldev, pin, configs, ARRAY_SIZE(configs));
-	mutex_unlock(&pctldev->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
-
 /**
  * pinctrl_gpio_set_config_new() - Apply config to given GPIO pin
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -938,7 +917,22 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config)
 {
-	return pinctrl_gpio_set_config(gc->base + offset, config);
+	unsigned long configs[] = { config };
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc->base + offset);
+	ret = pinconf_set_config(pctldev, pin, configs, ARRAY_SIZE(configs));
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 4fdc0e570329..bcd09f584525 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -33,7 +33,6 @@ int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
 				     unsigned int offset);
 int pinctrl_gpio_direction_output_new(struct gpio_chip *gc,
 				      unsigned int offset);
-int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
 int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
 
-- 
2.39.2

