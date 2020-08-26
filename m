Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCA62538E4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Aug 2020 22:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgHZUIg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Aug 2020 16:08:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726609AbgHZUIe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Aug 2020 16:08:34 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 171EA2083B;
        Wed, 26 Aug 2020 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598472513;
        bh=r2eUCjOJuj+16QEDQGPSCX07Dpa5TMMPEKSqunY6FdM=;
        h=From:To:Cc:Subject:Date:From;
        b=GeZqiTmwFRpueeTkTp+H+Zx3bUh+YKFf6UtKm/lkv9zC8mxwOHeHqxRVeVybyd0io
         cvGg9c4AZ/I9KZNh5R3J55VMK5ndFY6qCkKwvAQOpiCFbAc0nQ0wUXX0ZYpXFIB8e5
         eIymMn/hLHtU1MkG+IOeOH3fLK2LqDsV//amgPEE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 1/2] gpio: Add devm_fwnode_gpiod_get_optional() helpers
Date:   Wed, 26 Aug 2020 22:08:26 +0200
Message-Id: <20200826200827.30931-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add devm_fwnode_gpiod_get_optional() and
devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
node might use it to remove some boilerplate code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/gpio/gpiolib-devres.c | 71 +++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h | 30 +++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 7dbce4c4ebdf..f8476f6a65cc 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -184,6 +184,37 @@ struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_get_from_of_node);
 
+/**
+ * devm_fwnode_gpiod_get_optional - Resource-managed fwnode_gpiod_get_index()
+ *                                  for optional GPIO
+ * @dev:	GPIO consumer
+ * @fwnode:	firmware node containing GPIO reference
+ * @con_id:	function within the GPIO consumer
+ * @flags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * GPIO descriptors returned from this function are automatically disposed on
+ * driver detach.
+ *
+ * This is equivalent to devm_fwnode_gpiod_get_index(), except that when no
+ * GPIO with the specified index was assigned to the requested function it will
+ * return NULL.  This is convenient for drivers that need to handle optional
+ * GPIOs.
+ *
+ * On successful request the GPIO pin is configured in accordance with
+ * provided @flags.
+ */
+struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
+						 struct fwnode_handle *fwnode,
+						 const char *con_id,
+						 enum gpiod_flags flags,
+						 const char *label)
+{
+	return devm_fwnode_gpiod_get_index_optional(dev, fwnode, con_id, 0,
+						    flags, label);
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_optional);
+
 /**
  * devm_fwnode_gpiod_get_index - get a GPIO descriptor from a given node
  * @dev:	GPIO consumer
@@ -226,6 +257,46 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_index);
 
+/**
+ * devm_fwnode_gpiod_get_index_optional - Resource-managed fwnode_gpiod_get_index()
+ *                                        for optional GPIO
+ * @dev:	GPIO consumer
+ * @fwnode:	firmware node containing GPIO reference
+ * @con_id:	function within the GPIO consumer
+ * @index:	index of the GPIO to obtain in the consumer
+ * @flags:	GPIO initialization flags
+ * @label:	label to attach to the requested GPIO
+ *
+ * GPIO descriptors returned from this function are automatically disposed on
+ * driver detach.
+ *
+ * This is equivalent to devm_fwnode_gpiod_get_index(), except that when no
+ * GPIO with the specified index was assigned to the requested function it will
+ * return NULL.  This is convenient for drivers that need to handle optional
+ * GPIOs.
+ *
+ * On successful request the GPIO pin is configured in accordance with
+ * provided @flags.
+ */
+struct gpio_desc *devm_fwnode_gpiod_get_index_optional(struct device *dev,
+						       struct fwnode_handle *fwnode,
+						       const char *con_id, int index,
+						       enum gpiod_flags flags,
+						       const char *label)
+{
+	struct gpio_desc *desc;
+
+	desc = devm_fwnode_gpiod_get_index(dev, fwnode, con_id, index, flags,
+					   label);
+	if (IS_ERR(desc)) {
+		if (PTR_ERR(desc) == -ENOENT)
+			return NULL;
+	}
+
+	return desc;
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_index_optional);
+
 /**
  * devm_gpiod_get_index_optional - Resource-managed gpiod_get_index_optional()
  * @dev: GPIO consumer
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 901aab89d025..2364c5ca9384 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -183,11 +183,21 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 					 const char *con_id, int index,
 					 enum gpiod_flags flags,
 					 const char *label);
+struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
+						 struct fwnode_handle *fwnode,
+						 const char *con_id,
+						 enum gpiod_flags flags,
+						 const char *label);
 struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      struct fwnode_handle *child,
 					      const char *con_id, int index,
 					      enum gpiod_flags flags,
 					      const char *label);
+struct gpio_desc *devm_fwnode_gpiod_get_index_optional(struct device *dev,
+						       struct fwnode_handle *fwnode,
+						       const char *con_id, int index,
+						       enum gpiod_flags flags,
+						       const char *label);
 
 #else /* CONFIG_GPIOLIB */
 
@@ -562,6 +572,16 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline
+struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
+						 struct fwnode_handle *fwnode,
+						 const char *con_id,
+						 enum gpiod_flags flags,
+						 const char *label)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 					      struct fwnode_handle *fwnode,
@@ -572,6 +592,16 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline
+struct gpio_desc *devm_fwnode_gpiod_get_index_optional(struct device *dev,
+						       struct fwnode_handle *fwnode,
+						       const char *con_id, int index,
+						       enum gpiod_flags flags,
+						       const char *label)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 #endif /* CONFIG_GPIOLIB */
 
 static inline
-- 
2.17.1

