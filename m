Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA037CC309
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbjJQMXI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:23:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbjJQMWu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:22:50 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E61116
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:30 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40684f53d11so62517795e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544328; x=1698149128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqh80WdRi0gOj4xJupqHqeCuK7TYCSZZE8MoyG0FXMc=;
        b=Jp9HR6nFwhdnzZ3rk2trcvAffihrRRbD9skIVXxL4UrSkktfEAcQ0zEBNNgc7DA57o
         lg6prSQKRZhqhDb7R1abWL0PdiKfT9ZZ02gunA+qoYz2GAhmDIz2US8pNmzZC/R6hqkn
         iaSHSLts84BPCmm3AH/+M2s3KFNqDpwdxxKMAwy/kY9qpTTQWELq6z+4T9F9uhQ5sHOF
         gRJV3rrQefVLG7dFeTsjOZ4NMgv0ETSZpvtE+34IzWQDjP1mBWjwMxk6nEtaz+WNIAzs
         mO1CD0WBwKZPoRQglRTWGREK9jZzammWM+SMsrS5Fv2ymUArnannog0ymacwrs2xHlgL
         FEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544328; x=1698149128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqh80WdRi0gOj4xJupqHqeCuK7TYCSZZE8MoyG0FXMc=;
        b=Jtls5yYZnPX9B1tpTfcpRcBLUantY5MezKsBYHejXFgpMcFH3KLZm13XejZ4zxGEs5
         +fdzb7JInfqRH52fYKQjspT5nh3wOXXvSSI310XdkIhEaP/yA6N5TkHkPSNPJTiDyV9f
         V2IHxJC/06iP/0916hHe1cWfpcGLrh3Ulloys2uht7EeP0TaftsLSVAcr5J/yV7dPwDY
         ia0/y9FjU0TouppzEyX7I0KnWVvUW3DmnjVZR9CpfBYfIF8kWeC+3hzthgA4KLvwF3HG
         0HbqzeAlfMDhJFVPN5BnukhWv3HcHrC+YXa5KN+K5vXyRM9hG5VSJORrWbZ4zJu1CKqo
         abhw==
X-Gm-Message-State: AOJu0YyWt7gl4CoPJ74POaVLP/gPXlGvVU8WAIZec4s9cz3lXhH0GSQB
        Kr4eJaqgFGuJPbfTyW+PH1OeEQ==
X-Google-Smtp-Source: AGHT+IGtqD2NSdKrkdy2YLUUP3llJ/HF4BUPh1V5oC58M9d5555REcKLTl3cSqEFX6D3mS1v1zF0ww==
X-Received: by 2002:a05:600c:4f0d:b0:405:37bb:d940 with SMTP id l13-20020a05600c4f0d00b0040537bbd940mr1723644wmq.0.1697544328006;
        Tue, 17 Oct 2023 05:05:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:27 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 41/73] pinctrl: remove pinctrl_gpio_set_config()
Date:   Tue, 17 Oct 2023 14:03:59 +0200
Message-Id: <20231017120431.68847-42-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are no more users of pinctrl_gpio_set_config() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 38 ++++++++++++++------------------
 include/linux/pinctrl/consumer.h |  6 -----
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 0d66b3d5e685..881845395885 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -904,27 +904,6 @@ int pinctrl_gpio_direction_output_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-int pinctrl_gpio_set_config(unsigned gpio, unsigned long config)
-{
-	unsigned long configs[] = { config };
-	struct pinctrl_gpio_range *range;
-	struct pinctrl_dev *pctldev;
-	int ret, pin;
-
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
-	if (ret)
-		return ret;
-
-	mutex_lock(&pctldev->mutex);
-	pin = gpio_to_pin(range, gpio);
-	ret = pinconf_set_config(pctldev, pin, configs, ARRAY_SIZE(configs));
-	mutex_unlock(&pctldev->mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
-
 /**
  * pinctrl_gpio_set_config_new() - Apply config to given GPIO pin
  * @gc: GPIO chip structure from the GPIO subsystem
@@ -938,7 +917,22 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config)
 {
-	return pinctrl_gpio_set_config(gc->base + offset, config);
+	unsigned long configs[] = { config };
+	struct pinctrl_gpio_range *range;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
+	if (ret)
+		return ret;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc->base + offset);
+	ret = pinconf_set_config(pctldev, pin, configs, ARRAY_SIZE(configs));
+	mutex_unlock(&pctldev->mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index e25e9b0599ac..aa3a7a7ca52d 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -33,7 +33,6 @@ int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
 				     unsigned int offset);
 int pinctrl_gpio_direction_output_new(struct gpio_chip *gc,
 				      unsigned int offset);
-int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
 int pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
 
@@ -97,11 +96,6 @@ pinctrl_gpio_direction_output_new(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
-static inline int pinctrl_gpio_set_config(unsigned gpio, unsigned long config)
-{
-	return 0;
-}
-
 static inline int
 pinctrl_gpio_set_config_new(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
-- 
2.39.2

