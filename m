Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20147B6C1D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240175AbjJCOvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbjJCOv2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:51:28 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D754DB0
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:25 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so9991145e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344684; x=1696949484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+cAT0NJxUIuqflU1cBfM6vQPrUJJd4UlghEqs5YsBY=;
        b=LFNdR+dp4rIVI1EYTfKCEFUufwfItUQ9v/T8U0/sMedgyzvNAZTZJpsRGBUBGkZAJi
         gJagrqCK1lf9vndHIqNkIGbeGseePrXKlrzL726CLqTD3+7KGynrfFRMHeE/EcHauTCi
         P8JJe8BBS78kH6N+BiJR6jdl5hSJGg/hntlzfHHahaLhZoDhCaISyTpbhk4EFLXoFO4U
         jBjsCOWlY3BGBWNt6osytY7te3GyFMbqWKzl4cXkdZdbrlx3AnieG5g9ex2Sua/TCloy
         9j94/cEfpZygogEmUI4SkrPKXNFxgPCnwEjW8GELXO+LjLXRNUYOnusEVZUBXCJARS7O
         g7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344684; x=1696949484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+cAT0NJxUIuqflU1cBfM6vQPrUJJd4UlghEqs5YsBY=;
        b=hbWPw8/SnkpbJby+kfaPwUjRkF0P/wtQYlnYKEG6MZHHKr3GyvTTQd5nBlhiQkD45V
         XVN8FwjzQrwWv5VAfCRiUJ1nCJGcQEFooyKu+5LMqUx9qCtm99b8WxoI0OlpnsM4io/n
         TFRc8utJmywXNz/WuXkQc8H7qEzQvxqQsjcFBJa8O6bRS1dR4Q2AixG4P//wv6SqWdUj
         s5756Ns5AGPbDp/kOeN9qRi8tSZ+IfTT9nYUn9vbFQexdPXyHR7qVmGv3AynPlUujL4u
         TuQAzN1dL9q+vmkatd7/YAArJWnHs968+8BRdD8H79m3aO+4O2DQ5hX8G+lb6dd2UETs
         e26Q==
X-Gm-Message-State: AOJu0YyQmehtnVV5/zexbpgvY4v8OjlGBtpdZNgatbH/CfldVx9gcHua
        Qc90oQgnr9+5YWdF/22eGreW8A==
X-Google-Smtp-Source: AGHT+IHioWDnG6xJL3DIbbqz/tDyFKQ3NBP6THRHpZJAOU282meIzEKqGKDI+KX0axm5yV3Yi64EjA==
X-Received: by 2002:a05:600c:ac9:b0:402:f55c:faee with SMTP id c9-20020a05600c0ac900b00402f55cfaeemr12308302wmr.26.1696344684393;
        Tue, 03 Oct 2023 07:51:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 03/36] gpiolib: generic: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:50:41 +0200
Message-Id: <20231003145114.21637-4-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7c27a1efc1b0..511f6220071d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1854,7 +1854,7 @@ int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset)
 		return 0;
 #endif
 
-	return pinctrl_gpio_request(gc->gpiodev->base + offset);
+	return pinctrl_gpio_request_new(gc, offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
@@ -1870,7 +1870,7 @@ void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset)
 		return;
 #endif
 
-	pinctrl_gpio_free(gc->gpiodev->base + offset);
+	pinctrl_gpio_free_new(gc, offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 
@@ -1883,7 +1883,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
+	return pinctrl_gpio_set_config_new(gc, offset, config);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
-- 
2.39.2

