Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329BC7CC273
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343536AbjJQMHb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343692AbjJQMGs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:48 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC92173D
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:21 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507975d34e8so5737084e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544317; x=1698149117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=647iAq3iBI+ayvQVhhErvz6gPvZUyIZ/SN8sLbjPkvs=;
        b=PrZmBJnCFQbSaYmMWwaI9AeJY7fxDFfdHwF8NX26R3vDo8OZTWe6gqPdO2qh08/jZ/
         oluVvqojNnMi2o3WWdzcdmuL01mJtpV1hZ/UK9wF1ASk5ArgzKkBdyaGxciVRWD5dZjv
         cMneXcZqDp16IrEPMn4qpP+a2KYAUB6hpzL1w1ERdYstYMhiUeTn8OQJaiES7V1QnNBC
         tFsSlY8jHFn3QQo0Us+RF0unQgV0s++m4pAnQakjnrJ8Gx/2cVsEkXI/uO4TNxpP6BCa
         V5n5CTe8ObXNlIl73izYEe22IdFNshuPjjvD4IruAYc0z4xL2q5Wh5x6vtJGwBv54gOF
         kHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544317; x=1698149117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=647iAq3iBI+ayvQVhhErvz6gPvZUyIZ/SN8sLbjPkvs=;
        b=CM6B5i4VABUacJwmiEjE6Abugsy7rIyIJlWCxW49bJfHAScdBUFH7br2AfpmXAjKe6
         Qx3CSqSL0eCPgEETpuJlgECQYgt/9the2bpJ8qaEL9bZhKu8GoY0bONaC4Q1cxwpZbVg
         oJy5iBuZZgG0lV/ByhbzTgo0rU3l+y9OTeDjg8196dP3gCEaQiCYkewQ6O+Pc7OSJ/fI
         FKj8wbMIX6JE1vlSWacOKh+ErclArsqzc1vpnKCulWOfLmZea0ptVM1rRZSAmyyBqx63
         OWb0LbWDYfLdC6I3BanOVXMhDaZneYPU8uj7J7CMy25139FHPNu7Aalw6zpW/WkJQHoh
         +e6g==
X-Gm-Message-State: AOJu0YyImWkVyYaHQOjgG1lX3b5ZUEHGrNyawTl/qj8dT8a4c69bZAmQ
        79TKhVewMSoLk+5FZeSY2MX/kyLv1u3U9NaGJq4=
X-Google-Smtp-Source: AGHT+IGNXONS2yCN4qhnOennX9MnXyI6ctcbHek+iYyOS02Bqbyc/A8eFqvuzL3jPIeOQy2QLGcD1w==
X-Received: by 2002:ac2:5585:0:b0:507:9608:4a87 with SMTP id v5-20020ac25585000000b0050796084a87mr1573902lfg.56.1697544316763;
        Tue, 17 Oct 2023 05:05:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 30/73] pinctrl: as3722: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:48 +0200
Message-Id: <20231017120431.68847-31-brgl@bgdev.pl>
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
---
 drivers/pinctrl/pinctrl-as3722.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 84b47a6cc3a6..205937f7f9a1 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -502,14 +502,14 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 
 static int as3722_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
 	as3722_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int as3722_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-- 
2.39.2

