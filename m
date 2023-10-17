Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8067CC2F7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbjJQMVK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235140AbjJQMUy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:20:54 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A102D48
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c5056059e0so60236651fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544355; x=1698149155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvAiclzYBXz54ZfUbD1kCo7tfLM2DvIrls2CuKVDYu0=;
        b=aZW+JreSbECKa1vngWbyqDTBjSkP/CZwBV+K2ovxhC5UMZmQS/WAIWIe2dfhSOBKtj
         SPUhMJb8mSbCxk+vrAA5GE0rzAU1USSNeRr07tTXjAmDf+MeRZU2gLelFaOSsIU9o0KV
         VH6fziwYraWXfbgHKoSLoy+aznTIrLygoGd/XYscCnHCM8IT36S7AhWzqXPJZUZUYM7p
         8Y7iH4326d6iyxLqGsvdmaRKLTZdfAom87HFBXYpAJVERQwBVd+lZ6vx8tGTYXkqcE3N
         YyR364bf6lfKlyHWuVz887vwDkyT3xXgE0NpIg/BZnYwebFlYcpaWs5KGOadzfFaqqgt
         Zreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544355; x=1698149155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvAiclzYBXz54ZfUbD1kCo7tfLM2DvIrls2CuKVDYu0=;
        b=W/PQgRekRnr7nJwbJuzgYkJHD+7Bf15dbLizu2iaPgRpV7199GFjk84SK/M+3H5G8O
         v51ZvdVKEij/2chPvDmqgxZupOIunlkS1LcNT+pcjwK1JxRJ2OTMN3AYu1EEiIh2gbqL
         CotPw/+6/tiS6KPwndAKMJKIeVHHaRQXB1n+JWpkkZUAakC1+ndbiU3nPIKZgEg3NcYh
         li/jWlD0sQwrGHj7SlJUsKxFAMmPgiuNq0eXnWNMKf7PmTvxTcxTZef1OowAK+8wpAsM
         OM8qJFf1DREVzXhzDbbwnyiWjDNGlitTAj+dw3v5kDg9ribyAT/U1B2yiMsxVoBETm69
         mhcQ==
X-Gm-Message-State: AOJu0YwGcBPFwVQz8wiLj87/GwKTC2G+uCEoMAQLtcwboMON0djqBWjE
        tk1nJLyaZje3VgmQ1KU6ns8Hj4hd0xUvXPfHSPQ=
X-Google-Smtp-Source: AGHT+IFjObtVg9WwA/yvyP0k1hEElLXc08dQMyqWvtp8tfJXU+iEFMwb/KdsxYo7u8j+NqKwUkmOEQ==
X-Received: by 2002:a05:651c:60a:b0:2c2:966f:8cc with SMTP id k10-20020a05651c060a00b002c2966f08ccmr1326065lje.0.1697544355167;
        Tue, 17 Oct 2023 05:05:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 70/73] pinctrl: nuvoton: npcm7xx: drop wrappers around pinctrl_gpio_request/free()
Date:   Tue, 17 Oct 2023 14:04:28 +0200
Message-Id: <20231017120431.68847-71-brgl@bgdev.pl>
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

pinctrl_gpio_*() helpers now have signatures corresponding with those of
the GPIOLIB callbacks. We can drop the wrappers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 51aeac7ecc79..1e658721aaba 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -208,12 +208,6 @@ static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	return bank->request(chip, offset);
 }
 
-static void npcmgpio_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	dev_dbg(chip->parent, "gpio_free: offset%d\n", offset);
-	pinctrl_gpio_free(chip, offset);
-}
-
 static void npcmgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc;
@@ -1916,7 +1910,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
 		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
 		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-		pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
+		pctrl->gpio_bank[id].gc.free = pinctrl_gpio_free;
 		id++;
 	}
 
-- 
2.39.2

