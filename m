Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A86D57AEF40
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Sep 2023 17:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbjIZPAE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Sep 2023 11:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbjIZPAC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2023 11:00:02 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8688E
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 07:59:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40572aeb673so59493995e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2023 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695740395; x=1696345195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNGK0v08+zzpQuwoBoXMljpypDBn+BJlECyJC5l0N4Y=;
        b=y8aV3sl/654U3FoYohmH++rkk2HdgHwQxSCApQc7CvTvnkS7DXX0+VG009UypeeXBH
         o98O++bbLGXSezK6Ttg/lCCchVVejqj1azQZZoPYvSyhTPBsSSS7IFhnR9xUr9F9vf5g
         klVnOgQVovYOeECWZmMiJMhrmZDR6qu8+/HDcWCKWZ6pX0fo4hSHlVFI8Xh15nMh9sYg
         M8FWJlNs2cw5DsdnQoEIEnVSvpjrHmR/H7OzAUY2cJ7Sq23O4mxPrvxKa8A4fkIw69nT
         v/348kPXJ8HF4ePd7C1Jk+oHRGpDo0LKFEhqbsOHA4Aekr0X4bu3DHLtyso3u2T7vVdS
         ULQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740395; x=1696345195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNGK0v08+zzpQuwoBoXMljpypDBn+BJlECyJC5l0N4Y=;
        b=EaFZjeZVLPaBKtunfG4x6i41YKMtFFp8E6gw+IHOrz10NwkfHlUWOz1SZgxQZIjQ3d
         NIJxXDdvAnog/t/9+iGFfkAX0doVbQJwJtFeGoohP4Ezubsac4UGJ1D+vv6YgVMeQX1a
         viPcq33Gr8FCuklLimol/HMhQ6DYx9dJKnPVYNJb54WXl2Bm2Ln2/f6gKRby/Vi5R6w5
         zTriorr/YtZBfFQpoFtbqP6bGr+VX/LYYhAcm+zin1qXHRM2pABzMZ6KsoJW7JnAI/0B
         PHBGqNIIASWbeidjqXZpb2Ce/r6wn1XPWpTewxZQfDqWvAleRFS9zMqylDC2dmsZcNXO
         5yhQ==
X-Gm-Message-State: AOJu0Yyf60nnZccbP8PUZFAi+xJkly8/hmJU7gK6kO7PnUffb4RpoVlp
        dPb9FP/13fl9YQzUwZ44z+vB3Q==
X-Google-Smtp-Source: AGHT+IEOH4p3qhvyQQt5ZYpZ/mQ1vxTnsYtUtTM2fHWFYi8sXoPXL21yjgXMCK7N2nHUIBl2/l7VVw==
X-Received: by 2002:a05:600c:216:b0:401:b2c7:34a8 with SMTP id 22-20020a05600c021600b00401b2c734a8mr8423804wmi.7.1695740394843;
        Tue, 26 Sep 2023 07:59:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:686:c497:30b1:d2b9])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b0031f82743e25sm14871634wrt.67.2023.09.26.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:59:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RFT PATCH 4/4] gpio: acpi: remove acpi_get_and_request_gpiod()
Date:   Tue, 26 Sep 2023 16:59:43 +0200
Message-Id: <20230926145943.42814-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230926145943.42814-1-brgl@bgdev.pl>
References: <20230926145943.42814-1-brgl@bgdev.pl>
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

With no more users, we can remove acpi_get_and_request_gpiod().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c   | 28 ----------------------------
 include/linux/gpio/consumer.h |  8 --------
 2 files changed, 36 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 17a86bdd9609..89ff93f3b579 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -158,34 +158,6 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	return gpiochip_get_desc(chip, pin);
 }
 
-/**
- * acpi_get_and_request_gpiod - Translate ACPI GPIO pin to GPIO descriptor and
- *                              hold a refcount to the GPIO device.
- * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
- * @pin:       ACPI GPIO pin number (0-based, controller-relative)
- * @label:     Label to pass to gpiod_request()
- *
- * This function is a simple pass-through to acpi_get_gpiod(), except that
- * as it is intended for use outside of the GPIO layer (in a similar fashion to
- * gpiod_get_index() for example) it also holds a reference to the GPIO device.
- */
-struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label)
-{
-	struct gpio_desc *gpio;
-	int ret;
-
-	gpio = acpi_get_gpiod(path, pin);
-	if (IS_ERR(gpio))
-		return gpio;
-
-	ret = gpiod_request(gpio, label);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return gpio;
-}
-EXPORT_SYMBOL_GPL(acpi_get_and_request_gpiod);
-
 static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
 {
 	struct acpi_gpio_event *event = data;
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 6cc345440a5b..db2dfbae8edb 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -606,8 +606,6 @@ void acpi_dev_remove_driver_gpios(struct acpi_device *adev);
 int devm_acpi_dev_add_driver_gpios(struct device *dev,
 				   const struct acpi_gpio_mapping *gpios);
 
-struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin, char *label);
-
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 #include <linux/err.h>
@@ -625,12 +623,6 @@ static inline int devm_acpi_dev_add_driver_gpios(struct device *dev,
 	return -ENXIO;
 }
 
-static inline struct gpio_desc *acpi_get_and_request_gpiod(char *path, unsigned int pin,
-							   char *label)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
 #endif /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
 
-- 
2.39.2

