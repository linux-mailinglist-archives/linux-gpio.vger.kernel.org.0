Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515BB7CC2A1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234909AbjJQMJf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343658AbjJQMIw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:08:52 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F362191
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:50 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso50403011fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544349; x=1698149149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6y2fYAElMK3+9pk+W11zZcwrJV986RWR1hlU2SY+8Q=;
        b=pHXetQdlnqM/PILM0DQmHEJEQIT4tt2KAEVKB27+l378t4fVg4MST6JUl7LN8WkZ3W
         AmRHS0g4n/sd02aWw0kFBgCXG89DImfWL2Gz+O++7bdZ+30Jp0fz4Yrh3OGt6emXBM+O
         a8QDY9Kl4/Z7C/DqOhXb34FvL9F2aK7xEcEKCttQQlRJK6Obfsop1ERXJERnRO0Bsuaz
         b6rRQjxqqRD7uxDCVHhwU7c61BR8WM55Rd6fsoruHT9kXpM+nWagQ4swB8UEfaoqwN6m
         qH7/CHcPRbyJtHJCIz7atJm63RtHCh2o7EcmJmPfo30sg7+VR2njAaaaLtHFa/JaYMdZ
         n/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544349; x=1698149149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6y2fYAElMK3+9pk+W11zZcwrJV986RWR1hlU2SY+8Q=;
        b=XOKYXm4jSMLRxhp9Lp9gcRK/n6r0v3Z9esyKda/dSTdmHdVRPWlOUUVd4VPVANYvJc
         kjrvMN3bCGLqYlbcoHpA8sVDKAAt6KnB3/haITstzaFoR0t/r9+hhRoQ0jkiShFC2PzG
         EO+kqFoTqp+Ro7B4Z2DInwYUtlUbQpm/lihxwwan7gK/rRHw6iWeOFqV0R1NB1t5xx3e
         271mJHIQqgpydcFKiZg7wpURFQLmPjhK5ZV0F/wEBEKsZg1cISxvQDE4oADjCZ640Y4s
         utASTm9LG/DOHzIMX81jWzpgpgA1Duz7woQszwg/m31iV6+ZzoMwtdj1IiENpmcTYyUg
         VmmA==
X-Gm-Message-State: AOJu0YzFE2/VcnJq6xhBniOb4gM+j5OdOW2H9si5+egLqr8SrzjiXPk+
        sb32mmU2b3NsGipFRm+sW50H1Q==
X-Google-Smtp-Source: AGHT+IHUy24UWBIJaS9b96FoOT4wD4I4WLrdfwflESnQjHgtLwgxwa97eFVem8CyyrWWcBpnxTt0Pw==
X-Received: by 2002:a2e:a58c:0:b0:2c5:8a4:9e6f with SMTP id m12-20020a2ea58c000000b002c508a49e6fmr1501787ljp.37.1697544348815;
        Tue, 17 Oct 2023 05:05:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:48 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 63/73] pinctrl: mediatek: moore: drop the wrappers around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:21 +0200
Message-Id: <20231017120431.68847-64-brgl@bgdev.pl>
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index c3f33f96f920..c3d59eddd994 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -510,11 +510,6 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
 }
 
-static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
-{
-	return pinctrl_gpio_direction_input(chip, gpio);
-}
-
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
@@ -569,7 +564,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	chip->parent		= hw->dev;
 	chip->request		= gpiochip_generic_request;
 	chip->free		= gpiochip_generic_free;
-	chip->direction_input	= mtk_gpio_direction_input;
+	chip->direction_input	= pinctrl_gpio_direction_input;
 	chip->direction_output	= mtk_gpio_direction_output;
 	chip->get		= mtk_gpio_get;
 	chip->set		= mtk_gpio_set;
-- 
2.39.2

