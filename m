Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEA847CC379
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234896AbjJQMox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234921AbjJQMov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:44:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D621C1BCE
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so63934341fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544324; x=1698149124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThsW6Nt0Ih6GF++2vb41tY1BX2+xdfHi/vH+KQlice4=;
        b=Yk4ph482avhWk/MYlv0kIGPLxEzt83see/jgBL+IZYkMhxz9E/awwBvsxqXTwT1DJq
         AnoJ58RuANwNmpfIyF3yHkZZX+lFv0fupL8ycIzZTo5434kMOc78rFRI3fRjaogXnvA4
         OFg+wvOLD0uuvqeNkEcbm/JyuFsqSfPNCjAI38t4Fq9o8JFYl+lPqnUEVtZZ8RId1LzT
         hVCnE7XD+rZoZs+NwNViZypRal5iN9q2A7d2j6iLHBkr2uG4ZLXQ9FsZ14f8Yv0QAXXl
         uMNZCXb7Nh7uRy0Y10fgxntS1NaXcuMis5uypUcwj6TSG1haTs5BkN+FfaXJwzgqMn7S
         hO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544324; x=1698149124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThsW6Nt0Ih6GF++2vb41tY1BX2+xdfHi/vH+KQlice4=;
        b=E+1qGTS/af+Gog67w7TiqgzT/hB1WdVStcACAS5M3c6KdVAxIs0TRQe7hbDTkUutxE
         LQqyRtAbwj+mdXZN2yCjN2t5FvLh8BQtcKtk9eIkXQBQzyqACiETMrTrbx9SEXpqsfR5
         DtlDyiZGvUBhJ69KxOFm2/8Q4me43pshDtsvtrT2FEiMDRK34KHk+d46ecXTr9vDGMYh
         ibGalVKO4bF0l6G6ogOE8mnXfa5zrvO63cbty1H5Perwb1mXaOkmkU0svQzMfW/3hkX/
         a3qzBHPxlot360emllfeWmB1g+FBD+PwTIvPB9K5XZxlEAmZpLiiFyCLvTcJC8r5PTuH
         bWDA==
X-Gm-Message-State: AOJu0YwNdrObVBrssCfJK2/qErU2ogCXGsC80uV4Zbw1XzMPKlBOtpMG
        M28VeRAGXSQTIEKLrfTiy7rSlA==
X-Google-Smtp-Source: AGHT+IENICqafjLYY10wi9nR/Umwr+zTDxyRM3/yBS1hFKG9yVCHdjHVHH+gzhq2045irW3jhD0rZg==
X-Received: by 2002:a05:651c:102f:b0:2c5:47f:8ff7 with SMTP id w15-20020a05651c102f00b002c5047f8ff7mr1579491ljm.18.1697544324183;
        Tue, 17 Oct 2023 05:05:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 37/73] pinctrl: remove pinctrl_gpio_request()
Date:   Tue, 17 Oct 2023 14:03:55 +0200
Message-Id: <20231017120431.68847-38-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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

There are no more users of pinctrl_gpio_request() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 51 ++++++++++++++------------------
 include/linux/pinctrl/consumer.h |  6 ----
 2 files changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4a03fc1c6ba0..46e5fe90718b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -783,34 +783,6 @@ bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-int pinctrl_gpio_request(unsigned gpio)
-{
-	struct pinctrl_dev *pctldev;
-	struct pinctrl_gpio_range *range;
-	int ret;
-	int pin;
-
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
-	if (ret) {
-		if (pinctrl_ready_for_gpio_range(gpio))
-			ret = 0;
-		return ret;
-	}
-
-	mutex_lock(&pctldev->mutex);
-
-	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gpio);
-
-	ret = pinmux_request_gpio(pctldev, range, pin, gpio);
-
-	mutex_unlock(&pctldev->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_request);
-
 /**
  * pinctrl_gpio_request_new() - request a single pin to be used as GPIO
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -822,7 +794,28 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_request);
  */
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_request(gc->base + offset);
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
+	if (ret) {
+		if (pinctrl_ready_for_gpio_range(gc->base + offset))
+			ret = 0;
+		return ret;
+	}
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gc->base + offset);
+
+	ret = pinmux_request_gpio(pctldev, range, pin, gc->base + offset);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_request_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 3991271cc39f..83a414a347cf 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -27,7 +27,6 @@ struct pinctrl_state;
 
 /* External interface to pin control */
 bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
-int pinctrl_gpio_request(unsigned gpio);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
 void pinctrl_gpio_free(unsigned gpio);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
@@ -78,11 +77,6 @@ pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
 	return true;
 }
 
-static inline int pinctrl_gpio_request(unsigned gpio)
-{
-	return 0;
-}
-
 static inline int
 pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset)
 {
-- 
2.39.2

