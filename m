Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2491792DD2
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Sep 2023 20:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbjIESy5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Sep 2023 14:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238665AbjIESy4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Sep 2023 14:54:56 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA20CCE0
        for <linux-gpio@vger.kernel.org>; Tue,  5 Sep 2023 11:54:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso24889445e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Sep 2023 11:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940007; x=1694544807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2GE4FHHqs6bBZBv794WL9eWtt6b/gcHhoE6C2vLyfs=;
        b=qU/fWNXV1VJfKZ2SoOwOtjhwuDd0NYdQLryt6PlmFtdk073sxaBx8DHaIkvrlf7ih0
         044RxVvgY15XfF6o637PEbb3CfuM52holeRFB4yBINIbL0iSj4jRVep386mVXLT4CaOL
         uS+3PHKEqcpzRfusgTfiDxdEUJn++OmfPjg4E0jz2FU4QwVDtUL7k1+aktNGDqxh69zp
         1zOAJZghnJ8SilpocO4fKNsk1QMZoYxVi6YH4h7woAupKdkh33Rz3DMKudoN2PL1RTZ3
         fBF8vOHHOB7TWvpJUV72sEs1gEEKAhmt/O+H9l6A3fuxqgHBaqHgGAxT2M1u3rkRen4Z
         xJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940007; x=1694544807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2GE4FHHqs6bBZBv794WL9eWtt6b/gcHhoE6C2vLyfs=;
        b=CO5Z3sG3g4yhLMX9rCOqzgcY/LDOwbBsaIh5UWGlyRNoLm1TkISnpZRnVSJjgdsBSy
         OSDSGdWXhOBAdCvL85ec6AqDDgOs8ZuEnY4iGVsONMMuuH82qVjDkelMrL+4idDXQ5wB
         3Tttf/CT+5KFE6/XkXCcyUB8L3ZMA7JQkuRIEd7gj4hiLS/HsuLYZz2dOy5VHu3iRuF1
         sUX+FuSlRPfkotoANzOz2e1sXFwJqSbkm/P2rVWOTgnMxeh5/dT1XPVZwhMkQcXPJ+DS
         EOT7FBlGumJwmHflxE6UWEVKc4YDQSeH7QlIRxUaQf329tJAby7oYegyTGYXHE8vRkIi
         KK7Q==
X-Gm-Message-State: AOJu0YwWMuCctqtQ9a0edATeB8Jyeuil7SmoVkqiVC2h/1DciZLcF16G
        W0ikQPgVJQ/9mwwqiwWXZvNMKA==
X-Google-Smtp-Source: AGHT+IEMv51XL5FvHHG3cRgXKYfBtpCzIaG0xueCnriuyRygrFNOOQC3x8IGQeLMqwqbAjFRM5ODiw==
X-Received: by 2002:adf:ce8c:0:b0:31c:762b:ceb3 with SMTP id r12-20020adfce8c000000b0031c762bceb3mr489509wrn.48.1693940007276;
        Tue, 05 Sep 2023 11:53:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 01/21] gpiolib: make gpio_device_get() and gpio_device_put() public
Date:   Tue,  5 Sep 2023 20:52:49 +0200
Message-Id: <20230905185309.131295-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
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

In order to start migrating away from accessing struct gpio_chip by
users other than their owners, let's first make the reference management
functions for the opaque struct gpio_device public in the driver.h
header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 24 ++++++++++++++++++++++++
 drivers/gpio/gpiolib.h      | 10 ----------
 include/linux/gpio/driver.h |  3 +++
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index edffa0d2acaa..f84ad54d8dbd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1058,6 +1058,30 @@ static struct gpio_chip *find_chip_by_name(const char *name)
 	return gpiochip_find((void *)name, gpiochip_match_name);
 }
 
+/**
+ * gpio_device_get() - Increase the reference count of this GPIO device
+ * @gdev: GPIO device to increase the refcount for
+ *
+ * Returns:
+ * Pointer to @gdev.
+ */
+struct gpio_device *gpio_device_get(struct gpio_device *gdev)
+{
+	return to_gpio_device(get_device(&gdev->dev));
+}
+EXPORT_SYMBOL_GPL(gpio_device_get);
+
+/**
+ * gpio_device_put() - Decrease the reference count of this GPIO device and
+ *                     possibly free all resources associated with it.
+ * @gdev: GPIO device to decrease the reference count for
+ */
+void gpio_device_put(struct gpio_device *gdev)
+{
+	put_device(&gdev->dev);
+}
+EXPORT_SYMBOL_GPL(gpio_device_put);
+
 #ifdef CONFIG_GPIOLIB_IRQCHIP
 
 /*
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 9bff5c2cf720..3ccacf3c1288 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -86,16 +86,6 @@ static inline struct gpio_device *to_gpio_device(struct device *dev)
 	return container_of(dev, struct gpio_device, dev);
 }
 
-static inline struct gpio_device *gpio_device_get(struct gpio_device *gdev)
-{
-	return to_gpio_device(get_device(&gdev->dev));
-}
-
-static inline void gpio_device_put(struct gpio_device *gdev)
-{
-	put_device(&gdev->dev);
-}
-
 /* gpio suffixes used for ACPI and device tree lookup */
 static __maybe_unused const char * const gpio_suffixes[] = { "gpios", "gpio" };
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 8f0859ba7065..a2060dc3344b 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -606,6 +606,9 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 struct gpio_chip *gpiochip_find(void *data,
 				int (*match)(struct gpio_chip *gc, void *data));
 
+struct gpio_device *gpio_device_get(struct gpio_device *gdev);
+void gpio_device_put(struct gpio_device *gdev);
+
 bool gpiochip_line_is_irq(struct gpio_chip *gc, unsigned int offset);
 int gpiochip_reqres_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_relres_irq(struct gpio_chip *gc, unsigned int offset);
-- 
2.39.2

