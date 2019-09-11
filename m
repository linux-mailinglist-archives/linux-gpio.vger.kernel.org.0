Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BBEAF73D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfIKHw3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36533 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727232AbfIKHw3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id j191so568919pgd.3;
        Wed, 11 Sep 2019 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xxrtIfSruvrXHw4q7jKv1F46B8PQJ0pGIOgebDon1hA=;
        b=O1LmxtXZigIBphs1DwmQApvNXGIG79sP7qyLAVkvGSf0mot+9HkTtFO9nlSA9x9iuE
         bk0I+rZnmjBksAXZyI8+E/CperrUyDsD69KfZhCZihiSyMhdj0xYtKtUJFC67/apf9E4
         gqf/kpiiu4h4nhR5h1zyiu+eYrCLsYYrD4lD5d88Lci955PhIZxkJBO6y/5d6IH2roeO
         gNBxeNCDqio4x/X0vl/m7m6ibp9dtqCwrydybiIwP6679vHLyQg4WrWk3DBv07emPet5
         KqxsrYNdqjNQgS/0UI7FND112zt+0GeU2C+1QBNoMYdQr9QqP14W7ccGA9jhWJKF79fc
         grUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xxrtIfSruvrXHw4q7jKv1F46B8PQJ0pGIOgebDon1hA=;
        b=UC5Ju+xSZEA+4VOE3dATsmJFlkA0TND3uWQElTFsf4SWXT1+FDJVon6bJYwPTj2Pid
         achXxfyPTSx98cxwAlE29tklmKyyNCl8Ftkp01auGjRwMaeeD0UAQC5LjepT+Emg+len
         0WaHPN5Ealp4Do9eZBl8gvZjopvOCMZJsBagXaGXkoviEMZOY4eILZFM2BG6CZ40CFix
         AZD+AkpH3zXmSwLAbuMuBKShg2rD46Ap5DGW4ZmFiU4JQs2xojby8Ynb5QY4ghOpUZ8M
         VCX+H46KUTTMr1BwQnE2GQIjzvg4mLcZwUr48sF0f+GnRbxQ40toZNOxa691X0TrwUgJ
         ZE3g==
X-Gm-Message-State: APjAAAV/MLddHZAGNKfPlGrWvcY+qm1sguDFygLt09Hoq60HZENubcBr
        wKEujne4/4JIiLHRfaBZj8Y=
X-Google-Smtp-Source: APXvYqxzV10kyx30B4mcUy5MrnFZL1M7/hU1vEaVzNb1qZE6gzjvIGja4ITH+2F73YPFiJrPwJXuOw==
X-Received: by 2002:a62:db84:: with SMTP id f126mr41629628pfg.25.1568188348113;
        Wed, 11 Sep 2019 00:52:28 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:27 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 07/11] gpliolib: make fwnode_get_named_gpiod() static
Date:   Wed, 11 Sep 2019 00:52:11 -0700
Message-Id: <20190911075215.78047-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that there are no external users of fwnode_get_named_gpiod() we can
make it static.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/gpio/gpiolib.c        | 108 ++++++++++++++--------------------
 include/linux/gpio/consumer.h |  13 ----
 2 files changed, 43 insertions(+), 78 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f15e3880aae5..54db2c42e9a0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4314,6 +4314,49 @@ static int platform_gpio_count(struct device *dev, const char *con_id)
 	return count;
 }
 
+static struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
+						const char *propname, int index,
+						enum gpiod_flags dflags,
+						const char *label)
+{
+	unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	struct gpio_desc *desc = ERR_PTR(-ENODEV);
+	int ret;
+
+	if (!fwnode)
+		return ERR_PTR(-EINVAL);
+
+	if (is_of_node(fwnode)) {
+		desc = gpiod_get_from_of_node(to_of_node(fwnode),
+					      propname, index,
+					      dflags,
+					      label);
+		return desc;
+	} else if (is_acpi_node(fwnode)) {
+		struct acpi_gpio_info info;
+
+		desc = acpi_node_get_gpiod(fwnode, propname, index, &info);
+		if (IS_ERR(desc))
+			return desc;
+
+		acpi_gpio_update_gpiod_flags(&dflags, &info);
+		acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
+	}
+
+	/* Currently only ACPI takes this path */
+	ret = gpiod_request(desc, label);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
+	if (ret < 0) {
+		gpiod_put(desc);
+		return ERR_PTR(ret);
+	}
+
+	return desc;
+}
+
 /**
  * fwnode_gpiod_get_index - obtain a GPIO from firmware node
  * @fwnode:	handle of the firmware node
@@ -4574,71 +4617,6 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpiod_get_index);
 
-/**
- * fwnode_get_named_gpiod - obtain a GPIO from firmware node
- * @fwnode:	handle of the firmware node
- * @propname:	name of the firmware property representing the GPIO
- * @index:	index of the GPIO to obtain for the consumer
- * @dflags:	GPIO initialization flags
- * @label:	label to attach to the requested GPIO
- *
- * This function can be used for drivers that get their configuration
- * from opaque firmware.
- *
- * The function properly finds the corresponding GPIO using whatever is the
- * underlying firmware interface and then makes sure that the GPIO
- * descriptor is requested before it is returned to the caller.
- *
- * Returns:
- * On successful request the GPIO pin is configured in accordance with
- * provided @dflags.
- *
- * In case of error an ERR_PTR() is returned.
- */
-struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname, int index,
-					 enum gpiod_flags dflags,
-					 const char *label)
-{
-	unsigned long lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	struct gpio_desc *desc = ERR_PTR(-ENODEV);
-	int ret;
-
-	if (!fwnode)
-		return ERR_PTR(-EINVAL);
-
-	if (is_of_node(fwnode)) {
-		desc = gpiod_get_from_of_node(to_of_node(fwnode),
-					      propname, index,
-					      dflags,
-					      label);
-		return desc;
-	} else if (is_acpi_node(fwnode)) {
-		struct acpi_gpio_info info;
-
-		desc = acpi_node_get_gpiod(fwnode, propname, index, &info);
-		if (IS_ERR(desc))
-			return desc;
-
-		acpi_gpio_update_gpiod_flags(&dflags, &info);
-		acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
-	}
-
-	/* Currently only ACPI takes this path */
-	ret = gpiod_request(desc, label);
-	if (ret)
-		return ERR_PTR(ret);
-
-	ret = gpiod_configure_flags(desc, propname, lflags, dflags);
-	if (ret < 0) {
-		gpiod_put(desc);
-		return ERR_PTR(ret);
-	}
-
-	return desc;
-}
-EXPORT_SYMBOL_GPL(fwnode_get_named_gpiod);
-
 /**
  * gpiod_get_index_optional - obtain an optional GPIO from a multi-index GPIO
  *                            function
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 5215fdba6b9a..2f5e825f4601 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -172,10 +172,6 @@ int desc_to_gpio(const struct gpio_desc *desc);
 /* Child properties interface */
 struct fwnode_handle;
 
-struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname, int index,
-					 enum gpiod_flags dflags,
-					 const char *label);
 struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 					 const char *con_id, int index,
 					 enum gpiod_flags flags,
@@ -526,15 +522,6 @@ static inline int desc_to_gpio(const struct gpio_desc *desc)
 /* Child properties interface */
 struct fwnode_handle;
 
-static inline
-struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
-					 const char *propname, int index,
-					 enum gpiod_flags dflags,
-					 const char *label)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
 static inline
 struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 					 const char *con_id, int index,
-- 
2.23.0.162.g0b9fbb3734-goog

