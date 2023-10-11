Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4DF7C53B8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbjJKMXL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235039AbjJKMWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:22:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9B511C
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:01 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-405524e6769so5547155e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026180; x=1697630980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym+lGOiXrLf/f0DbNS5vfxnOIvt8z3Dra3kRtB7r3BY=;
        b=mW72BsQjzS2uELChPLdKJcGvRE0RNG+FHz5J5TAxCnVeBXHXcf4cKdFjc+/0sZHmzs
         kivozQ5g+wMl2o+BfB+2lzaJFEdu1V22L9IjkrSLcmkhiIlCEjy2d2AO1H6nKcfmGhLM
         PWNk0i4CpajIv2JLblmAuiLXnSRDG/KcLiASBg9YGs767I4illxyjNko7BcE+d6Nxezt
         03GAhV3YUOehFrQ/RxBDC05efX+vs9CzRC2OhLZOykxtn+R10dPXSYrvo1CAVJV8XZl6
         qYjjz4EaNW5ehjDlKC/FxSeDyMDxlOv0MazN/yNFf/DS3adrAQM10xmeluqr8M/7ZebA
         4VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026180; x=1697630980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym+lGOiXrLf/f0DbNS5vfxnOIvt8z3Dra3kRtB7r3BY=;
        b=p+Celb7V5okZbpF16UyclPEfaLBG3F0buobR1uq9vx6rL6/yoQ7f3UVa29sHBM14hE
         IwnH53lW9XkR5xjLLqwfnNN0+BOqIjcm4BNwqFgNj+ItiHuS7p/vAXU5w/Z28O0nLkiK
         ZafkTUh/8vNcdexQmh2Yg+tuXkRqqs596bp08aj1OsaIM+teI2650hMeOyic59u+6S/l
         NPRryX8a6zUzx/LEssJGhmpjL/QftfvOh13chOmzo21wSVbuteLPU3Ztb08YYqMnqJHP
         fGweGlcbTVXh6ONKhnQMptAROp2FQzscjKioL735HSr/mWXx+zEnz6kWdmf+aySvEGJu
         paSw==
X-Gm-Message-State: AOJu0Yz8imPAskCL7UGxA37WbqajNd8ZmM/D5sBM7xY5TOHsUtV8JQUv
        CY5c+uAlNSXZJJLm2k2mmRNayg==
X-Google-Smtp-Source: AGHT+IGpDIm9Zgn0zQNDDt75Bdh7Sxc6oPaB9ssRSL02k06JvL7YWItC+HcBNLZizFTtalkCPv2H8Q==
X-Received: by 2002:a05:600c:1e2a:b0:402:ebe1:7960 with SMTP id ay42-20020a05600c1e2a00b00402ebe17960mr15507087wmb.2.1697026180119;
        Wed, 11 Oct 2023 05:09:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 36/62] treewide: rename pinctrl_gpio_can_use_line_new()
Date:   Wed, 11 Oct 2023 14:08:04 +0200
Message-Id: <20231011120830.49324-37-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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
index 99514119c2bd..2c8d0ef798f5 100644
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
index bcd09f584525..220f69f342e1 100644
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
@@ -73,7 +73,7 @@ static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
 }
 
 static inline bool
-pinctrl_gpio_can_use_line_new(struct gpio_chip *gc, unsigned int offset)
+pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
 {
 	return true;
 }
-- 
2.39.2

