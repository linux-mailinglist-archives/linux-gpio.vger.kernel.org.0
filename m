Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC4CAB43C
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 10:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391779AbfIFIpo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 04:45:44 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:50672 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391680AbfIFIpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 04:45:44 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id y8lh2000405gfCL018lhM0; Fri, 06 Sep 2019 10:45:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i69sD-0003NA-0D; Fri, 06 Sep 2019 10:45:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i69sC-0005hC-VA; Fri, 06 Sep 2019 10:45:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] gpio: devres: Switch to EXPORT_SYMBOL_GPL()
Date:   Fri,  6 Sep 2019 10:45:39 +0200
Message-Id: <20190906084539.21838-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906084539.21838-1-geert+renesas@glider.be>
References: <20190906084539.21838-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change all exported symbols for managed GPIO functions from
EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL(), like is used for their
non-managed counterparts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The only exception was gpiod_get_from_of_node(), as everything in
drivers/gpio/gpiolib-of.c used EXPORT_SYMBOL(), until the previous
patch.
---
 drivers/gpio/gpiolib-devres.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 0acc2cc6e868fdef..98e3c20d9730e66a 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -59,7 +59,7 @@ struct gpio_desc *__must_check devm_gpiod_get(struct device *dev,
 {
 	return devm_gpiod_get_index(dev, con_id, 0, flags);
 }
-EXPORT_SYMBOL(devm_gpiod_get);
+EXPORT_SYMBOL_GPL(devm_gpiod_get);
 
 /**
  * devm_gpiod_get_optional - Resource-managed gpiod_get_optional()
@@ -77,7 +77,7 @@ struct gpio_desc *__must_check devm_gpiod_get_optional(struct device *dev,
 {
 	return devm_gpiod_get_index_optional(dev, con_id, 0, flags);
 }
-EXPORT_SYMBOL(devm_gpiod_get_optional);
+EXPORT_SYMBOL_GPL(devm_gpiod_get_optional);
 
 /**
  * devm_gpiod_get_index - Resource-managed gpiod_get_index()
@@ -127,7 +127,7 @@ struct gpio_desc *__must_check devm_gpiod_get_index(struct device *dev,
 
 	return desc;
 }
-EXPORT_SYMBOL(devm_gpiod_get_index);
+EXPORT_SYMBOL_GPL(devm_gpiod_get_index);
 
 /**
  * devm_gpiod_get_from_of_node() - obtain a GPIO from an OF node
@@ -182,7 +182,7 @@ struct gpio_desc *devm_gpiod_get_from_of_node(struct device *dev,
 
 	return desc;
 }
-EXPORT_SYMBOL(devm_gpiod_get_from_of_node);
+EXPORT_SYMBOL_GPL(devm_gpiod_get_from_of_node);
 
 /**
  * devm_fwnode_get_index_gpiod_from_child - get a GPIO descriptor from a
@@ -239,7 +239,7 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 
 	return desc;
 }
-EXPORT_SYMBOL(devm_fwnode_get_index_gpiod_from_child);
+EXPORT_SYMBOL_GPL(devm_fwnode_get_index_gpiod_from_child);
 
 /**
  * devm_gpiod_get_index_optional - Resource-managed gpiod_get_index_optional()
@@ -268,7 +268,7 @@ struct gpio_desc *__must_check devm_gpiod_get_index_optional(struct device *dev,
 
 	return desc;
 }
-EXPORT_SYMBOL(devm_gpiod_get_index_optional);
+EXPORT_SYMBOL_GPL(devm_gpiod_get_index_optional);
 
 /**
  * devm_gpiod_get_array - Resource-managed gpiod_get_array()
@@ -303,7 +303,7 @@ struct gpio_descs *__must_check devm_gpiod_get_array(struct device *dev,
 
 	return descs;
 }
-EXPORT_SYMBOL(devm_gpiod_get_array);
+EXPORT_SYMBOL_GPL(devm_gpiod_get_array);
 
 /**
  * devm_gpiod_get_array_optional - Resource-managed gpiod_get_array_optional()
@@ -328,7 +328,7 @@ devm_gpiod_get_array_optional(struct device *dev, const char *con_id,
 
 	return descs;
 }
-EXPORT_SYMBOL(devm_gpiod_get_array_optional);
+EXPORT_SYMBOL_GPL(devm_gpiod_get_array_optional);
 
 /**
  * devm_gpiod_put - Resource-managed gpiod_put()
@@ -344,7 +344,7 @@ void devm_gpiod_put(struct device *dev, struct gpio_desc *desc)
 	WARN_ON(devres_release(dev, devm_gpiod_release, devm_gpiod_match,
 		&desc));
 }
-EXPORT_SYMBOL(devm_gpiod_put);
+EXPORT_SYMBOL_GPL(devm_gpiod_put);
 
 /**
  * devm_gpiod_unhinge - Remove resource management from a gpio descriptor
@@ -374,7 +374,7 @@ void devm_gpiod_unhinge(struct device *dev, struct gpio_desc *desc)
 	/* Anything else we should warn about */
 	WARN_ON(ret);
 }
-EXPORT_SYMBOL(devm_gpiod_unhinge);
+EXPORT_SYMBOL_GPL(devm_gpiod_unhinge);
 
 /**
  * devm_gpiod_put_array - Resource-managed gpiod_put_array()
@@ -390,7 +390,7 @@ void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
 	WARN_ON(devres_release(dev, devm_gpiod_release_array,
 			       devm_gpiod_match_array, &descs));
 }
-EXPORT_SYMBOL(devm_gpiod_put_array);
+EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 
 
 
@@ -444,7 +444,7 @@ int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
 
 	return 0;
 }
-EXPORT_SYMBOL(devm_gpio_request);
+EXPORT_SYMBOL_GPL(devm_gpio_request);
 
 /**
  *	devm_gpio_request_one - request a single GPIO with initial setup
@@ -474,7 +474,7 @@ int devm_gpio_request_one(struct device *dev, unsigned gpio,
 
 	return 0;
 }
-EXPORT_SYMBOL(devm_gpio_request_one);
+EXPORT_SYMBOL_GPL(devm_gpio_request_one);
 
 /**
  *      devm_gpio_free - free a GPIO
@@ -492,4 +492,4 @@ void devm_gpio_free(struct device *dev, unsigned int gpio)
 	WARN_ON(devres_release(dev, devm_gpio_release, devm_gpio_match,
 		&gpio));
 }
-EXPORT_SYMBOL(devm_gpio_free);
+EXPORT_SYMBOL_GPL(devm_gpio_free);
-- 
2.17.1

