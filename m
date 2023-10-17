Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EAD7CC2A6
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbjJQMJx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbjJQMJN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:09:13 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7DE189
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:51 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4079ed65582so4544865e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544349; x=1698149149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlzkIOQCjUnaLQIijso5Hp4dS0y/amt7GTYGhDxNGpk=;
        b=vILeJu/SGi8uYS7u4bdsmG8n+Jt2CcWOXKNhBuN6LgS5+tB8xba+e8mkgpwF4P/B4t
         6bwraGL59wnQoyCYAT3Fpo72ThdLRCmyCC5JoQ4bUIWMPkvXdFmq1P6qylCXLQQE7DSP
         tPDee4dG7B9jyaPG0NiK3f/ydnMLIk3VwEQRQzucdnQibu0MiFjr0EiPjWro4xmYgXvY
         l/+xv5S0NjwOh1x0CuavjlJvOiqsMWnBSHapiR7EEU6cHgyMNb4gPuAr/xw7NWJhBvOo
         HT/GATKUD5GpY1Cx4OcooAF3WLcG3AXZvvk92ZsAz2ZmqR7SueGc+4QiPQAoWd0QNWpQ
         qNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544349; x=1698149149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlzkIOQCjUnaLQIijso5Hp4dS0y/amt7GTYGhDxNGpk=;
        b=NCAUL5fENOV8uJK9KYQgrlhbi6VRAWMoJB/bIITpg9VsPks2MCeVdLnW8dk3rw1QNU
         PUX2STrD7bvBRqvbV4Z8ux0hnuEwSjW57eLoU71x6XVdQ04GN6zged9Udbxjxi0WZH/D
         TMvzI18HlYwwW2YofKIlEdX8o6qfh9iFowBX2nXlhNYtQWfaZRx7pZY196ni8+YhFhUh
         rjy68RGfXv0y8HXFFVU++IDud99OP2iIQz6XAIIDmpSySZo33SEN6ZH4ueE8l8HPrVs6
         EcHrAlohFHM7Q3pCUvc1h7zr+63CKWE1TrJ58iaSLuunQPrfuZQdo2snSRnGAOlTp+f3
         Oe5g==
X-Gm-Message-State: AOJu0Yw6t8F+trx9b8Vq/5TCn7ySs4D0B8bPvRwzqSvnZ1lbjMEAe2Gx
        fxjS6a3UASXMBehiMflfJsJcRA==
X-Google-Smtp-Source: AGHT+IHKAhNxHGMZwD12fpBu9rtiYo7vwmeRY7ABks2s9oTibAZ6b5mFhWbrDyN7Os3NcQouNImWvw==
X-Received: by 2002:a05:600c:1392:b0:406:513d:7373 with SMTP id u18-20020a05600c139200b00406513d7373mr1749009wmf.11.1697544349588;
        Tue, 17 Oct 2023 05:05:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 64/73] pinctrl: mediatek: common: drop the wrappers around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:22 +0200
Message-Id: <20231017120431.68847-65-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrappers around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 41e9847e3085..e79d66a04194 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -808,12 +808,6 @@ static const struct pinmux_ops mtk_pmx_ops = {
 	.gpio_request_enable	= mtk_pmx_gpio_request_enable,
 };
 
-static int mtk_gpio_direction_input(struct gpio_chip *chip,
-					unsigned offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
@@ -898,7 +892,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.get_direction		= mtk_gpio_get_direction,
-	.direction_input	= mtk_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
-- 
2.39.2

