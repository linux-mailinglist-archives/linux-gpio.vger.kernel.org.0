Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078067B6C21
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240228AbjJCOvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240187AbjJCOvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:32 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4620AF
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:28 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-405497850dbso10117955e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344687; x=1696949487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJlcPxZYJ+2xOtgJ5lT3aANbc/q/A7LyEHQjQgc784Q=;
        b=mhvYEiRo+bhT1rWAYnR8WLllDeWvqTbzz/90S2v0hSmggFXzFQNY/fdLu7EfFwgWKx
         ckFLG0P4Xe+4JJIlUtJ9k7B3O4TpolDGUx2uoPQySc9rDixQgqaJKVR7vshb4UsyG54r
         naM82a4Y4sJ+OUDHvYDsYRudrErD+xbhh79mWENSWeBayfyd72JwUGQl1jiDmOE0FiBO
         bByHJu72Nje06GfvJmkQZ9ir5qBF62p6I5ARxKuxyDZRH+KTDCQQrDDDsJ0O0UpOWeze
         AfD7uoBrdri/LL4YoC/CyOg+0LSrxa35GujlBRTtSqZqBq92NiyyNPn9WwLq2SFtOM7y
         5JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344687; x=1696949487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJlcPxZYJ+2xOtgJ5lT3aANbc/q/A7LyEHQjQgc784Q=;
        b=O0UyjO4/jeyuYWzUpzPQJtVU62/kjWwskZNGvnoijLBFsXpkJJgQPgR15H9jnk9WI+
         gla68lUt6u6oIdnfVh770XA2L8ikcV3jBl/VIrzhDZDPuZukpGdzAeKArscar5FE0y9r
         YRTJmULIjKckWCdTcZjkLUr4dxHfRCk25FTuUG/fnt4WWr5AHkz/s3a66O/bW32glKl0
         JSZjOpwc1RSQup2Ff8hQwAUoAonTxgx/UMBo/4GORgQNew5s45fRy9yLcIzCEI75lEOQ
         nIEaM3qyoya50X7ZrpFlMvgOC71qKq8IvjvwNOntwEGTMJxQMoXIPGvir8k5fxWCyMz6
         DGog==
X-Gm-Message-State: AOJu0YxQyZ3m/IFi87N5a1ZanVxDnpgx1dkZ54cWHaW4Ch+SlsuSwL4O
        +Jv2trSe26JgWA2joXt7Ei47tA==
X-Google-Smtp-Source: AGHT+IFsfE5BRcM1HG+HIE2wDfPZ0fpZlZ9UKyEA+cdTptLNLKiA+uRGC9DiZYq9vd5rAGQ8WiCVYQ==
X-Received: by 2002:a05:600c:2948:b0:405:3f06:c07e with SMTP id n8-20020a05600c294800b004053f06c07emr12250441wmd.15.1696344687198;
        Tue, 03 Oct 2023 07:51:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH 06/36] gpio: tegra: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:44 +0200
Message-Id: <20231003145114.21637-7-brgl@bgdev.pl>
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
 drivers/gpio/gpio-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index ea715582bcf3..08951ddcd294 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -139,14 +139,14 @@ static void tegra_gpio_disable(struct tegra_gpio_info *tgi, unsigned int gpio)
 
 static int tegra_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void tegra_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
 
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 	tegra_gpio_disable(tgi, offset);
 }
 
@@ -179,7 +179,7 @@ static int tegra_gpio_direction_input(struct gpio_chip *chip,
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 0);
 	tegra_gpio_enable(tgi, offset);
 
-	ret = pinctrl_gpio_direction_input(chip->base + offset);
+	ret = pinctrl_gpio_direction_input_new(chip, offset);
 	if (ret < 0)
 		dev_err(tgi->dev,
 			"Failed to set pinctrl input direction of GPIO %d: %d",
@@ -199,7 +199,7 @@ static int tegra_gpio_direction_output(struct gpio_chip *chip,
 	tegra_gpio_mask_write(tgi, GPIO_MSK_OE(tgi, offset), offset, 1);
 	tegra_gpio_enable(tgi, offset);
 
-	ret = pinctrl_gpio_direction_output(chip->base + offset);
+	ret = pinctrl_gpio_direction_output_new(chip, offset);
 	if (ret < 0)
 		dev_err(tgi->dev,
 			"Failed to set pinctrl output direction of GPIO %d: %d",
-- 
2.39.2

