Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0665F455C9D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhKRN0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:26:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbhKRN0X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:26:23 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52F3C061767
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 05:23:22 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d24so11603756wra.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Nov 2021 05:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pCmJ133IytTayjb9MTRo+s4O8L5B6g8mT+I89lJX/oI=;
        b=J9xOXl8YDR/lOX4MLXONf9amVy62Ez1SLTqsQKqpixb41wh7G9lEP5ReTRIt/QDGqM
         xdY+LpQRBlN+eY1srIle5WznTNcGuJKuDUUE2vdH+A0Lp8kCQhu41PqoPOFTPG7NgH1F
         3gDGYMPV780X+xdnXTm04IDQHquD+YKiLMjjSUKOtBU0qT6m0E2s/ChFBUgZCmqLsJiZ
         MsMoHp4sh+J9H0e5WBRyYuF3z4miaTB0NPWWf5zsREcB+evVacj94Zcju1pc+qAuzCFz
         n6MZh4RIHBAMdVb3a0ZHQsdK1lqC29fR4cebX7YxMZeJCu6i5pUk18CF2Xb2Rv80hVK5
         KnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pCmJ133IytTayjb9MTRo+s4O8L5B6g8mT+I89lJX/oI=;
        b=VQAWo0kg9+DLukOD4U3mp9Ke0ram0xWAD6UCCaFgSmYIfdmpG/x9Xt0MXmaKQ0lCaD
         Ihs81rEAvMoIN1nCLarO2xGg9QBWvMyL1Uv1qC1BzAuNuxdbGrif8Z202ptgO3EgEwir
         geSToxQwWMGAmTR1CjZmHNNUAjqJk2ovZ8PsGA0eiu1zCrFx4lJm6nrPIp1pHQopMTR4
         5OIos1P3PrmNPgBVJe+dBMkEPb9CJzhXCdL87O82TgDDpCya77SfQpwPbgwBtWtzQUY3
         br2kPRpxxCwZjTe9ivenei967trrNgXx6735uEzCBG+CFJ0ACNQx7oB7uNsspfYylwke
         tEuA==
X-Gm-Message-State: AOAM532+ZIVGjcxVxrnxIVdRGgnSmzzjqoWMVDRB2wl4VPziuRwH6Vyp
        i8+kw3NS63FEE9MGInBVuNgsPw==
X-Google-Smtp-Source: ABdhPJzbIVQXhFwzEIhHEhr91tjVfHKbZAN3A2Hk1Mhl9YfLsthOHoWb+VwDhuviGhmezX3fuCAe3Q==
X-Received: by 2002:a5d:6843:: with SMTP id o3mr30620560wrw.174.1637241801325;
        Thu, 18 Nov 2021 05:23:21 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id x1sm3094267wru.40.2021.11.18.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:23:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core gpiolib code
Date:   Thu, 18 Nov 2021 14:23:17 +0100
Message-Id: <20211118132317.15898-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211118132317.15898-1-brgl@bgdev.pl>
References: <20211118132317.15898-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several drivers read the 'ngpios' device property on their own, but
since it's defined as a standard GPIO property in the device tree bindings
anyway, it's a good candidate for generalization. If the driver didn't
set its gc->ngpio, try to read the 'ngpios' property from the GPIO
device's firmware node before bailing out.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v1 -> v2:
- use device_property_read_u32() instead of fwnode_property_read_u32()
- reverse the error check logic

 drivers/gpio/gpiolib.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 20d63028b85c..0746615073c6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -598,6 +598,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	struct gpio_device *gdev;
 	unsigned long flags;
 	unsigned int i;
+	u32 ngpios;
 
 	/*
 	 * First: allocate and populate the internal stat container, and
@@ -646,9 +647,14 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	}
 
 	if (gc->ngpio == 0) {
-		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
-		ret = -EINVAL;
-		goto err_free_descs;
+		ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
+		if (ret) {
+			chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
+			ret = -EINVAL;
+			goto err_free_descs;
+		}
+
+		gc->ngpio = ngpios;
 	}
 
 	if (gc->ngpio > FASTPATH_NGPIO)
-- 
2.25.1

