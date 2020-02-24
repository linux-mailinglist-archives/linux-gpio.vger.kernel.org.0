Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9942516A2E4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2020 10:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbgBXJmR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Feb 2020 04:42:17 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42163 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgBXJmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Feb 2020 04:42:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id p18so5893333wre.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2020 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=neyVk7RV4OtR4xz1BjORPRhapgH6pG8UY6Ux3fjGOFc=;
        b=MR4PxrVDnc11dgXc3VKdsrLqF9uj/yQxIojpZo+q77djYlG4zSeosEurwIhQWSE35B
         nylE3fSNnevJfrjvHDqkg4vBdRlsrPMcFA/qDcKdfOwjhEzcScdcl9yrMkikDlu4vREi
         H3sQWPNWfo/4/Gr1sMR7gfXYUGYyCSyIa32ZBVhJsH78gnq5Q9qSJysaeKV8whGAgpgx
         Pb0eHwyIdjlP3fiu/2TU7izxtZIA0lajVoR93lEWMsBPeGRjVeVOeCVmZ6vPLwvyzw7o
         h2WzV40No0uYN/ec/HB5E8HdS4w8IoVCK94AuO17SCplfuxnh64cbOF3kqkD/v3bo3Ww
         gY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neyVk7RV4OtR4xz1BjORPRhapgH6pG8UY6Ux3fjGOFc=;
        b=ST9pchsu9Za88AVaPvMpKkmaOPuGuN7/HyT8xsSgaZesOaQrLX01D+A2geRy27xPiP
         SC6avCAGtG4mAYIirwNw67ycLKAx9Utc6HiQP7Qm7KLtGc79g9pox85utAYv7UTRmezy
         zjmfc78+Yl7Xlc/oEDyMQ+T+GSbU6M6c7jKSolwmWdb/0ddFMPI2qIXajMvb1i/vtIXh
         urxSiXIfWTVZ8ci1CX2OjfPglUMx53CjQ3ycABThWRTQ6cBrtonqbAMOBpMQ+anV2oZR
         VBBjVF9ScLPVr64lPBSJrwAPcPHRoPcjXx6kKKvDsNKoXDwSx9LRdMhPuNxOIJErQBkb
         Ux7w==
X-Gm-Message-State: APjAAAVcqEiuhYtg+XEj8PEAt7bQ1pEQp4nWub6OMkQZwPf3CCUfEJU7
        5k59BrYQKnEc1IaJvidtwxoJWQ==
X-Google-Smtp-Source: APXvYqxL+aCG2wMJPp+XrNvvfAKcfdqb0x0Dm729ywFQYAHCElqUCZQkzGYMYSOnlsA0AlTLZqOS9g==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr71182804wrw.60.1582537324674;
        Mon, 24 Feb 2020 01:42:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id t10sm16920730wmi.40.2020.02.24.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 01:42:04 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/3] gpiolib: use kref in gpio_desc
Date:   Mon, 24 Feb 2020 10:41:57 +0100
Message-Id: <20200224094158.28761-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224094158.28761-1-brgl@bgdev.pl>
References: <20200224094158.28761-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c        | 40 +++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  9 ++++++++
 3 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index da8ffd40aa97..e97ea1e113a1 100644
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
@@ -2941,6 +2943,13 @@ void gpiod_free(struct gpio_desc *desc)
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
@@ -5075,18 +5084,41 @@ struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
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
-	if (desc)
-		gpiod_free(desc);
+	might_sleep();
+
+	VALIDATE_DESC_VOID(desc);
+
+	kref_put(&desc->ref, gpiod_free_kref);
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
+	VALIDATE_DESC_PTR(desc);
+
+	if (!test_bit(FLAG_REQUESTED, &desc->flags)) {
+		pr_warn("gpiolib: unable to increase the reference count of unrequested GPIO descriptor\n");
+		return desc;
+	}
+
+	kref_get(&desc->ref);
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
index bf2d017dd7b7..02b136884923 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -81,6 +81,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
 							const char *con_id,
 							enum gpiod_flags flags);
+struct gpio_desc *gpiod_ref(struct gpio_desc *desc);
 void gpiod_put(struct gpio_desc *desc);
 void gpiod_put_array(struct gpio_descs *descs);
 
@@ -237,6 +238,14 @@ gpiod_get_array_optional(struct device *dev, const char *con_id,
 	return NULL;
 }
 
+static inline struct gpio_desc *gpiod_ref(struct gpio_desc *desc)
+{
+	/* GPIO can never have been requested */
+	WARN_ON(desc);
+
+	return NULL;
+}
+
 static inline void gpiod_put(struct gpio_desc *desc)
 {
 	might_sleep();
-- 
2.25.0

