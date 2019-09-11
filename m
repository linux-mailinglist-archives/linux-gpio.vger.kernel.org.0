Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3E8AF749
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 09:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfIKHwZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 03:52:25 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40404 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfIKHwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 03:52:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so13140282pfb.7;
        Wed, 11 Sep 2019 00:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=51aUTOSnvcLQf+P79cmPrM9loBkdI6A9ZLwOiaZPzyo=;
        b=rqnkc1X9ZeB2/DP9qO/oHLGiURvCmamjolmF3Fi+jRUhdmjxd3j34i69Fyl6VjDFnA
         ckXXTEUt99zUl9YchvNhE2apQQ+Y3I0yPxw5Fmq8Geza5q+WP5LqsCZV00vAUrCjqehi
         qEJXvvFMePJG8Xm3mpQ/Uw8FM6RokIJG85+U4CD2LuiiCU5GLyhWCz0nmdHzutNV46HV
         4Ju4ywnPItQl21foHDgKVubG/IAric4zSBh5isuJpuSSNlaa61tU/PW8AKBrW7uhAsEv
         WZ12EYycqLndOS7mr9pO8oFHcknnPVDkERR9rCncABQrqVY9j/X4yh/dGF3b95UIdV4q
         +33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=51aUTOSnvcLQf+P79cmPrM9loBkdI6A9ZLwOiaZPzyo=;
        b=C5Fyy5SH9WPGVFxAx967elc2tH17PTqa0Wlg1qRN/pM23AOb/PWR9l0RYjtMiyJTs4
         81jBG69DqCyYvhThpjI9D4FMDncT5U18+Yj6NW3Z6ZgKV2f95tKZZU7BFuzOfr/r6hQS
         4zleC7aPPQ+4JfEIzJWdkAtE50DKl/Th1Lu3N8TuJiR1wg72H8/yxOqCfRNuQAaaeqgC
         bEWCvPpcppJ5vCz/Yyc4eMpPZbfOZbFzU1Bt22CVe3+0m5K7EIy4odvwgQsUv+A5idRz
         Ctbcyq5dDok2irVN/VFqlSt3acLsJhwgK6NEl1W+HahX9wiR5TJ+xc+/MKv337fRWYDB
         DGzQ==
X-Gm-Message-State: APjAAAXaoh4IPpq0FS4eXTNqkzRnG8tQh0yiuUI01sbvgS5zWC93r9Ph
        3Rta4XUSX56jUPhonaHJYHc=
X-Google-Smtp-Source: APXvYqwwsqargbsvdE+AwGvCGluX6ER3qn1ywDXmPbRRF3Tq0baH5IbrPOldSSRvHdB6bkMY9+ApPg==
X-Received: by 2002:a17:90a:b88b:: with SMTP id o11mr4084973pjr.42.1568188342330;
        Wed, 11 Sep 2019 00:52:22 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u2sm8582445pgp.66.2019.09.11.00.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 00:52:20 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 02/11] gpiolib: introduce devm_fwnode_gpiod_get_index()
Date:   Wed, 11 Sep 2019 00:52:06 -0700
Message-Id: <20190911075215.78047-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.162.g0b9fbb3734-goog
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
in question does not have to be a child of device node. Let's rename it
to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
for now.

Also let's add a devm_fwnode_gpiod_get() wrapper as majority of the
callers need a single GPIO.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/gpio/gpiolib-devres.c | 19 ++++++++--------
 include/linux/gpio/consumer.h | 41 ++++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 0acc2cc6e868..190ce7c43b4e 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -185,12 +185,11 @@ struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
 EXPORT_SYMBOL(devm_gpiod_get_from_of_node);
 
 /**
- * devm_fwnode_get_index_gpiod_from_child - get a GPIO descriptor from a
- *					    device's child node
+ * devm_fwnode_gpiod_get_index - get a GPIO descriptor from a given node
  * @dev:	GPIO consumer
+ * @fwnode:	firmware node containing GPIO reference
  * @con_id:	function within the GPIO consumer
  * @index:	index of the GPIO to obtain in the consumer
- * @child:	firmware node (child of @dev)
  * @flags:	GPIO initialization flags
  * @label:	label to attach to the requested GPIO
  *
@@ -200,11 +199,11 @@ EXPORT_SYMBOL(devm_gpiod_get_from_of_node);
  * On successful request the GPIO pin is configured in accordance with
  * provided @flags.
  */
-struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
-						const char *con_id, int index,
-						struct fwnode_handle *child,
-						enum gpiod_flags flags,
-						const char *label)
+struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
+					      struct fwnode_handle *fwnode,
+					      const char *con_id, int index,
+					      enum gpiod_flags flags,
+					      const char *label)
 {
 	char prop_name[32]; /* 32 is max size of property name */
 	struct gpio_desc **dr;
@@ -224,7 +223,7 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 			snprintf(prop_name, sizeof(prop_name), "%s",
 					    gpio_suffixes[i]);
 
-		desc = fwnode_get_named_gpiod(child, prop_name, index, flags,
+		desc = fwnode_get_named_gpiod(fwnode, prop_name, index, flags,
 					      label);
 		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
 			break;
@@ -239,7 +238,7 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 
 	return desc;
 }
-EXPORT_SYMBOL(devm_fwnode_get_index_gpiod_from_child);
+EXPORT_SYMBOL(devm_fwnode_gpiod_get_index);
 
 /**
  * devm_gpiod_get_index_optional - Resource-managed gpiod_get_index_optional()
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index b70af921c614..dc0ddcd30515 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -176,11 +176,11 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 					 const char *propname, int index,
 					 enum gpiod_flags dflags,
 					 const char *label);
-struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
-						const char *con_id, int index,
-						struct fwnode_handle *child,
-						enum gpiod_flags flags,
-						const char *label);
+struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
+					      struct fwnode_handle *child,
+					      const char *con_id, int index,
+					      enum gpiod_flags flags,
+					      const char *label);
 
 #else /* CONFIG_GPIOLIB */
 
@@ -531,6 +531,29 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline
+struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
+					      struct fwnode_handle *fwnode,
+					      const char *con_id, int index,
+					      enum gpiod_flags flags,
+					      const char *label)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
+#endif /* CONFIG_GPIOLIB */
+
+static inline
+struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
+					struct fwnode_handle *fwnode,
+					const char *con_id,
+					enum gpiod_flags flags,
+					const char *label)
+{
+	return devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
+					   flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 						const char *con_id, int index,
@@ -538,11 +561,10 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 						enum gpiod_flags flags,
 						const char *label)
 {
-	return ERR_PTR(-ENOSYS);
+	return devm_fwnode_gpiod_get_index(dev, child, con_id, index,
+					   flags, label);
 }
 
-#endif /* CONFIG_GPIOLIB */
-
 static inline
 struct gpio_desc *devm_fwnode_get_gpiod_from_child(struct device *dev,
 						   const char *con_id,
@@ -550,8 +572,7 @@ struct gpio_desc *devm_fwnode_get_gpiod_from_child(struct device *dev,
 						   enum gpiod_flags flags,
 						   const char *label)
 {
-	return devm_fwnode_get_index_gpiod_from_child(dev, con_id, 0, child,
-						      flags, label);
+	return devm_fwnode_gpiod_get_index(dev, child, con_id, 0, flags, label);
 }
 
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_OF_GPIO)
-- 
2.23.0.162.g0b9fbb3734-goog

