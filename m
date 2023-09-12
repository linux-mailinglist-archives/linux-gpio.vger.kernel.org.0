Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740EA79CD47
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 12:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbjILKIH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 06:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233958AbjILKHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 06:07:45 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7841988
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:41 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so58077795e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694513260; x=1695118060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6yCpRsJ9YDulO6YNUQQZrVJSWHh877hWXgywBs804o=;
        b=TpQxjVY+ICyqKwIHOyu+x0bHKtufJJxchZCIdaAx/ZI5LUYQE6fVKZJQojUOqIQsOz
         jB83+T/Bo0uv8S0/yRNnktVNbjtgHn6UpQycN4Yh6XyQR0sIWoGp1iUftf3u356UjWNS
         J2KJNUP76h6SHcIWOg7/cE6lf3A7WDSBoODGyRIvDGuxiOFKgGxMrYVYEYd80DYdykhm
         h+Bo/ItDxUOXtt3kiOjhBJaE4CC8EEenjZgroYoZBxCnJXZuG87MdtTScxU64xhF4+rh
         +cGObF+eiIt41IQjc9/syUcmMNYVdyLFZcUEJQTqetWKhru4PPNue5X7oEudDb68x1Mv
         htpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513260; x=1695118060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6yCpRsJ9YDulO6YNUQQZrVJSWHh877hWXgywBs804o=;
        b=eP3k7VZpfJfyjj2J58ZOBu5W4n+mBVbR5M/Qu5OlO4et/uPdcsFpry8kKXxENxgRcK
         GC1J9thQHSPgEPvn/eAnEM3htXmJ+t3t0ktq+Oaste37/U6tVWXzuMDZ0JPPvQ0yF6Tb
         iYp5MYb4mdPa8N7uzfiNlVcIwInBqJZAUIImHWpW2GDWPXtsMwyJRz8pmI9CX09O3CfL
         lAFbzOdXWQD4j9RsCN955qQ0t5PLFRaBf5TNONpAJ4aDn4g0cPxeZ218UOdI0FXZbE7+
         gkaYOgzAY3DpmL8Gk8DmjADFQ5d1XVMktXnddcj5cWyvTUJCMI2JR3pGRsFb4j0KdJB5
         BFPQ==
X-Gm-Message-State: AOJu0YxOJAzsz7tnQPIS8CXvkYjcPbOewyz7o7kQtiIbnAIpw+nQ44Nw
        HufbHPIKG9nn4oMl1cDwVJk7mg==
X-Google-Smtp-Source: AGHT+IFcT7aRuxPokXUdCiwhobRYyRamsHE6NPEllDWPFOmdrpuZSdnUT0Q8AdVtMC65mNulQccRLA==
X-Received: by 2002:a05:600c:204c:b0:401:23fc:1f92 with SMTP id p12-20020a05600c204c00b0040123fc1f92mr10852185wmg.25.1694513260155;
        Tue, 12 Sep 2023 03:07:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:907f:4cd7:f0ae:6b2a])
        by smtp.gmail.com with ESMTPSA id h5-20020adfe985000000b0031ae8d86af4sm12351417wrm.103.2023.09.12.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:07:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 05/11] gpiolib: provide gpio_device_get_desc()
Date:   Tue, 12 Sep 2023 12:07:21 +0200
Message-Id: <20230912100727.23197-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912100727.23197-1-brgl@bgdev.pl>
References: <20230912100727.23197-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Getting the GPIO descriptor directly from the gpio_chip struct is
dangerous as we don't take the reference to the underlying GPIO device.
In order to start working towards removing gpiochip_get_desc(), let's
provide a safer variant that works with an existing reference to struct
gpio_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 45 +++++++++++++++++++++++++++----------
 include/linux/gpio/driver.h |  2 ++
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9f20311e4c1a..e413136d1566 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -147,27 +147,48 @@ struct gpio_desc *gpio_to_desc(unsigned gpio)
 }
 EXPORT_SYMBOL_GPL(gpio_to_desc);
 
-/**
- * gpiochip_get_desc - get the GPIO descriptor corresponding to the given
- *                     hardware number for this chip
- * @gc: GPIO chip
- * @hwnum: hardware number of the GPIO for this chip
- *
- * Returns:
- * A pointer to the GPIO descriptor or ``ERR_PTR(-EINVAL)`` if no GPIO exists
- * in the given chip for the specified hardware number.
- */
+/* This function is deprecated and will be removed soon, don't use. */
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc,
 				    unsigned int hwnum)
 {
-	struct gpio_device *gdev = gc->gpiodev;
+	return gpio_device_get_desc(gc->gpiodev, hwnum);
+}
+EXPORT_SYMBOL_GPL(gpiochip_get_desc);
+
+/**
+ * gpio_device_get_desc() - get the GPIO descriptor corresponding to the given
+ *                          hardware number for this GPIO device
+ * @gdev: GPIO device to get the descriptor from
+ * @hwnum: hardware number of the GPIO for this chip
+ *
+ * Returns:
+ * A pointer to the GPIO descriptor or %EINVAL if no GPIO exists in the given
+ * chip for the specified hardware number or %ENODEV if the underlying chip
+ * already vanished.
+ *
+ * The reference count of struct gpio_device is *NOT* increased like when the
+ * GPIO is being requested for exclusive usage. It's up to the caller to make
+ * sure the GPIO device will stay alive together with the descriptor returned
+ * by this function.
+ */
+struct gpio_desc *
+gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum)
+{
+	struct gpio_chip *gc = gdev->chip;
+
+	/*
+	 * FIXME: This will be locked once we protect gdev->chip everywhere
+	 * with SRCU.
+	 */
+	if (!gc)
+		return ERR_PTR(-ENODEV);
 
 	if (hwnum >= gdev->ngpio)
 		return ERR_PTR(-EINVAL);
 
 	return &gdev->descs[hwnum];
 }
-EXPORT_SYMBOL_GPL(gpiochip_get_desc);
+EXPORT_SYMBOL_GPL(gpio_device_get_desc);
 
 /**
  * desc_to_gpio - convert a GPIO descriptor to the integer namespace
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index bcf418441ef2..5c0f2ccfd51b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -767,6 +767,8 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
 void gpiochip_free_own_desc(struct gpio_desc *desc);
 
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
+struct gpio_desc *
+gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum);
 
 #ifdef CONFIG_GPIOLIB
 
-- 
2.39.2

