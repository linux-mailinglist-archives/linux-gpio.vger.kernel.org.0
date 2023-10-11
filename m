Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285B17C534F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343588AbjJKMMr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234952AbjJKMM2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:12:28 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBA7189
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:38 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40572aeb673so65241435e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026201; x=1697631001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUbVE7EnprLRCHg/IupG2aGO0MyUMAidx/+KUyiUqH8=;
        b=nOjheE+SGPdXqTm3Xpp/aWp6ag9Ig52xlyg3hylrHr4SC2pTAUOQRzqSDZpabFdVjI
         vIjqdWQrrAH47bjRx6FxSw4hsRE53gNLCB/nHYIqK0cNflxmb4zxOAGAU68SOVV2QshK
         mv/ThRX4uhrbt9fwgAtPVeyNpmZW5hvKwZX4TBwy0Yt6jvGmdia//5g6XTbycLNViiUA
         qGbcoR/Th+UhivKgjiCFShjuNAvAFiOtK1RIJD5P5gesCk08RKORpUDFnubXlkuUiGdw
         Y71jwAPL1AnAXRaJ4uCZRf+8LpNh+Bw0zFuzeYTUzNryi4hSDNPXElamzqpbEzpJvRIS
         4xAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026201; x=1697631001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUbVE7EnprLRCHg/IupG2aGO0MyUMAidx/+KUyiUqH8=;
        b=FhYr8xLFt0Hwv8lSRMw3dxPBKYNGU9KleJg3JjJafXHjgvLq1i4uy7Ud4HhjDbDDGa
         UuohL4kBhwMmbAafW/qLjdgxFO9N/BEjtBAd+sx7Hn0KzmC5+IMN7VDAzSFb+ywSoXsN
         FssfORpLXRgLaBwUxWFa2Ns1jNqf69XJMMdCLOVMY8ysG3lcCQQxBpIDEEeAgGCAfdLr
         +lOw4CICoCHKe1vhUzH2dtk//jItIm3luMJ1RlQD3KWqEhkVgo6PDBqDM2b5p3KKN/6q
         OvEk9HZXrcGl5RSpZWQiUT6E9yRE6y+AjMAccURl/pqbEJDlGJGJpyKP6clAZVVO1lmd
         z3jg==
X-Gm-Message-State: AOJu0Yyy9QHxSF+r/Bs+eS+eJS03lUyj4WMmCC21kVG5zZsZXsqaFzCe
        zgQ9fn6WC4YC3FFX0gMFy+4n9w==
X-Google-Smtp-Source: AGHT+IEPRuIYbzvef3i9jdK8m7uV+p1qfFU44AIb0ANdBVLyT68aVw2Zh4aIudZrTjzL26NX6RkBDA==
X-Received: by 2002:adf:ed11:0:b0:317:6653:60b8 with SMTP id a17-20020adfed11000000b00317665360b8mr17257726wro.50.1697026201490;
        Wed, 11 Oct 2023 05:10:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:10:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 59/62] pinctrl: stm32: drop wrappers around pinctrl_gpio_free/input()
Date:   Wed, 11 Oct 2023 14:08:27 +0200
Message-Id: <20231011120830.49324-60-brgl@bgdev.pl>
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

