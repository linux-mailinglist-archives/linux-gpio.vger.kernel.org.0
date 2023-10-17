Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 121227CC2F1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235101AbjJQMUw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbjJQMUf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:20:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32138D7C
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so69645171fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544325; x=1698149125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTp45qpeTF/+gPzHARMv2KmOGY0Alfi//g8E89OVTQM=;
        b=lnqIygFwxJPZDnH9pan8NDRztJbA2YqC1qs3fLsxb/tRKPzEuYWYGFf28qwvN+7w8w
         2ShK8I5u6DSNkkrx6NY95kvqO0e+yWU1J4fSKHyJ/KbBp+NwpU5bZk/+xC9Y76lxhHZw
         jRgLRrtuZEWyRXctqf5+noGpCFz4IE6uOVcOcxt5z5fAy1qjJg0fJ/s0TAIU903GWZOy
         qiTFhDq0FTNzDBCHv08/m/adH8eLXtaSM+fjBpbsFjydLoPmNGDjH9/X62sLubRBIU8f
         ueXeV+d6IKzBfmqVoZ7IAqPoi6uR6ceSLrrsM/OaSzwH2zFrik4O4ampCqid2liVUCB3
         TMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544325; x=1698149125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTp45qpeTF/+gPzHARMv2KmOGY0Alfi//g8E89OVTQM=;
        b=N5Mq967ZFmBRMxZAM7HFfLYLdV9PsHsOh1KJl1LiCj5zUh+WFxBESIFvOjjBAdzcX+
         XBthA/94LOeE2KnHrvUK4bWSvHTcacLaQj4JTwDAytKAlV8YzhVCirio+8jkr0W09A/z
         48kDjd2GSSCPYvxYy704tjOgvBFoUqHMr8XE2LcNPAZEWM1CouC0g15mVSGVkXEror6r
         q6WJ5vlsJyJGYMzVRBXL4KOI2k5Rmg2if9JFTH/YKuNFfwc8klls8IAY+1mUloRbdlEs
         IjLLuRgrElzErSxPmHVqs6YWOdvF+n5RGNJ9WX6yCrr/mdqadUNxvgsPBGdWOUE+YMRZ
         1OTQ==
X-Gm-Message-State: AOJu0Yy2gFyZs30GFElWv0QWytx6T/wVq+b0xqZpFwSY4Ycenj5MBC19
        CD45UxLbKJE1UUj3nGF07ZUDyQ==
X-Google-Smtp-Source: AGHT+IGdoHFWz6qAcVFDGAMc7KnLo665dhnHhEtx9RUpTzfX4R2j7ZSCVSU8KKqG9zlUAWhnHQlB/Q==
X-Received: by 2002:a2e:7e0b:0:b0:2bc:efa4:2c32 with SMTP id z11-20020a2e7e0b000000b002bcefa42c32mr1383090ljc.37.1697544325140;
        Tue, 17 Oct 2023 05:05:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 38/73] pinctrl: remove pinctrl_gpio_free()
Date:   Tue, 17 Oct 2023 14:03:56 +0200
Message-Id: <20231017120431.68847-39-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of pinctrl_gpio_free() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 41 +++++++++++++-------------------
 include/linux/pinctrl/consumer.h |  5 ----
 2 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 46e5fe90718b..5a1414bfeacc 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -819,29 +819,6 @@ int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_request_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-void pinctrl_gpio_free(unsigned gpio)
-{
-	struct pinctrl_dev *pctldev;
-	struct pinctrl_gpio_range *range;
-	int ret;
-	int pin;
-
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
-	if (ret) {
-		return;
-	}
-	mutex_lock(&pctldev->mutex);
-
-	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gpio);
-
-	pinmux_free_gpio(pctldev, pin, range);
-
-	mutex_unlock(&pctldev->mutex);
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_free);
-
 /**
  * pinctrl_gpio_free_new() - free control on a single pin, currently used as GPIO
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -853,7 +830,23 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_free);
  */
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_free(gc->base + offset);
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
+	if (ret)
+		return;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gc->base + offset);
+
+	pinmux_free_gpio(pctldev, pin, range);
+
+	mutex_unlock(&pctldev->mutex);
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_free_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 83a414a347cf..90b2f0b78c4b 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -28,7 +28,6 @@ struct pinctrl_state;
 /* External interface to pin control */
 bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
-void pinctrl_gpio_free(unsigned gpio);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_direction_input(unsigned gpio);
 int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
@@ -83,10 +82,6 @@ pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
-static inline void pinctrl_gpio_free(unsigned gpio)
-{
-}
-
 static inline void
 pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset)
 {
-- 
2.39.2

