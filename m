Return-Path: <linux-gpio+bounces-15960-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB2A34ED4
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D2216D346
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B943266182;
	Thu, 13 Feb 2025 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYIF2Kpn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648824A07E;
	Thu, 13 Feb 2025 19:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476589; cv=none; b=HWVoRQmAaQwfIGxePgkVFqXFxA9vFtrJGhNxDuCQrjcl1fqyexHZEMVdCWIIIRpd+YK3moq4snmdyR+VP+FJFB1qBvUe9fPEEsMcramBibGqTj6bi1KlFxfZnrpMJqFJIx8SIssm5qGYfrKgdClw+BMlre4NSWAbau2dz15m80Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476589; c=relaxed/simple;
	bh=e86C71mshsm1vSox8d1u/ipm+lGPGwqYZMTfGlI8LvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cX9lZpCCnA2n23KfI9yI3DhJyFXszOiGhC1/N+ldd0D3tQt0l3UaMVCMF+ov4U/+T0BtCumB5/oFAn7YUlrggpy19jFxWJAG+E6Q9MJsj4nagI2g9v7hEu0c7id8Q2lv34B7/gyTFNns7P8WIOF0lPJhBqEq/Nom1BXyeQUgFKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYIF2Kpn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476588; x=1771012588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e86C71mshsm1vSox8d1u/ipm+lGPGwqYZMTfGlI8LvU=;
  b=hYIF2KpnR4wXRLWezPMoLoI5piLnM9TSGTLjZfZh5iF63gj+0c2CNI7v
   FkqZh5nwQ1NbDeWPSDrMBQfjrKiWpwtjkNu0LaU54lIfd8T1sginnqUc3
   UgPxq2B6ou5es+00NqDuqYZ+Cjt+jt5jG9xC3MpjABVDWdvzfUzJtQBmV
   /V9d5tri/6rDRwOVE5jhHI/iXM8wtnec/jN9kvDmXTnW9xlc/tPxJEryS
   a9ew17MhOQOSHKynrXgvwuQ9eqSE3wcQnv/ZxUFDguCbqTzbOeP3v44Qn
   fo3IOWLLOYLSiZvggZMKmZkaStC9+FCq109Zazd8Bm6xX7ESkMhfyjDce
   A==;
X-CSE-ConnectionGUID: b7DA7Ox/QpylVJ2NY2PQOw==
X-CSE-MsgGUID: F9J8zHPRRWiNu1MYhbYzxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40078538"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40078538"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:56:26 -0800
X-CSE-ConnectionGUID: 2G6nTZXgRGC9pfwqBVnVnA==
X-CSE-MsgGUID: vzh7xowATdqNdUdNGhjYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150421160"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 11:56:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 234CC31C; Thu, 13 Feb 2025 21:56:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v1 3/5] gpio: regmap: Group optional assignments together for better understanding
Date: Thu, 13 Feb 2025 21:48:48 +0200
Message-ID: <20250213195621.3133406-4-andriy.shevchenko@linux.intel.com>
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

Group ngpio_per_reg, reg_stride, and reg_mask_xlate assignments together
with the respective conditional for better understanding what's going on
in the code.

While at it, mark ngpio_per_reg as (Optional) in the kernel-doc
in accordance with what code actually does.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-regmap.c  | 6 +++---
 include/linux/gpio/regmap.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 05f8781b5204..7775b0c56602 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -233,9 +233,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->parent = config->parent;
 	gpio->driver_data = config->drvdata;
 	gpio->regmap = config->regmap;
-	gpio->ngpio_per_reg = config->ngpio_per_reg;
-	gpio->reg_stride = config->reg_stride;
-	gpio->reg_mask_xlate = config->reg_mask_xlate;
 	gpio->reg_dat_base = config->reg_dat_base;
 	gpio->reg_set_base = config->reg_set_base;
 	gpio->reg_clr_base = config->reg_clr_base;
@@ -243,13 +240,16 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	gpio->reg_dir_out_base = config->reg_dir_out_base;
 
 	/* if not set, assume there is only one register */
+	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
 		gpio->ngpio_per_reg = config->ngpio;
 
 	/* if not set, assume they are consecutive */
+	gpio->reg_stride = config->reg_stride;
 	if (!gpio->reg_stride)
 		gpio->reg_stride = 1;
 
+	gpio->reg_mask_xlate = config->reg_mask_xlate;
 	if (!gpio->reg_mask_xlate)
 		gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
 
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index a9f7b7faf57b..b9240e4156cc 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -30,7 +30,7 @@ struct regmap;
  * @reg_dir_out_base:	(Optional) out setting register base address
  * @reg_stride:		(Optional) May be set if the registers (of the
  *			same type, dat, set, etc) are not consecutive.
- * @ngpio_per_reg:	Number of GPIOs per register
+ * @ngpio_per_reg:	(Optional) Number of GPIOs per register
  * @irq_domain:		(Optional) IRQ domain if the controller is
  *			interrupt-capable
  * @reg_mask_xlate:     (Optional) Translates base address and GPIO
-- 
2.45.1.3035.g276e886db78b


