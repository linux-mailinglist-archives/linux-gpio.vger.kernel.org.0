Return-Path: <linux-gpio+bounces-28373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D42C506D9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 04:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9441C34C045
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 03:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120972D47ED;
	Wed, 12 Nov 2025 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+J5tV3G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3122D29C2;
	Wed, 12 Nov 2025 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762918900; cv=none; b=MvpSxeHo87l91FjFBf/fV6oR+foEW8e4JNTpxdjaIx9uh5vvZe4Ri1ryZ+FvYLPMwgl2WBTexk9F1kZyfOCFr/MccRB44BYvMxJqVpnqN3xouDD8dJWUs2qUhb6YD/fqhYIzefJFHzhH8ScBYyKMjsgIe63rwOCXdVv9SFKbw04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762918900; c=relaxed/simple;
	bh=DE/v2b6ENt1oLsOk2NZCT7yKWmhqmWwExeH+pvIBpxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iW0mXpZQwtP4YFgukiNq0fSg8SWolV3bptGKWp2szfJavKkhm5F1l8SwrfonH0fRtWy4vcIYIfHYDWkcQEFtUjoX1NHf2BvbLU7biDlIDVHe7Iga3LnlCnIsI36Do3yJmgzt8B9d3Bk3fafa1ib5J0Ii6wRIclYFKRZZRoa0DZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+J5tV3G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762918899; x=1794454899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DE/v2b6ENt1oLsOk2NZCT7yKWmhqmWwExeH+pvIBpxg=;
  b=c+J5tV3GHVkmR5QlazY8Nn5Y7yhwcm3+e1i1NoyM5T3qyLAnvSL2Q3v5
   twzva6dis2MfG0Pj4CP6uT7tWqZRP1Zu65+eocig5mEp+LRvoV/ZnsQX7
   MyFmjhSsIhU6SixdOrXKnArvak43E0N/DQd8pckIMbX2MUuj08IMjwn2Z
   HtgBmhvNnzr1j8IHVcPYgm0x3TDSjLmlomqdxu2A7GKNVIZqR9pMR3lcC
   ARn27wIL9gzxTDReuR12hzrxWvQhux5JWgEKp5icjm3yYNluUOdK45K32
   Yrm1taYztDB74Vanvn5AjW6AA5MW38fcl/5hit/2CImNIv++98qRMH0Fj
   Q==;
X-CSE-ConnectionGUID: VDLq6RnUTgKcDnXOK4QW3Q==
X-CSE-MsgGUID: c0CVj/SnQ7KhO9U1uUgytg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90450223"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="90450223"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 19:41:39 -0800
X-CSE-ConnectionGUID: lfpfmXOETtawRYY8miIVmg==
X-CSE-MsgGUID: puv8V+38RzqIHUbGz1pw+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188752305"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2025 19:41:36 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 2/2] gpio: elkhartlake: Convert to auxiliary driver
Date: Wed, 12 Nov 2025 09:10:11 +0530
Message-ID: <20251112034040.457801-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112034040.457801-1-raag.jadav@intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since PCI device should not be abusing platform device, MFD parent to
platform child path is no longer being pursued for this driver. Convert
it to auxiliary driver, which will be used by EHL PSE auxiliary device.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/Kconfig            |  2 +-
 drivers/gpio/gpio-elkhartlake.c | 36 +++++++++++++++++----------------
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05..d4b4451b4696 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1413,7 +1413,7 @@ config HTC_EGPIO
 
 config GPIO_ELKHARTLAKE
 	tristate "Intel Elkhart Lake PSE GPIO support"
-	depends on X86 || COMPILE_TEST
+	depends on INTEL_EHL_PSE_IO
 	select GPIO_TANGIER
 	help
 	  Select this option to enable GPIO support for Intel Elkhart Lake
diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/gpio-elkhartlake.c
index 95de52d2cc63..b96e7928b6e5 100644
--- a/drivers/gpio/gpio-elkhartlake.c
+++ b/drivers/gpio/gpio-elkhartlake.c
@@ -2,43 +2,46 @@
 /*
  * Intel Elkhart Lake PSE GPIO driver
  *
- * Copyright (c) 2023 Intel Corporation.
+ * Copyright (c) 2023, 2025 Intel Corporation.
  *
  * Authors: Pandith N <pandith.n@intel.com>
  *          Raag Jadav <raag.jadav@intel.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/pm.h>
 
+#include <linux/ehl_pse_io_aux.h>
+
 #include "gpio-tangier.h"
 
 /* Each Intel EHL PSE GPIO Controller has 30 GPIO pins */
 #define EHL_PSE_NGPIO		30
 
-static int ehl_gpio_probe(struct platform_device *pdev)
+static int ehl_gpio_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &adev->dev;
+	struct ehl_pse_io_data *data;
 	struct tng_gpio *priv;
-	int irq, ret;
+	int ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	data = dev_get_platdata(dev);
+	if (!data)
+		return -ENODATA;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	priv->reg_base = devm_ioremap_resource(dev, &data->mem);
 	if (IS_ERR(priv->reg_base))
 		return PTR_ERR(priv->reg_base);
 
 	priv->dev = dev;
-	priv->irq = irq;
+	priv->irq = data->irq;
 
 	priv->info.base = -1;
 	priv->info.ngpio = EHL_PSE_NGPIO;
@@ -51,25 +54,24 @@ static int ehl_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "tng_gpio_probe error\n");
 
-	platform_set_drvdata(pdev, priv);
+	auxiliary_set_drvdata(adev, priv);
 	return 0;
 }
 
-static const struct platform_device_id ehl_gpio_ids[] = {
-	{ "gpio-elkhartlake" },
+static const struct auxiliary_device_id ehl_gpio_ids[] = {
+	{ EHL_PSE_IO_NAME "." EHL_PSE_GPIO_NAME },
 	{ }
 };
-MODULE_DEVICE_TABLE(platform, ehl_gpio_ids);
+MODULE_DEVICE_TABLE(auxiliary, ehl_gpio_ids);
 
-static struct platform_driver ehl_gpio_driver = {
+static struct auxiliary_driver ehl_gpio_driver = {
 	.driver	= {
-		.name	= "gpio-elkhartlake",
 		.pm	= pm_sleep_ptr(&tng_gpio_pm_ops),
 	},
 	.probe		= ehl_gpio_probe,
 	.id_table	= ehl_gpio_ids,
 };
-module_platform_driver(ehl_gpio_driver);
+module_auxiliary_driver(ehl_gpio_driver);
 
 MODULE_AUTHOR("Pandith N <pandith.n@intel.com>");
 MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
-- 
2.43.0


