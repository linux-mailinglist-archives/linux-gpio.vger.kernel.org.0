Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0217CC2A7
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbjJQMKD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234944AbjJQMJ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:09:29 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C595B268E
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:44 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40684f53d11so62519885e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544342; x=1698149142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZA9jxM2qedMisgaI2wTgRjsyEvc4vcg/mOILSJ3QTQ=;
        b=cZaK5JFhE3fQcdHqt9Y2ut45fX2MRu4Iul6awgxoaIS7u39iWg3EmRv4YMH8gbi/dv
         FHUbfO7pfm4WM33Ni1c8vRm7fhhbTitAfyL/22QTRNGgS2HkvQi49Kih0wirb1iBMUtb
         YPKsYqYJi3mIiqoATGQ4z5+GzKJOR92V/fTclxOfYtSB8PjFgQhQOjseq6wXoElPwNja
         f9D4Yjkk0SnGWFWVSNpQmJ/nsA1ZW8bCS7MPgyQziG2vde3x06IlDWxjSDOFXhfsWII5
         oAj56XbM4kBCgMv30n4apvJ1KCmCWdwsQ7muMwJcnRBjH3aq4w4/aAyP7ReQN5OudUOS
         g4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544342; x=1698149142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZA9jxM2qedMisgaI2wTgRjsyEvc4vcg/mOILSJ3QTQ=;
        b=CIb5G5Y5+J4UhHEqK/2M5inE8D0taVRajQE0bm4/zHADLWB5+uj3CK9W58HZTO2+My
         kd4B8xNTE6Y+2VxlOafrR66TdxpV6vEXizEOBy/ISstTgb6bkWmYcK6BL/y/1HfDZmiy
         m2cW45yTWXBitDRKJO/KHY3onHY3ZOtPy74p0BA3joHEwHOyKngZVl7LGNvhsxdb/vg0
         fnKdX3iAbJWKTLmeoYdn8Z3gg/HZ1IQZlukxE9BJaeMKsBkZO/Vn5uZthAY0fsHCQgPc
         K3NGYol8b2Iz23hyVOCUUr0fMol5jE/+nGDH6SaGfjUOzb1KEPbTNeaSGj38Cm7lamFp
         rGeg==
X-Gm-Message-State: AOJu0YxQGBQzD7mWJQGv+j3iaM0xNGhSonlpgjEaOmsDcAstXnPjX5Zz
        jrLzkEux7b1RMcfvp8oqQZCa4g==
X-Google-Smtp-Source: AGHT+IEqZN3vjK9m7+TPCHjXqsDkxrsq/FZ9dHcs+XebmA+Waahesh5JLijgb1Q3MNPO84Gg3IGu2g==
X-Received: by 2002:a05:600c:a0a:b0:406:4a32:52fc with SMTP id z10-20020a05600c0a0a00b004064a3252fcmr1528311wmp.21.1697544341404;
        Tue, 17 Oct 2023 05:05:41 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 55/73] pinctrl: intel: cherryview: drop the wrappers around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:13 +0200
Message-Id: <20231017120431.68847-56-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrappers around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 067b0d344f0e..d1315cf027ce 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1146,11 +1146,6 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return GPIO_LINE_DIRECTION_IN;
 }
 
-static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				     int value)
 {
@@ -1163,7 +1158,7 @@ static const struct gpio_chip chv_gpio_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
 	.get_direction = chv_gpio_get_direction,
-	.direction_input = chv_gpio_direction_input,
+	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = chv_gpio_direction_output,
 	.get = chv_gpio_get,
 	.set = chv_gpio_set,
-- 
2.39.2

