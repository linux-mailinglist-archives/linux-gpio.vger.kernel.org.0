Return-Path: <linux-gpio+bounces-9276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7053F962AF6
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 16:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4655FB224D0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 14:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A771A0710;
	Wed, 28 Aug 2024 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbHyAEP7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D748F1A01CA;
	Wed, 28 Aug 2024 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857163; cv=none; b=FGH9EqhomwKtCZNX0EbJzIKBYNNLVc2NN0Dyv9edUEjcnm7EtKBhASJz+XGmvAmnBUwdrXNpyf4WnIExodnxTTGxFUIs+GQi9p8PO+FwqYMwgRBL90iCiAgJwPU7PSWSDrAHto8VwH+sU1LI0YQEcZXHV2/Wq08ElYE03mtO3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857163; c=relaxed/simple;
	bh=2F6dPp+IAfqvH3BafvdZ7gW4KB0RHBvgAWJGeOf4fFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EZ/Q9/LX0YXKXUqzpXdEsIZFzLZdqz3b9CusVnGp35UzKwoGL2N61NfGqOcbOlek3Q1X2NhCym1hIkBdFRuRaGIFHjDWNiAgiNRYqGXij93FupnJWqSHnB7o731e+c3mc3ubqRbm2V1nYQl0P8wZWbYziolNaLxma5wBozoF2ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbHyAEP7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724857162; x=1756393162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2F6dPp+IAfqvH3BafvdZ7gW4KB0RHBvgAWJGeOf4fFg=;
  b=LbHyAEP7dVWHoB0SxJS23zMiPaPhTtCkvWXkEDcDmayYKbpLL2Ifg8QA
   PPGXWrLqvitqMh6qJ5MSnRb1GtgcAY9JhOoO27F+clSEQApclAKxgB8Bp
   F1DDFiIBheYgUarpUWOsMMQ+x6ENF3l0sCHWpxzng/3CzvqX8LKtGrK3H
   jG46eL80XEfkmym4G5Qgo6utjV/5nPf65uj/zXxK3qiYhTfDjqb9TiIG7
   yfMzpkUEhZYIBeOdTgiug4cov3AvYvm4mfHzaqJ9rsLkKXpCkIlVpYtLg
   7X/+g9ZUg59vKgJ7GQmWDYnH68UIDHHPUDxoaRlhwqYN4iBjAQfoBtk9G
   w==;
X-CSE-ConnectionGUID: iJUpPdp2RjqO9G5P3cHNzw==
X-CSE-MsgGUID: QTfMqFjfQJiDW7u5H1XU+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27159650"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="27159650"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 07:59:22 -0700
X-CSE-ConnectionGUID: 3Q8VUhG/Qpq0DUyg8FVnRA==
X-CSE-MsgGUID: nF8er1zDTVSy7nS9VhOB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="67611681"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2024 07:59:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EF623143; Wed, 28 Aug 2024 17:59:18 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpiolib: legacy: Consolidate devm_gpio_*() with other legacy APIs
Date: Wed, 28 Aug 2024 17:59:14 +0300
Message-ID: <20240828145914.2569187-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no reason to keep deprecated legacy API implementations
in the gpiolib-devres.c. Consolidate devm_gpio_*() with other legacy
APIs. While at it, clean up header inclusion block in gpiolib-devres.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-devres.c | 92 +++--------------------------------
 drivers/gpio/gpiolib-legacy.c | 86 ++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 84 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 04c33fdd1163..53e0559cad63 100644
--- a/drivers/gpio/gpiolib-devres.c
+++ b/drivers/gpio/gpiolib-devres.c
@@ -6,15 +6,19 @@
  * Copyright (c) 2011 John Crispin <john@phrozen.org>
  */
 
-#include <linux/module.h>
-#include <linux/err.h>
-#include <linux/gpio.h>
-#include <linux/gpio/consumer.h>
 #include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
 #include <linux/gfp.h>
+#include <linux/types.h>
+
+#include <linux/gpio/consumer.h>
 
 #include "gpiolib.h"
 
