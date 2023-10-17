Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA027CC2EF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbjJQMUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235163AbjJQMUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:20:17 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2189B2710
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4079ed65582so4544645e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544348; x=1698149148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mWMEsrepSOyp3f33hvoi4PwifoeQU9K1dcaB1U/fvQ=;
        b=lt0otnXuA0fRwjdGxBS2T9ffQSHVaBNOdDaKniXDdeNy7j2ytKFjfILQlMOABif4v5
         16/6pvzYJBI7jpAgtn7hxIXl4IUVJjp9YIo47bZ4JI0TAoeDExCrEq/Wz5wTV7TMkXvO
         E59NILp9WCG6rBx7SSYXs92BnlgWFHCcGE0NluvYajj3g4CkahAxhHdTNa34q7SkzmyW
         u1z8BHEUPbfBAQcAo/Mg88szNqb7O3l3YKyfcFRE0N7NsQbCjBO0RIFKlWuQFzMLa2j/
         Y9Ftd8/KZ0iWOYLAudHq4JX2q5plQj7qR/wwwaRBJXfp6+/2JMDtKf+ivybMqJCLt3vh
         NHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544348; x=1698149148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mWMEsrepSOyp3f33hvoi4PwifoeQU9K1dcaB1U/fvQ=;
        b=TcKWlaPRtnKvaK8/O9wRMCwUjmAYodOC/m4G1RkNAQZ+cSZj/+pWy7ha/zHe0UrKPm
         tFCf7CG8hupOOKUi2zJTUydwH0jNfilPHlP5JmCkwIjI9HGwzsYNw2Zq9UrTzIO8TX88
         fMKJjD2zh0qqsgPEZgQdy6wNOD2NIczzFRgiXlUOo8DlkISHIxUHWzo83SWeJihViNmx
         7h1SksfsPGj89xom7bWCOT5LyKCcFPRllfyBDX4mvfUfl2yd/VUy6qUsCYjOomD5dOzc
         5Mz0I/VzXjGXKd+5+CGDymsaXBKnCJCVR1FeSJ+svngSaQqPGHkdmZlpKKFsqnN2roxs
         hu3A==
X-Gm-Message-State: AOJu0YzTjEvlmLG9KA2t6RTdGqI95qWTZ/nxssXNzyHvtl/QLpGlpMbK
        p6uhxghLGduVbt225hXKfUUtTMGCcefoHy7qfBk=
X-Google-Smtp-Source: AGHT+IG8mdi9OfL/mb4nEczReux6y+URj0QBaTlkrL93RcdQsWKDQTtHT10AMRkdA0nw1j2biSEk8w==
X-Received: by 2002:a05:600c:1d94:b0:404:74e3:27a4 with SMTP id p20-20020a05600c1d9400b0040474e327a4mr1593975wms.40.1697544348017;
        Tue, 17 Oct 2023 05:05:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 62/73] pinctrl: rk805: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:20 +0200
Message-Id: <20231017120431.68847-63-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-rk805.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 968f066eb9da..56d916f2cee6 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -286,12 +286,6 @@ static void rk805_gpio_set(struct gpio_chip *chip,
 			offset, value);
 }
 
-static int rk805_gpio_direction_input(struct gpio_chip *chip,
-				      unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int rk805_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
@@ -330,7 +324,7 @@ static const struct gpio_chip rk805_gpio_chip = {
 	.get_direction		= rk805_gpio_get_direction,
 	.get			= rk805_gpio_get,
 	.set			= rk805_gpio_set,
-	.direction_input	= rk805_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= rk805_gpio_direction_output,
 	.can_sleep		= true,
 	.base			= -1,
-- 
2.39.2

