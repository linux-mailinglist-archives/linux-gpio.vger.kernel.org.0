Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C61ED7B6C2C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240201AbjJCOvm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbjJCOvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:38 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A7ABD
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:32 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4065dea9a33so9885185e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344690; x=1696949490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2xq1c7gkK7UBvFiiWYtPT4/dVB/RGOfCXDnH3L0uQ8=;
        b=E8TWi5ZzdtTPUndB5aIkSwrT+UoIbnDE16ENBJkYNXs6f8Ypr7JDmSpftSUvrHaVhG
         051ke8Dx72b/a6WG5H6+8pY5pxWAVShfVLId9I1gBngjEHqSzRLVBVrFf63bhqrh3YNm
         oO2U1tc5d6c5miWAnvG/E7HvAuEHtqqBZMUloVmUAMGyD+7wQp4SUCtuddgTr/LyGzQI
         /7nhlkaKWaJUKO+CjVoCzTHPRm1MJJoOna/IXgBfpagkg6jIgIXIgNhbU+mddCSEc4fp
         M1Ro5lCtEe3UEJ7Auo2TGFnQc0FNT29PjyHhvn8lpvcYa8dfqAD92Del8LPrqJAJJ6TD
         GpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344690; x=1696949490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2xq1c7gkK7UBvFiiWYtPT4/dVB/RGOfCXDnH3L0uQ8=;
        b=KhZSWeQtqmNMNZssPf/++CVq8cSNMBogmYFhK6zrrqU9DCtfCOz2SJpna8qFNpsZ+U
         VMN7lfMawneKqcS/a75R3CrWej6I4jfslzZFYVxtMK4QyQGxhwNo0xT6H8EB+8+4ojDP
         1osTH2YflEvEY6FFd+NaCU4QyUH33kTL7JboUaP4d4e4giqO03kCtbR91kiU/yJSPNa4
         VDAQQl7DORGlaljyV1WMxpaG9XpzFSwPzOPR48dY3fHD3ZW0mQ1xqemft/1ED7KTwvST
         cIJvPZaTJbLCuohjyQ0GT5USwqeAMqBE9vtua4NVXdOW2e3DJyWLk5DdvhFFSEi+yKTO
         rBPw==
X-Gm-Message-State: AOJu0YxcggqD7E/BMqsrWd6mVtE0ZolninaqX982bJoPXYbV8UZgZmTo
        +a7wXGMPT2D9AOTUE7IIKGY+aQ==
X-Google-Smtp-Source: AGHT+IGkb2Fy/8zq40r4KIx9nHVvna1+yMixR2m08jCrRwmuRm5uyopHERtqBMwV79wlXMrxPVxwCA==
X-Received: by 2002:a05:600c:21ca:b0:405:3b1f:9691 with SMTP id x10-20020a05600c21ca00b004053b1f9691mr14309451wmj.11.1696344690515;
        Tue, 03 Oct 2023 07:51:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH 10/36] gpio: pxa: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:48 +0200
Message-Id: <20231003145114.21637-11-brgl@bgdev.pl>
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
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index cae9661862fe..2fd797b91270 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -260,7 +260,7 @@ static int pxa_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	int ret;
 
 	if (pxa_gpio_has_pinctrl()) {
-		ret = pinctrl_gpio_direction_input(chip->base + offset);
+		ret = pinctrl_gpio_direction_input_new(chip, offset);
 		if (ret)
 			return ret;
 	}
@@ -289,7 +289,7 @@ static int pxa_gpio_direction_output(struct gpio_chip *chip,
 	writel_relaxed(mask, base + (value ? GPSR_OFFSET : GPCR_OFFSET));
 
 	if (pxa_gpio_has_pinctrl()) {
-		ret = pinctrl_gpio_direction_output(chip->base + offset);
+		ret = pinctrl_gpio_direction_output_new(chip, offset);
 		if (ret)
 			return ret;
 	}
-- 
2.39.2

