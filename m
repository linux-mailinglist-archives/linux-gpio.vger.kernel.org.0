Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1AD07CC26B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbjJQMHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbjJQMG3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:06:29 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFC51989
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso69728361fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544318; x=1698149118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwciMDEJmwkjhMDgP1JPMADTRBiS8hEPWAh7DlNBT2c=;
        b=KJ6TxornkPx4ML8GSGSmxf6o4mZYPwV+vEtSFYpOPuaycfqCm5CI2ExoIV5MYzeBCb
         Ig80DTGZcqgLjKsYJ/12/UejLdQtw5zzUNabg4CYbc74qzr3G8iBIQOH+SgwlFTWYDGE
         jxEH50Npl6ZYkQVP3e25uXrUqq1K9tw/rcCo4W53WTSqtgDm5mKdZmRU3+0iqaVAleCa
         bWxWScKEPvqrU3fr8WSgbLejdRkzjg48APEkDrFZ/2NIexHJVHQvRnbvEACiYomo6u5P
         KUsEQDLTi+ZvBQnSL3t0wVPDQGeZu9EsAJRSIjDHBBtEwQcHE4obYjpSGvmjrVQAKMqK
         WJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544318; x=1698149118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwciMDEJmwkjhMDgP1JPMADTRBiS8hEPWAh7DlNBT2c=;
        b=Lr0e6lb4vAeha8miFaZ2KFlnIpE3OsS1LG4rocYd7UYMuRfS7v9JPCesWfvlQ0hLH0
         lEQEgimxAC5bMV0JOqEA8XEoJf3j5UsNvRicp6UjdWWpA+L0TH0d+jHDjIlTpMyL0hXM
         ktlZoVSAXXXlVKCwj7kcwZaEJgoQJZdWhzPicXj9xv7i8WHV7nlTOyvBu2k36KHfTmQx
         KfGXOU9yE3w3Kb9Tv1l1GTZ4GPujLWoDUrtAA+Dq47OZYe+7L0DUX6NgV0UL7jgCxsFl
         pJabmffsllg8CRGtP73KRC0P4LfikGHoqxSrgV3V8QYJ1E148Vy+wLKaf8/oI6akt0Dp
         ptbw==
X-Gm-Message-State: AOJu0YycP/sMZiPayhDIqqwMpK8cpMm+sdWStsqjpj6+NIk2+sIz+BpZ
        rrf+sS/xai9dZureF+7mBiETS11qsMDM1wWCHuU=
X-Google-Smtp-Source: AGHT+IHhzZONAYHNx3gqc4pIA0lEbPEqPBfq0qcFjG7SYfmr12HY78Q6mpZGLRdrOVOx+JChdGnpZw==
X-Received: by 2002:a2e:9902:0:b0:2b9:e6a0:5c3a with SMTP id v2-20020a2e9902000000b002b9e6a05c3amr1655865lji.48.1697544318317;
        Tue, 17 Oct 2023 05:05:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 31/73] pinctrl: ingenic: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:49 +0200
Message-Id: <20231017120431.68847-32-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
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
 drivers/pinctrl/pinctrl-ingenic.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2f220a47b749..5072fb907193 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -133,6 +133,8 @@ struct ingenic_pinctrl {
 	struct pinctrl_pin_desc *pdesc;
 
 	const struct ingenic_chip_info *info;
+
+	struct gpio_chip *gc;
 };
 
 struct ingenic_gpio_chip {
@@ -3561,14 +3563,14 @@ static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int offset)
 static int ingenic_gpio_direction_input(struct gpio_chip *gc,
 		unsigned int offset)
 {
-	return pinctrl_gpio_direction_input(gc->base + offset);
+	return pinctrl_gpio_direction_input_new(gc, offset);
 }
 
 static int ingenic_gpio_direction_output(struct gpio_chip *gc,
 		unsigned int offset, int value)
 {
 	ingenic_gpio_set(gc, offset, value);
-	return pinctrl_gpio_direction_output(gc->base + offset);
+	return pinctrl_gpio_direction_output_new(gc, offset);
 }
 
 static inline void ingenic_config_pin(struct ingenic_pinctrl *jzpc,
@@ -4052,7 +4054,8 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		case PIN_CONFIG_OUTPUT:
-			ret = pinctrl_gpio_direction_output(pin);
+			ret = pinctrl_gpio_direction_output_new(jzpc->gc,
+							pin - jzpc->gc->base);
 			if (ret)
 				return ret;
 
@@ -4172,6 +4175,8 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	if (!jzgc)
 		return -ENOMEM;
 
+	jzpc->gc = &jzgc->gc;
+
 	jzgc->jzpc = jzpc;
 	jzgc->reg_base = bank * jzpc->info->reg_offset;
 
-- 
2.39.2

