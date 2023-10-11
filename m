Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C82C77C52F3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346396AbjJKMJP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346311AbjJKMJM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 715E89E
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:10 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4066241289bso63786185e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026149; x=1697630949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icYrwF7jxGyZfxdkLAJd0y1aF4G3t/6nxjmVee2aWOo=;
        b=QCj+p0BXTT+x13Z5eQxTkd3UX2kN20ZRoTbj2ZaRx0Zn0s/UCiuQv9p5X/d/z7xjvf
         gq/3QrvYIdsuKDKB0VIuQIAYVRwFZszmmHP5hUmUfgtN3WOjfywAuMf9/6B/wgvQMLFB
         1xUsEcOmk8ObqZ62wfkU2JAGjLwkdTUFQqxIOZp8BvXL5SnpNLiN4Bc/5JXUy68rZaiR
         IclxDZmc1qqNbLAUrraU7yH5dCCf5N97fuxaEfOMzGt0sKp3TVnZFXnbGWGTwNxq9k8G
         atWADmjeEWBldhb2bZAojm5G9Thqx9ZYRjHUiDY5vNHYap4YMOY46Uwt/mWXwjoKzit/
         lAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026149; x=1697630949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icYrwF7jxGyZfxdkLAJd0y1aF4G3t/6nxjmVee2aWOo=;
        b=PMoKheEOGYk6IctfjjDwJcO7tZq3tO9NoXih0wmOG7Jzo6pUmrkrVo9hNHVhDl24UG
         V9pRo0kFVE/460HtAMW6pp0oqLUT6sjicpQ84IuXFf9ah2f2vvIh91sPJuLZzjnMl9Mj
         pHu5e0rkQiGBaHai6Tloj4DfNpyZ2AB5naXDD4z4j9kiK7ESEQkI0nOZ2kW1kP5KMSLT
         ZvC34O4ihexpasiVyui9iwXVdIJzyy1nnOxo2R9mg+8nCMFVr64TCbD/zKSVbGL28jqf
         wp3D25cGMSClRDDe07aNNKbfLJXWTYdqtxaT6o4eEPOpBOpOnYH/DANnu2V6S3EeYXui
         6Ugg==
X-Gm-Message-State: AOJu0YwDJMJvY55ITBiaJVaDkxdtYVoO1kWuscXTFVOO5DRxMO+SJEoT
        qUb2aP49wZiz7/lS80SreH7JcCCEdM4hzQBX0rY=
X-Google-Smtp-Source: AGHT+IFlsXoqQLzoIPmN8CXaySIOAdUw53OnJt0grCR6gw56NYPwZUvj99/8z2/5Pd5y8iRqi/4amQ==
X-Received: by 2002:a05:600c:4686:b0:405:95ae:4a94 with SMTP id p6-20020a05600c468600b0040595ae4a94mr17712597wmo.5.1697026148848;
        Wed, 11 Oct 2023 05:09:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 03/62] gpiolib: generic: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:31 +0200
Message-Id: <20231011120830.49324-4-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpiolib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 191f9c87b4d0..cec816b46679 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1965,7 +1965,7 @@ int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset)
 		return 0;
 #endif
 
-	return pinctrl_gpio_request(gc->gpiodev->base + offset);
+	return pinctrl_gpio_request_new(gc, offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_request);
 
@@ -1981,7 +1981,7 @@ void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset)
 		return;
 #endif
 
-	pinctrl_gpio_free(gc->gpiodev->base + offset);
+	pinctrl_gpio_free_new(gc, offset);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 
@@ -1994,7 +1994,7 @@ EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return pinctrl_gpio_set_config(gc->gpiodev->base + offset, config);
+	return pinctrl_gpio_set_config_new(gc, offset, config);
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_config);
 
-- 
2.39.2

