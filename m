Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B50D7CC295
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343698AbjJQMI6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343781AbjJQMIJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:08:09 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D732D40
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:56 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40806e40fccso3498305e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544354; x=1698149154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUbVE7EnprLRCHg/IupG2aGO0MyUMAidx/+KUyiUqH8=;
        b=xMHDUv+fjSV9unbVsPuGNBL2e45kTOBSZiuAjMqcrWJYowvnPGFlSg9jjnYKdd0/Gq
         hEoHm25h+IMnYyeVLTMY2VNGh5T5LHE6+gsSaxs+evFxDalnzNidLQ0dh51Wfrj7RXNa
         vga4dqFozH9kcl+tjLicTtwTdDIiNrEshslikUnT3LILLfxgqRdBVrvbW5FmSujQx2Op
         3HjbiyhwnOfME1RqGbYIaeNa0jA3HOCxbXjb7vmOZItslVWkry48zeHDeymCBGdPhVeF
         a8OAszY6mxRrtMKLERK5rC+yffuzGbTIagvH5N4AxKo2zHnJqQtlZ1qev8IqSQy02KcH
         840g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544354; x=1698149154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUbVE7EnprLRCHg/IupG2aGO0MyUMAidx/+KUyiUqH8=;
        b=v4G6a1JXaEXtq7mC4bRN5QLkUQbxNl0VQBjrGsXQ6unusrjAYhE3rMCDykcQkswwnb
         Kad9Tdani/ECceS3NRPoyqOy0BI8HROhJcl2TZTVthfYS8dhYC8cL4BtFyTu+w+0Fp5S
         Zls39ht7CSIDZacMtAzXruyDvHgzeykF0I+C+O6t46VjBrVo9DfVxzspjYySR70OpJ98
         CEtgQF1jjeuO4LanO7ppz1mOdJLErUhM/R5GkKOO8X2ZsVEsMohgW/y7Xs65GlyKra0T
         Cee2qbVVWsFuBBuiFeKGL9MbCW/lPNSUVR3rXvwfoDZzcRqiXFJcZqrqxYxPInXzzggw
         YFqg==
X-Gm-Message-State: AOJu0Yzsk9oyn2gKZfG66gjb5+Ean6CFlxlENVcx2MUW95GMHylo1Li2
        Lihws+LERzABr7yR2VqilYCGoA==
X-Google-Smtp-Source: AGHT+IEQJmajdRG259Azur9kK4aLJz58vsY+Ji8pyKRpIU01MvG8yUxaV5SJfIXAnU492LUJVpBCYQ==
X-Received: by 2002:a05:600c:1550:b0:405:4f78:e128 with SMTP id f16-20020a05600c155000b004054f78e128mr1627510wmg.4.1697544353982;
        Tue, 17 Oct 2023 05:05:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 69/73] pinctrl: stm32: drop wrappers around pinctrl_gpio_free/input()
Date:   Tue, 17 Oct 2023 14:04:27 +0200
Message-Id: <20231017120431.68847-70-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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

pinctrl_gpio_*() helpers now have signatures corresponding with those of
the GPIOLIB callbacks. We can drop the wrappers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 917b87acbf0d..64e8201c7eac 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -220,11 +220,6 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 	return pinctrl_gpio_request(chip, offset);
 }
 
-static void stm32_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_gpio_free(chip, offset);
-}
-
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
@@ -239,11 +234,6 @@ static void stm32_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	__stm32_gpio_set(bank, offset, value);
 }
 
-static int stm32_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int stm32_gpio_direction_output(struct gpio_chip *chip,
 	unsigned offset, int value)
 {
@@ -316,10 +306,10 @@ static int stm32_gpio_init_valid_mask(struct gpio_chip *chip,
 
 static const struct gpio_chip stm32_gpio_template = {
 	.request		= stm32_gpio_request,
-	.free			= stm32_gpio_free,
+	.free			= pinctrl_gpio_free,
 	.get			= stm32_gpio_get,
 	.set			= stm32_gpio_set,
-	.direction_input	= stm32_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= stm32_gpio_direction_output,
 	.to_irq			= stm32_gpio_to_irq,
 	.get_direction		= stm32_gpio_get_direction,
@@ -381,7 +371,7 @@ static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
 	int ret;
 
-	ret = stm32_gpio_direction_input(&bank->gpio_chip, irq_data->hwirq);
+	ret = pinctrl_gpio_direction_input(&bank->gpio_chip, irq_data->hwirq);
 	if (ret)
 		return ret;
 
-- 
2.39.2

