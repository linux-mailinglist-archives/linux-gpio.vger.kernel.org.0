Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F0F78132F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Aug 2023 21:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379511AbjHRTBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Aug 2023 15:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379562AbjHRTBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2023 15:01:14 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFAA30F6
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 12:01:12 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe12baec61so11933235e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Aug 2023 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692385271; x=1692990071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExYK1kYhxn5KPsD+IcjfzF6s7qsUsIZxW0+eQjzIynM=;
        b=FTEil+JpDeyExcASvR2TIxlpfeKIoy0xpo21NSCYx/4FUoPC5mX8UJAHxtxqXlq3ID
         N7Bm9VN0uQ+rpny0W+DyGiko5yHILVMwMMgHEuPTqVgPukDt34x3WqnIv6KZ7u7R4vI0
         ksfFNi6ifY9ZK05Qswx5BODywkJEotyHAMxkqBNlbNVaFxftzbLBX27hiAfLfIsBpDew
         Rzf/YVc7+VnDnDppB918hDB39IGKQG385+TLUzsVMgapnX0bSjzto1M32dGvLuzqO3Kc
         bJ61yCKKKF0VwX02vmksOe3uGk5y+vCLnadEDga6AzeFfDc5ZcsU/yrMaqAr04Snmssq
         DAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692385271; x=1692990071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExYK1kYhxn5KPsD+IcjfzF6s7qsUsIZxW0+eQjzIynM=;
        b=kmCI6w0nHKfLbqXAs0bSE9ratvZPYcZrWJD3/eW4lKwJefTyYe4LIWmpo+MNgZQpm1
         Glb4wgKpMC2a6McbQPvZmaPlkNhkihRiyJ3pvbI7CzjrfrUaOipQjWumFyP2CpFRLO0+
         2EW8vN7LIGpyzni0YiMZtK6v+ry80oEaaAUAMmYUnGb3t+hK1bzCoTMIOa5g1qP8fvCj
         fJl4xTjROTZp67GiD2eKQNtTQl9s4NGCjWcT6dlGIj57zjJ27pjw6qt8Vk4m+9H26m30
         xelg+Q71FvG3qG0J2G9GxqOKFRiiNffaq2PsBLWBSfJjx3Nkj/mCc+ps+jiaCAepDLbS
         +yCQ==
X-Gm-Message-State: AOJu0Yzlg+QzNZ5RFHqj5wDGXCa5lRBTc79Wy/vVUN29Yu8d0RYEw3zS
        WlaDm2E7Xjejv0LIRFmVYkBEKw==
X-Google-Smtp-Source: AGHT+IGafrw+J+nMKxJ+bVCGdx71rij2ppv9FFCnJtp3E7rVKZ2+RqLKN/e/1fyQTUoTkyEYBRrh7A==
X-Received: by 2002:a1c:ed04:0:b0:3fa:9823:407 with SMTP id l4-20020a1ced04000000b003fa98230407mr72249wmh.18.1692385271099;
        Fri, 18 Aug 2023 12:01:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d1c5:9f1f:6f05:38a3])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b003fe4ca8decdsm7263541wmf.31.2023.08.18.12.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 12:01:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: tie module references to GPIO devices, not requested descs
Date:   Fri, 18 Aug 2023 21:01:08 +0200
Message-Id: <20230818190108.22031-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

After a deeper look at commit 3386fb86ecde ("gpiolib: fix reference
leaks when removing GPIO chips still in use") I'm now convinced that
gpiolib gets module reference counting wrong.

As we only take the reference to the owner module when a descriptor is
requested and put it when it's freed, we can easily trigger a crash by
removing a module which registered a driver bound to a GPIO chip which
is unused as nothing prevents us from doing so.

For correct behavior, we should take the reference to the module when
we're creating a GPIO device and only put it when that device is
released as it's at this point that we can safely remove the module's
code from memory.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 76e0c38026c3..cb0072d2d137 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -583,6 +583,7 @@ static void gpiodev_release(struct device *dev)
 	list_del(&gdev->list);
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
+	module_put(gdev->owner);
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
@@ -753,6 +754,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	else
 		gdev->owner = THIS_MODULE;
 
+	ret = try_module_get(gdev->owner);
+	if (!ret)
+		goto err_free_dev_name;
+
 	/*
 	 * Try the device properties if the driver didn't supply the number
 	 * of GPIO lines.
@@ -769,7 +774,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			 */
 			ngpios = 0;
 		else if (ret)
-			goto err_free_dev_name;
+			goto err_put_module;
 
 		gc->ngpio = ngpios;
 	}
@@ -777,7 +782,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	if (gc->ngpio == 0) {
 		chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
 		ret = -EINVAL;
-		goto err_free_dev_name;
+		goto err_put_module;
 	}
 
 	if (gc->ngpio > FASTPATH_NGPIO)
@@ -787,7 +792,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gdev->descs = kcalloc(gc->ngpio, sizeof(*gdev->descs), GFP_KERNEL);
 	if (!gdev->descs) {
 		ret = -ENOMEM;
-		goto err_free_dev_name;
+		goto err_put_module;
 	}
 
 	gdev->label = kstrdup_const(gc->label ?: "unknown", GFP_KERNEL);
@@ -937,6 +942,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	kfree_const(gdev->label);
 err_free_descs:
 	kfree(gdev->descs);
+err_put_module:
+	module_put(gdev->owner);
 err_free_dev_name:
 	kfree(dev_name(&gdev->dev));
 err_free_ida:
@@ -2101,20 +2108,16 @@ static int validate_desc(const struct gpio_desc *desc, const char *func)
 
 int gpiod_request(struct gpio_desc *desc, const char *label)
 {
-	int ret = -EPROBE_DEFER;
+	int ret;
 
 	VALIDATE_DESC(desc);
 
-	if (try_module_get(desc->gdev->owner)) {
-		ret = gpiod_request_commit(desc, label);
-		if (ret)
-			module_put(desc->gdev->owner);
-		else
-			gpio_device_get(desc->gdev);
-	}
-
+	ret = gpiod_request_commit(desc, label);
 	if (ret)
-		gpiod_dbg(desc, "%s: status %d\n", __func__, ret);
+		return ret;
+
+	gpio_device_get(desc->gdev);
+	gpiod_dbg(desc, "%s: status %d\n", __func__, ret);
 
 	return ret;
 }
@@ -2177,7 +2180,6 @@ void gpiod_free(struct gpio_desc *desc)
 	if (!gpiod_free_commit(desc))
 		WARN_ON(extra_checks);
 
-	module_put(desc->gdev->owner);
 	gpio_device_put(desc->gdev);
 }
 
-- 
2.39.2

