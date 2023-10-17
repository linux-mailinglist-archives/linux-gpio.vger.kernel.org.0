Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21D517CC251
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbjJQMGT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjJQMFu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:50 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DF21BE
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:08 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-405417465aaso53788465e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544306; x=1698149106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPwuEwfRZF39P0qe4RqCU1p549Ra/xLyaMOsvkr04jY=;
        b=ALlXbgt/Wpe+uIRa0DokBqYy/kZo82Z+L2+Cf/9xz3lfmlQBonaNTjnMFjim9LjYiK
         W1qzz5BH5n21avQv6kGCq4UlEenyN7lYE3Km1kznSb2LZv/B03EHiSnWOnemFFzuM9jg
         lP/aFTLxhelLJr6uSBWavQaGSvVIUoPVWJQpxqwqBQc1Up888s6X5MWeOkm+EXh0fsR9
         +hRgYd/b5SmWq+b9t1bZAfk2+recJdvhmRXlsqCT/azwsvb/lE7lsOAUbQU/XL5qzJ/M
         LWR4jTokYfqgDCXDF6e6Rhfx5EVG/hJUiMKdlFw/7MnA1aeZxuLiopfPMzKx88/qgCmw
         VNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544306; x=1698149106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPwuEwfRZF39P0qe4RqCU1p549Ra/xLyaMOsvkr04jY=;
        b=MLKSZFbKrEi7So6xD6U7oD0x8vj07azDi3z7sJxz7GFOPCjCVqZNDl1tpP6zZXzhyS
         OepyUXrp04I9BkTr5UfXXP9EusBhibUCf7S403XParS90r5CNpPkQooWqggkAyxtgsmv
         iVEmyU6xMRik7xCvENOcAGnRsDKUAXB/udtqcNHyIeEAa+1TQKtqt00XpJW0pPjH3v2a
         8PpJyGP2g9D1jOJt9WHOosOyel17/TaUXw9R+ml1mgF4APapwpROOJlkU8GS7wFHVz8M
         pZhKdP64soEcDINor/Xwyx/duya7yUO6jB2yfb+27ZjktvgMqk/DFnS8js5An/lm/irv
         TIcQ==
X-Gm-Message-State: AOJu0YyG+40rLw+kbkdMtNWLTx3AOHzNjelhy4x9IQr8sjExpnNl4GRZ
        IJttwf7uEdCUSbnD2Bk+fP63pw==
X-Google-Smtp-Source: AGHT+IESz/519coifuniggGRbm/pl4zw6Mdj+LHiTmP7DPt4+Q992oqG7iyXA89aU5ehDoX/56Nzqw==
X-Received: by 2002:a05:600c:4e89:b0:406:3977:eccd with SMTP id f9-20020a05600c4e8900b004063977eccdmr1494323wmq.33.1697544305855;
        Tue, 17 Oct 2023 05:05:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 17/73] pinctrl: stm32: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:35 +0200
Message-Id: <20231017120431.68847-18-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index a73385a431de..11d9f07934bd 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -217,12 +217,12 @@ static int stm32_gpio_request(struct gpio_chip *chip, unsigned offset)
 		return -EINVAL;
 	}
 
-	return pinctrl_gpio_request(chip->base + offset);
+	return pinctrl_gpio_request_new(chip, offset);
 }
 
 static void stm32_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pinctrl_gpio_free(chip->base + offset);
+	pinctrl_gpio_free_new(chip, offset);
 }
 
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -241,7 +241,7 @@ static void stm32_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 
 static int stm32_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int stm32_gpio_direction_output(struct gpio_chip *chip,
@@ -250,7 +250,7 @@ static int stm32_gpio_direction_output(struct gpio_chip *chip,
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
 
 	__stm32_gpio_set(bank, offset, value);
-	pinctrl_gpio_direction_output(chip->base + offset);
+	pinctrl_gpio_direction_output_new(chip, offset);
 
 	return 0;
 }
-- 
2.39.2

