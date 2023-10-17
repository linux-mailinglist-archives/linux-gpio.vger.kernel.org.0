Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8E857CC300
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235280AbjJQMWS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343788AbjJQMWG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:22:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872431BFB
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso26676621fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544327; x=1698149127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6cZJ9iOvjAsdg8L9d8ZBjfJOuY8giQz9BcQIlxiHnc=;
        b=IrEtUnYzM7bU4f67RzhcQwixNd1/M3ZvXP3tJSRGcLCO2NDoZB1yU4jbS9q4NJmI1n
         udYlHIHj+Abct2VVgJssgDAEyLL5CChp09Y6uYjFKLHFDXJunAfz+L6akd9EE9RE6uLz
         Po8Ww934yIUKK1IOItcSnLfujyfpwjsMIw1L6r/dFOND7/jXK59JyJsd2OYoXsqHex+/
         rXWeM27RQ1tfd8hZULY3Hk0AliXKRtwvOgJLlIe5eW2dDQPCF00wfQuBbxvNviulCBO7
         AGkF7YJ+W/8oo+HLp7hU1LnE56Sw6axCrQewfPbwxn9GgGtRVzAPitu03vLoUUl8b+U1
         gjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544327; x=1698149127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6cZJ9iOvjAsdg8L9d8ZBjfJOuY8giQz9BcQIlxiHnc=;
        b=F4cNWVpzAixZbOPrI2u3DSre0ecJYKoKnwMubkzd4Wc4ZJrtqR+53AOUXMLcH5PSaD
         PaSiLdQ+UFjQx3PiTpP/cwuBPlQbPBYK1ufyViv0XlelIyf/8b4k6+0vNqG4GDJUcE5j
         rbEeejKpU2uqdpRQV5FhZ6qtTOyDpNnpt0VUKd2HcDoe7/qEvdhSUjAKXA/qwaCwaBwI
         op2vU1sUK9kb0ZPWMYdWdKgR8mscYs+3w8qNnhQPm9q3GLRghLmtPheSgSd2boAkWDsZ
         AnHJOAZQQMdwjkTEuS1wiHupnO9pFfvZQY8BcOGnpD8MTs884YiMniyKK+or+UUciO9U
         6pkw==
X-Gm-Message-State: AOJu0YyPt9uq3VY2VBNS33wMZ3cTKXp5Du9rTbhMP4nsEFbKhuiMN1nt
        C3EDFqD81zwh+ECJd0ia4WoZ/YknHuGDwkMn9e8=
X-Google-Smtp-Source: AGHT+IHIx2IT1ps4wbETt4/2aJXXyDnFuR04+EKtk22Vy46nsZK+31vJnPA+tvs9MQ98GtqknoVxWQ==
X-Received: by 2002:a2e:6e17:0:b0:2c5:17ac:77f7 with SMTP id j23-20020a2e6e17000000b002c517ac77f7mr1411851ljc.1.1697544327089;
        Tue, 17 Oct 2023 05:05:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 40/73] pinctrl: remove pinctrl_gpio_direction_output()
Date:   Tue, 17 Oct 2023 14:03:58 +0200
Message-Id: <20231017120431.68847-41-brgl@bgdev.pl>
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

There are no more users of pinctrl_gpio_direction_output() so remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c           | 9 +--------
 include/linux/pinctrl/consumer.h | 6 ------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 80f565aac707..0d66b3d5e685 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -888,13 +888,6 @@ int pinctrl_gpio_direction_input_new(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_input_new);
 
-/* This function is deprecated and will be removed. Don't use. */
-int pinctrl_gpio_direction_output(unsigned gpio)
-{
-	return pinctrl_gpio_direction(gpio, false);
-}
-EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
-
 /**
  * pinctrl_gpio_direction_output_new() - request a GPIO pin to go into output
  *                                       mode
@@ -907,7 +900,7 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
  */
 int pinctrl_gpio_direction_output_new(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_direction_output(gc->base + offset);
+	return pinctrl_gpio_direction(gc->base + offset, false);
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output_new);
 
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 249bb28a52d6..e25e9b0599ac 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -31,7 +31,6 @@ int pinctrl_gpio_request_new(struct gpio_chip *gc, unsigned int offset);
 void pinctrl_gpio_free_new(struct gpio_chip *gc, unsigned int offset);
 int pinctrl_gpio_direction_input_new(struct gpio_chip *gc,
 				     unsigned int offset);
-int pinctrl_gpio_direction_output(unsigned gpio);
 int pinctrl_gpio_direction_output_new(struct gpio_chip *gc,
 				      unsigned int offset);
 int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
@@ -92,11 +91,6 @@ pinctrl_gpio_direction_input_new(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
-static inline int pinctrl_gpio_direction_output(unsigned gpio)
-{
-	return 0;
-}
-
 static inline int
 pinctrl_gpio_direction_output_new(struct gpio_chip *gc, unsigned int offset)
 {
-- 
2.39.2

