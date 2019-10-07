Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7DC1CE28F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 15:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbfJGNDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 09:03:34 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49472 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbfJGND1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 09:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=lL/kh/qetVtVFXgFRF0qXSp3surLNTIc1iBbd+ByaZQ=; b=qPccM/3wNlPs
        8GZTMxt0kTf4crWhQcXJwkeXYagLlgk4SCpjv5urre1quXHpkzKG0HTuYek0W6WBYw6BEzLG/u+k4
        voS0kHQEJJudGqRXWnuwImisOw5UlGJ0uIHSjl9q23EzCHS/hwEKRl9eUJx8DDWZK0fpNG0HtliT3
        W1y58=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iHSfc-0003Sz-Qd; Mon, 07 Oct 2019 13:03:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 3D0D9274162F; Mon,  7 Oct 2019 14:03:24 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Applied "gpiolib: introduce devm_fwnode_gpiod_get_index()" to the regulator tree
In-Reply-To:  <20190913032240.50333-2-dmitry.torokhov@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191007130324.3D0D9274162F@ypsilon.sirena.org.uk>
Date:   Mon,  7 Oct 2019 14:03:24 +0100 (BST)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The patch

   gpiolib: introduce devm_fwnode_gpiod_get_index()

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 2d2f116d69c127099553afe0d87cf9c0bbe2759e Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 12 Sep 2019 20:22:38 -0700
Subject: [PATCH] gpiolib: introduce devm_fwnode_gpiod_get_index()

devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
in question does not have to be a child of device node. Let's rename it
to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
for now.

Also let's add a devm_fwnode_gpiod_get() wrapper as majority of the
callers need a single GPIO.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Link: https://lore.kernel.org/r/20190913032240.50333-2-dmitry.torokhov@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-devres.c | 19 ++++++++--------
 include/linux/gpio/consumer.h | 41 ++++++++++++++++++++++++++---------
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 98e3c20d9730..9a0475c87f95 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -185,12 +185,11 @@ struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_gpiod_get_from_of_node);
 
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
@@ -200,11 +199,11 @@ EXPORT_SYMBOL_GPL(devm_gpiod_get_from_of_node);
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
-EXPORT_SYMBOL_GPL(devm_fwnode_get_index_gpiod_from_child);
+EXPORT_SYMBOL_GPL(devm_fwnode_gpiod_get_index);
 
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
2.20.1

