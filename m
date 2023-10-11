Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D71A7C5394
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346917AbjJKMVN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbjJKMUg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:20:36 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5CB19BF
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:23 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4065f29e933so66606955e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026191; x=1697630991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q2AAUK8nSoyCcAL3+dAuFLxmVbbJcIniBd1EuYZbmQ=;
        b=lfRa0TK5Bmz558wPy655hvc0XZ/Ygpzc826pfbyw7z1DHFOTWXT2pS1cmOHXrCRDwi
         P9gpBv8w9sYpfD27OC+6/JYD/vtQRk/XiUbjBLUkTuMG+FwSi9Vwdf0aoSG8x54eNIlm
         jKXjiA9IILJVjjOavHNW+wHDm7xEoA/pWrcbcDVQHQvVh3OrBiBDKmAy7xS+qJYUSFsu
         qQpw/h6UbuwpmEmDHynUGmqlx2bqwx+gsXZcUX5W4WT1HnxFRQiCpzTQWMMgd70SbEQ5
         4ZKSuvcPEr5c5L75waFEz7tMZGflKOCCD/SWfCWNBnef4V2OkjsPGBv3u4DwTSxXs/FA
         TA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026191; x=1697630991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q2AAUK8nSoyCcAL3+dAuFLxmVbbJcIniBd1EuYZbmQ=;
        b=c/3LBillapePrSy3Hv04t+kpb3vQPA7FKo8F2m3TaWbbg4gLO21iiOr/c9A9d5gGDb
         asBQ7qSg0dBUYShZWIP1NtDW77jGetp4f3UrEP22nLo7Z38Ei/KiBUHNafRJpyvJz8qV
         9eL2W+QpDuPvD+F1PinptO2+MkGT7NLZiUSl6cwoSBmvzzPI9OEoF1ix3YP+sGmgqAc+
         wbAt2VpfQF0LQXbUJrSo3e3mafM6e769XTO/3yJs6mBfCu3KbRIA+9zAG+7EbDNuwYkH
         x3MpgMKOSgANS/V4tU9RfAcFS546NPqWeLUXmbWk5/b7wQGejRK9jUV4ufaZAB2+jFZ7
         RX7w==
X-Gm-Message-State: AOJu0YxGBoF86HdzREiSYk+rfoOA+nl76FG6AOkY1i/JtbMg3Mq3UxwD
        L2f/ZNb65/wQi+En5C3qusHArA==
X-Google-Smtp-Source: AGHT+IHAmrK7CL234ZlKddU9bn/ryIqmCG9P9cfyvHmrPE6PCNb7YNB5Vs/kq2qwLnLC1iLWQpExaw==
X-Received: by 2002:a7b:c45a:0:b0:403:e21:1355 with SMTP id l26-20020a7bc45a000000b004030e211355mr17503175wmi.36.1697026190788;
        Wed, 11 Oct 2023 05:09:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 47/62] pinctrl: intel: drop the wrappers around pinctrl_gpio_direction_input()
Date:   Wed, 11 Oct 2023 14:08:15 +0200
Message-Id: <20231011120830.49324-48-brgl@bgdev.pl>
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
wrappers around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 7 +------
 drivers/pinctrl/intel/pinctrl-intel.c      | 7 +------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c  | 7 +------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 5abe83de1ea8..0f3112d7d372 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1170,11 +1170,6 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
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
@@ -1187,7 +1182,7 @@ static const struct gpio_chip chv_gpio_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
 	.get_direction = chv_gpio_get_direction,
-	.direction_input = chv_gpio_direction_input,
+	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = chv_gpio_direction_output,
 	.get = chv_gpio_get,
 	.set = chv_gpio_set,
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index f20e027d0584..c46dc1efa92b 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -989,11 +989,6 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int intel_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				       int value)
 {
@@ -1006,7 +1001,7 @@ static const struct gpio_chip intel_gpio_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
 	.get_direction = intel_gpio_get_direction,
-	.direction_input = intel_gpio_direction_input,
+	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = intel_gpio_direction_output,
 	.get = intel_gpio_get,
 	.set = intel_gpio_set,
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index e6878e4cf20c..303aaca341ea 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -539,11 +539,6 @@ static void lp_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	raw_spin_unlock_irqrestore(&lg->lock, flags);
 }
 
-static int lp_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int lp_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
@@ -799,7 +794,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 	gc->request = gpiochip_generic_request;
 	gc->free = gpiochip_generic_free;
-	gc->direction_input = lp_gpio_direction_input;
+	gc->direction_input = pinctrl_gpio_direction_input;
 	gc->direction_output = lp_gpio_direction_output;
 	gc->get = lp_gpio_get;
 	gc->set = lp_gpio_set;
-- 
2.39.2

