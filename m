Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF0A7A21BF
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Sep 2023 17:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbjIOPDu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Sep 2023 11:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbjIOPDn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Sep 2023 11:03:43 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC1A270B
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 08:03:36 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-404c023ef5eso2588435e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 08:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694790215; x=1695395015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTcEgfPoq9MntpjrBDVs2nRvtCmOFJGrOAf8mTlZ6ic=;
        b=rdjoB0xKsHGM1x4R8s9X1xCAIsSLxu+2w6b65eLwNkKUp8wMQ+Qimk3fscXUeZBMy3
         pKRHHtw9gnL3qMDHS0ZX4E+PVgQgT00bLeFR1oKcUGzHMhhHFKPU4rX7QlrJgTxO7CwX
         2aJxIf3fTORUfXgp4JK/pUZNfOiCfv/cZuVAfeuym8iy3ZaZph6KzWFN/eBUC31uv9TR
         ruj7JWXFjAl6EN6KhhdP5bExQokO4RoCC2/9tmGOcDMlXLoygLiUy3fPb94XyAVgyudc
         bn5ioJMwdnx8nCo6RgVzsAM4n9bZJTUzGjdA8opuWIGHogu8du42FvQorsvZFpsbXSKb
         +Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694790215; x=1695395015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTcEgfPoq9MntpjrBDVs2nRvtCmOFJGrOAf8mTlZ6ic=;
        b=XYOJ7eTS54uHk24hrY0fJt65WJ2TYqmiDYOXF1t8xl0D48lXYQx4vOaiS70Ic28uLS
         X/NbrIFHTZOe/kK4bjzs6+h4qtkxYC+TUCJSkctl4VP4NTm+fnLYcmGSR1iuzm1ZWAca
         kPkA9mjlNNOBNk1nctl4kA9jjfKxcFhrUhxZmiO44pALvaME0RSh4b1LU/j+L80WH4Rh
         /PIw1jq63dr5ommNfjTI0v4L2HWKjrsGvUJXmLMNBx2L4ug5xRhzbLI85ILMW8w10scy
         0XL/QsIIrZM0aFTWxSCR3oiHOvLrAMoLy66in5D50nxUkvL1nf6ufDbFLR0fw/FdanWU
         yj2Q==
X-Gm-Message-State: AOJu0Yw+2N3QOg+yKssgN9RTttsQnojPFX7liRIDEvtSV3nC20B8qDJV
        X4WSjPaOJ7ASiX4e5aFX2KieSfXl3LIcoFKznSk=
X-Google-Smtp-Source: AGHT+IGSX35Oc0GhsqAkUcP/myKirkzaVx8dZFAZLfR2EHYxjRgGM6Pp7ksYimIT1wHVVOr0U4lfNA==
X-Received: by 2002:a05:600c:2144:b0:402:f55c:faee with SMTP id v4-20020a05600c214400b00402f55cfaeemr1732253wml.26.1694790214756;
        Fri, 15 Sep 2023 08:03:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:aa19:4569:aeeb:c0d3])
        by smtp.gmail.com with ESMTPSA id hn40-20020a05600ca3a800b003fef19bb55csm4853369wmb.34.2023.09.15.08.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:03:34 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 04/11] gpiolib: provide gpio_device_find_by_label()
Date:   Fri, 15 Sep 2023 17:03:19 +0200
Message-Id: <20230915150327.81918-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230915150327.81918-1-brgl@bgdev.pl>
References: <20230915150327.81918-1-brgl@bgdev.pl>
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

By far the most common way of looking up GPIO devices is using their
label. Provide a helpers for that to avoid every user implementing their
own matching function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c      | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0371d23f0a46..9f20311e4c1a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -1081,6 +1082,26 @@ struct gpio_device *gpio_device_find(void *data,
 }
 EXPORT_SYMBOL_GPL(gpio_device_find);
 
+static int gpio_chip_match_by_label(struct gpio_chip *gc, void *label)
+{
+	return gc->label && !strcmp(gc->label, label);
+}
+
+/**
+ * gpio_device_find_by_label() - wrapper around gpio_device_find() finding the
+ *                               GPIO device by its backing chip's label
+ * @label: Label to lookup
+ *
+ * Returns:
+ * Reference to the GPIO device or NULL. Reference must be released with
+ * gpio_device_put().
+ */
+struct gpio_device *gpio_device_find_by_label(const char *label)
+{
+	return gpio_device_find((void *)label, gpio_chip_match_by_label);
+}
+EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
+
 static int gpiochip_match_name(struct gpio_chip *gc, void *data)
 {
 	const char *name = data;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 6ad1f1a8ef2e..24996cba6465 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -610,6 +610,7 @@ struct gpio_chip *gpiochip_find(void *data,
 
 struct gpio_device *gpio_device_find(void *data,
 				int (*match)(struct gpio_chip *gc, void *data));
+struct gpio_device *gpio_device_find_by_label(const char *label);
 
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
-- 
2.39.2

