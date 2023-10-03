Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D13C7B6C2D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240242AbjJCOvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240207AbjJCOvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:38 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B2ADC
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40652e5718cso10183515e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344692; x=1696949492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3PAik/MdMnmd6nJXEVGIJx0ZjjbAy5Xj5U2rnqb3Ps=;
        b=JNb9y+4Ud+Jnj2+QOSYSdULPNKXQs/YgHtozr9VkTXRXX42Fch1p+5K8umy7vtcnWS
         0Kqwx1hFIqKXcW4ZwbcODQq8fsiPy1u2l/EY3beSC0zS2WU71hncPTgi+vZ+kBXHtw0l
         YXCYBBeyMfnnLsv68J9xiDrNCMryk6ARMZv2jsMt/o8hWhNAO0JqPKaNNLWrTlQI+Shj
         /5+d0KGqbWZhzZcH12PmEYm2Y160u4oOqaCjFONfEN62sZpr+gCrvKTDsjaE2qlxG94u
         cwvvhyO/4uE0SwoOvZ745JyQVHd/CxqLznKKPB8r/o9I4WUtXjIMpHZ5AtBaTdg1sXb5
         mIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344692; x=1696949492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3PAik/MdMnmd6nJXEVGIJx0ZjjbAy5Xj5U2rnqb3Ps=;
        b=wckbR1FHSYUwq5B1XRhYyDL/qFwlpUEJf9tzkZ0ztIQsd8l4EaqfRp1+vb+Ae/byHa
         sK9yTw7AqaeP/yKWE+CYDEVvvBsVLar3HS5OrjMNMXikRBTzew49um53UA98YgbGPwMB
         ANSeCz/S7OvdYhRmkwclMdr1isM12Izz6A3yjYyhXJqaVVoZ5Ocoupd11ewHfyFL/EcO
         lkZQgmHNltGt5Si/kcoXiXbtUOvK5NKYOmuDWCzdRUygB+clgx1UOlvg2JUZvDeGS7fB
         h4vgpt3G5x7W7yTlvDv8xgWZY/R3L3qEtMS2AroW8rrnFnfI7g6vwse2KtMEx5S2bQJY
         Wa7w==
X-Gm-Message-State: AOJu0YxeEkTncGB/YaGP8+1sPRb1A9r7ea90y6B+Vc6eJjzY22AiirA6
        EHM5T4EfStlePpNbLyw/Hg2+Eg==
X-Google-Smtp-Source: AGHT+IGu7MXgYnFGdb+GeWB9FUbG2O9dRPCYAL9vmWgmEyNl+PENMO7rOSYyKjICB5htTVJPl6MGmQ==
X-Received: by 2002:a1c:7c0b:0:b0:3fe:2b8c:9f0b with SMTP id x11-20020a1c7c0b000000b003fe2b8c9f0bmr11782685wmc.23.1696344692136;
        Tue, 03 Oct 2023 07:51:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 12/36] gpio: vf610: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:50 +0200
Message-Id: <20231003145114.21637-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-vf610.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index dbc7ba0ee72c..32142b9564f9 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -116,7 +116,7 @@ static int vf610_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
 	}
 
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
@@ -134,7 +134,7 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 	vf610_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static void vf610_gpio_irq_handler(struct irq_desc *desc)
-- 
2.39.2

