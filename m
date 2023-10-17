Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF687CC28C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343827AbjJQMIe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbjJQMH3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:07:29 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0C112F
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:31 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c515527310so38319291fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544329; x=1698149129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmbOot5RLrw4dhGM35wwQDK66NpZcPzXz+VcMMZhqQw=;
        b=AR6rAWDOWbPt1AtkTSN3PTMBPkj1L2qTPmKSbC9w0hTqO3CZlDkRQk3iFVCDT5gwLx
         ETKyUcbJrqsrrVE2pjFKzSh/j7Vhu2tFcSSd+O+oKrpBdxSfCni1365N9URaBGeDgyK5
         SliNmYGXGX/6G0Hn4KptzXL5RJXDPkkOsg8KRcZvh0kXk73gvJlmcsOEDv/61ldsVhlC
         szomGA2dGTqt92j3MytV0lVW9sDtI1zlc3eA7n5AY5us7Br3m8YU4f0YgX0WMKFu70L/
         thDl3wFILRP+G3q/+7h1/RcjFxyh2p9bvHfqSwjh1tq754bxxLBkLrELf7vY0CW5UrOW
         vumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544329; x=1698149129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmbOot5RLrw4dhGM35wwQDK66NpZcPzXz+VcMMZhqQw=;
        b=KweWqBQo/7bD8jx874+4rbPXHjSPYDvhsFm83fREI0DqwQIV+wc9OCNRdU1g9vKL7M
         UcxwYJ/H1hOZWwjq02aMRWYN9uzORoskusQcW9589Ya/rVfdz11Qf+b2s903CHKicej2
         HUxjsdk3tSm03OQgLCfRVullCBagHlDpFRGednQogc+BE4CQlbpm7QAKDgetv3AJPfJb
         uT1fdLjlhY0w4TpZqvhsjNpDmdo+ify9lYuTIopZyF9WU+ApTOQ7IKgIfIMpqUrSpGIC
         gmfaL0yzKXJv5rsB+xR6zsqkwXKd9V+vXkxjJcHDKnykLWPyHM/NlVCxgMZBI94Wyosd
         HcqQ==
X-Gm-Message-State: AOJu0YzGGZ/aDMwEa4moXPoxV/7kUfAFgB+Oxk9g7WmIyQ0M3XYcahbD
        9cLKSOJ3cZPdYNPICok/Ku6+nw==
X-Google-Smtp-Source: AGHT+IHnnbArgK7X3e7NA50LhtLme/ELgZolnw+hJhzIV6zoyJbs7diRLj3gP/grQYP7SGxh9SaD3g==
X-Received: by 2002:a05:651c:314:b0:2c0:21b6:e82e with SMTP id a20-20020a05651c031400b002c021b6e82emr1509394ljp.4.1697544328832;
        Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 42/73] treewide: rename pinctrl_gpio_can_use_line_new()
Date:   Tue, 17 Oct 2023 14:04:00 +0200
Message-Id: <20231017120431.68847-43-brgl@bgdev.pl>
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

Now that pinctrl_gpio_can_use_line() is no longer used, let's drop the
'_new' suffix from its improved variant.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-cdev.c      | 2 +-
 drivers/pinctrl/core.c           | 4 ++--
 include/linux/pinctrl/consumer.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 54ee075410db..02ffda6c1e51 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2287,7 +2287,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * FIXME: find a non-racy way to retrieve this information. Maybe a
 	 * lock common to both frameworks?
 	 */
-	ok_for_pinctrl = pinctrl_gpio_can_use_line_new(gc, info->offset);
+	ok_for_pinctrl = pinctrl_gpio_can_use_line(gc, info->offset);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 881845395885..20f4b655aa08 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -755,7 +755,7 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
-bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
+bool pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range;
@@ -781,7 +781,7 @@ bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
 
 	return result;
 }
-EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line_new);
+EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line);
 
 /**
  * pinctrl_gpio_request_new() - request a single pin to be used as GPIO
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index aa3a7a7ca52d..4f9ead7f65d2 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -26,7 +26,7 @@ struct pinctrl_state;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
-bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
+bool pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
@@ -68,7 +68,7 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 #else /* !CONFIG_PINCTRL */
 
 static inline bool
-pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
+pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
 {
 	return true;
 }
-- 
2.39.2

