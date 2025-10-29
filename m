Return-Path: <linux-gpio+bounces-27780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 033E0C18761
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 07:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D03E504C49
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 06:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D753730FF04;
	Wed, 29 Oct 2025 06:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a45BIFTd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8F30BBB9;
	Wed, 29 Oct 2025 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761718921; cv=none; b=qVWgRSwTK9QRtlkW3aZ1pP4JKY1fdIcW0a+ovkWnmRxQZNPch6HGXzLF1/ufRy/lOfbWCZCm6H48PsXUAlzyHqpe3pl4tTN9OdB5ktsJWDOkBNvQGMEOu39eWz6apkGDV6Ce+1weSKMEUwHHrrP+5+HnvSRuDk9Tdso2dqd6ZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761718921; c=relaxed/simple;
	bh=nOGjeszvai6JO5Fsljp6H0j57dlEMS7Fx7Gh6+l2Y1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ETQSfQu952GiJarMOhUbP5AUKESsvyK15i+58gyzL3Bo+aeWutW9I1tDqI2vJ5zou6lcrorQajCwIBbXqVr1dRzltKAmtDrh2JzoUelS+NMAdkkIUiJ3RgXokRY8EiqsNFNmzdtPEsAMhEJgYozrfle8cbQti7RivnHZuzsfqy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a45BIFTd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761718919; x=1793254919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nOGjeszvai6JO5Fsljp6H0j57dlEMS7Fx7Gh6+l2Y1Q=;
  b=a45BIFTd/Ua/yd0glw1Pt4LTfOWsKHU4nN62et4TbZiR+hUEb7ZtyO5h
   6f4oZ/yA7nD7DALcXDkZhubO+mf4ZH/UPy6q8tzBWYN+vguO4zozGKnLw
   hWi4+mYAU9EQxzf5fClTjPXRjW8Os/wBTYTO8JsWBfZkn1+a6HdZ7xjks
   NbEi/LMEpXYW6fBp/2AzgEpKQteZLuFBbNm57SJkK8LLoj9J9fwGAotVO
   5N4HGMuSdoEpZyKJAzU59XwttdbW/WZSV+F7GVaqb3fx9Hy2RmWsuRAyX
   YldFPWQf0dRTGndseZHWB1uW464CqyK2lWLzhyaxsl+IMwNRDJ8RTG3p+
   A==;
X-CSE-ConnectionGUID: VG2a7sB8TcaeEDhMwpRhOQ==
X-CSE-MsgGUID: HvrzcbL1RlmZj4Sr/06CYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66446277"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="66446277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:21:58 -0700
X-CSE-ConnectionGUID: /fdP6DeMSha9MIJ19VgaXA==
X-CSE-MsgGUID: hlwQ1UgOSGmYJoSk0bU6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185201123"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 23:21:55 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
Date: Wed, 29 Oct 2025 11:50:50 +0530
Message-Id: <20251029062050.4160517-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029062050.4160517-1-raag.jadav@intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
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
2.34.1


