Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4EF7C530E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346472AbjJKMJt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346726AbjJKMJa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:09:30 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B92DD7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:23 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-406619b53caso63174215e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026161; x=1697630961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CbdpxA2yoiqOdTkvvgzFYeQ0S/2apw7f0m7nJ4Vrkk=;
        b=HZ8Z3wujgrEl3JcSkK/MPH57vSOVXQy9CBPQOJs4cV/ZT9wZD1FyzuxUMl+S7cMnni
         cplCIA4HTgi4+9P4OtX+oyq9/qVTXYdKazNEQ6MeL/Oi9paKB9aH8yesUTs9yTTEGO6s
         b1syYfjj91R604gfTWUz1hcPiMr95NHb8/ZTnm5lD+6SeKg3GKSy2cHb06+E4kiMjMnl
         1banjHDyTDtpBZaf/alm7/FAOxKl+zM2mjx89qiD33XzQ58IVEr2bYYK7OXXQ6zR8XIY
         7zyFfyMjKEDaTxCzuVrMCCw0t0Ogc2gaWK7hpgLPb2RlZ0cpDh3K5A/CHOX5Vk1awFhc
         A6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026161; x=1697630961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CbdpxA2yoiqOdTkvvgzFYeQ0S/2apw7f0m7nJ4Vrkk=;
        b=LBqCuyXKq2fNsF9fB5maGJAL6NFgWqaHDZlwe4oSIbMRt0ZXJw4dlddR0ouvUD+VgU
         TyoCtLyqFAApMewxQi5TSvyn6QUrr8rLCk6LjHVf/hPZXzTKktGJRcKPWKTk38Ylwd6m
         bks0SRwYpBUWgLvaRoqrluapVpXGKPdmCaQ3rQs+rqXOiNnVRwgOJE8MtNL2ILkYx6NH
         Z7IFzJ3jYrCpnvJc9H5sTRYZIJIfgPo5ziV69iHhq0ge5RSrLbwhsGwiNm8LajGS1q/d
         PczTfRGOpXSIv5Hsb1F/F1ZWRoKONEs7jVKYEVcWeluWC5V1VnVnD3+ayEfrtUP77xzP
         y3ww==
X-Gm-Message-State: AOJu0YyDDtd7+h8tPLwYoQHnVlVrZIp1iB4MwQbstjYwxxbCX6HC+McV
        MM5LZlIqh+LyVqygm+HfmZxruw==
X-Google-Smtp-Source: AGHT+IGPszQMlGOhUEshB1OYzNIjZG0mo+cw3ASMyoyfmyTuDwtxPnM6tHzkZ5s/2xnXiC02gOnQJg==
X-Received: by 2002:a05:600c:3ba1:b0:406:872d:7725 with SMTP id n33-20020a05600c3ba100b00406872d7725mr17789005wms.1.1697026160925;
        Wed, 11 Oct 2023 05:09:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 15/62] pinctrl: bcm: use new pinctrl GPIO helpers
Date:   Wed, 11 Oct 2023 14:07:43 +0200
Message-Id: <20231011120830.49324-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
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
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index bc7bb9876e57..fb98c3e14743 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -330,24 +330,22 @@ static const struct irq_chip iproc_gpio_irq_chip = {
 static int iproc_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
-	unsigned gpio = gc->base + offset;
 
 	/* not all Iproc GPIO pins can be muxed individually */
 	if (!chip->pinmux_is_supported)
 		return 0;
 
-	return pinctrl_gpio_request(gpio);
+	return pinctrl_gpio_request_new(gc, offset);
 }
 
 static void iproc_gpio_free(struct gpio_chip *gc, unsigned offset)
 {
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
-	unsigned gpio = gc->base + offset;
 
 	if (!chip->pinmux_is_supported)
 		return;
 
-	pinctrl_gpio_free(gpio);
+	pinctrl_gpio_free_new(gc, offset);
 }
 
 static int iproc_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
-- 
2.39.2

