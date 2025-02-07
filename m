Return-Path: <linux-gpio+bounces-15546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB39A2C6B2
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 16:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F2C16B973
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 15:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A311EB1B3;
	Fri,  7 Feb 2025 15:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyJr4Q1q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F541E5B67;
	Fri,  7 Feb 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941513; cv=none; b=d3Cbp1PeIdyNzdhaAFp32poy0cAvU4dWavHYHBzdHuv3Jl3D0hF7oe6ksjkgEZIkQOZbkxk3rtwmMz9Lwtc4k3flstP0cxTy8SRJwtWbV4XeMktDIWlLr3tJbI7Rwv9E1Qc0YqLHUnMmlB/1dr1FOUxwIUMfj4+lu6Eqpov+fMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941513; c=relaxed/simple;
	bh=OPZPEzubgWFgSDqq2IdR1CiH9zps4lf42a2bMs4pJx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPpgnzq+AihzZG/ZJwmXA0lO8yLfRjisSKVFDTvVZwDRpdxaSPvekLZC9SmqK8PX0ByTAD2u2vIZ0hi0bgsXunCThd5eP0QxLW4x7d1bl3x8i+M69oJQCgLj5OSfpPiK/gWhjRHWsSbLQOuyEFMXBtkQ6ZDZ1bAcFdCpnUa224A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyJr4Q1q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738941512; x=1770477512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OPZPEzubgWFgSDqq2IdR1CiH9zps4lf42a2bMs4pJx8=;
  b=XyJr4Q1qGNQgzYxrLjPpkP+v+x+OhAmCuBRbHVTC9N95bz/bY2RPlj8o
   kAWzNkBS/pF+uvVpuYgV0zMV55wxfOc5OpKzMuZuVrw+xVBm3yhnD3UfL
   BacIyGsmqoIgy4pwnVogJqBcYP22dbkkeSo4pF686DM2zuXpR9c4JAed6
   SW68W6zwdygPmFhjssUtyOF6CKRY2GTFGIF5YYogzvMzU0QxDzv8jmdla
   5xd2GlgQzI9Xoov47gVCl/UI0T49ZlC7baxy/leTivXM4/54fS1KWbxV7
   1GDDrQ544NdIo1upA6i8H9qUYjPZuT+gS90jYglIb2HmB91ghuoI9bmvU
   w==;
X-CSE-ConnectionGUID: RbvRz2TsQz+b63QQXItVsQ==
X-CSE-MsgGUID: QM73s09WSQeXRUPnF9NLXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38815617"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38815617"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:18:30 -0800
X-CSE-ConnectionGUID: LXg0QpDkQCu4fQYsGjErMg==
X-CSE-MsgGUID: mT39GpXhRIuUk/aNh/y7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116599311"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 07:18:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 92FD538D; Fri, 07 Feb 2025 17:18:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH v2 2/7] gpio: 74x164: Simplify code with cleanup helpers
Date: Fri,  7 Feb 2025 17:17:09 +0200
Message-ID: <20250207151825.2122419-3-andriy.shevchenko@linux.intel.com>
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

Use macros defined in linux/cleanup.h to automate resource lifetime
control in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-74x164.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index fca6cd2eb1dd..70c662bbca7b 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
@@ -43,13 +44,10 @@ static int gen_74x164_get_value(struct gpio_chip *gc, unsigned offset)
 	struct gen_74x164_chip *chip = gpiochip_get_data(gc);
 	u8 bank = chip->registers - 1 - offset / 8;
 	u8 pin = offset % 8;
-	int ret;
 
-	mutex_lock(&chip->lock);
-	ret = (chip->buffer[bank] >> pin) & 0x1;
-	mutex_unlock(&chip->lock);
+	guard(mutex)(&chip->lock);
 
-	return ret;
+	return (chip->buffer[bank] >> pin) & 0x1;
 }
 
 static void gen_74x164_set_value(struct gpio_chip *gc,
@@ -59,14 +57,14 @@ static void gen_74x164_set_value(struct gpio_chip *gc,
 	u8 bank = chip->registers - 1 - offset / 8;
 	u8 pin = offset % 8;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
+
 	if (val)
 		chip->buffer[bank] |= (1 << pin);
 	else
 		chip->buffer[bank] &= ~(1 << pin);
 
 	__gen_74x164_write_config(chip);
-	mutex_unlock(&chip->lock);
 }
 
 static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -78,7 +76,8 @@ static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	size_t bank;
 	unsigned long bitmask;
 
-	mutex_lock(&chip->lock);
+	guard(mutex)(&chip->lock);
+
 	for_each_set_clump8(offset, bankmask, mask, chip->registers * 8) {
 		bank = chip->registers - 1 - offset / 8;
 		bitmask = bitmap_get_value8(bits, offset) & bankmask;
@@ -87,7 +86,6 @@ static void gen_74x164_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 		chip->buffer[bank] |= bitmask;
 	}
 	__gen_74x164_write_config(chip);
-	mutex_unlock(&chip->lock);
 }
 
 static int gen_74x164_direction_output(struct gpio_chip *gc,
-- 
2.43.0.rc1.1336.g36b5255a03ac


