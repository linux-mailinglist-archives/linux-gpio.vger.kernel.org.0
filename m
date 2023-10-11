Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3A07C5355
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346387AbjJKMND (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:13:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346882AbjJKMMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:12:41 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FB6410C8
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4060b623e64so5627005e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026176; x=1697630976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63WjOp9UsiT59ywyo99tyOEp/CpCY6vvpVWnONIBEpw=;
        b=peZ6Fsn4XUud0jFzjDcUHU7bu940Yb+Qq18xQh6tfTox0KEXXlHg0GzaVQBzZ1WrkW
         8LC6khX/Mqs5oj0I66uhoMua09XwyvbfO1RjDKdbsw2M+ntfysESyl9teV3K7WUuHivy
         PJNqjWhVX8sdgY9YGUpHOIiT0ZTigNSTZzLvKtmsO6lTuTZlStqC2LW3B0f7tJrVtUKS
         les8SHyNm34qh101w2wcR3UkdelzO6WU+P4ExnZp66nu1w6vmFQktbIfcedUFAaX2uHA
         1Y0Rcbp9XC85zRbXe9Jny/5cv5O99Wb0ZTT5075oFCkPakSTl9q2R7zDLRIIZFRzSJpU
         NF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026176; x=1697630976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63WjOp9UsiT59ywyo99tyOEp/CpCY6vvpVWnONIBEpw=;
        b=Dci3Md8rAdtSRgHyd00EFhdozZLvpzBQawGZK5RKAIlvzts/VlEmUFja2uDURMYOes
         Y1YJc9k5cIJnsyiGNaWMl+8PWUOs5yjO2PrcxHqLuo6QU6myN4o2pW4YafbK5BSMV8eE
         XtK6/Y184z00sjryQmaDYg/1NlG6B6PQyeoH5pd+3qskkNLRyVjIziiuXVWdyP2asEB3
         Kr3AOMaIxRusl0hOPDM3mSNkBJEpwHkBSND35q79MVyeLiGUoLiixZ65kuz+yMpx6JL4
         E2Cyk6G9vpOaB7m5a/gIrJJV5mtJCbewh1wDH/CFBJdKW9hED4IeGBdWKe9RefGocBnq
         RgLw==
X-Gm-Message-State: AOJu0YzdS070BPFoARsYqOpLUCcQsLC6MZf4ZtGbQs4pxkZAR+V3weEE
        x7sUPWEeu0EuMMp73pwKGX/2ZA==
X-Google-Smtp-Source: AGHT+IEGqgu5V+Pg/7nLvW82pyAyz6O9E0Gf6z4or3apid/QwBxQIkmDYnSVBUM+m6s5v++vocBDJw==
X-Received: by 2002:a05:600c:895:b0:405:3be0:c78d with SMTP id l21-20020a05600c089500b004053be0c78dmr13871009wmp.3.1697026176573;
        Wed, 11 Oct 2023 05:09:36 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:36 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 32/62] pinctrl: remove pinctrl_gpio_free()
Date:   Wed, 11 Oct 2023 14:08:00 +0200
Message-Id: <20231011120830.49324-33-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

There are no more users of pinctrl_gpio_free() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 41 +++++++++++++-------------------
 include/linux/pinctrl/consumer.h |  1 -
 2 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 837d35b0e5c3..6e163841d145 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -819,29 +819,6 @@ int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_request_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-void pinctrl_gpio_free(unsigned gpio)
-{
-	struct pinctrl_dev *pctldev;
-	struct pinctrl_gpio_range *range;
-	int ret;
-	int pin;
-
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
-	if (ret) {
-		return;
-	}
-	mutex_lock(&pctldev->mutex);
-
-	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gpio);
-
-	pinmux_free_gpio(pctldev, pin, range);
-
-	mutex_unlock(&pctldev->mutex);
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_free);
-
 /**
  * pinctrl_gpio_free_new() - free control on a single pin, currently used as GPIO
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -853,7 +830,23 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_free);
  */
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_free(gc->base + offset);
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
+	if (ret)
+		return;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gc->base + offset);
+
+	pinmux_free_gpio(pctldev, pin, range);
+
+	mutex_unlock(&pctldev->mutex);
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_free_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index ffce8d7dd0d3..467f02b0aa98 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -28,7 +28,6 @@ struct pinctrl_state;
 /* External interface to pin control */
 bool pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
-void pinctrl_gpio_free(unsigned gpio);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_direction_input(unsigned gpio);
 int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
-- 
2.39.2

