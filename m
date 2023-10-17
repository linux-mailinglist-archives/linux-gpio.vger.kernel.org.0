Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088577CC257
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343543AbjJQMGd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbjJQMF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:57 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDAF8D7B
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40651a72807so52795535e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544309; x=1698149109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0sgIJXyiWCMH9BTQoi/ajBzkcQtsuv8BX1pVGl7zGQ=;
        b=Cq/DzslR6rIOsCqA4OXdxVyPASyc3VkHN8hplAOPyHr7VUIZdP4DevglLmjuaQjrHc
         4N24wOvafiQb0FVvApx7aUAs5dwqzM8rsgWRGYY4wKolpz6QSxryOID1Cqt0F9R6RECE
         cfJA8kJv6YOUbIA/FysOezBnzhHIruKm2Jq7dWe0LPkSaZJsBDaPwdmKeuvswbEXAPTk
         ZAxvFGAQ5dwWPqnZOSNDw8MI6upZhqznj06erZqLo6Zzjo/IU19CTKF8muN0AnR1t58J
         +YpNtL/VH7Mvf9WhYutCGqdAU/t5mtrW3VB2zF9ZVZqeGjb2dIPioqKk3ArmRRDatvII
         itAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544309; x=1698149109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0sgIJXyiWCMH9BTQoi/ajBzkcQtsuv8BX1pVGl7zGQ=;
        b=Zyo6zf1d+CqTe8ecr75Xf/aDWSRIXAgGxKUvBC/bPlodwPswKfr5PF8RO+1f9fi6mu
         Z+3ByNT2esknvmgKJkxhJfAAGS81sdKa3csCl7z9Ig9r2Wncz8whf/5VUZxQuDTTex5t
         y/sjDpjCLo0iG86cfrk5dEkWs+QwAVSCktAsS698hb3pbR5JHvGBpT4tx0AVLhpMZiQV
         4drjbBh9ZLahMnKCt1SCd/HNhnUvYPummHAJW6MqGskg7Sr+j89u5eU9KTucJJ61jZ2U
         pkGr3BH/+534Fv56Yvq+KGeWiZ9IrC2QziXcBoQ3sH8RIMlrhQdMCTNTluj3oYo+z6GQ
         h0+Q==
X-Gm-Message-State: AOJu0YzmeF6abZhwbdwL0WqwXf9BAD/uD5jEen3PolpxSF5tfjxezJXs
        X7YJVowUzlwg6rOm6WqO+f3o0g==
X-Google-Smtp-Source: AGHT+IE/nc5I9+GQ/o41DO0BGiv6vt7/H/Y2JrbO9sOo2jK12NQjN+mMyMStCbfFk/vnHBmjDZb6zA==
X-Received: by 2002:a05:600c:1550:b0:405:4f78:e128 with SMTP id f16-20020a05600c155000b004054f78e128mr1625995wmg.4.1697544309333;
        Tue, 17 Oct 2023 05:05:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:08 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 21/73] pinctrl: ocelot: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:39 +0200
Message-Id: <20231017120431.68847-22-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ocelot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index f8ae2e974221..a6022d44ad6c 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1779,7 +1779,7 @@ static int ocelot_gpio_get_direction(struct gpio_chip *chip,
 static int ocelot_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int ocelot_gpio_direction_output(struct gpio_chip *chip,
@@ -1795,7 +1795,7 @@ static int ocelot_gpio_direction_output(struct gpio_chip *chip,
 		regmap_write(info->map, REG(OCELOT_GPIO_OUT_CLR, info, offset),
 			     pin);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static const struct gpio_chip ocelot_gpiolib_chip = {
-- 
2.39.2

