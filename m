Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89449164033
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgBSJW0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:26 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56213 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgBSJW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:26 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so5622535wmj.5
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8EYskHCO+Ze6d2P/0tNY66T5czh8vXZPUNBi7vs1Mng=;
        b=PvkqZ1DD7PX52G/eA7u72zEvePAPG0FfjU3TFvvxfsXMcp/FUpJdyrVLko9XMABHRX
         DmQkxjo4jFqZ131bGV2WCRbfRq4uGQ79OnrWkruOdGsC96qk5etFiZAUj+TXZTgTyDxA
         QG18MWfjDvTSBLMCbZp2WqCkzrhbHJ0+UotspPWhTeQkE6kDWhJsGnGIxQFfTCVZ5DGe
         R31RAeRZ2NuZagH4Y5u3vt5kWPU4nrUT6Y1lB728Zlwu7zFsXAiQLHfo1/psAvlZUfq0
         jLvJ8fVhHXcct8dNOxAFzWkuIEoG1qQGC9Li+13xHaxZUHOq9kyfmbFnBhab5VdV1k1n
         TXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8EYskHCO+Ze6d2P/0tNY66T5czh8vXZPUNBi7vs1Mng=;
        b=bxspuk/CXwdKX5DnbNeLji/e3JsMJljZm8Fa2B/s8+/qHRCp3N5HJwpGBuulAgxEbW
         iI1p4ueYWnv16AKPS1Cvwg8E19goR+qC18xN0CkePvEHr1P4pod5aoXr5bUsZ3JLiGq9
         sOidMR0FI+E409xGX8H201Np42C9Q6OuRLNC/BsNv0+l1wyIiw08jOh2BeXe0lazeJhY
         BYkzQGjyxWh32WZkUGimnGRAyctBqhPUapD2B/duEH4uRrntaZKv3QNdBoa5xTvaL4cZ
         CQoU23LBc1S1B0ySW9SXmV9qQuJT6KdTIv201bcAeXmxl4hGXGJ0u9loVHvYytN9NMXq
         xE8A==
X-Gm-Message-State: APjAAAVXFix3ng/BjRtPr8Cxd6/3d+Wo9A7snoy6GiwyjKvQS3DzxeaR
        Uza5r3QBo7ZMVbKwHuCcO43jnQ==
X-Google-Smtp-Source: APXvYqw9jrMzpPpWL+KcxGAO03nrW+jmOV33681F53QYsl6rCf0Ztjz9bWUOTa5o0Qzr9w2eeDOyLw==
X-Received: by 2002:a1c:688a:: with SMTP id d132mr9314062wmc.189.1582104143536;
        Wed, 19 Feb 2020 01:22:23 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:23 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 2/7] gpiolib: use kref in gpio_desc
Date:   Wed, 19 Feb 2020 10:22:13 +0100
Message-Id: <20200219092218.18143-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219092218.18143-1-brgl@bgdev.pl>
References: <20200219092218.18143-1-brgl@bgdev.pl>
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
 drivers/gpio/gpiolib.c        | 36 ++++++++++++++++++++++++++++++++---
 drivers/gpio/gpiolib.h        |  1 +
 include/linux/gpio/consumer.h |  1 +
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4d0106ceeba7..78220e86b2bd 100644
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
@@ -5067,18 +5076,39 @@ struct gpio_descs *__must_check gpiod_get_array_optional(struct device *dev,
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
+	if (!desc)
+		return NULL;
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

