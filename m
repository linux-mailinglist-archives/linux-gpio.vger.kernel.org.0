Return-Path: <linux-gpio+bounces-15961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B4A34ED6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B0EF16D1F2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0445A2661AC;
	Thu, 13 Feb 2025 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="in9Omtpn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4F24BBF6;
	Thu, 13 Feb 2025 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476590; cv=none; b=TbULhmkA3xZcYyYqvqp7GWQHOGlytaHelAIEvfPDNF0xSHZzbKhCM7H+uS5Gs9Fd98k0SfJIbHTwAgqdv6EhXnZs36W7BUo1GCfUVpHoPP+cY1VEMXfJ8vi0q8GF081db0uPrBNOo5OY92lewt8OU+XU4s34mlo7/n5BY5nYh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476590; c=relaxed/simple;
	bh=iHwGxYpMwuP2zk+GRPxjAQdMF+OcbFeFkFYimRgAIwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eShsGQKtNPf7TZRMKPUr8Sn5Jj7aJAh8xz/LNR3B+3fy8HHPS1L/JM1D9bGu19sScVZ2p6y/byrF+SLtROMNq14GSD90V2oJ6i+wwPxXBBd0qlQ9Q7f6ZHyEHpvhq/pVmjFpYBgvlT6Q8pZRXTB5RwYdQICTtJBOVrjtOJqqPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=in9Omtpn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476589; x=1771012589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iHwGxYpMwuP2zk+GRPxjAQdMF+OcbFeFkFYimRgAIwk=;
  b=in9Omtpn0LWRHojMoxkJyywusbANONnMsqOtsOatOFLyC/qbrZnNSTCw
   G7K63pNQpm1tEM2ULU5vTFJVD8bq94mF2b/KfDXHsHQI56Xo5zCOi+aTA
   VKJz3lPSCOagNDAp703/4tb6W5AmRbeHS55fTgPgnOeOe9EfXPmOQhZNM
   8ivhRYqUSZXLevfUipny1N36nPwe5C8QLqRHRKPmGSTP7kRTUgmiwzhzL
   j6YfxtIMpgSgcrHU7qN7x4pMlSz3r23RNQZi4xajwxPbYKaBuuQ4N9rl+
   Dmr2wWwADROQSBcbP0X34P7RSHi2RfeZh/yaUlmvk6Jwt7C/xI8ECAciv
   Q==;
X-CSE-ConnectionGUID: +wYp0r/RRxySrPGnMjDX6A==
X-CSE-MsgGUID: s54JVnbSSxqG85m1MBJYTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40466025"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40466025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:56:25 -0800
X-CSE-ConnectionGUID: xKuVD2+eTm+le5ugCOVjNQ==
X-CSE-MsgGUID: A6XCuCTJRkSKvLntjR+1ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113745542"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 11:56:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 32CB3322; Thu, 13 Feb 2025 21:56:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v1 4/5] gpio: regmap: Move optional assignments down in the code
Date: Thu, 13 Feb 2025 21:48:49 +0200
Message-ID: <20250213195621.3133406-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
References: <20250213195621.3133406-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move optional assignments down in the code, so they may use some values
from the (updated) struct gpio_chip later on.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-regmap.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 7775b0c56602..41ee576e7cd0 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -239,20 +239,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->reg_dir_in_base = config->reg_dir_in_base;
 	gpio->reg_dir_out_base = config->reg_dir_out_base;
 
-	/* if not set, assume there is only one register */
-	gpio->ngpio_per_reg = config->ngpio_per_reg;
-	if (!gpio->ngpio_per_reg)
-		gpio->ngpio_per_reg = config->ngpio;
-
-	/* if not set, assume they are consecutive */
-	gpio->reg_stride = config->reg_stride;
-	if (!gpio->reg_stride)
-		gpio->reg_stride = 1;
-
-	gpio->reg_mask_xlate = config->reg_mask_xlate;
-	if (!gpio->reg_mask_xlate)
-		gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
-
 	chip = &gpio->gpio_chip;
 	chip->parent = config->parent;
 	chip->fwnode = config->fwnode;
@@ -276,6 +262,20 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 		chip->direction_output = gpio_regmap_direction_output;
 	}
 
+	/* if not set, assume there is only one register */
+	gpio->ngpio_per_reg = config->ngpio_per_reg;
+	if (!gpio->ngpio_per_reg)
+		gpio->ngpio_per_reg = config->ngpio;
+
+	/* if not set, assume they are consecutive */
+	gpio->reg_stride = config->reg_stride;
+	if (!gpio->reg_stride)
+		gpio->reg_stride = 1;
+
+	gpio->reg_mask_xlate = config->reg_mask_xlate;
+	if (!gpio->reg_mask_xlate)
+		gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
+
 	ret = gpiochip_add_data(chip, gpio);
 	if (ret < 0)
 		goto err_free_gpio;
-- 
2.45.1.3035.g276e886db78b


