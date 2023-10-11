Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239517C532C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346951AbjJKMK7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346816AbjJKMKN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:10:13 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBDED44
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-406650da82bso62487865e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026170; x=1697630970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTV/yldDdNeFa7KR560LkbzuRdncwWStAsZOIrIjz5U=;
        b=0zPYxIzEMSSvLMcCqTDCjkilDhW45L2bHHXrg2B1P+TFNtfnEO4+qtlJm5qDiD40VG
         ZY+NoTHziSvFWVgu7/YNK25qQkS5mYOZZDpdjiYo3NPQ/ZOytYGVpEqhtYkz0oq+pPhP
         DJYNsEyyiGR78qDcgGsE7X2xbGTjOukZ27JyJ6+dX6zAJHEiiqlic0mkIasDriSHCLZz
         vVvqcsI90dUaNEvaYa49mIqV16zH0+5espkpChRQQVvtigJdBdN74mvsC5sux/71+iZC
         zDm/KDeCSh+gOqUT5zNOS/5VCX+Nsy5Pnu90+SD4VNRHmkJJnXYmhwL9oVwO1QNFTO5Q
         VhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026170; x=1697630970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTV/yldDdNeFa7KR560LkbzuRdncwWStAsZOIrIjz5U=;
        b=ZJYYtMyTNNmwqZfj1ecRkBP26dV157QvMTKHFMPtaD1fCyCZLEfhP51FVPq0q4e9tF
         rwk+5vbAFjAvTCDwOqy/Yer5x+JqQuneYkn3WInespytT7/mHwZMxC1oTd880jU0F8XC
         Yxk/0w3RPLp36v5RKK7DcqeO/+ou1klVQDGBYpy1YqyIGoFtR4MGKbQzsAeXY6a8nF6C
         p+Xq5l2xTuIKMmGSdwxxTVrNNPlYaFU6udxz5eF/CwIDe2rMqUZqMMMHZ3oOGltOR8or
         uL6dU12plYOfnjmbiT7HAaEUWU4M73CbxwWY765nBUtNOLc3IIl/JUoeXX9mj2P2NyDx
         N/Ug==
X-Gm-Message-State: AOJu0Yx9kPq/ORciWdZWBQ6xS00p3UzA1UXEsV1sn7ouVH3QlUs7QBei
        /o13N5uVB+foUyHXrLL+V+HoPw==
X-Google-Smtp-Source: AGHT+IHo6DO6u78jF27w6DxeERZXgTt1CDg6h44dMlpZm0P3XPCpBeUd+S6s5QHxY9SfNa/SFbyX5w==
X-Received: by 2002:a1c:7c17:0:b0:3fe:ba7:f200 with SMTP id x23-20020a1c7c17000000b003fe0ba7f200mr18903722wmc.20.1697026169956;
        Wed, 11 Oct 2023 05:09:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 25/62] pinctrl: cy8c95x0: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:53 +0200
Message-Id: <20231011120830.49324-26-brgl@bgdev.pl>
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
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index fae80b52a6fc..8c6006353515 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -554,7 +554,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 
 static int cy8c95x0_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
 {
-	return pinctrl_gpio_direction_input(gc->base + off);
+	return pinctrl_gpio_direction_input_new(gc, off);
 }
 
 static int cy8c95x0_gpio_direction_output(struct gpio_chip *gc,
@@ -571,7 +571,7 @@ static int cy8c95x0_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(gc->base + off);
+	return pinctrl_gpio_direction_output_new(gc, off);
 }
 
 static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
-- 
2.39.2

