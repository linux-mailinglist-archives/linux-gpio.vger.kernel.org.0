Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B377B6C5D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240253AbjJCOwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240330AbjJCOwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:52:07 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2841BB
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406618d0991so9908575e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344701; x=1696949501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L71FhZFxQS/v+Kb2FZmLTi+Zct1vRjkWo7sxYZsb/pk=;
        b=ehH9dnNkTsAFzKXl9wp5BTCtWFJ8Ib7oce23tSALCCObFjAhhAzfJjio2ZlkBzkGT6
         R6LfHkQHkCal2t2XHDtbND7AegPdgdNKV+nn7MWVQEPhLjEjDheULuzeDbyfIGLxNN93
         vkmvHah1FT8Qh9TllnIjftcGfWvu0Hu59UJON+MjUvsjKIus7qyL67bv1JqvPC7gGMA1
         +Q3RAQ7PyZE41gs9pief71F7i/ayKnywz+1k2w1CX1gIqWwBWo/iGBO70AUnbZFoqlUW
         ebmw8MJUuiLr051H+gD4Z7G5M8aKBoCIhn8vvoBHXeK53Cqyof/NVLSshS7cCVL3Wbd6
         RzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344701; x=1696949501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L71FhZFxQS/v+Kb2FZmLTi+Zct1vRjkWo7sxYZsb/pk=;
        b=USfaF/gWd+ynbR3IIY6yQyfJZ5D+Lx0brQr7jMaDkES1rjxx/Mz4r213nxqlzGHCIF
         IYj+lJK8zKPcbYtF6QqSJBosrHweuzsTvlcNcvM7M9qGsJcbB3K7CQTEt5ufYNV0BwA4
         7efTmz0XxqlIo0Ogu80qcHGAgFkO26MATU+jLmygutqlGROZpWACW38C9uOxqMfro7Z3
         /Pm0QdaatvxjzNZ+4HSbWCMsY3/cFMYkuRLnpcskvaZJbIeFvYaeReCupqn+FPsyFdvQ
         mFdcu9LbMAfPiLzxTQTK/AyF8BbC5MpAOf1KKsUkEhnbCvIjqphEa3Utful923sCwYfu
         GT8g==
X-Gm-Message-State: AOJu0Ywws7lzJxYFePj5NwiX1O4nkqUCy2oGk4ADK/x65Gin0oJ1qFHe
        Uab0i7BwP5JVOyOMuaCnkBx6tg==
X-Google-Smtp-Source: AGHT+IFpgJR8jX4WZ4MEHUckdWS9LRZrLndEAQ1pHTOpK8bldfDDXYffd5Wm7Bb0iTzDawrXwod0XQ==
X-Received: by 2002:a05:600c:2317:b0:405:3a3d:6f41 with SMTP id 23-20020a05600c231700b004053a3d6f41mr12365579wmo.22.1696344701465;
        Tue, 03 Oct 2023 07:51:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 23/36] pinctrl: axp209: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:51:01 +0200
Message-Id: <20231003145114.21637-24-brgl@bgdev.pl>
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
 drivers/pinctrl/pinctrl-axp209.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index 9f5b3ab8e184..d7f081f1d1f6 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -126,7 +126,7 @@ static int axp20x_gpio_get_reg(unsigned int offset)
 
 static int axp20x_gpio_input(struct gpio_chip *chip, unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int axp20x_gpio_get(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

