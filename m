Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919697B6C25
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240218AbjJCOvk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240176AbjJCOvd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:33 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6468EAC
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:30 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40666aa674fso10076555e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344689; x=1696949489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdtmVBU6kbuKuNlqmo+NUmCZOtJiKsXYzRDePE/dKQY=;
        b=jXakqBkhtEuN7DMEJBXvkGRe3XTKFUaJCKM9DlRt4KV1JxCVzMivj8ykB5NGFX8qj2
         V2bmXI7B/a41CKjup4pl1DYO0EbcgybwJv10wfFsSEc/lg3i1RNHPhIuyOOfFA+O5RXI
         pi5EWXBPs8ElaXlZUGRpZYN57mxP4oZISOilmm+qCgdk17VpyQCkI7xSnAUjzZWofuLV
         /Wlp4fetyMcUTxP8eX14IKOC3wFKJSk1ctxL+Zidu1w6IpQlszmiK8JD1aOVwmzFniTL
         vlQVP/DDI+zWn4w3pBkjhV0ycm1hYDbbxKxZ9OSeu7kotG/ZgAecoa7BRQnk3YxdCbZW
         ifqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344689; x=1696949489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdtmVBU6kbuKuNlqmo+NUmCZOtJiKsXYzRDePE/dKQY=;
        b=gfHz2RM4dA0xPP4v8bxm44WjsoAIYI61wugHa4AlyQR2P9ie7auTMLc30lifvS8ZST
         KeR4pQDATpdq21Gi+/IdW8pvxP+qsybkvhvTP+qZ0+iifCWTjUJq/dHwcp5wksIaBi2F
         cnQgZ0b0zWmmyDhLOmLPAWqPiLX+1tJPXHOcduwSRNrE+W7uqrMhI9lLel8LFEGHh65Z
         P+9JrTR1YS0gb1HPyZg7/Lj0mqLQ5bMBSiXzMHe17AdlyPizIhLbRYcRNzvxaX/VhB5y
         tFRRp/iMz/xxz/CxU7+LJxv3Q6uFPhXRx7W47XNx+3ZZl0O/qVx7GbJKbAhLl7mrmkn9
         5X2w==
X-Gm-Message-State: AOJu0Yz1O6U3Qkfa9B4Rg9jxOh7+qiZ3ddxkJdf/gPeAxfczGEehrWXP
        FEH/yHu/x6iBC728XZ6m4eRJyQ==
X-Google-Smtp-Source: AGHT+IF2Yqjlf5dCLqftkIXWdnHlJncSeaVfR3l4v1vd7ez4EG86XwGi+KzTftAAZ+upVwzbWRH4WA==
X-Received: by 2002:a7b:ce95:0:b0:401:b2c7:349b with SMTP id q21-20020a7bce95000000b00401b2c7349bmr13017389wmj.7.1696344688864;
        Tue, 03 Oct 2023 07:51:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 08/36] gpio: aspeed: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:46 +0200
Message-Id: <20231003145114.21637-9-brgl@bgdev.pl>
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
 drivers/gpio/gpio-aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index da33bbbdacb9..d3aa1cfd4ace 100644
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
-		return pinctrl_gpio_set_config(offset, config);
+		return pinctrl_gpio_set_config_new(chip, offset, config);
 	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN ||
 			param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
 		/* Return -ENOTSUPP to trigger emulation, as per datasheet */
-- 
2.39.2

