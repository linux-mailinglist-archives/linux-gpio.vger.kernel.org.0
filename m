Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A03E7CC252
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343567AbjJQMG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbjJQMFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:54 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334A2D5A
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40806e4106dso2990825e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544306; x=1698149106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPRzIFIU2I284yl/ON43iSE6foshfftHmva92Etqe/c=;
        b=VNgmRJc/Gsx85JpIDQw7ac2UDfMhWoKdeb/5WtOfSUGYjMTadqXs+SNkvvRLkHPL2+
         CaaQ4CmpbjyfBViyA3v90fBf7ugWr8PIpOjKR+OLazUHTqcEhUQwXBdcKOYPF3XgIUB/
         TIcvIDQxoiHy2s8/Zmn/op+uOjOV2h9s3r5p2NhVUPHynN9w7rB+SE0K8LrGPG07iojb
         mXiZw8TbbjmZ1un3fcGRNjXFiCK6vkrqLUZ6iFTzPdliWBJ8EqAEvBvoSbE6VMTFGO3+
         ufiALeOB2xVpuedOgLouUsZZILU0AwVm4yrmPh6JulUqYp2eOxhqjZRM7aDRg9tqLfHm
         OpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544306; x=1698149106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPRzIFIU2I284yl/ON43iSE6foshfftHmva92Etqe/c=;
        b=cpSwsuo1bvy04l8UNGJ3sYLmUMRL5gFrG/UuFzDaE4ALorkPJe9BbjUDq9AT7yH6/K
         VUvbPVpwC29F1P72InV7zVgvu7/oTmog0C+HrXlvb7x+VW33AYq8ywD3pRCaULZwx6aP
         FrfLJI202F165LT3jRQUXKE57deLH/dWYl3P9JC5DnlTy6b/Y14v2xuvnlSaoPrryUhY
         aWqxN4KN9Q+htM3Q96IfECD2M0Jq2lk8lQTWYK95wRMu4YfTrC92aBsE7WqU07wt9Dgj
         Ws2sC7nbOj/6vl8GwnUMRHYFMXS9hl4EWLn0OgkT6WhpW0b0+SG6KLKTmsRyU3R+oJtp
         bvwQ==
X-Gm-Message-State: AOJu0YzIeWz0x0+4DeCtoHzxdRgWMNPQdIimsPL46TWno1y9XKGz2Xx9
        XA57yX0lV+fboJTLCEjPOCoNRg==
X-Google-Smtp-Source: AGHT+IGWkJeri8jyS0Ae6jZs+nKZuzy4WzXnyJfZIWeKjQDhfyINCb06MdhjhV4hz1V1AM7IEE6reQ==
X-Received: by 2002:a05:600c:1912:b0:405:3924:3cad with SMTP id j18-20020a05600c191200b0040539243cadmr1659061wmq.15.1697544306662;
        Tue, 17 Oct 2023 05:05:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 18/73] pinctrl: spear: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:36 +0200
Message-Id: <20231017120431.68847-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/pinctrl/spear/pinctrl-plgpio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 722681e0b89b..7488f6394318 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -204,14 +204,13 @@ static void plgpio_set_value(struct gpio_chip *chip, unsigned offset, int value)
 static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
-	int gpio = chip->base + offset;
 	unsigned long flags;
 	int ret = 0;
 
 	if (offset >= chip->ngpio)
 		return -EINVAL;
 
-	ret = pinctrl_gpio_request(gpio);
+	ret = pinctrl_gpio_request_new(chip, offset);
 	if (ret)
 		return ret;
 
@@ -249,14 +248,13 @@ static int plgpio_request(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 err0:
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(chip, offset);
 	return ret;
 }
 
 static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct plgpio *plgpio = gpiochip_get_data(chip);
-	int gpio = chip->base + offset;
 	unsigned long flags;
 
 	if (offset >= chip->ngpio)
@@ -280,7 +278,7 @@ static void plgpio_free(struct gpio_chip *chip, unsigned offset)
 	if (!IS_ERR(plgpio->clk))
 		clk_disable(plgpio->clk);
 
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 /* PLGPIO IRQ */
-- 
2.39.2

