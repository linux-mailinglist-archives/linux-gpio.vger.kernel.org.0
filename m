Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9E17C5325
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346812AbjJKMKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346864AbjJKMKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:05 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B3C1A4
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:38 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so63086305e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026167; x=1697630967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks2t/2sFBUuZyfDpT4cAX7qKrPmH6DMrQUqaUAZXib0=;
        b=o91Zf7B6sCrisBCXWYTy+Y8B3svAz11INSZBIK56Dt29JevW44M5RBIjoj5osCW7zT
         TDmuOSyWJvW1MOke3yZ5QmW4HOd030bJnlBcBcYfnmxG+2mGucpC7x9vuox0fC/lz0kB
         hU6NJjoIs81yyC1zSrkwkrMTzIxjfyMwszjhDoC7VAqmLisvy0dqJDmlp3VVvQ9hC1uS
         gI4r9YNV7uHgGe3AbyfTf497bQWyfKmL97C/BbU99FN5rTBx9DED9qULPWbyQFoHufoL
         a/HF8b1EnhzsVyBx3PcUigzNGYwourjxMlQZXrGzNrwixw4WiBIPi9/1Y/XLkJlKBa2i
         O2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026167; x=1697630967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ks2t/2sFBUuZyfDpT4cAX7qKrPmH6DMrQUqaUAZXib0=;
        b=LwvUbhJYya6meg0GioYKjcreosMKS4O9Q8P7ZYuH5sW5N5D0GctRhQsDQG30Ok0srr
         sp3dsEk/05DLNmeke5O+jouVlvPqy9BMZ2PrZKYLh3yqTKyazi0sUMcvEl1aeqguQkEU
         Hie/XDQiJviNI3m6f4apCbzSfZNESgauXPoR9/TtP3pLvKqnwA9iUhreIiSf16VXX85X
         Fpc7sAFJ6f5bC6BoZmNhCxHAHKrSrjPJpRPkcHfttctHKmMzy9eoaCkwzOeGdeJAsCG9
         tI94Mj0YZvGiZhVMwiuR1LydCZZlp61XW1yqpCkM3I5t7WfEqQzCmQ1OeWBF1cv7uYrh
         aijA==
X-Gm-Message-State: AOJu0Yy/gnnl/m63nqQqLdbBu9wqYIIHmEXtVB/ZRwp9VzUpnZOq4J7p
        ryJ7BzTpbed44wi1UweIjufE6w==
X-Google-Smtp-Source: AGHT+IGQ7kZP3ui4mKte3UXb4BLNt8W4dnf/QQsGRm5dUL/HK9k+SRNYUwn5j8g/dvS5QzMHz28epw==
X-Received: by 2002:a05:600c:2154:b0:402:ff8d:609b with SMTP id v20-20020a05600c215400b00402ff8d609bmr18248812wml.33.1697026167228;
        Wed, 11 Oct 2023 05:09:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 22/62] pinctrl: mediatek: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:50 +0200
Message-Id: <20231011120830.49324-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-paris.c      | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 889469c7ac26..dc41ffa31357 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -512,7 +512,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -520,7 +520,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 {
 	mtk_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 74b15952b742..fc046415b567 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -811,14 +811,14 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_input(struct gpio_chip *chip,
 					unsigned offset)
 {
-	return pinctrl_gpio_direction_input(chip->base + offset);
+	return pinctrl_gpio_direction_input_new(chip, offset);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
 	mtk_gpio_set(chip, offset, value);
-	return pinctrl_gpio_direction_output(chip->base + offset);
+	return pinctrl_gpio_direction_output_new(chip, offset);
 }
 
 static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index b7cb5a1f1060..14b151aec2f9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -916,7 +916,7 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
-	return pinctrl_gpio_direction_input(chip->base + gpio);
+	return pinctrl_gpio_direction_input_new(chip, gpio);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -929,7 +929,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 
 	mtk_gpio_set(chip, gpio, value);
 
-	return pinctrl_gpio_direction_output(chip->base + gpio);
+	return pinctrl_gpio_direction_output_new(chip, gpio);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.39.2

