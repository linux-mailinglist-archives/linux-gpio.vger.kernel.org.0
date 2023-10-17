Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC2B87CC25D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343678AbjJQMGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343552AbjJQMGH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5070610D5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:14 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-408382da7f0so619635e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544311; x=1698149111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7mQAW/gcS7bWGdM82oN9G3UwAV92bdGrqJQuitFsrM=;
        b=lr7mzP4MsyiUqnqqwfT9kA05p6E7NRFjKKLoTq/KCa5pGM2HqcO2UInBL+EjH53fzL
         8dwMHMJngYAAZ7tj+THX7x/6kcT+k1SMYC5zJXkyWLUkks8BBrl/we8nMfbpzvfkHRM9
         /cbM4w/6LlBs2T2E178pbsvuwpIyTd20mF7oiPNdi7yjOvY5Z5Sx02caFTTFUPOEtg+Z
         nNvVqBWENk9FpKvbhSahTJEZWU6E+S0fpfcDy/1on8/eDmyvQForm0rk2wHPxDKLwz96
         CdD9BuechMLrghdvMsbcKKny661D4Yf/JhnNbLa13kIT+sX9YtPHQp4MRDAjWo4gwUGq
         FVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544311; x=1698149111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7mQAW/gcS7bWGdM82oN9G3UwAV92bdGrqJQuitFsrM=;
        b=W6hm/d47Gegv3cvrAKKAmXHtSirijtJLemVqrj6rb2DBrUma0s5cltXP0pyO17/hk8
         7eLaQb6oMJ7r2I8AyVC5gN2jj5yLbv3OnasiR/Ap8StsAKjszhGnUz+WyivYel98+Z4l
         M2Jea0FIdxHptf5tx8SRS4HJ0+pMRAU7UbTpgueg0r5tAxt4PR5LUu4WzZgM5BVOayOS
         VniA+J24IPX/HnwdbbnDCvLCibgpXNZ5CPh3ScKg8mf7CaQSy/rAUkGuwf8wdiyZyXi9
         QeM4wmx2zvXR8zrR0niFKvQ5zsNoIoj4wYXPZhAkiGbqBBRU7Lp0zTDs25hLcKHCeE8e
         baFQ==
X-Gm-Message-State: AOJu0YwjE99gu08P4GGTJ5xYsX1fUSHStAYxJxmwY5pjzhcA2wk8J8US
        ZUfTa7sbapIuojXlOlJphSo7TA==
X-Google-Smtp-Source: AGHT+IEzhjgOi2CL2N9u/A2zUe36QP/uG4RQiBPIaBY0sv5A2CMkLJO65L4EQaqfAQVA6Bb3QdLp/A==
X-Received: by 2002:a05:600c:4e8c:b0:401:906b:7e9d with SMTP id f12-20020a05600c4e8c00b00401906b7e9dmr1617989wmq.18.1697544310895;
        Tue, 17 Oct 2023 05:05:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3 23/73] pinctrl: cirrus: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:41 +0200
Message-Id: <20231017120431.68847-24-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c   | 4 ++--
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index c09646318419..097e4dcdda36 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -508,7 +508,7 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int cs42l43_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
@@ -516,7 +516,7 @@ static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
 {
 	cs42l43_gpio_set(chip, offset, value);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int cs42l43_gpio_add_pin_ranges(struct gpio_chip *chip)
diff --git a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
index 0b78cf611afe..f3c8a8c14e14 100644
--- a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
+++ b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
@@ -1098,7 +1098,7 @@ static int lochnagar_gpio_direction_out(struct gpio_chip *chip,
 {
 	lochnagar_gpio_set(chip, offset, value);
 
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int lochnagar_fill_func_groups(struct lochnagar_pin_priv *priv)
-- 
2.39.2

