Return-Path: <linux-gpio+bounces-15951-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FAA34E03
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 19:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737CF3A4C9D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FDA24293A;
	Thu, 13 Feb 2025 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JM0CHvCh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B335241691;
	Thu, 13 Feb 2025 18:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739472519; cv=none; b=DRSau+fNr11PTZm3yje60ak9aONaZfDDDm99ZVKJKdptGEG0six1+6q8YpwBDw5hihowC/o5ZJVYIC7fNqjlYxK214aGAGffruCUGWMI4omdE3ExBx96SFAEKJoS1nzft5BQvFWX8WV2rjgmL84EWuf4VqKY3XrM8Ajzut+yLGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739472519; c=relaxed/simple;
	bh=I05iALjHIFaPIYNvh9LQmBWacwqmHnBLROjwOcAffBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VWq7eKFbTHUQjwIotW2OtYHbA8QF1WbK+lTD33QZ7Uuwa3UoA/OwZb+h5wVEJdqzT0P1mHYWkvDKHNsIKovPnmzi7YdwDgAZraap1pJTEnIEDFto8N50Lk6sOUsG7uQNESG7gHuGOVWYsgB36d3hiUzDqmrZBLY4NEs2SpAXRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JM0CHvCh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739472518; x=1771008518;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I05iALjHIFaPIYNvh9LQmBWacwqmHnBLROjwOcAffBg=;
  b=JM0CHvChtomyxE/nbzelP0caILqonPfWnvTrrVuuqS3YGX6QBxE8Ucbt
   1mIWTDNstNlem5asjeylGy9uytEWomXEhMDwj7Nrto2qXHZLypnZOMsSS
   Ko6r8EXxVjuQvJkovb7+hYCJjam7QjU4kxANfqM71mDLkH14iIBYVLVX+
   bKc/XzAXj89K6yz3iiSQMHF2n9gG7OqQqoceTB8NbQGfM3KDDcNu74b/H
   Wh6mVGsV9JNzs74Z71DZ3bVrcn3zQIWAfLK5iGwX63+1NlqML4OgsjvBn
   lXSJSZh3p1JzWOgvjAmENGu2FwRpztZHZ4+sbQUTC9eoqi2/kI1NABFBL
   w==;
X-CSE-ConnectionGUID: 5/eq/GGxTxmZZwEi1rJkNw==
X-CSE-MsgGUID: 3hd/NenkS9S4iGyh8vm3Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40314489"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40314489"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:48:38 -0800
X-CSE-ConnectionGUID: Q4U1Amc2QhGsiNMTAE2E0w==
X-CSE-MsgGUID: 8CZxRNMqQ0SITpVQpGHHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150405388"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2025 10:48:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 237021FD; Thu, 13 Feb 2025 20:48:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] gpio: loongson-64bit: Remove unneeded ngpio assignment
Date: Thu, 13 Feb 2025 20:48:33 +0200
Message-ID: <20250213184833.3109038-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO library will parse the respective property to fill ngpio.
No need to repeat it in the driver.

While at it, drop unused fwnode field.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-loongson-64bit.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 7f4d78fd800e..f000cc0356c7 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -31,7 +31,6 @@ struct loongson_gpio_chip_data {
 
 struct loongson_gpio_chip {
 	struct gpio_chip	chip;
-	struct fwnode_handle	*fwnode;
 	spinlock_t		lock;
 	void __iomem		*reg_base;
 	const struct loongson_gpio_chip_data *chip_data;
@@ -138,7 +137,6 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 			      void __iomem *reg_base)
 {
 	int ret;
-	u32 ngpios;
 
 	lgpio->reg_base = reg_base;
 	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
@@ -159,8 +157,6 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 		lgpio->chip.direction_output = loongson_gpio_direction_output;
 		lgpio->chip.set = loongson_gpio_set;
 		lgpio->chip.parent = dev;
-		device_property_read_u32(dev, "ngpios", &ngpios);
-		lgpio->chip.ngpio = ngpios;
 		spin_lock_init(&lgpio->lock);
 	}
 
-- 
2.45.1.3035.g276e886db78b