+struct fwnode_handle;
+struct lock_class_key;
+
 static void devm_gpiod_release(void *desc)
 {
 	gpiod_put(desc);
@@ -309,86 +313,6 @@ void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
 }
 EXPORT_SYMBOL_GPL(devm_gpiod_put_array);
 
-static void devm_gpio_release(struct device *dev, void *res)
-{
-	unsigned *gpio = res;
-
-	gpio_free(*gpio);
-}
-
-/**
- * devm_gpio_request - request a GPIO for a managed device
- * @dev: device to request the GPIO for
- * @gpio: GPIO to allocate
- * @label: the name of the requested GPIO
- *
- * Except for the extra @dev argument, this function takes the
- * same arguments and performs the same function as gpio_request().
- * GPIOs requested with this function will be automatically freed
- * on driver detach.
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
-{
-	unsigned *dr;
-	int rc;
-
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	rc = gpio_request(gpio, label);
-	if (rc) {
-		devres_free(dr);
-		return rc;
-	}
-
-	*dr = gpio;
-	devres_add(dev, dr);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(devm_gpio_request);
-
-/**
- * devm_gpio_request_one - request a single GPIO with initial setup
- * @dev: device to request for
- * @gpio: the GPIO number
- * @flags: GPIO configuration as specified by GPIOF_*
- * @label: a literal description string of this GPIO
- *
- * **DEPRECATED** This function is deprecated and must not be used in new code.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int devm_gpio_request_one(struct device *dev, unsigned gpio,
-			  unsigned long flags, const char *label)
-{
-	unsigned *dr;
-	int rc;
-
-	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
-	if (!dr)
-		return -ENOMEM;
-
-	rc = gpio_request_one(gpio, flags, label);
-	if (rc) {
-		devres_free(dr);
-		return rc;
-	}
-
-	*dr = gpio;
-	devres_add(dev, dr);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(devm_gpio_request_one);
-
 static void devm_gpio_chip_release(void *data)
 {
 	struct gpio_chip *gc = data;
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index 087fe3227e35..28f1046fb670 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -1,4 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/gfp.h>
+
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 
@@ -74,3 +80,83 @@ int gpio_request(unsigned gpio, const char *label)
 	return gpiod_request(desc, label);
 }
 EXPORT_SYMBOL_GPL(gpio_request);
+
+static void devm_gpio_release(struct device *dev, void *res)
+{
+	unsigned *gpio = res;
+
+	gpio_free(*gpio);
+}
+
+/**
+ * devm_gpio_request - request a GPIO for a managed device
+ * @dev: device to request the GPIO for
+ * @gpio: GPIO to allocate
+ * @label: the name of the requested GPIO
+ *
+ * Except for the extra @dev argument, this function takes the
+ * same arguments and performs the same function as gpio_request().
+ * GPIOs requested with this function will be automatically freed
+ * on driver detach.
+ *
+ * **DEPRECATED** This function is deprecated and must not be used in new code.
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+int devm_gpio_request(struct device *dev, unsigned gpio, const char *label)
+{
+	unsigned *dr;
+	int rc;
+
+	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	rc = gpio_request(gpio, label);
+	if (rc) {
+		devres_free(dr);
+		return rc;
+	}
+
+	*dr = gpio;
+	devres_add(dev, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_gpio_request);
+
+/**
+ * devm_gpio_request_one - request a single GPIO with initial setup
+ * @dev: device to request for
+ * @gpio: the GPIO number
+ * @flags: GPIO configuration as specified by GPIOF_*
+ * @label: a literal description string of this GPIO
+ *
+ * **DEPRECATED** This function is deprecated and must not be used in new code.
+ *
+ * Returns:
+ * 0 on success, or negative errno on failure.
+ */
+int devm_gpio_request_one(struct device *dev, unsigned gpio,
+			  unsigned long flags, const char *label)
+{
+	unsigned *dr;
+	int rc;
+
+	dr = devres_alloc(devm_gpio_release, sizeof(unsigned), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	rc = gpio_request_one(gpio, flags, label);
+	if (rc) {
+		devres_free(dr);
+		return rc;
+	}
+
+	*dr = gpio;
+	devres_add(dev, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_gpio_request_one);
-- 
2.43.0.rc1.1336.g36b5255a03ac


