Return-Path: <linux-gpio+bounces-15253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDAA25932
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE673A43AD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016E2204C28;
	Mon,  3 Feb 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMdu3rf4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B14204698;
	Mon,  3 Feb 2025 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585132; cv=none; b=Fdgy0gCNAkGyDxiMhY9kEvn880GpGS2wwNKUAfCVLd6qH0ANomNxDLFpc6aYCyLNFeEXMu0Dev0zVK0hQEz6zWm+eJ6s+OnW9WyXZPPBBAPsfus3qBb3UZuBFRAWWlzdDQ/iWXinsRc0skj6VG8z7xVhzwmurRt8R/YRc5/RNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585132; c=relaxed/simple;
	bh=W8ihz+XdNBEMhRh6wz1AdgNj2Nb2oR3a6c8z4k8I6Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMdAdI79M15LDu5xNcYg3AIbemda+xLpJYgiJZ3Eef7KAQcSRG6/NjlvTzJFgdefeDFqHPNog1WbKXtT8+PnBrBCSgFTndx6OZ6nsxTvF5gYOlIZMsLsreu+MX8HI9HKAU904/CG1wIvHSuFl3D7K0+b88QaVkR8Vn5TpmH+hQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMdu3rf4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585132; x=1770121132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W8ihz+XdNBEMhRh6wz1AdgNj2Nb2oR3a6c8z4k8I6Us=;
  b=BMdu3rf4E0DvBm9As8eXyQotz7XhOB925kIiG2WHsAyIRr7LvYpv5dtm
   /WcTzUlgMAY8CM0/seesZNeuF8s3Jksb8vwqd6hx7e9EG+zSlk8QAGM43
   kOLB4//kIsNDVzj3Ch2rg/2Oix61ysJnM2d0zB2CzsHQzBOQ9od7CfnAD
   YuG9f0FuuYqAnrcuYGX5/UUy01tsRtMLHZRpfvvi6LgycELLqBkk80a9v
   hOkesuMapvqKNgw+C+W8j4XHsypGbdz/Nbg0Kgpgd4jeb5zFOfJgrHjqi
   UFNYRufS12+OEWN4f0KYlp2HfmO+w/AwvjIMpPgc6xR3lzXXzCE61KOjS
   w==;
X-CSE-ConnectionGUID: /3QI1rvbS0ubttlnFNX6ew==
X-CSE-MsgGUID: 84vlLhgXRKeX7caQOZx46Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56502993"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56502993"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:51 -0800
X-CSE-ConnectionGUID: tsBsjCohQhWUZZq42TQLVA==
X-CSE-MsgGUID: 3XhbaGU8Q7OYsTqs+ImJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115279163"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 04:18:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7B13649A; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/7] gpio: 74x164: Fully convert to use managed resources
Date: Mon,  3 Feb 2025 14:17:21 +0200
Message-ID: <20250203121843.3183991-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the driver probe stage to use managed resources.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 0f720d539fa7..920d3b9c1087 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -95,6 +95,19 @@ static int gen_74x164_direction_output(struct gpio_chip *gc,
 	return 0;
 }
 
+static void gen_74x164_deactivate(void *data)
+{
+	struct gen_74x164_chip *chip = data;
+
+	gpiod_set_value_cansleep(chip->gpiod_oe, 0);
+}
+
+static int gen_74x164_activate(struct device *dev, struct gen_74x164_chip *chip)
+{
+	gpiod_set_value_cansleep(chip->gpiod_oe, 1);
+	return devm_add_action_or_reset(dev, gen_74x164_deactivate, chip);
+}
+
 static int gen_74x164_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -128,8 +141,6 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (IS_ERR(chip->gpiod_oe))
 		return PTR_ERR(chip->gpiod_oe);
 
-	spi_set_drvdata(spi, chip);
-
 	chip->gpio_chip.label = spi->modalias;
 	chip->gpio_chip.direction_output = gen_74x164_direction_output;
 	chip->gpio_chip.get = gen_74x164_get_value;
@@ -149,7 +160,9 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(&spi->dev, ret, "Config write failed\n");
 
-	gpiod_set_value_cansleep(chip->gpiod_oe, 1);
+	ret = gen_74x164_activate(dev, chip);
+	if (ret)
+		return ret;
 
 	return devm_gpiochip_add_data(&spi->dev, &chip->gpio_chip, chip);
 }
@@ -181,7 +194,6 @@ static struct spi_driver gen_74x164_driver = {
 		.of_match_table	= gen_74x164_dt_ids,
 	},
 	.probe		= gen_74x164_probe,
-	.remove		= gen_74x164_remove,
 	.id_table	= gen_74x164_spi_ids,
 };
 module_spi_driver(gen_74x164_driver);
-- 
2.43.0.rc1.1336.g36b5255a03ac


