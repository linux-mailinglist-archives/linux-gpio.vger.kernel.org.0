Return-Path: <linux-gpio+bounces-13064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A009D0BA8
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 10:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9EE61F21374
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2024 09:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC96C18EFED;
	Mon, 18 Nov 2024 09:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKos5JwR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4D18B47E;
	Mon, 18 Nov 2024 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922055; cv=none; b=T7UhTXywrB2mjo1ljpvFTCMjbkL4kQRJksqfJw7MSiYV5FcFfOP73E6tmCtyYxHD/S8AY6rhgZQac65rX0DwT4vQbv8txH/nvwftV2T3Lb1tmKwh8bPSSErqQH9h/6xJzuPFQc9a+LhpQ90gsZGjxxWZimVxo7waSCGULKJdeE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922055; c=relaxed/simple;
	bh=yiJoYmZ+1mxJIynIPiaYtUku1lFQL80mp5dxepxukDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qmEp3rvEo9mNl9/mcla28CX17qDolvhbpyoZuNSat9+CvCKXYXOs5CUR3SweKa14ydzTROYLks+sozz8+Xn3aKXtyd4gJJFa5viDbwMkFJ3GRyzw3IpYdnxChpKewkisgmp8jPJoUKGbH2fdnJHG4++6HJ0eDHQrLrRL2ZTul4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKos5JwR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731922054; x=1763458054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yiJoYmZ+1mxJIynIPiaYtUku1lFQL80mp5dxepxukDA=;
  b=YKos5JwRtpfONvEjS6oBN0CO61jUF8d012EkCXnVrXyjswwhIMnov32I
   yH9jsCqxFcEiI5Lrfd4gqVEChW1gDn8w2RaAIPu+I4LzzFsrs/pnbN3Gk
   31ecPGOuYZejfaaZSNY9YFaah4worBHAFK+4qKcSnPxSS9r9kNEUY+GM+
   auMyKfo+j2EFyq12oZ1DNWkY/g27oeraRdLZeiUn3/YDwt73p/uktslUg
   ADC0mWlajPUNCA6J2WnCRNQOhJD1ZF4MjcjX7e0H5TKq3MYoIZqazwkNg
   BUujnxIzRLGWU1VfmVnfjEr4m8NOBQxcURXS2EznuscirDOtOx5udmXht
   Q==;
X-CSE-ConnectionGUID: vHSbAuEsTeiBcgQZSYujPA==
X-CSE-MsgGUID: 4O0eI1hwSQOdYZrDxJrNdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32105654"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="32105654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:27:33 -0800
X-CSE-ConnectionGUID: nbY3P3a1TYCAyW/CowvkbA==
X-CSE-MsgGUID: p+bnMUpGTi2Z9ijlUKIUBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93237403"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 01:27:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EB378277; Mon, 18 Nov 2024 11:27:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/1] gpio: zevio: Add missed label initialisation
Date: Mon, 18 Nov 2024 11:27:07 +0200
Message-ID: <20241118092729.516736-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialise the GPIO chip label correctly as it was done by
of_mm_gpiochip_add_data() before the below mentioned change.

Fixes: cf8f4462e5fa ("gpio: zevio: drop of_gpio.h header")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: explained why label should be initialised (Bart)
 drivers/gpio/gpio-zevio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
index 2de61337ad3b..d7230fd83f5d 100644
--- a/drivers/gpio/gpio-zevio.c
+++ b/drivers/gpio/gpio-zevio.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -169,6 +170,7 @@ static const struct gpio_chip zevio_gpio_chip = {
 /* Initialization */
 static int zevio_gpio_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct zevio_gpio *controller;
 	int status, i;
 
@@ -180,6 +182,10 @@ static int zevio_gpio_probe(struct platform_device *pdev)
 	controller->chip = zevio_gpio_chip;
 	controller->chip.parent = &pdev->dev;
 
+	controller->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
+	if (!controller->chip.label)
+		return -ENOMEM;
+
 	controller->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(controller->regs))
 		return dev_err_probe(&pdev->dev, PTR_ERR(controller->regs),
-- 
2.43.0.rc1.1336.g36b5255a03ac


