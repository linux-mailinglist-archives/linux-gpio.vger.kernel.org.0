Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250757CC279
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343728AbjJQMHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbjJQMHK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:07:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCA91FFF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:37 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso62512615e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544335; x=1698149135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqYDdpwSMHdixfarzmEYN9Owj/ALsHDXsFbQ9TIrKwc=;
        b=flztOwpWuuW2aUJbyYp//Q2Uqamnmhj4YctQ/aZ5PzmpE2c7tfR8raBKy3ZVmRRPTM
         p9ay+QTQreDqGW+DWRicnKl2M2aUMeHaX17B1AT3kAnwce2d23XRsRKlTMh4iQ5Uf9h8
         dehkQ9ODUdGbOoBqq0X2/Y9iGxnyzZHibjHfvD7JYDXDv7maSPeCe4ZjwUmMzBaRJmXT
         tFBREOe4y4E9hjarWZGSQ6RyRuuoAB0aJqzPze/zQbSOEkxqoFLeKqS9JvPORCsnIoik
         rDiCrbpJBbk+fstZ5JPk9nt7StLbqtJC6Gw3G30bOj+k7GLQrJYwo6By1kVGpQDoX+HU
         VhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544335; x=1698149135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqYDdpwSMHdixfarzmEYN9Owj/ALsHDXsFbQ9TIrKwc=;
        b=Oiey8liRNf3/q0nXADsQbXwuEwOpSGxtyXlfs10afq/JcgJ1iPPlVP0BNQxWzm/CIG
         3NTn6uHx0ATr5joKHiaYcVZgHZ7K1fqVyo+SPbOsqq2OwiYma8NyLuLjOC//yv1K71IH
         82J21IV1NfxCXPBplkJCANXBkJhuAJuxcTrCVJSE/exf45TgZgt/0xEea/Pz/9QWF0vX
         OQGTx0XAoQ1w+yvw6LVxsaTFviR9jR+Dx9hNOpMAb5x6rh2bpEPBcVOjCtBFkhIEirHj
         i4BBbOmlfmzNDTlqgnZH2MDrPyC1s/1PPiUcOiN/lmqDbrtQTXrx8rNxqS10ToQmK+YN
         GbMQ==
X-Gm-Message-State: AOJu0Yz9BiC+Uin0zIxjC/N5gRe51fvN8Qp4TCNUKoVD13oUc5AAfMD6
        Jh6u7u48a4MA0gEHtWNf0Q324A==
X-Google-Smtp-Source: AGHT+IGXaO/+/HmoIehSue+LQn4AH2sJqYjhveacHqteldmyuF6SKygUWSf3bKZslzRs2TEj2+gYWQ==
X-Received: by 2002:a05:600c:3590:b0:404:4b6f:d70d with SMTP id p16-20020a05600c359000b004044b6fd70dmr1539396wmq.17.1697544334471;
        Tue, 17 Oct 2023 05:05:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 48/73] pinctrl: change the signature of pinctrl_gpio_direction()
Date:   Tue, 17 Oct 2023 14:04:06 +0200
Message-Id: <20231017120431.68847-49-brgl@bgdev.pl>
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

Modify pinctrl_gpio_direction() to be in line with public GPIO helpers
and take a pair of GPIO chip & offset as arguments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d4a615eb1c39..b92047af7b9f 100644
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

