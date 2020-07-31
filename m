Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750E92345F1
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jul 2020 14:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733167AbgGaMj7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jul 2020 08:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733093AbgGaMj7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Jul 2020 08:39:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AA4C061574
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2020 05:39:59 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1k1UKI-0000kD-5f; Fri, 31 Jul 2020 14:39:54 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1k1UKH-0002d3-3w; Fri, 31 Jul 2020 14:39:53 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: don't use same lockdep class for all devm_gpiochip_add_data users
Date:   Fri, 31 Jul 2020 14:38:36 +0200
Message-Id: <20200731123835.8003-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 959bc7b22bd2 ("gpio: Automatically add lockdep keys") documents
in its commits message its intention to "create a unique class key for
each driver".

It does so by having gpiochip_add_data add in-place the definition of
two static lockdep classes for LOCKDEP use. That way, every caller of
the macro adds their gpiochip with unique lockdep classes.

There are many indirect callers of gpiochip_add_data, however, via
use of devm_gpiochip_add_data. devm_gpiochip_add_data has external
linkage and all its users will share the same lockdep classes, which
probably is not intended.

Fix this by replicating the gpio_chip_add_data statics-in-macro for
the devm_ version as well.

Fixes: 959bc7b22bd2 ("gpio: Automatically add lockdep keys")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
This doesn't fix any particular problem I ran into, but the code
looked buggy, at least to my lockdep-user-not-developer eyes.
---
 drivers/gpio/gpiolib-devres.c | 13 ++++++++-----
 include/linux/gpio/driver.h   | 13 +++++++++++--
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 5c91c4365da1..7dbce4c4ebdf 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -487,10 +487,12 @@ static void devm_gpio_chip_release(struct device *dev, void *res)
 }
 
 /**
- * devm_gpiochip_add_data() - Resource managed gpiochip_add_data()
+ * devm_gpiochip_add_data_with_key() - Resource managed gpiochip_add_data_with_key()
  * @dev: pointer to the device that gpio_chip belongs to.
  * @gc: the GPIO chip to register
  * @data: driver-private data associated with this chip
+ * @lock_key: lockdep class for IRQ lock
+ * @request_key: lockdep class for IRQ request
  *
  * Context: potentially before irqs will work
  *
@@ -501,8 +503,9 @@ static void devm_gpio_chip_release(struct device *dev, void *res)
  * gc->base is invalid or already associated with a different chip.
  * Otherwise it returns zero as a success code.
  */
-int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
-			   void *data)
+int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc, void *data,
+				    struct lock_class_key *lock_key,
+				    struct lock_class_key *request_key)
 {
 	struct gpio_chip **ptr;
 	int ret;
@@ -512,7 +515,7 @@ int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = gpiochip_add_data(gc, data);
+	ret = gpiochip_add_data_with_key(gc, data, lock_key, request_key);
 	if (ret < 0) {
 		devres_free(ptr);
 		return ret;
@@ -523,4 +526,4 @@ int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(devm_gpiochip_add_data);
+EXPORT_SYMBOL_GPL(devm_gpiochip_add_data_with_key);
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c4f272af7af5..e6217d8e2e9f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -509,8 +509,16 @@ extern int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		gpiochip_add_data_with_key(gc, data, &lock_key, \
 					   &request_key);	  \
 	})
+#define devm_gpiochip_add_data(dev, gc, data) ({ \
+		static struct lock_class_key lock_key;	\
+		static struct lock_class_key request_key;	  \
+		devm_gpiochip_add_data_with_key(dev, gc, data, &lock_key, \
+					   &request_key);	  \
+	})
 #else
 #define gpiochip_add_data(gc, data) gpiochip_add_data_with_key(gc, data, NULL, NULL)
+#define devm_gpiochip_add_data(dev, gc, data) \
+	devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
 #endif /* CONFIG_LOCKDEP */
 
 static inline int gpiochip_add(struct gpio_chip *gc)
@@ -518,8 +526,9 @@ static inline int gpiochip_add(struct gpio_chip *gc)
 	return gpiochip_add_data(gc, NULL);
 }
 extern void gpiochip_remove(struct gpio_chip *gc);
-extern int devm_gpiochip_add_data(struct device *dev, struct gpio_chip *gc,
-				  void *data);
+extern int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc, void *data,
+					   struct lock_class_key *lock_key,
+					   struct lock_class_key *request_key);
 
 extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *gc, void *data));
-- 
2.27.0

