Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C4279CD43
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 12:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbjILKIF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 06:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbjILKHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 06:07:44 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3577173F
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401d80f4ef8so58252475e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 03:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694513259; x=1695118059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCDUk9FL9Q692ddNjdMXT5ENU2BFc69rKKghpfXciCM=;
        b=poGu0EP8lj+w4zbeuEzRBK6ITBxCWpNXEyUP6ifqtEhX/o9MhFQsAFi+6cobT1Yi36
         cHvgIR14G9Hr+ij1G8IFoOS9NiDBjfQgdLhbP5XEmsqrnEDVESxhf7l806npe6wtVkdl
         2qusW8WEBB2Vm3a1oOyiMh9wpVKRfB/GZPPQliPZGd5UTjerNLtf/fm3Tlng1t6RQnNF
         +2aHQ20LCScs93M3zr5/q8VGZvXP8dzgJBPAvYdH+CBLhUxLb6bIYBQAeJTqj1oS97g/
         uUOn6D7VrGo7G+BAM7ZRnSucoGyGacGVLz7xPfQbuHojVOXdqwm4OKJs6aOo8qfdAbvu
         vH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694513259; x=1695118059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCDUk9FL9Q692ddNjdMXT5ENU2BFc69rKKghpfXciCM=;
        b=anavSlLrv+LYW5/Bxrl8LDh1Ekbluzu/bVkYUd1+zJSjxDuj8Zn9oCqjNkDGzl4lw5
         ArTwk0FkljxpGaAddubMnzc+ol/i6HajF5bCt0Uz0IdJ8GRJWqmey5Mqz/4VFkg18Vzn
         MJjKVV0DOdF9EBTo2DTZRwuRWKnTzYDUvJW6ghKGtpmpwaOrL9aXvQjAT9jzIg3biagX
         CySQM2Ycrc2hI9v91QiEDIV/jm60HZG9gFjEzReAZKOVzP65mRrFhKpA7u23q4ffVSAF
         qKCN5qmkBxM9eKhryevrEFKIG8OiyfzyFxHYeHzWGFh57qjzCACrzp5GTGlgL5nWwVSg
         fPWA==
X-Gm-Message-State: AOJu0Yx3LIWlGtiyDvg3eBbVSq6IG7ZuCmbEqMoyy/o6Aouw6EtnL5Ej
        Ucvpkn9rO3KhN0S8MUfcYB8IoA==
X-Google-Smtp-Source: AGHT+IHonzMB2+V21JxFk2G89bW7yRBbI8iwIHB8aj8JCPZvn5vupWvvr6zj/Tl3xtbb6FaYGD/jfQ==
X-Received: by 2002:a7b:cd82:0:b0:401:b6f6:d8fd with SMTP id y2-20020a7bcd82000000b00401b6f6d8fdmr10899242wmj.6.1694513259338;
        Tue, 12 Sep 2023 03:07:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:907f:4cd7:f0ae:6b2a])
        by smtp.gmail.com with ESMTPSA id h5-20020adfe985000000b0031ae8d86af4sm12351417wrm.103.2023.09.12.03.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 03:07:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 04/11] gpiolib: provide gpio_device_find_by_label()
Date:   Tue, 12 Sep 2023 12:07:20 +0200
Message-Id: <20230912100727.23197-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230912100727.23197-1-brgl@bgdev.pl>
References: <20230912100727.23197-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index bf27cc8392fb..bcf418441ef2 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -608,6 +608,7 @@ struct gpio_chip *gpiochip_find(void *data,
 
 struct gpio_device *gpio_device_find(void *data,
 				int (*match)(struct gpio_chip *gc, void *data));
+struct gpio_device *gpio_device_find_by_label(const char *label);
 
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
-- 
2.39.2

