Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE4C7C532D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346888AbjJKMLD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346897AbjJKMKY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:24 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136D2D68
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40537481094so63316915e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026172; x=1697630972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwciMDEJmwkjhMDgP1JPMADTRBiS8hEPWAh7DlNBT2c=;
        b=IeF/GJxIE74+XeiqYusm8Yjqc5X0YS/qq+OF1dKDPsGELgGWsbuLpe5oCEfe3Afm99
         1MlGK4mrnqrrZgXKVMp8wUVpdz0uY/Ku50llimMeNFJ/jeJ0dZdtJ0UGQlW/Hum6NksW
         wMMOh8+ubLplMYlajETIrmcZjTjftbI9BoUUU1ORxbG6NNHzdztzVnt54HB93zlObwLD
         iYR+e/W1BXGQEif+d4q74+bz8zsHSQggms57TD/LJWT8c8ujcU5QWBECDcsas+sJNhTD
         N3TPhtjb5FB7wkSoBwAf07FbxJso4hUYtNooNbHFGQCVJsuySvwgo9XamrrD6rFelgNh
         GA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026172; x=1697630972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwciMDEJmwkjhMDgP1JPMADTRBiS8hEPWAh7DlNBT2c=;
        b=Yi/pxr6Fe1vw160I9yYB6zK6R/a3XOLN15EgtSnafpvJ8JxmGKd+SpG+lm7hFN1wai
         /ruSEBWWZoiEiEu4pudlwDHlWTWEenbloG0y4xq7SlEYGnMAvTy3Uo5FQh/RLga4xGxx
         wysICkxwEIEXfIk5H2SHl8CDoZrfsEnPF0w1NCXL6hEZsUJzUrAXzOUZv5IGq6tzsLag
         POXnmKotremqF/83XtnoDuMQLjx18Db224U/ZiWrJiWEkvza5W9yLusl4HmvsEGLl2Q0
         +EcnEmUSGrnpWGepF7Q3xEIieOt1v21xr4oknU25+rgudKpGnK2Lup+CgOQJaEDweG9x
         TdDg==
X-Gm-Message-State: AOJu0YxCluoLAGzHnhfonMVMrqHBBqkMm9Mw2pwSHSylGXkBRAY7/p9e
        bn0M24sh+vGOrBw+ZCO+m7XZWzXnzH1T6yfxL5A=
X-Google-Smtp-Source: AGHT+IEjibE7jloLZbXBSZsLbNy7J3ZxHZK1sq8mInwc1VhTHV8P22+FVQSf0pHiB0qB8FSsf/8qPg==
X-Received: by 2002:a7b:cc88:0:b0:401:bdf9:c336 with SMTP id p8-20020a7bcc88000000b00401bdf9c336mr19488682wma.27.1697026171852;
        Wed, 11 Oct 2023 05:09:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 27/62] pinctrl: ingenic: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:55 +0200
Message-Id: <20231011120830.49324-28-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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

