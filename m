Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76877CC276
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234968AbjJQMHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbjJQMG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:57 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B1819BA
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4064867903cso62408425e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544321; x=1698149121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEGizAbOxMwHBeRhJGcb8ss//xXj+RtWLOdU8JMZ+S4=;
        b=GIUDjfOeExe7e8WYs8tVMrgzRTUUx5dBVFxo6ksvEFa3/ohDpIyDJuQYP6xjFqki4U
         4Cs8s7K4XaZb7vyUsJ5hrW0g1y9spP/wgvFxTaFH+TGFsVP7fkQ75xQBBT/y/86O/Yr3
         boZ5ufFXIgKDgos+NOjZDJQlulU4UWmyNtxpXDeHHJkLTGUwy1OcwlGfwlN1eBGyAN1D
         IZeUI019B6iBhBV2jCdlcb8i53g2zVdNqA8R9FVhkFXfByhjlNQUGi8m7pRrCeant/fy
         DpEhjTeNGEjoG2un4xmjtMFanCq8nWM+HHpz/I+2QN2Y3BVvf73qPZg7zQr5Tw+jD2qG
         l/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544321; x=1698149121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEGizAbOxMwHBeRhJGcb8ss//xXj+RtWLOdU8JMZ+S4=;
        b=JwhLHMd6efQe7sR4gXN2ya00v4d0Rbe4xItsrGjJKjJbrDYDoQA06pBiqErvHZjjFk
         V25tX0c/vjKIMrtfbEFay+EOud6XOgCFCXvJE9c02P6V8B2pFnr4O1N53k7J8r8WRnfX
         TC7557ZbX6f/kE0/Z5melwbAjQK9Dbuj26UP16MEL03ufAZrfqh3bDl5qWaD5CDf0MFJ
         Sg8BXxKl0XScrvu9kMe92zjVj+QgswSANQbcooUYnj1KkRVIuBdYIAENO1gjpPBk4t+2
         t1O9BjJI37DuyfcHqfpcEtiqy9DYOLKYdbJHgNI7pvGjPPZZ5HXs3WEbwyHWYJh59R+k
         2FKA==
X-Gm-Message-State: AOJu0YwdwuJ8tPbNxPhsutu2KP0oZawpT46x8vINLvskssJ/XSJxAjfm
        Rbv8oZ+Y+n7NxN+nr45RmV2ESA==
X-Google-Smtp-Source: AGHT+IFIOngxq1pIAToZEwbs7J6cyGu+pyUOwiSkrMvmFdYAHXIOcaxr312ZZreBXjxOFPU3xWKx8Q==
X-Received: by 2002:a05:600c:4fc8:b0:406:53ab:a9af with SMTP id o8-20020a05600c4fc800b0040653aba9afmr1615188wmq.10.1697544321692;
        Tue, 17 Oct 2023 05:05:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v3 35/73] pinctrl: st: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:53 +0200
Message-Id: <20231017120431.68847-36-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/pinctrl/pinctrl-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index c1f36b164ea5..ec763572ab3e 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -719,7 +719,7 @@ static void st_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int st_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_direction_input(chip->base + offset);
+	pinctrl_gpio_direction_input_new(chip, offset);
 
 	return 0;
 }
@@ -730,7 +730,7 @@ static int st_gpio_direction_output(struct gpio_chip *chip,
 	struct st_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__st_gpio_set(bank, offset, value);
-	pinctrl_gpio_direction_output(chip->base + offset);
+	pinctrl_gpio_direction_output_new(chip, offset);
 
 	return 0;
 }
-- 
2.39.2

