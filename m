Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8621623B2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgBRJnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:43:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38717 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgBRJnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:43:02 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so2095596wmj.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vs4OE31WsiGbVv6LZjmXhIlNF139JU3dEyKrkLKqJNw=;
        b=Gh87iHnJUp96w4JmneMhAMF3S2lRCMXsSU0ngHBTa8HkWCPxKvhIOnJ+4cbWWsuhbr
         g2PYUv6jvLzhPYRzAuAgh6KrU3zq4SmHgni2Mqq9H0gPyPrZBrFSI5CG74GndMAsAzSP
         jQA+cKqHnwO/CZ3tj3mMGmXZnHjvEtXyFGh83Qo/kmnzYuKyjcupnxrToJnlk3jsIs1Q
         KuvzO7Bge9HoN+QoLk8b9bsR1xfRAus9DtXvJCUjSlVVTO22x0V1RXF+2896KGUqmuqC
         qu/FLvOMLRAUFD4mioSP6wP06BUh4fjb1AKsC8Du7Q7qNXDp4h2jOFlO+iQxvVeSjIIO
         fyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vs4OE31WsiGbVv6LZjmXhIlNF139JU3dEyKrkLKqJNw=;
        b=sIYGq6Dmwi1qfopUXCgYBZ8fnETEn3IZab8khgSHYRDRGxVGefE9A7A+pHZeIFGdOK
         Az9qBxN8BXMJvEO819S6/O33Yjj5vfw6d9dpA/CDcZy3qm/o4I0PJxIrSoVXeMxfo7i4
         8jNY7nuNaGjZNmv3pucbwj8HDT2Tc1LXhFPqajU7wPqoUX33FyHoMJXZI161hUD7qZDb
         jbpuE93dA9TV8L8+rPc+OHl6iZOZLmuOS2JX0BU8Ez6wgOXOPQEzbm30f5ug4aG/W9m2
         MQpgdyqEZn78r4ULEehPEWPp/41NKikCj65vqyYsewEEV8WMjFWr2FdQukAJZY+brBLC
         ASNg==
X-Gm-Message-State: APjAAAV1wli6YyN+1ximjgCUab86HHstYvCKAGIDGZNkjMnjfq+vylc/
        xIfdbcaMTarbRHdGx80+G2VQKg==
X-Google-Smtp-Source: APXvYqw6LI7HKtlyYh/EW5PH0yIC1CBM2N5kV+mfVOyfg1KJb2H5fXA4sVEJvezHg7MsQp/bKskuLA==
X-Received: by 2002:a05:600c:149:: with SMTP id w9mr2042148wmm.132.1582018979955;
        Tue, 18 Feb 2020 01:42:59 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id s23sm5351095wra.15.2020.02.18.01.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 01:42:59 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 3/7] gpiolib: use kref in gpio_desc
Date:   Tue, 18 Feb 2020 10:42:30 +0100
Message-Id: <20200218094234.23896-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218094234.23896-1-brgl@bgdev.pl>
References: <20200218094234.23896-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

GPIO descriptors are freed by consumers using gpiod_put(). The name of
this function suggests some reference counting is going on but it's not
true.

Use kref to actually introduce reference counting for gpio_desc objects.
Add a corresponding gpiod_get() helper for increasing the reference count.

This doesn't change anything for already existing (correct) drivers but
allows us to keep track of GPIO descs used by multiple users.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c        | 30 +++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  1 +
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7..582425e9b449 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2798,6 +2798,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 		goto done;
 	}
 
+	kref_init(&desc->ref);
+
 	if (chip->request) {
 		/* chip->request may sleep */
 		spin_unlock_irqrestore(&gpio_lock, flags);
@@ -2933,6 +2935,13 @@ void gpiod_free(struct gpio_desc *desc)
 	}
 }
 
+static void gpiod_free_kref(struct kref *ref)
+{
+	struct gpio_desc *desc = container_of(ref, struct gpio_desc, ref);
+
+	gpiod_free(desc);
+}
+
 /**
  * gpiochip_is_requested - return string iff signal was requested
  * @chip: controller managing the signal
@@ -5067,18 +5076,33 @@ struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
 EXPORT_SYMBOL_GPL(gpiod_get_array_optional);
 
 /**
- * gpiod_put - dispose of a GPIO descriptor
- * @desc:	GPIO descriptor to dispose of
+ * gpiod_put - decrease the reference count of a GPIO descriptor
+ * @desc:	GPIO descriptor to unref
  *
  * No descriptor can be used after gpiod_put() has been called on it.
  */
 void gpiod_put(struct gpio_desc *desc)
 {
 	if (desc)
-		gpiod_free(desc);
+		kref_put(&desc->ref, gpiod_free_kref);
 }
 EXPORT_SYMBOL_GPL(gpiod_put);
 
+/**
+ * gpiod_ref - increase the reference count of a GPIO descriptor
+ * @desc:	GPIO descriptor to reference
+ *
+ * Returns the same gpio_desc after increasing the reference count.
+ */
+struct gpio_desc *gpiod_ref(struct gpio_desc *desc)
+{
+	if (desc)
+		kref_get(&desc->ref);
+
+	return desc;
+}
+EXPORT_SYMBOL_GPL(gpiod_ref);
+
 /**
  * gpiod_put_array - dispose of multiple GPIO descriptors
  * @descs:	struct gpio_descs containing an array of descriptors
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 3e0aab2945d8..51a92c43dd55 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -119,6 +119,7 @@ struct gpio_desc {
 	const char		*label;
 	/* Name of the GPIO */
 	const char		*name;
+	struct kref		ref;
 };
 
 int gpiod_request(struct gpio_desc *desc, const char *label);
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index bf2d017dd7b7..c7b5fb3d9d64 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -81,6 +81,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
 							const char *con_id,
 							enum gpiod_flags flags);
+struct gpio_desc *gpiod_ref(struct gpio_desc *desc);
 void gpiod_put(struct gpio_desc *desc);
 void gpiod_put_array(struct gpio_descs *descs);
 
-- 
2.25.0

