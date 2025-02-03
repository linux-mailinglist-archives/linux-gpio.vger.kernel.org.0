Return-Path: <linux-gpio+bounces-15249-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E6EA2592C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D2AE3A1594
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1335F204598;
	Mon,  3 Feb 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGNVf+R5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558EE2036E1;
	Mon,  3 Feb 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585129; cv=none; b=A3SZToee7y70h/mqTWoTglyou8xerpe2vVnIVMk2zDXpKAz9ldhWl/vDsGFBt4UtQhx8ZqzEBh1T57aitaWyo5e20vVnlWKAnmG3Dj+wOdmcOJ3kaH59pvcVc5pGoQSqYBzdBJjC3UWzBxIKwt41yQ2i1oBrrsdk8oFDym7SZaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585129; c=relaxed/simple;
	bh=Hg+ZWkXcKMzpoi69OuZ67hZSAqFz2rwIYs4UrpX3Q1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGy2gCa2YIVwH9NEdiGdb4qb8ZjC0O3tzbssDYH3Q6EPXDD7x8vTrFP7DbJG/s6UXVe+psgpHbpRt79IhRdAtUL5ZWLrd7IS5IJTjZ4n+eul9hiHATTF/b/KQyJZF5gRUou1/lThLk4HyrqR5lBgQzj/ekvNSO2XF6wl2ajFyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGNVf+R5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585129; x=1770121129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hg+ZWkXcKMzpoi69OuZ67hZSAqFz2rwIYs4UrpX3Q1U=;
  b=JGNVf+R5CUoZSxaDZFaj454feamTUn/2nr5C+aQ65qFIKbpxflv7TZF0
   YpKMm2Vrxc1kR8MKfZ5Op31eDdjOc8nZOOd54morp5Duice4y4DdZfUMP
   wtXrPIcjJR/LefUOSUgPYUYL5cG9yePsAe949N1p+KYE550zvSXakiqaG
   MAiLucHkW8wpdS1WFu+XjMYXlzSV2CnWbVOhKoQP78ZnQSm/jbGS+/Rk9
   rSUVwOGL3mN4POpTVTBI7na4cvThDAAhgHYUhcT3MlAIiqufgQV7ATBgs
   ZomkY9IXGTKQ0hZk6kGJ7Ypo9+XNyRrb7eJi5r0KeQehK4TpsR8WIKx6c
   Q==;
X-CSE-ConnectionGUID: F9J0RjmZTySLRQPf7ibG8g==
X-CSE-MsgGUID: ctdBajcsQ0iXSkLJ8iQRkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56502983"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56502983"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:48 -0800
X-CSE-ConnectionGUID: U/dc3eLMTaagZAXlvCZv4A==
X-CSE-MsgGUID: jQ1GOZbLQXuXeAO0Tpr6Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115279157"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 04:18:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 62D423A7; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
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
Subject: [PATCH v1 3/7] gpio: 74x164: Annotate buffer with __counted_by()
Date: Mon,  3 Feb 2025 14:17:19 +0200
Message-ID: <20250203121843.3183991-4-andriy.shevchenko@linux.intel.com>
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

Add the __counted_by() compiler attribute to the flexible array member
volumes to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE.

Use struct_size() instead of manually calculating the number of bytes to
allocate the private structure with a buffer.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 70c662bbca7b..7844f8a58834 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -30,7 +30,7 @@ struct gen_74x164_chip {
 	 * register at the end of the transfer. So, to have a logical
 	 * numbering, store the bytes in reverse order.
 	 */
-	u8			buffer[];
+	u8			buffer[] __counted_by(registers);
 };
 
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
@@ -97,6 +97,7 @@ static int gen_74x164_direction_output(struct gpio_chip *gc,
 
 static int gen_74x164_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct gen_74x164_chip *chip;
 	u32 nregs;
 	int ret;
@@ -116,10 +117,12 @@ static int gen_74x164_probe(struct spi_device *spi)
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(&spi->dev, sizeof(*chip) + nregs, GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, buffer, nregs), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
+	chip->registers = nregs;
+
 	chip->gpiod_oe = devm_gpiod_get_optional(&spi->dev, "enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(chip->gpiod_oe))
@@ -133,10 +136,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 	chip->gpio_chip.set = gen_74x164_set_value;
 	chip->gpio_chip.set_multiple = gen_74x164_set_multiple;
 	chip->gpio_chip.base = -1;
-
-	chip->registers = nregs;
 	chip->gpio_chip.ngpio = GEN_74X164_NUMBER_GPIOS * chip->registers;
-
 	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.parent = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
-- 
2.43.0.rc1.1336.g36b5255a03ac


