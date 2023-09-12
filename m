Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3E079CD4B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 12:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233833AbjILKIR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 06:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234070AbjILKHq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 06:07:46 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F0C198C
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:42 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-402d499580dso57439335e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694513261; x=1695118061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yjw2Sx7Aq1HDg3hSjQzpJvKG22q88QmH6ugiYX5BMXI=;
        b=gn6MQKLQwHECLcrK0PWXrM4E1AH349KTmcy0Fq5UGSE7OP+q4MuhoKFjwOX4jCioSv
         G2nNKuHafWzy/PvuJh0r+hUGic/F/3s+Bt6EGzvVU58kUlbhtC0xDKwTzUJzWNymnWm7
         K3tYZqZRSdkWVpSj6mv4YvdZSkqeaTQgswJCDyZ1nvLKf5HJHzu3oM1+FpfFSNr6K6y2
         7OmWmQcGRW4N9A7VokoJx7mhcwCPr9KZ9MgXuBXlakLoTy6x0JK9f7/iG1++3chN3mYi
         Tb2otc/Ycqh19MKhGZlHecqeudkpsPztVQYE/x2Vm6LvxR1mA7GFQALXD/yxSWLqS1/D
         Bf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513261; x=1695118061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yjw2Sx7Aq1HDg3hSjQzpJvKG22q88QmH6ugiYX5BMXI=;
        b=niEAZfFB+rgqQvrQzl7ARAPKRnFiIGs4Sl/uBLbFax07Li9UTOyT+xJXilkhBiSQjH
         AYTsWLV/zKA68Rjjo4WGDnlAaW3zVjiR+2mkwv9GT+Z1u6elpUGhXtJjo089R82eb9WP
         bK0hU9Q0gneLbK3lX/j6bNIS6PudRIAYhv76W03T1k9TONsM9s5DdFjy+PXgEWHma5eN
         WGW9u+fXhfNK5uECJMIc6q1cuQsrB3D5TQgmtJ1V6AFX95+NyV/KfXoXfRXK4scw+lU4
         7c976IzeDs7BqD2Fg30IS5KEVGiPfdl1qFv5Z7WjzUYkshocp2dXJxnieaJ/BhXSWBRF
         oJtA==
X-Gm-Message-State: AOJu0Yx6RmfFEK23OEhNwh90wwxT8zO8WQRaTB85pVlRhuH0aOfXv5HD
        YrDHNWYZAe+UZR2RSUAWuaTwqc7BBvRu6L5unTE=
X-Google-Smtp-Source: AGHT+IHGPSa2JUipRzSqKipXpdiSn+a7Tbfpw/9aU9Pk43iaDiaKJin4lOiQ5XXdbJN9KVtTdNY/eQ==
X-Received: by 2002:a7b:c412:0:b0:3fb:df34:176e with SMTP id k18-20020a7bc412000000b003fbdf34176emr10913436wmi.31.1694513260984;
        Tue, 12 Sep 2023 03:07:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:907f:4cd7:f0ae:6b2a])
        by smtp.gmail.com with ESMTPSA id h5-20020adfe985000000b0031ae8d86af4sm12351417wrm.103.2023.09.12.03.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:07:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 06/11] gpiolib: reluctantly provide gpio_device_get_chip()
Date:   Tue, 12 Sep 2023 12:07:22 +0200
Message-Id: <20230912100727.23197-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912100727.23197-1-brgl@bgdev.pl>
References: <20230912100727.23197-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The process of converting all unauthorized users of struct gpio_chip to
using dedicated struct gpio_device function will be long so in the
meantime we must provide a way of retrieving the pointer to struct
gpio_chip from a GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e413136d1566..224e0d330009 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -219,6 +219,27 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
+/**
+ * gpio_device_get_chip() - Get the gpio_chip implementation of this GPIO device
+ * @gdev: GPIO device
+ *
+ * Returns:
+ * Address of the GPIO chip backing this device.
+ *
+ * Until we can get rid of all non-driver users of struct gpio_chip, we must
+ * provide a way of retrieving the pointer to it from struct gpio_device. This
+ * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
+ * chip can dissapear at any moment (unlike reference-counted struct
+ * gpio_device).
+ *
+ * Use at your own risk.
+ */
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
+{
+	return gdev->chip;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_chip);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5c0f2ccfd51b..a583e539263e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -770,6 +770,8 @@ struct gpio_desc *gpiochip_get_desc(struct gpio_chip *gc, unsigned int hwnum);
 struct gpio_desc *
 gpio_device_get_desc(struct gpio_device *gdev, unsigned int hwnum);
 
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev);
+
 #ifdef CONFIG_GPIOLIB
 
 /* lock/unlock as IRQ */
-- 
2.39.2

