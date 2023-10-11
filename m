Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5557C53A6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346874AbjJKMWU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346313AbjJKMV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:21:56 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744E91BC7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40566f8a093so62356005e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026192; x=1697630992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1iLMtevXqv9Kk30l8xkOyL7j4m4nBnZ6GmTsolOeXI=;
        b=anjzPtSQkeB4UBRQhalEeL075Xa7BZm3sFIhbzZeLR8FV0htGQ2zrLrryDKhxAUgLr
         jyWxN6+g3xhhiTlWKyPJ+bx8AnTiTWnKmdvotJSbSKk6pPrecV7Ap1JzzFkU/WVKf0/9
         6LlbWHQHfQWofGigU1974vaBiDZXmcdEYL2giaDciyl5WG0jaC9+2DeIW8QuzBWALuTy
         kXm9jAtSCLVJsshckF7La6DkK3LAQIVEb5nPxNcp4pdPHLIwqC3IpMCT5DW6g62thvio
         N2XaGbv3S9WRaou8NN+PXn/9szMu2hcMunTr/e1pQJtbQdsy1YdWxY1ZYHm3i9BXjgWs
         IsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026192; x=1697630992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1iLMtevXqv9Kk30l8xkOyL7j4m4nBnZ6GmTsolOeXI=;
        b=GhSG3pbifE1/Ulr0fD78/RKWMyT23xLdPiD9tYJXRfEi+y0D9asmPvdG8bgie3uoPB
         XDKU5b0bUWxMlBwjKgpO2qyc+nlm6r8eXBYu6RStesPNaoED2aynwTSgziaZDVfOKkeI
         +sx911C8TsZw3Xj30zAfYEnLy6ByJQQxAhhpUtu1am2ecXmZI9wotQmitf8R2WefJLP+
         prIoi8qwU/REi+hhs3wE62KmmB+sbGSjt58mvBHptTBXHVygTyNRnMZmrlFoHXGOtlhV
         6J1OWUVD9lj9QJfwrWUiWGHLh+ooKrroLowcGcdBnfj7TltqAdKNe4Z63Dgx3gwPohrU
         FE6Q==
X-Gm-Message-State: AOJu0YyCXCkfLsVWFx12cgUW8oovy5bc/TIpqYEjRDMn6QifyboSen4g
        d6WYmMPBSNGt/dHjTdOis6ku2g==
X-Google-Smtp-Source: AGHT+IHOWnpmsJTqrwNvvhgGMgR6h8nP+PquRmjaKPLLyvFA3cvrWpH7tew41p007DtOoA+dKCur/g==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id p1-20020adfcc81000000b00321597123a5mr18409071wrj.20.1697026192467;
        Wed, 11 Oct 2023 05:09:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 49/62] pinctrl: ingenic: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Wed, 11 Oct 2023 14:08:17 +0200
Message-Id: <20231011120830.49324-50-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index ca58c9db5c2c..ee718f6e2556 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3560,12 +3560,6 @@ static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return (int) ingenic_gpio_get_value(jzgc, offset);
 }
 
-static int ingenic_gpio_direction_input(struct gpio_chip *gc,
-		unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(gc, offset);
-}
-
 static int ingenic_gpio_direction_output(struct gpio_chip *gc,
 		unsigned int offset, int value)
 {
@@ -3680,7 +3674,7 @@ static int ingenic_gpio_irq_request(struct irq_data *data)
 	irq_hw_number_t irq = irqd_to_hwirq(data);
 	int ret;
 
-	ret = ingenic_gpio_direction_input(gpio_chip, irq);
+	ret = pinctrl_gpio_direction_input(gpio_chip, irq);
 	if (ret)
 		return ret;
 
@@ -4197,7 +4191,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 
 	jzgc->gc.set = ingenic_gpio_set;
 	jzgc->gc.get = ingenic_gpio_get;
-	jzgc->gc.direction_input = ingenic_gpio_direction_input;
+	jzgc->gc.direction_input = pinctrl_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;
 	jzgc->gc.get_direction = ingenic_gpio_get_direction;
 	jzgc->gc.request = gpiochip_generic_request;
-- 
2.39.2

