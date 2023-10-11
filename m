Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 444CE7C52F7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346465AbjJKMJS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346387AbjJKMJO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:14 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA5DBA
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:12 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so8910576e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026150; x=1697630950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhFi4LGhC2Y5nFrUut/uRJGJvyUMlfTO1AC2VY89hk8=;
        b=PTwW8Mm60bUz0lSdpHfx/ETkUHRkk6phf/AoBK71eH8GEtZTPihox/Gihy4VS1Ktfz
         M+gCKn/FR1CAQ4vOdBlirgve8PazA0KsjeLbkbaJccxt/INtOCSxmbsXMCFl4Wrnuix+
         DxqVsSn8cTJ0HdlqaO/XbP0Yl24F2fEqeqvkJRNp54EFThVohCPcBgNDOU0baOCR4pKQ
         WrPzCNnzd5Z67G9Z1TGj7R8v/pfGdVfdpTxtRlAB+8IXXJnapwHX5CEjVnevfFt/acpE
         /6CaLDkqvqS+Z0RVy/ZvU2o+mAlyRItMSamEJDeRFgSa7IfyKt15NRZ/FjI2H7hu1e/z
         Q6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026150; x=1697630950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhFi4LGhC2Y5nFrUut/uRJGJvyUMlfTO1AC2VY89hk8=;
        b=Z/ilgn15TwZK2+cKmwANQ3MZPQpEw3zGYCEBVs57dvYjXCfxmU64p658E5LVUpT+6M
         NQej/xtepDDL1uGLdsJqTIke6zrbFL2lwAK+DOmLRMBYjxWCusRvWXla/Y7Z8mv7Q2/9
         Wkicrj0jnj9FlFhqKLZB1NNlAMAzhn42CWeRBJ1dee1SVQvSGyUzmyNDVxpjO+wScal7
         sFI8h6zlR4/RkojAa7nYF7GIn7jtS+QGh34DtTmDH0p9SrMawGmpqSWkyItx2nsUuzv7
         QY+Kdyv1BxnH71/rMIvHWHsYpiKJxRufRQR9yxHlScHr/pl9DhT6u924wAODtltuy8vD
         uYyw==
X-Gm-Message-State: AOJu0YxjgLBKPX7491stJ/5Ynt8ZpkLuxJezgQXSNt9W3uBfqQHJG/6D
        09aCdBjaPFXUifJ6W/bz/c78omHvoPfTBvMhKtk=
X-Google-Smtp-Source: AGHT+IF3GfioFYS4wMF3LgWfKnAbfvrqUIRw86S7ZSZdwNNMjEgKLHTlQiBeUgJx+Vg4DbeSBVoTwQ==
X-Received: by 2002:ac2:5e33:0:b0:502:9c4e:d46a with SMTP id o19-20020ac25e33000000b005029c4ed46amr12870722lfg.32.1697026150722;
        Wed, 11 Oct 2023 05:09:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:09 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 04/62] gpio: cdev: use pinctrl_gpio_can_use_line_new()
Date:   Wed, 11 Oct 2023 14:07:32 +0200
Message-Id: <20231011120830.49324-5-brgl@bgdev.pl>
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

Use the improved variant of pinctrl_gpio_can_use_line() which takes a
pointer to the gpio_chip and a controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

