Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1292D7B6C30
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240167AbjJCOvp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240238AbjJCOvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:40 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1097CAC
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:37 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so9761275e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344695; x=1696949495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPwuEwfRZF39P0qe4RqCU1p549Ra/xLyaMOsvkr04jY=;
        b=V/EcYzL+rKM43RBUqb7swBdGPGTgyzXMD/J1+c1+I+J5xHtyATZjR4vQV6MZa/VQdF
         Wet1XPrrY6d1oM/2711jZ4BCGpkqOMO6TpgYMjLCrmoMek0ETsMKBKfSZDFfT7kDOYTP
         diCuU7v9eoPWK4yt7tFxn1uXHvJhYqw/9zuCtLPZgBF/+5OhIm8sbM04377GS9YmVRgt
         uA+I+i85zthkBnqlI24MwfXgBal09soA37PHAOBAlspbyuSuctIulLe+VA2G5RgXuO6M
         LV/JDw/qXdW6f/tXei1oeFpLssH7PGXHYRnd3M0stHItcaRyu0xqIfhboExqLKfBEw4v
         Bz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344695; x=1696949495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPwuEwfRZF39P0qe4RqCU1p549Ra/xLyaMOsvkr04jY=;
        b=MFZKLlu1UOjHF9Imq/o/ElzcDSnDQy4lKzWK7VV2hy7sUWk/b27MUI9RGyTZeyhjDp
         DfmpKLS5vxcI7yr8WNNDZB0CdfYkSNbahWQn/sPK3c52ZI6atXQsxk4jgiAEn5ejumV6
         SCUZ5mNc4tgiDX59ArAz+VeiFahJwnp7HT54HdUm1tHQ+BfGzPskr6E5TNVXPflMW7we
         5W5wSxiitWWQzCb6zGEt+Rjrsyhyc5mRolbB1wZC3d+7whIyFnVCWft1ZxLa9NrIURfC
         qViFHV/p91lqfXXnHJTSMcjNYgwEEH6LlkRbFodbiQeKHCoFDvf0zr5FV2bkIOP42Flk
         NXjg==
X-Gm-Message-State: AOJu0YzNvF/orYxA+0jM6J9hYMZEF5JdLuwalQql4oQaUouMlOtRQRfn
        f8odO/yLQgED1ShJzZ6J4eys7A==
X-Google-Smtp-Source: AGHT+IFL0cGDlyQsQFD3DCP71g75HpD2QVKEVJmc2asAX8aA38eoi8vB4WqD1KC2Ukpy1e7Nhirx9A==
X-Received: by 2002:a1c:7917:0:b0:404:7480:d821 with SMTP id l23-20020a1c7917000000b004047480d821mr12880689wme.37.1696344695594;
        Tue, 03 Oct 2023 07:51:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 16/36] pinctrl: stm32: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:54 +0200
Message-Id: <20231003145114.21637-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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

