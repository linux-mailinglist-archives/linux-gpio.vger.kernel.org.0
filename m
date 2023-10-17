Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2177CC231
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbjJQMFD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbjJQME7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:04:59 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F02FEA
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:58 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405361bba99so50467405e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544296; x=1698149096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfWYSE8ThvfQSJQ9/Fq2M/H6j3nV1pBrLUi6/wp2wmg=;
        b=PhvTpAobVqwkJccjOUCkjy77AWEMCyhzMWY64tYstqClvC5XEKTefFeFDLGuEfxKM0
         mZ+xU0CID3axiltzz/J+DN1ANjfvFJr9b6DK3UbmdEG8YeKQc6DI+cL+osKE4Aserp74
         Swakv8l71pFy/1CNv8vScPK9bnRMIup0TPJYaPy38vCleYTViJzeWlT7xuOS894Xi4bl
         wK5U12tmxINhA0baWQlhR43qivYR7dkgeslvT33E+AtzF/oCYQd2FnxDh6pAfLUBNYlL
         RPnJkX5chs76M7569aMVKdnMtRDxzUnRTns4NiHNuqvmwZYC/5rY16IlEy/F9cuKLYWY
         Tr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544296; x=1698149096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfWYSE8ThvfQSJQ9/Fq2M/H6j3nV1pBrLUi6/wp2wmg=;
        b=qmJQWcvVLVdRmIcHIT/XHigKOn1kqL/W1Eitf3h7uzsQ26dkNkHgwFgHKHbAUd6dnm
         KoPKUy154N/SEgOa68HjosoVc8ZL5C8s1ebYhwmFjrVZ9q0jypDtOsp2P7sv4s1kKS9g
         ExLB45ABrEp68NFFZAyqnH7Jb61Ac4D69Y373E5DV0Hn37i1KJF6lMEy94jNj9Mc0cdt
         zMuLsVf/VBHrzRgg6Rb8OtWM6NcrhxXbBlxeTfTIrykbM3ByQup3r9VDKTEAOnXGtq+B
         n6h4auWa9ndosJXhQElbAagzvLe1cGjLjWRGEKY/pjG7immPl/5duqU/e1esoy9ITQ21
         Twbw==
X-Gm-Message-State: AOJu0Yx0jgrdGnjL0ly2UIPfK9TIqTWGfknTCscyeXKTUHmv2SWuQ4IU
        XlTH27SJK/PHiGBRH0oX/1N17w==
X-Google-Smtp-Source: AGHT+IHZg+Ea7NCU4m7eBzeT7ivGJI5rD+ML7hobIKQtqDtCWG5KVKYjI4E9NTJ9Gllb+IOWK+wUSQ==
X-Received: by 2002:a05:600c:4f85:b0:405:3a14:aa1a with SMTP id n5-20020a05600c4f8500b004053a14aa1amr1685911wmq.18.1697544296151;
        Tue, 17 Oct 2023 05:04:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v3 08/73] gpio: aspeed: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:26 +0200
Message-Id: <20231017120431.68847-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 58f107194fda..d3aa1cfd4ace 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -750,12 +750,12 @@ static int aspeed_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (!have_gpio(gpiochip_get_data(chip), offset))
 		return -ENODEV;
 
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void aspeed_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 static int usecs_to_cycles(struct aspeed_gpio *gpio, unsigned long usecs,
@@ -973,7 +973,7 @@ static int aspeed_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	else if (param == PIN_CONFIG_BIAS_DISABLE ||
 			param == PIN_CONFIG_BIAS_PULL_DOWN ||
 			param == PIN_CONFIG_DRIVE_STRENGTH)
-		return pinctrl_gpio_set_config(chip->base + offset, config);
+		return pinctrl_gpio_set_config_new(chip, offset, config);
 	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
-- 
2.39.2

