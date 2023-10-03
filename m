Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2766F7B6C2A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240236AbjJCOvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240192AbjJCOvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:32 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76213AB
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-406402933edso9800445e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344688; x=1696949488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H58FBovONkBFAtGhn37zN4A9drmVE/E2kcDVb0X5d1o=;
        b=N8tJVom9Re4DmqsnYQNTN025giyqow9d/SCsYtRMq/oHzFozLNHkKcj/OLJTLw/Gp4
         JlGu10feB5oGneyc+CxLykBY+UDVlpm94koxalHnmAhjisp6VeYpDpNxFmeuYpjClRFH
         BLcZ3Tpu9Hiwc6ZQEo9L4YWZSfnrT/VnslioZN7WppV0YcW1Tq6UwVsq6QzX8pf9EX8v
         vkNxB53kLweKmBIghp+VhrWcEKaOacKHl0H282pu0uKsC6SXVzzI4O3yJ1663MBQndOT
         Aeq4KZOYuQ+AswMOFlUVAGPes/IvMj+Aw1PiNSKOgJT3LahwisO7DGZNkLsnKlnmNMy1
         3J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344688; x=1696949488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H58FBovONkBFAtGhn37zN4A9drmVE/E2kcDVb0X5d1o=;
        b=ewPTiAReFo/8TmSLxbF0w2E8Ceyaq/DKnMGRVs3/HK+1S2HSD0PGhZHUl6eaV3bpgM
         w6GFoLsFXwzuB3/TBjsT+hhsnG018+u2yV9nBLb7P0TnDfxxp+M5L4cwL8xr5HF88LCy
         0jK+hrnglRyIyRqrc/VHPKxCnhoP8lRbADXcP2MlMKKrV+DspOF/Jcbo2NNUedZ6xMbE
         91ZM9xK6IETF3XvzFVWzZcZlmLVgCdQptSVDDzHvcy2DvbAMgjJ3P+TbR5j0wtmJGug8
         LE+Bc2XKhXvxU1nPUG3h/EFn1CKaJs7djre1QlJdgJsBrntJIT6GPq21UZYXGgj+KHzg
         gzUQ==
X-Gm-Message-State: AOJu0Yy45ZTFyxQsqGSb27C9uXP8IXjZIToJNE3M8hUXu8RCiBpFH1fz
        mdvefYrhobbgVKR4vUSaYaj9djJsIL7amvJVyQg=
X-Google-Smtp-Source: AGHT+IFL9RZLYwtKAj88CDL+UKJR7r9Y9ziEP9MY68xteGhRUj0BtPvdYyQ1K611Qjp6ZXGfcPKi5w==
X-Received: by 2002:a05:600c:1d9d:b0:406:5463:3f51 with SMTP id p29-20020a05600c1d9d00b0040654633f51mr12476502wms.25.1696344687920;
        Tue, 03 Oct 2023 07:51:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 07/36] gpio: em: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:45 +0200
Message-Id: <20231003145114.21637-8-brgl@bgdev.pl>
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
 drivers/gpio/gpio-em.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 858e6ebbb584..35c65ff43f71 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -229,12 +229,12 @@ static int em_gio_to_irq(struct gpio_chip *chip, unsigned offset)
 
 static int em_gio_request(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void em_gio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 
 	/* Set the GPIO as an input to ensure that the next GPIO request won't
 	* drive the GPIO pin as an output.
-- 
2.39.2

