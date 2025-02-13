Return-Path: <linux-gpio+bounces-15962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25944A34EDA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 20:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8095D1891035
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4216266B4B;
	Thu, 13 Feb 2025 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3cQLwhw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2524BC11;
	Thu, 13 Feb 2025 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739476591; cv=none; b=CQnuFkY/lo2wkA8BNZ4NPjFlsPi4J6ld/YlfaLxw2/VxaJ2qOWVSYLj9ZPDEOENRjA44k8I0Qwyw9cPBW2lDd7vKGgWE77FsKcDdy7AYB+SYI+NA1uJP1rWYfk0PPPQRuBwb1t707OvloApcH+oHE+xKpu8i2+3WRLRovmdSV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739476591; c=relaxed/simple;
	bh=PJmRW2KaIfrpizikoDdSsfo6z+i8RUkbQGWcNuTn1m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYFj9qTE5KMEK5JlhZjflrXMS+Fc+37SK1eL9lgMJQ6nNmnb/fHmWsRjKcalbvdg/TM/3ilD/ez2yR964HP+/3Cb/2b1zV424WkSuzA96H5fbJgo1+Q090kXLiZtUvU0AvmmKSd4LkCEFRm7ByFyfk2Bu5PSVBo8EOvGhQPbSkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j3cQLwhw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476589; x=1771012589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PJmRW2KaIfrpizikoDdSsfo6z+i8RUkbQGWcNuTn1m8=;
  b=j3cQLwhw9rrmcchGmrcWd9LFA+yE/jHi5WXKAU+LZyv/Iq5oKQzo0waB
   m7cOsMQ5qPY9s+yy228BGX5RJEtbtLB0i254/wGfrE6a8uhW6iAJg9SwT
   kQMtTvlaXFw9iuJ6/qrNehe88OworooHFvArOSYrNoLdBIvT/1kYZnzT6
   f0MUWVjaBiIZL+ysK4lFoIowA4wQveL3ccw+zrGYd0lytFEKdHrVWk3ua
   PM7pVU/S3tUxTvvp/j+3USpiGNPHOjWOmSPcqwzSZj27uPluMqg40ze+m
   rxWnJmpqh62MWq5K8jKuT9mmoVVBjTB2nHI0LEiNtKeskZEfQk1vPt6aE
   g==;
X-CSE-ConnectionGUID: moXuq2SQShKtqD4nmSPN8w==
X-CSE-MsgGUID: KuzlKpVdRk6ADCdn4d8gjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40078548"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40078548"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:56:28 -0800
X-CSE-ConnectionGUID: I+8HbDY6RvGH7W7Paeh5Rw==
X-CSE-MsgGUID: AZJKqqLORUODhGoCsOzjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150421164"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 11:56:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3E6673BA; Thu, 13 Feb 2025 21:56:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	athieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v1 5/5] gpio: regmap: Allow ngpio to be read from the property
Date: Thu, 13 Feb 2025 21:48:50 +0200
Message-ID: <20250213195621.3133406-6-andriy.shevchenko@linux.intel.com>
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

GPIOLIB supports the case when number of supported GPIOs can be read
from the device property. Enable this for drivers that are using
GPIO regmap layer.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-regmap.c  | 13 +++++++++----
 include/linux/gpio/regmap.h |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 41ee576e7cd0..856f8569566e 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -17,6 +17,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/regmap.h>
 
+#include "gpiolib.h"
+
 struct gpio_regmap {
 	struct device *parent;
 	struct regmap *regmap;
@@ -210,9 +212,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	if (!config->parent)
 		return ERR_PTR(-EINVAL);
 
-	if (!config->ngpio)
-		return ERR_PTR(-EINVAL);
-
 	/* we need at least one */
 	if (!config->reg_dat_base && !config->reg_set_base)
 		return ERR_PTR(-EINVAL);
@@ -243,7 +242,6 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 	chip->parent = config->parent;
 	chip->fwnode = config->fwnode;
 	chip->base = -1;
-	chip->ngpio = config->ngpio;
 	chip->names = config->names;
 	chip->label = config->label ?: dev_name(config->parent);
 	chip->can_sleep = regmap_might_sleep(config->regmap);
@@ -262,6 +260,13 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 		chip->direction_output = gpio_regmap_direction_output;
 	}
 
+	chip->ngpio = config->ngpio;
+	if (!chip->ngpio) {
+		ret = gpiochip_get_ngpios(chip, chip->parent);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index b9240e4156cc..c722c67668c6 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -21,7 +21,7 @@ struct regmap;
  *			If not given, the fwnode of the parent is used.
  * @label:		(Optional) Descriptive name for GPIO controller.
  *			If not given, the name of the device is used.
- * @ngpio:		Number of GPIOs
+ * @ngpio:		(Optional) Number of GPIOs
  * @names:		(Optional) Array of names for gpios
  * @reg_dat_base:	(Optional) (in) register base address
  * @reg_set_base:	(Optional) set register base address
-- 
2.45.1.3035.g276e886db78b


