Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29057CC256
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343611AbjJQMGa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235067AbjJQMF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:57 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FD510C7
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:13 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405361bba99so50468955e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544310; x=1698149110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgDYd9Rguhjm4qQEjlLUgCLw45ItMDY7i661tMI87TY=;
        b=LlSS2DtzY4fcgC9sZwnpYo0Io/0oc/oxalLxA3j4fGHMLITZD3mHE5v+B82dYk77zg
         r0alUG0mKl5JAshaTAbg26j5b3/tyRzp9FRtXUK6u1TUbezllzC5rqqjDPLEHIjv3Kbv
         9bJmU1Btd2ql63Xz7m8aqrj8GnZpTXpz3ZThvgC+kFJ0H4QfenSBiFHJDLME0CizsvtE
         nJ9jwTvhxiW5de87KH8VL8K54uC6RLW1gwtwYZ03Wt3SCr4vaKNUMXii+mXnqxnLDMwK
         9ndkQBAb3RWmPd4vxTTI/0xSrHE1tsC7GPm1A7mtR98QzJI3C/EeWzkm69eTVAkoMS4K
         I4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544310; x=1698149110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgDYd9Rguhjm4qQEjlLUgCLw45ItMDY7i661tMI87TY=;
        b=gWQZYVjyDtfIcZpL8vdQXPo7GnJ6G/7EIysJ+dwWcty2rJBU1BUEdDfHeTfVNjHfpZ
         Sk+Kzc8xI009kOnP9hp2602b71FY7hddnywZMtKvXFmAHFi5Pe6cyzWwTws9alfY75Hb
         ujOPWQpLCq7Ka66IzADZ/dDTshm8hEAdZxAPDElkshkD6ux5ExcwzNESEdvQ5/ySejvc
         7P0MnfIa8rekNqY8YHzUvOnVh8fUWxUL8ie1iGij3ZbofFZwBUqCMU44NjaUbgiRaiPB
         2iWts70MiCgN5Cbq1JfbH2DWEhYkEz7OF6uSh4d6bhOsTitMGBHxDAnU5B2nHancwQyS
         gq5g==
X-Gm-Message-State: AOJu0YyCdDUwKbQH7Gkk6xqZfLZkhGB8+Zvh2njw/tVCRHFDy8ieCq0n
        QkkDPmkNzRDeiZk98FD8mYALYQ==
X-Google-Smtp-Source: AGHT+IHoqOXAdwuaCibM3AvmWGcF7ULgsBaShA2+HrC8/rd7yKj5B3ysn1O2JoofsH7u7HJrI45SGA==
X-Received: by 2002:a05:600c:4455:b0:406:4a32:1919 with SMTP id v21-20020a05600c445500b004064a321919mr1546165wmn.29.1697544310101;
        Tue, 17 Oct 2023 05:05:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 22/73] pinctrl: rk805: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:40 +0200
Message-Id: <20231017120431.68847-23-brgl@bgdev.pl>
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
 drivers/pinctrl/pinctrl-rk805.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 2639a9ee82cd..58e6dd932bc7 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -289,14 +289,14 @@ static void rk805_gpio_set(struct gpio_chip *chip,
 static int rk805_gpio_direction_input(struct gpio_chip *chip,
 				      unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int rk805_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
 	rk805_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

