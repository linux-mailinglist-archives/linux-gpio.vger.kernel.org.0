Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2B9168248
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbgBUPtJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:49:09 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36179 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729224AbgBUPsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:48:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so2412969wma.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNOyXL2FHV1G3B3dMKi0NeHmPme3SyjuhzWOnvysfO4=;
        b=e06/jlR3Xwj0soL+EDf9/Gy1sjopUiSvXC+XtqUVPQxBvCHkODs3Zx4PnV9t3MH4JU
         l+OBb2kcjOFLo39kJ0XPZcUROuyKYAURuoBljL4yoq4DTSfGwrhZOry2Fm9KyKeZk1jE
         dCsO+2Qio9iv7eEJbwlEmwbFCY5jZyVL+oM10PXEtwFahGCIz1EH5sMbDhEgwpkozxaS
         AHH5p3ZWjEkqq21eO/yRjwBd5BUET6p0K3MwqtFRbrZN3TClWi9Fqj++Qscy0ZmaH8Z2
         3jn5PC5zIBgfDsGIvmS87aC2FoBXXEGQGNKfNm+lJS7iwvWnC4yIuFcviyuBHhhdjevZ
         6M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNOyXL2FHV1G3B3dMKi0NeHmPme3SyjuhzWOnvysfO4=;
        b=T99xRzG097H2NwUvt6YQQusUCzR/JcuG09ATAUnCnruYiXDFIfR9BnWhyNdSSs0TJW
         CoLoUxBZMYfPFEKDz0qeN1g7RVJYOC2+JcIvnjgLXdLYX8teKntg0fj8tN3dSZTf35fX
         xE0m4CVQi5kaKIGz/Ea62gyv2F3QNmLsGX5iKS1SzYTKFW6GKRXuxUXmitlD0lpsTzYZ
         Ih/I0HHlvkgMO7MWCAhFVjLAHts+z7z1O8UYOkZCy6jwLp702Twe80hNe5lE32y6ATfN
         yyVHEpDRCY2D7xCs3JDK8JmU5YBf3EBIYJWDrCKv58KI1/0rLe3cpQRes8uFc4AsPyno
         wX/Q==
X-Gm-Message-State: APjAAAWnEmi8BdyJLbx0ece3ei+wy6+3AfCvl78YJddyf1USCwoWsPFy
        yDQMjnhe7m0jdFfyqGrw5ff4ew==
X-Google-Smtp-Source: APXvYqyEtSzwy7SeYEJm34vV+VbjKSo7cTIGWkkhLtuA0xig9qkgHnOUHAAWlL3ybLVc5GPl8Pk58w==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr4641601wmg.151.1582300131453;
        Fri, 21 Feb 2020 07:48:51 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h10sm4267947wml.18.2020.02.21.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:48:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 3/5] gpiolib: use kref in gpio_desc
Date:   Fri, 21 Feb 2020 16:48:35 +0100
Message-Id: <20200221154837.18845-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221154837.18845-1-brgl@bgdev.pl>
References: <20200221154837.18845-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c        | 38 +++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  1 +
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index da8ffd40aa97..a00e28ca8a49 100644
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
@@ -5075,18 +5084,39 @@ struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
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

