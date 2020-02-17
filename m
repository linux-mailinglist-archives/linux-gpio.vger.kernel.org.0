Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17FE9161C02
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 20:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgBQTyo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 14:54:44 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37044 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729501AbgBQTym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 14:54:42 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so21212053wru.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6usHAmM/tR1NKSe7ERsXJJ85CdMUxDouW36IMeIpPc=;
        b=wSVgzTK6HYqnvIH30T0/Plu/iTE9+fXiAC1ZolWfS+DwZfVQb9FKUv/6zIiyKmNora
         QxYdgNKCdsM3P5dVwwznjeg4kdr3jQ4OAnDdP+fXYwx/umaI2MITR1/ACKA/ajPf8Sr5
         xVgP9ZzC4nlgxEPjQPgfIW54a4jlsqOKkt3c6hvpDLsiJu9jnxTqkbRJNrxoY821jQvf
         XfTTiAdAxMvzHxQ+M7Tc3nGVXv1v9e/8qMwFO1gklj2H2dl3oyjtMs5jCFHgvdldFBLU
         5fpSRq9HgEpCChnYJKjMbOcZ+dTLoR69OvHOyqYgwBDx1650LY6DDzhzmfYH3im3/lqq
         071w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6usHAmM/tR1NKSe7ERsXJJ85CdMUxDouW36IMeIpPc=;
        b=Ev65q2X3KmYAi1CZ+JqMdeJ/MUtGlu+lHyKfXnq1oau3kw6XJNAPoUSsVdYM/tXFDk
         2noBC7gvOQp4EXejIInkqWURKZteKMbOUe2xSkQaBvQ40fUESuIiU7LsRGPjBjuprtc8
         ruN/1Iepc5q2iNH9E/hLV+P56RJcafW+N9/u3rCKaf/WkoZDZ5jim0kgRg/ohWdRwhop
         /lgamfntjHSwYLXUc5r9sd3loBtRhpmKo5aykj36gs4Pnj9ZTk8zg7PKV8viLzwmfN37
         tcgRUkbgdeRreod82/GYvO9fhZI80KEBuHrt5RhnFko1DjzuafVXO7x8Azp85B6Q6PSd
         leKw==
X-Gm-Message-State: APjAAAWNV8Huo8o/0xce74rG8wslKHHREeXOz0IkyQfMgSs59aPUagfC
        FLmG453xx1GbuXJYp5txgBOToQ==
X-Google-Smtp-Source: APXvYqzN+aH7ss4CRCso05uviGcmNd0mlhFjxAFlhCrMb02hfYJnGZDhWu8xq8nlz/swjAqd5cmjRA==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr22981757wrw.31.1581969280760;
        Mon, 17 Feb 2020 11:54:40 -0800 (PST)
Received: from debian-brgl.local (8.165.185.81.rev.sfr.net. [81.185.165.8])
        by smtp.gmail.com with ESMTPSA id v5sm2679469wrv.86.2020.02.17.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:54:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/6] gpiolib: use kref in gpio_desc
Date:   Mon, 17 Feb 2020 20:54:30 +0100
Message-Id: <20200217195435.9309-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217195435.9309-1-brgl@bgdev.pl>
References: <20200217195435.9309-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c        | 26 +++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  1 +
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7..1f781cb97437 100644
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
@@ -5067,18 +5076,29 @@ struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
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
+ */
+void gpiod_ref(struct gpio_desc *desc)
+{
+	if (desc)
+		kref_get(&desc->ref);
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
index bf2d017dd7b7..b12bbd511c6e 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -81,6 +81,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
 							const char *con_id,
 							enum gpiod_flags flags);
+void gpiod_ref(struct gpio_desc *desc);
 void gpiod_put(struct gpio_desc *desc);
 void gpiod_put_array(struct gpio_descs *descs);
 
-- 
2.25.0

