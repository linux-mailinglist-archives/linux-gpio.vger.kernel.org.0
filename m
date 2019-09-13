Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D487DB176D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 05:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfIMDWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 23:22:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37420 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfIMDWq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 23:22:46 -0400
Received: by mail-pl1-f195.google.com with SMTP id b10so12679017plr.4;
        Thu, 12 Sep 2019 20:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j2w8J4UIC3b5lx+y07rDcDaGRQCf9wYAm17Az5VE72U=;
        b=n/tuaB6xgyYLZm6SYFCTRFe3KmESaMOVF6EfoNHoJ0tCj/fDo9E/aw0VR4W3pT2EFO
         yBc5GrKxprdsOpN5hk91bIek1gusbADc0YpTGoFShKji48PbS4Gv8+UN4xIhh9xgdjGW
         BIchaTn8Z7ZiANO5sBO8Sa3si7qnB8sSYN/0ZmYjkC6m9cllvN0Ipyc01EJWLPIXyW5c
         DfvXsJJZ5nFUkdzVtjUa8ivK3WY1qfDZzE/g8ejVT8pDnaIubXgKnlDOsOgKLeBIgLOW
         z76dcmF9SA/ACmwqv06msRGspJmZB1m8RlURiJLkfXjuzo8V2hn48zQuYWdgtSWLGOig
         n6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2w8J4UIC3b5lx+y07rDcDaGRQCf9wYAm17Az5VE72U=;
        b=gwD0bSel5ZCRusNht2XLMAqdRgs6zCOgtGuBpjQrz5BQ1V2o2r/AdDlTmd8b20lc9r
         XGckxhts7MvF0kF8zpjaHFT8obRzaq38vVGoF6/E66eU5GW5emnvC4VEBmf96/whWjm9
         gyZ6yaJU1bH9uYI8lzgaKucIYeG+M89vQ4RGI3KNySGshWVoTilGfLR5JwMCTDNo/xyP
         y+Ik+2lHOVuU1cvXPeC4RoiWREyQt7bgOzD2nwFc+zyevM0tJ2+RaUgeRjkEiR8wlX40
         ZWKXoG83FuGmaA7hh9Fojn9JdDDuvReTw31BfV4FJPlhb2GDc9gEl12hOSrGQpnEZ+I2
         gVUw==
X-Gm-Message-State: APjAAAWKO+191sOHaK+Fn37IEJ1YW9LoHB4/5HJuTyufu6Z9cB1DpWoY
        eW5lgQvXZAnXAXzYtfliZUU=
X-Google-Smtp-Source: APXvYqxnlVkiDm54lrpwZsA79zz1AIvNF9KSRuQ2CNfyHmOoET6qxnunvpxE8X3ZgVg7Wd58xZxWMQ==
X-Received: by 2002:a17:902:7596:: with SMTP id j22mr34288450pll.280.1568344965348;
        Thu, 12 Sep 2019 20:22:45 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b2sm8060936pfd.81.2019.09.12.20.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 20:22:43 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/2] gpiolib: introduce devm_fwnode_gpiod_get_index()
Date:   Thu, 12 Sep 2019 20:22:38 -0700
Message-Id: <20190913032240.50333-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
References: <20190913032240.50333-1-dmitry.torokhov@gmail.com>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---

Changes in v2:
- switched export to be EXPORT_SYMBOL_GPL to match the new export
  markings for the rest of GPIO devres functions
- rebased on top of Linus W devel branch
- added Andy's Reviewed-by

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
2.23.0.237.gc6a4ce50a0-goog

