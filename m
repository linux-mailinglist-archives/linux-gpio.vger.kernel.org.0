Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE007C5314
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346581AbjJKMJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346768AbjJKMJc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:32 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15923101
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:24 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-406650da82bso62486655e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026162; x=1697630962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPwuEwfRZF39P0qe4RqCU1p549Ra/xLyaMOsvkr04jY=;
        b=owH5wbJfOoKtbUidOVVhY2l9zWRohRHWAksuFjsBRJrMUVCoAgS4neCQr8sIc9/Mfm
         +5vgsxKeYx09lZHa1kYewbOmsW+yEcuKNthRB1SGXyzh77ER4YNgmj8rTTYfUqVqXm9O
         Vhx+yAZlYt5j1vpMdIVOb0i7bKwlf8TwwBlZbCLdiy8+LS/zQTpxpZ5OF2Sqmc8/3QQ5
         FifuaSMi4o/O2Vd6TUBBusat9D+22YvvDMFj1/ZkVqZNMH5yd8O1S5Zq353iWtg8O+VI
         K1+fRldn2TuMNlggfz9N4I65ulkTQhG3ox78PS6cvB1ODivFpXcULFs5xIxu1dnIrugf
         2f8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026162; x=1697630962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPwuEwfRZF39P0qe4RqCU1p549Ra/xLyaMOsvkr04jY=;
        b=tAOkxJEze69loASy3FH2WyVQYzzo0Xzo6ROa7fxoghrJaYuK8Il3M115R9uMKUVXM/
         qi9zlWmUrb5ZH5G8rjTNVytW6zy5/tK5iCgPJWTsTiOJNaBMx6Rqcr3h9rJd2CdiKKsQ
         YziBOaRA3ouAME71Ha7eh0wwlFeXXnirfs+AHRYjSc4svgEW9qa+yAOazTnKsZrpjL+2
         iSzqATANW5+HPuAj2V5a1OmnJaycxgR4xww2z3sKBYAk2osWSc9WRfcXZseZ+UoSL8xW
         yFInVZ6iwNk2Hblmy4p8p3/fXuXbtO3WIQ/oUcfN4VNtT+4Q1CMh47vXSBl6YhwIr7Rt
         DH+A==
X-Gm-Message-State: AOJu0YzmIltB0UvVnL0DbtobixvzwFGoLvSHPWzfPvwWfJvok9aujNyt
        s3gVZWllJ8cTpMAySUQQhd0YmA==
X-Google-Smtp-Source: AGHT+IHG58kszOlx+/jzRbb/vUE3ysT4ruamZvPBJkCiYBz6pRrqIIBWYOANrs0621MZOnLfPD77xw==
X-Received: by 2002:a7b:c419:0:b0:3fe:d630:f568 with SMTP id k25-20020a7bc419000000b003fed630f568mr18238326wmi.39.1697026161771;
        Wed, 11 Oct 2023 05:09:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 16/62] pinctrl: stm32: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:44 +0200
Message-Id: <20231011120830.49324-17-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a73385a431de..11d9f07934bd 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -217,12 +217,12 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 	}
 
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void stm32_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -241,7 +241,7 @@ static void stm32_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int stm32_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int stm32_gpio_direction_output(struct gpio_chip *chip,
@@ -250,7 +250,7 @@ static int stm32_gpio_direction_output(struct gpio_chip *chip,
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__stm32_gpio_set(bank, offset, value);
-	pinctrl_gpio_direction_output(chip->base + offset);
+	pinctrl_gpio_direction_output_new(chip, offset);
 
 	return 0;
 }
-- 
2.39.2

