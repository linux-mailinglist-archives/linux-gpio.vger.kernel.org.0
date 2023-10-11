Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 122BB7C53BE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346904AbjJKMXQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235051AbjJKMW4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:22:56 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5191122
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:12 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40651a72807so65202435e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026186; x=1697630986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eURLtK1E6JcmmzD6B2P6Irw26TYQ834NNrDsSTOKog0=;
        b=OdgRvOlQzfaxIi+84kESxE4CZxh8AP1xbGArr74lLY8jWv0In8VXwPvREiKt7R+cT9
         dArnTTz9rqJMbUoEvsdNjFe0TdAVEcB+AJz8x4TRMarUPVCDFlfkjaeZFJtDRKG69jyo
         vNSelE1d2fQ/3/W3YE01g/6c/XimRt2hemyNQcTf5OXhKJhnd9TEBE3RmWvCp/01B1KE
         fgj60BFQj1iq/LEfiXAUgXTItMHk5PctoPaWExPWFJzD6V1Q/t443nnO6UOkAnGAcBCg
         8IIyB9PQQmCS9E34e683UCVyznZVTlD5kVa735mQnUM3MheE87+x5kcsualPFwGuhmsJ
         PT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026186; x=1697630986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eURLtK1E6JcmmzD6B2P6Irw26TYQ834NNrDsSTOKog0=;
        b=nNe6slCpEJJNOfivo9VVq4KSr9nuOxTqxKDublIXD1UdMogkNja2JJ/opRxLXSLwgO
         k6LBqJdvy8m4XwhWRbHc7r20t/RYNai5VAuaee/dCUjkeSPE6dzAHLtVMAVMSJPOKa6e
         byeWSLDGYZbvPG2c6m3S3B+ZvCdd0cMveu5ilF+zHKv3yfJUvOqe7d26lhfkLQDo5aUN
         q2Sd4d/jyTLQjWf/YT+nfpp8zgdYJumvNVPGGUgmGexyaX9JiAGkAA4nAHI+NFpeMgTX
         HPXsN56sknwT7RwgTWBWwN5/MQgoP+jzeVHsBf88DK7ftjBCoKcdjBkHaxk6od932zD6
         25qw==
X-Gm-Message-State: AOJu0YyJ+YPQOymy+qd3JncPxXcOX4Ni8206bQB6VhAXpbSiCl73bBZb
        EAr7IF5vk/x5rXze+MEQrlwgJA==
X-Google-Smtp-Source: AGHT+IE1tIsUdkO5TpFkqzJYNZJ5LbHIqogh+lf6MyZjarepBDtXaghNqZJ2hzf0G/CBAb4ziGaq3w==
X-Received: by 2002:a05:600c:2613:b0:401:d947:c8a9 with SMTP id h19-20020a05600c261300b00401d947c8a9mr18328913wma.19.1697026186266;
        Wed, 11 Oct 2023 05:09:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:09:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 42/62] pinctrl: change the signature of pinctrl_gpio_direction()
Date:   Wed, 11 Oct 2023 14:08:10 +0200
Message-Id: <20231011120830.49324-43-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Modify pinctrl_gpio_direction() to be in line with public GPIO helpers
and take a pair of GPIO chip & offset as arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 7552cf358e5d..24cc075044e9 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -850,14 +850,16 @@ void pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset)
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_free);
 
-static int pinctrl_gpio_direction(unsigned gpio, bool input)
+static int pinctrl_gpio_direction(struct gpio_chip *gc, unsigned int offset,
+				  bool input)
 {
 	struct pinctrl_dev *pctldev;
 	struct pinctrl_gpio_range *range;
 	int ret;
 	int pin;
 
-	ret = pinctrl_get_device_gpio_range(gpio, &pctldev, &range);
+	ret = pinctrl_get_device_gpio_range(gc->base + offset, &pctldev,
+					    &range);
 	if (ret) {
 		return ret;
 	}
@@ -865,7 +867,7 @@ static int pinctrl_gpio_direction(unsigned gpio, bool input)
 	mutex_lock(&pctldev->mutex);
 
 	/* Convert to the pin controllers number space */
-	pin = gpio_to_pin(range, gpio);
+	pin = gpio_to_pin(range, gc->base + offset);
 	ret = pinmux_gpio_direction(pctldev, range, pin, input);
 
 	mutex_unlock(&pctldev->mutex);
@@ -884,7 +886,7 @@ static int pinctrl_gpio_direction(unsigned gpio, bool input)
  */
 int pinctrl_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_direction(gc->base + offset, true);
+	return pinctrl_gpio_direction(gc, offset, true);
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_input);
 
@@ -899,7 +901,7 @@ EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_input);
  */
 int pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 {
-	return pinctrl_gpio_direction(gc->base + offset, false);
+	return pinctrl_gpio_direction(gc, offset, false);
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_direction_output);
 
-- 
2.39.2

