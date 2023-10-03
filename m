Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F957B6C5A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240418AbjJCOwV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240283AbjJCOwN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:52:13 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E05DCED
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40651a72807so9987785e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344705; x=1696949505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwciMDEJmwkjhMDgP1JPMADTRBiS8hEPWAh7DlNBT2c=;
        b=nIstkToP1amc27ZRDUiXlaZJ4dyyNi8SDgM6bgn04my5q8GKJXiEs7rUfZuFCVsh9X
         nauMvdUkItXIf5DYCM7uuwbt1kU6eyy760joZDy+w1C8Rd0BNK7FGJqav+b52UANf+2K
         2zLspJb/NQYdaGc/SkoB1as/supbrrr4/dm0swsXIJ9vs15AmlhYW+hUcB4OECsVRN9M
         xz+BLQ4/bxuZO3g/BMJx+yzJaXNWeb7b7Zk3ff9RYfLVw/NJ4J6Oy99fuX5FDssUg30T
         3D99anV0nMmeKPXssWJ0Oe6pa5yQIyQkFSfuiKZSyfUlKJsGPhLhFbykCHdys1JKmlCN
         cCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344705; x=1696949505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwciMDEJmwkjhMDgP1JPMADTRBiS8hEPWAh7DlNBT2c=;
        b=H+WThnzYvct4E50mvTgoIWB59dLk2JjRg0irfFpPZnhFGCSJk6f2RtRiGKD6ywOpO1
         iK+wVuioYRIMZGElqzWDOHL53DZGWrypcSUk+1NlobLGiFu0kTr9pftHDAmyqFJvW94L
         fhRZcb0J808gEiDDA7gN8cUy7aS/alumyxFyhEurDn6yh51D+4PxvVDxUYV0k0k+K8FH
         OspvGhuceLMgyPvewaASh3X0h+mY40gAkHrZ6qlHpStwAwLAPrlZTP9W6lmSmkdCjcob
         yY9sNM8fe4DwEQeG7bixvZgpRdXWmgwtvnkKvlQZfFobgZQT1EBFMXVp6nWjg/dGc/0J
         sXYA==
X-Gm-Message-State: AOJu0YxbBsbXatoBBgIpmI2ja79JOwOSwIWpZehrfc7JXrxz4KTl7ebs
        eQ4at2ZGkPpQGge0a2g0i5kN0Q==
X-Google-Smtp-Source: AGHT+IEwDBH/fVetxf31DUi31VYPc+e+LBDRKw00pleHHa4z/4rM5NY5TqMe1TyMWuwrX9h5w5yYnw==
X-Received: by 2002:a7b:cd95:0:b0:401:bdd7:49ae with SMTP id y21-20020a7bcd95000000b00401bdd749aemr11623686wmj.18.1696344705018;
        Tue, 03 Oct 2023 07:51:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 27/36] pinctrl: ingenic: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:51:05 +0200
Message-Id: <20231003145114.21637-28-brgl@bgdev.pl>
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

