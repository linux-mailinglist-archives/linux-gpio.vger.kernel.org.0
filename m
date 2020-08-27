Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A9B254DB1
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Aug 2020 21:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgH0TAJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 15:00:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbgH0TAD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Aug 2020 15:00:03 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C79802087E;
        Thu, 27 Aug 2020 18:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598554802;
        bh=/jWrUvkyehWmpjjCPlltLr1JAG0sr6Qc32pKieuISoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uU1UvUH1cXvsczwBGXa7c2b7fVAWGWudB4/QyJq0LUX8Fo/UbfvO8lXfYnwyXYrCw
         LXbnh5ijhwFtmrU2B5UYMoV/aqaY42dvVzRNrqPzS8/DC9Y0LMqt75pu2mSGTPt8Q1
         zhTS10dLDV3St6zkGpdDCqmqQpX9a7eHscujSwNk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        clang-built-linux@googlegroups.com
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 24/27] gpio: Add devm_fwnode_gpiod_get_optional() helpers
Date:   Thu, 27 Aug 2020 20:58:26 +0200
Message-Id: <20200827185829.30096-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827185829.30096-1-krzk@kernel.org>
References: <20200827185829.30096-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add devm_fwnode_gpiod_get_optional() and
devm_fwnode_gpiod_get_index_optional() helpers, similar to regular
devm_gpiod optional versions.  Drivers getting GPIOs from a firmware
node might use it to remove some boilerplate code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---

Changes since v2:
1. Return NULL

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
index 901aab89d025..7854d80b1e9a 100644
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
+	return NULL;
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
+	return NULL;
+}
+
 #endif /* CONFIG_GPIOLIB */
 
 static inline
-- 
2.17.1

