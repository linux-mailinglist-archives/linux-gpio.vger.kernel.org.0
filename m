Return-Path: <linux-gpio+bounces-15551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D4A2C6BB
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229F03A7D3C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3904E23FC5C;
	Fri,  7 Feb 2025 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+FdVtAb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC61F37C6;
	Fri,  7 Feb 2025 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941516; cv=none; b=a/7Vk1/OR2TQ0N7aVzrtpwd0Ohj/bRlolLHu7nSvP3Q6dNsLi6hi4gSVeWlDADmAC5XMYnUkqTeZlwIQiS1vjtXlFCuJkONORim+ccf8rujAH6mACYZkOFg5UjwPxGsOls+v0WlOFw1A/nEfapqYqH1F6OTBUGPmAY/1L2GYQMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941516; c=relaxed/simple;
	bh=RpIKikbcDWkM5Hzt3hYTUmGzsoMxr9PAEMTrIc2EYnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hY8/+vvuSUcJSaqaex7TZW1tUehAMS2rmcwuXaTbDC41ncf2Aq5dlziqhPrKEYdbODjkEFHc5GV6kGoj1zkC2TJCxUDegIdIg5xxOgFvxL/jGmHWh6yRm+1lIyZr6U8j8FuQFU7UFIBeDWJZOzDhU+nEHHO0zBSm/n0FAN5rroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+FdVtAb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941515; x=1770477515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RpIKikbcDWkM5Hzt3hYTUmGzsoMxr9PAEMTrIc2EYnU=;
  b=W+FdVtAbalaTEOR6VIttCkrFgW++fUZxxD9afYxoNYwaVa3sijgiOU2l
   dIk8wKVJwYdHonCkyd51i95VosPNDV1oEIsMbWNCPbF6cZK/RpgNJCRR3
   4s/Grig1rguqOFXqRb3dmNcmsR/HLLoXOjO1Nq2t+Cy6QM9QhAKWO8a6x
   ee957hbLwB7IOBINaFxUDbC+eyEnklUjU+QxACi1wBvZ+zHzximYgzoCO
   V9T88ZoKYUQaXOBpRA2x4d0fGgbFI85JQmOCZG4mbbjclD53FFwWrnm0h
   T4vgIdI5PqrCSNU1aLVRjnIIOwuINaVmJN/hTlGxKBCxy4uuE4xEXWItg
   A==;
X-CSE-ConnectionGUID: qjSxxWLyQ9qK3g36kvPWrg==
X-CSE-MsgGUID: GbxcWY9LSoWCFZFmo8Yg0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38815627"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38815627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:33 -0800
X-CSE-ConnectionGUID: 2IVECy69Q06iB9ObmdsC9A==
X-CSE-MsgGUID: 5HKF5HQ7S12bcVbnP0DVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116599318"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 07:18:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BD382498; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 5/7] gpio: 74x164: Fully convert to use managed resources
Date: Fri,  7 Feb 2025 17:17:12 +0200
Message-ID: <20250207151825.2122419-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
References: <20250207151825.2122419-1-andriy.shevchenko@linux.intel.com>
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
 drivers/gpio/gpio-74x164.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 0f720d539fa7..ecd691de8539 100644
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
@@ -149,18 +160,13 @@ static int gen_74x164_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(&spi->dev, ret, "Config write failed\n");
 
-	gpiod_set_value_cansleep(chip->gpiod_oe, 1);
+	ret = gen_74x164_activate(dev, chip);
+	if (ret)
+		return ret;
 
 	return devm_gpiochip_add_data(&spi->dev, &chip->gpio_chip, chip);
 }
 
-static void gen_74x164_remove(struct spi_device *spi)
-{
-	struct gen_74x164_chip *chip = spi_get_drvdata(spi);
-
-	gpiod_set_value_cansleep(chip->gpiod_oe, 0);
-}
-
 static const struct spi_device_id gen_74x164_spi_ids[] = {
 	{ .name = "74hc595" },
 	{ .name = "74lvc594" },
@@ -181,7 +187,6 @@ static struct spi_driver gen_74x164_driver = {
 		.of_match_table	= gen_74x164_dt_ids,
 	},
 	.probe		= gen_74x164_probe,
-	.remove		= gen_74x164_remove,
 	.id_table	= gen_74x164_spi_ids,
 };
 module_spi_driver(gen_74x164_driver);
-- 
2.43.0.rc1.1336.g36b5255a03ac


