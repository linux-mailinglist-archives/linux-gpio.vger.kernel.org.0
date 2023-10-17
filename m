Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F607CC230
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbjJQMFC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbjJQME7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:04:59 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBAFF9
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:54 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso73270751fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544292; x=1698149092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqSvTTUiCAxcdVsqPtP3QRiyb3qISoSChjkUUgG3668=;
        b=SueKBiqmIZUOBtnSpA7PCqgvsexnr/Z/EBBwRZ+sWrWr2fCH1iFKOWhJVE5U7KMUvO
         x5IcHqS1rUl8vEWKSWEyFvFDLjJpH4sNngHggnHs6X8r8XFbuk6580J07czQKupfKP3G
         2s7NIT1sc56DPfK80KZ+3kDnHNfcFJiLsukLGKILsSiTpCcNz7s+dMsp/YAglMufGRED
         Vaw8HbIbKAVznIqXfM60agbxJ7PFluJwEqLr3ZUlZKgIbmBMqkZ+0IIjdxKGJ+Sb/Lfj
         O4xPDOdd1SNJtxRu2BjzN1SGCH2dVaKWkrUUEJJypSp34PLxuf9IRzfNsYKncKcWYFPa
         AjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544292; x=1698149092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqSvTTUiCAxcdVsqPtP3QRiyb3qISoSChjkUUgG3668=;
        b=Yax8e8DI9yYEFGRM1Mzf2zJteCF7C3QYxoxycDr+SjS10Yb7iZD1RmGnpl1UBPrs0X
         SzbePTrLikZUYqIpJfUeMPgWuFBDmFmew/VXQ084tRuga+P4LUcsvj9ZRAx/PkZEn6K8
         1R7nssFnfr4CNMWH2ZLXnqczffcEADw66V1MbXxCaAy7+U38CLhZCivIO6DY8zlTC2DF
         Y0J9GNwVkjUNhNd0Ob2BVp09E4Ed13aMoz43/DSap6BvUGn1JT+Vf142mfhDQextvu3d
         RPOyrdu1bYsk2SeXB9fBDKNanW1G32AGTSb2AKTjqSjvlHqKUXZIoWIVOolq+0Rlsz8m
         n03w==
X-Gm-Message-State: AOJu0YwXeNjG1UjzaQWOMgQxldQx1Aj0a+JOvCZi58VCRwm9IZtSR/NL
        VGNy3k17kZKBGen0mrnsRA3JFw==
X-Google-Smtp-Source: AGHT+IFdNGufBtvxHVT2PYigX8VGTwzhNOTUcTb1bos7CHU1BhiK+V/FOUi1kwpeYNQkD1kZB9oNJA==
X-Received: by 2002:a05:651c:b29:b0:2c5:380:2a10 with SMTP id b41-20020a05651c0b2900b002c503802a10mr1919281ljr.25.1697544292084;
        Tue, 17 Oct 2023 05:04:52 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 04/73] gpio: cdev: use pinctrl_gpio_can_use_line_new()
Date:   Tue, 17 Oct 2023 14:03:22 +0200
Message-Id: <20231017120431.68847-5-brgl@bgdev.pl>
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

Use the improved variant of pinctrl_gpio_can_use_line() which takes a
pointer to the gpio_chip and a controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 31fc71a612c2..54ee075410db 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2287,8 +2287,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	 * FIXME: find a non-racy way to retrieve this information. Maybe a
 	 * lock common to both frameworks?
 	 */
-	ok_for_pinctrl =
-		pinctrl_gpio_can_use_line(gc->base + info->offset);
+	ok_for_pinctrl = pinctrl_gpio_can_use_line_new(gc, info->offset);
 
 	spin_lock_irqsave(&gpio_lock, flags);
 
-- 
2.39.2

