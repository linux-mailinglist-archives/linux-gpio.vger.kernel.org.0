Return-Path: <linux-gpio+bounces-9280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E47962BCF
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 17:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B77B61C21F96
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B841A38F4;
	Wed, 28 Aug 2024 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbGFGsSX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E619FA94;
	Wed, 28 Aug 2024 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724858043; cv=none; b=czsBGRbOOufS0jRqU2G27gH+Qxj72UMRIUAkn7oxpfmaDzFNKIwroob3d3Ks0JPYbxUMvgnp9M2TljEWlvaDua7pJv3G3LoFSGKFbS+0JyFkVVHq6seAZNrhxC/niPNwJIjBH7t3GoTWq1vJJ0d3dSK1lBkR+79EM+wdw2AC1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724858043; c=relaxed/simple;
	bh=lzCqdn5yAOU/5DHTzbefZ5WAIZxB9/oRXnFZZ0zHwAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IwuKZIIK5S+jmjaHO+vx9ma7G1mSn4BQoraFI+AUjxdl6WMjsPMd00C+HGN5MJo2gHK0Ew1gWlzbmrHX66sWnC1iyJoR8q2ai8ziTzgqQGKcy97J4/3kaJJEvYqLloMS1gnJCf6IUqwV0hLaVcK7QBgTaMOwLELNVtZ5Ci1Eu5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbGFGsSX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724858043; x=1756394043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lzCqdn5yAOU/5DHTzbefZ5WAIZxB9/oRXnFZZ0zHwAU=;
  b=JbGFGsSXZdDFZfLCKEGHeE4usKw9571SXUKbCbIkS0QOxC7zRvQ8eDWb
   AAeo4Qw8kIUVx/xQV4puwlwb9EoBnD/2tB9QOu+/LgdvnVkd7Xla+BzCJ
   4/2+g7VDj/l5kJGxl4t0HAjBg1W2O8qYEpru/Wb9sJJlHT0zePQDWAHrD
   sjUoLvLFrqkP3KpdgpF7VEacbqqdC5HZaUZyX2bfJact+eNK9J+6gzGeV
   pqev+54/tLLtY+3mMHQLJqawcm5xrnwPLM2kAPudviEGRuffeTVFqmj04
   qGsR3SJmc/UV0GNs1IA0I3HTiAPQBmcSLLnLL4lAcaqQ4hLb9q5yE1db4
   w==;
X-CSE-ConnectionGUID: t/TPNKKSTuuvVzoAZVuILg==
X-CSE-MsgGUID: KgdHSjnoRuSSpI2YyndXUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34773534"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="34773534"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:14:02 -0700
X-CSE-ConnectionGUID: FsEXhLAbTMCRNowWAnMymQ==
X-CSE-MsgGUID: Lwb2wqtWQXyFd4QKLYo8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63586378"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 28 Aug 2024 08:14:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7C43F143; Wed, 28 Aug 2024 18:13:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/1] gpiolib: legacy: Consolidate devm_gpio_*() with other legacy APIs
Date: Wed, 28 Aug 2024 18:12:43 +0300
Message-ID: <20240828151357.2677340-1-andriy.shevchenko@linux.intel.com>
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
v2: rebased on top of next-20240828
 drivers/gpio/gpiolib-devres.c | 82 ++++-----------------------------
 drivers/gpio/gpiolib-legacy.c | 86 +++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 74 deletions(-)

diff --git a/drivers/gpio/gpiolib-devres.c b/drivers/gpio/gpiolib-devres.c
index 4987e62dcb3d..b063f466a4d6 100644
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
 static void devm_gpiod_release(struct device *dev, void *res)
 {
 	struct gpio_desc **desc = res;
@@ -320,76 +324,6 @@ void devm_gpiod_put_array(struct device *dev, struct gpio_descs *descs)
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
- *      devm_gpio_request - request a GPIO for a managed device
- *      @dev: device to request the GPIO for
- *      @gpio: GPIO to allocate
- *      @label: the name of the requested GPIO
- *
- *      Except for the extra @dev argument, this function takes the
- *      same arguments and performs the same function as
- *      gpio_request().  GPIOs requested with this function will be
- *      automatically freed on driver detach.
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
- *	devm_gpio_request_one - request a single GPIO with initial setup
- *	@dev:   device to request for
- *	@gpio:	the GPIO number
- *	@flags:	GPIO configuration as specified by GPIOF_*
- *	@label:	a literal description string of this GPIO
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
index f421208ddbdd..9cb83f488cd5 100644
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
 
@@ -71,3 +77,83 @@ int gpio_request(unsigned gpio, const char *label)
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


