Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507937CC227
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbjJQMEy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232907AbjJQMEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:04:53 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7D9F2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40806e4106dso2987935e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544289; x=1698149089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHHeG5JRIrppV58ReGuMBvMgk8ne+kNJoA1YKryvqFg=;
        b=2SrRY3U/LUUddE6vr7B1pfMUV1gJInKkq75oPYO7mkkBhoVICz4Yw333RcGckM84R1
         o+eoXH08eOe6+dbaOS7GzJohbLHRd6LPSJPkXTggDNFdSbxsemB4FBoWBTNVYom1qz3A
         Q4AKtbxaYdvv+6t1iTuYAWisZwVZunfDtQBycSqhnZS4OdEKVaxeDdgcn3Bqi3SryRQX
         TTCfQ7nBfxw59+0s7k234chu2H3zE+246U6bXoHzvtRBRCweKilzgyuWwgTscdHCA2nh
         P2ByccVoF3/FvtrU0VsJawcJmFN7JMqU4NemEDiX4DlBtSXYGw+UZZHJtUTv+0iiqTO5
         yAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544289; x=1698149089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHHeG5JRIrppV58ReGuMBvMgk8ne+kNJoA1YKryvqFg=;
        b=WGTRcZd4IDolg/AggXm9ahqwF2u/Jx04eKvizpDA0upHoEbSuCMHer2ki2zRZ55Mc6
         eXZRJGMOw8OXwlLqQM5dYOWP0NZ0qYx/9EaBmIrKC7ZqzJGJWQdQ2yLL9jzxbUhOlVNf
         /h96r1qpP2JxybVN3xXghi7qMXLXgDp3UApj+ATE4ZLBJO6emhqAyWiNszhdfZBy5glf
         zvLdItn9G/0FCVN6KFL+2oj7NXszMfq5Ys7npUzmBrcCr31AJbYZ5IvMXX8m7UwDNynP
         HT2ZXaxVROTXbdf7wbEAWQ0ZNbPKS0lvOfM7Frw58dICTvnma6TAp10p1bmjOWH4H1k4
         wdyA==
X-Gm-Message-State: AOJu0YyxltXqa3DGAF10VXaxBkHNoxhlM0UtSRGdXKC6WaPDHSwz85wU
        ltydpAwBXxTdZ3PrUD3sJSpi2g==
X-Google-Smtp-Source: AGHT+IFA0moEr3UGf6vPmXCGuFJNzqDcsJwhXXG0UIzqX4L+ZqoFf+ma6PxjyQJlkTSMHvNM95rcCw==
X-Received: by 2002:a05:600c:a39c:b0:407:4126:f71c with SMTP id hn28-20020a05600ca39c00b004074126f71cmr1619544wmb.6.1697544289376;
        Tue, 17 Oct 2023 05:04:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 01/73] pinctrl: remove unneeded extern specifiers from consumer.h
Date:   Tue, 17 Oct 2023 14:03:19 +0200
Message-Id: <20231017120431.68847-2-brgl@bgdev.pl>
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

The 'extern' specifiers are not needed for function declarations. Remove
all of them from the pinctrl/consumer.h header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pinctrl/consumer.h | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 4729d54e8995..22eef0a513ce 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -25,27 +25,27 @@ struct pinctrl_state;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
-extern bool pinctrl_gpio_can_use_line(unsigned gpio);
-extern int pinctrl_gpio_request(unsigned gpio);
-extern void pinctrl_gpio_free(unsigned gpio);
-extern int pinctrl_gpio_direction_input(unsigned gpio);
-extern int pinctrl_gpio_direction_output(unsigned gpio);
-extern int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
+bool pinctrl_gpio_can_use_line(unsigned gpio);
+int pinctrl_gpio_request(unsigned gpio);
+void pinctrl_gpio_free(unsigned gpio);
+int pinctrl_gpio_direction_input(unsigned gpio);
+int pinctrl_gpio_direction_output(unsigned gpio);
+int pinctrl_gpio_set_config(unsigned gpio, unsigned long config);
 
-extern struct pinctrl * __must_check pinctrl_get(struct device *dev);
-extern void pinctrl_put(struct pinctrl *p);
-extern struct pinctrl_state * __must_check pinctrl_lookup_state(struct pinctrl *p,
-								const char *name);
-extern int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *s);
+struct pinctrl * __must_check pinctrl_get(struct device *dev);
+void pinctrl_put(struct pinctrl *p);
+struct pinctrl_state * __must_check pinctrl_lookup_state(struct pinctrl *p,
+							 const char *name);
+int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *s);
 
-extern struct pinctrl * __must_check devm_pinctrl_get(struct device *dev);
-extern void devm_pinctrl_put(struct pinctrl *p);
-extern int pinctrl_select_default_state(struct device *dev);
+struct pinctrl * __must_check devm_pinctrl_get(struct device *dev);
+void devm_pinctrl_put(struct pinctrl *p);
+int pinctrl_select_default_state(struct device *dev);
 
 #ifdef CONFIG_PM
-extern int pinctrl_pm_select_default_state(struct device *dev);
-extern int pinctrl_pm_select_sleep_state(struct device *dev);
-extern int pinctrl_pm_select_idle_state(struct device *dev);
+int pinctrl_pm_select_default_state(struct device *dev);
+int pinctrl_pm_select_sleep_state(struct device *dev);
+int pinctrl_pm_select_idle_state(struct device *dev);
 #else
 static inline int pinctrl_pm_select_default_state(struct device *dev)
 {
-- 
2.39.2

