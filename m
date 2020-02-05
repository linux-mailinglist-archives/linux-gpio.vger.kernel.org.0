Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFB5153213
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 14:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgBENnl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 08:43:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:44008 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726308AbgBENnl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Feb 2020 08:43:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 05:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; 
   d="scan'208";a="220105346"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Feb 2020 05:43:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 161F0101; Wed,  5 Feb 2020 15:43:36 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] gpio: Avoid kernel.h inclusion where it's possible
Date:   Wed,  5 Feb 2020 15:43:36 +0200
Message-Id: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Inclusion of kernel.h increases the mess with the header dependencies.
Avoid kernel.h inclusion where it's possible.

Besides that, clean up a bit other inclusions inside GPIO subsystem headers.
It includes:
 - removal pin control bits (forward declaration and header) from linux/gpio.h
 - removal of.h from asm-generic/gpio.h
 - use of explicit headers in gpio/consumer.h
 - add FIXME note with regard to gpio.h inclusion in of_gpio,h

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: Elaborate changes in the commit message (Bartosz)
 include/asm-generic/gpio.h    | 4 ++--
 include/linux/gpio.h          | 2 --
 include/linux/gpio/consumer.h | 5 ++++-
 include/linux/of_gpio.h       | 9 ++++++---
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 19eadac415c4..aea9aee1f3e9 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -2,10 +2,8 @@
 #ifndef _ASM_GENERIC_GPIO_H
 #define _ASM_GENERIC_GPIO_H
 
-#include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/errno.h>
-#include <linux/of.h>
 
 #ifdef CONFIG_GPIOLIB
 
@@ -140,6 +138,8 @@ static inline void gpio_unexport(unsigned gpio)
 
 #else	/* !CONFIG_GPIOLIB */
 
+#include <linux/kernel.h>
+
 static inline bool gpio_is_valid(int number)
 {
 	/* only non-negative numbers are valid */
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 2157717c2136..008ad3ee56b7 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -102,11 +102,9 @@ void devm_gpio_free(struct device *dev, unsigned int gpio);
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/bug.h>
-#include <linux/pinctrl/pinctrl.h>
 
 struct device;
 struct gpio_chip;
-struct pinctrl_dev;
 
 static inline bool gpio_is_valid(int number)
 {
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index bf2d017dd7b7..0a72fccf60ff 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -2,9 +2,10 @@
 #ifndef __LINUX_GPIO_CONSUMER_H
 #define __LINUX_GPIO_CONSUMER_H
 
+#include <linux/bits.h>
 #include <linux/bug.h>
+#include <linux/compiler_types.h>
 #include <linux/err.h>
-#include <linux/kernel.h>
 
 struct device;
 
@@ -189,6 +190,8 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #else /* CONFIG_GPIOLIB */
 
+#include <linux/kernel.h>
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index 16967390a3fe..f821095218b0 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -11,9 +11,8 @@
 #define __LINUX_OF_GPIO_H
 
 #include <linux/compiler.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio.h>		/* FIXME: Shouldn't be here */
 #include <linux/of.h>
 
 struct device_node;
@@ -34,6 +33,8 @@ enum of_gpio_flags {
 
 #ifdef CONFIG_OF_GPIO
 
+#include <linux/kernel.h>
+
 /*
  * OF GPIO chip for memory mapped banks
  */
@@ -63,6 +64,8 @@ extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
 
 #else /* CONFIG_OF_GPIO */
 
+#include <linux/errno.h>
+
 /* Drivers may not strictly depend on the GPIO support, so let them link. */
 static inline int of_get_named_gpio_flags(struct device_node *np,
 		const char *list_name, int index, enum of_gpio_flags *flags)
-- 
2.24.1

