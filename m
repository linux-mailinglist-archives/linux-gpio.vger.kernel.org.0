Return-Path: <linux-gpio+bounces-28281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13BC4505C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 06:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3D53B2E28
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 05:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948FC2EAB72;
	Mon, 10 Nov 2025 05:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mN3SdaEv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903792EA47C;
	Mon, 10 Nov 2025 05:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762752504; cv=none; b=RLGcyfqQqcKxX0c/oAy0M9Tb0UQFzPQCEErd+KBYLvuQsSh905PQSHZzH2Uo+SYcQS+EdYyuBHPcHdGZJ+C5WTN4t/WEGiJ/kB9UCrbVGf/66uEODLc0HlAY28OioBq80DuxuZC54rzkhLoXOWw9JokJhe4qvPG+vG7U7GISH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762752504; c=relaxed/simple;
	bh=JFVXTRN70n6U6zcNqFyPmW01tE9kHwKyej8zmUkWDIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdZIbmBMSWgU1IVn0Hoz11UEN5B3DKC2iOKJo+IXRw/J71XecQhkokvYYi9ZQdIeqDGvXvoVA/0n3Iex5odbjVR7vwpqwd3MJ3lS0my9L4jEuFmWKM1jzHZS2CO9spBmBquqHHpaCcY6GIkYtgH0eOC9y95WwUjfPgoDbB0W1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mN3SdaEv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762752502; x=1794288502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JFVXTRN70n6U6zcNqFyPmW01tE9kHwKyej8zmUkWDIM=;
  b=mN3SdaEvD3qhf8yUjHZLXVGJtazeC6aCLPXClnHssPAfr2c4LWWjkj7m
   0f+FIT1IMRdAzdWIfMdpFjT+wPyemi5VAiY5JpqkLD/hyb1FWhAiTC73z
   xEZ6C5YVnCqtvZ/h5E+rA3I/Ak6vT0I+DCpMHepyNFM6BM3SFaf1AN1XG
   dKEA5MsYGYZY7tmCWYg9S83AJpeZL4VVU0RBGiBBfHe+uR1KVIEiyFadH
   oJRx0vALY0vv8R+ZhlJwnorIP8XL7a48rnW5gGWld0DvoDfsvniwSP5hR
   M8YlqXbuQU7JgN48FBXuZeejKUCHuDmy+dwwGW61ECc3k4yVRTFXvaavB
   w==;
X-CSE-ConnectionGUID: qtpWSxd3Q1SmUP7ZG91AdQ==
X-CSE-MsgGUID: iL9sYBAWSOqiEHGEHiemRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="67405761"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="67405761"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:28:22 -0800
X-CSE-ConnectionGUID: YIvLMsgAT1OHh2BjdlF9pg==
X-CSE-MsgGUID: 2HEyzd6qSt6Xia/7nqAl/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192691687"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2025 21:28:19 -0800
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
Subject: [PATCH v2 2/2] gpio: elkhartlake: Convert to auxiliary driver
Date: Mon, 10 Nov 2025 10:56:41 +0530
Message-ID: <20251110052728.383339-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110052728.383339-1-raag.jadav@intel.com>
References: <20251110052728.383339-1-raag.jadav@intel.com>
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
 drivers/gpio/gpio-elkhartlake.c | 34 ++++++++++++++++-----------------
 2 files changed, 17 insertions(+), 19 deletions(-)

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
index 95de52d2cc63..08daf2fc59e6 100644
--- a/drivers/gpio/gpio-elkhartlake.c
+++ b/drivers/gpio/gpio-elkhartlake.c
@@ -2,43 +2,42 @@
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
+static int ehl_gpio_probe(struct auxiliary_device *aux_dev, const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct ehl_pse_io_dev *io_dev = auxiliary_dev_to_ehl_pse_io_dev(aux_dev);
+	struct device *dev = &aux_dev->dev;
 	struct tng_gpio *priv;
-	int irq, ret;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	priv->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	priv->reg_base = devm_ioremap_resource(dev, &io_dev->mem);
 	if (IS_ERR(priv->reg_base))
 		return PTR_ERR(priv->reg_base);
 
 	priv->dev = dev;
-	priv->irq = irq;
+	priv->irq = io_dev->irq;
 
 	priv->info.base = -1;
 	priv->info.ngpio = EHL_PSE_NGPIO;
@@ -51,25 +50,24 @@ static int ehl_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "tng_gpio_probe error\n");
 
-	platform_set_drvdata(pdev, priv);
+	auxiliary_set_drvdata(aux_dev, priv);
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


