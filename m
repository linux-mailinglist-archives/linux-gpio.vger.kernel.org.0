Return-Path: <linux-gpio+bounces-15251-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07213A25931
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5298018859CF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 12:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6DB2046BA;
	Mon,  3 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VV+yG13Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E040204684;
	Mon,  3 Feb 2025 12:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585131; cv=none; b=EcImXZxAIsb4GcERP82AYIj2jCMiAcf2SclKCMvRMkM6zLMohUUg3R/hY3WTYrqTmv6MpkD6Y8XID10W7SCzb7GgZP8Fwtr0baAgxIFzBXhe6kIz/MtFXiAsTouc9CBADd1PvOy6Hm+mOeqwPdiJrx7WtTJ70HuV/wvlvizB+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585131; c=relaxed/simple;
	bh=OPZPEzubgWFgSDqq2IdR1CiH9zps4lf42a2bMs4pJx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDYmjGnYLhe4H7mmGc/Rarabjb5upKb6+SK/kG/KkqS56jeBsCTsrinJimot7a67Y0av6ufgYjiQQx6/S0HzQOKsxVp8V2Uh4AFd8hDkVf4oMEPB/JZID3RekEN2lkGK05b7fXLPCaNJJGKQSd3eqFOFBuuJRAKTJy6kAC81tMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VV+yG13Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585130; x=1770121130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OPZPEzubgWFgSDqq2IdR1CiH9zps4lf42a2bMs4pJx8=;
  b=VV+yG13YdZG5R2TP2Vbj6Kc62XK4BKXe5Gz5Nq78NsAWl8qllgLtd976
   4DDXiqbdkZP98k0owvoEvj34YXGOri7R6OUfRuFiwoRynoiAin8MkHry3
   Jrhu21n4calpLnp9wFQ8g06xlCys7gPRFXfBuMzYuuyr1LoMn6wGollEp
   imeXtTEnytSzHPw5ZuTpyYCKQUjlcVEkdvP/RolW5IuQYHFooazukUgMl
   FbkHfGumeQbnj+H/Rbd91c7LkSdqIQYx95DHiFNOqhZwAs8qjTilkcUdr
   vxF5U1ALKH5OE4nAhcuq4DPFewDzvwvtA2VjgQsIz30uDZFLAikEasMj3
   A==;
X-CSE-ConnectionGUID: A/2098pgSra/jLAh7rEEog==
X-CSE-MsgGUID: ido3ZfKeSF6L3V1DtzVsSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42731508"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="42731508"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:18:48 -0800
X-CSE-ConnectionGUID: s0iWqOyuQ7yiA7xXqqwSzg==
X-CSE-MsgGUID: UK4kvM48Qx637a5UBpfwDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141138404"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 04:18:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 579E9399; Mon, 03 Feb 2025 14:18:44 +0200 (EET)
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
Subject: [PATCH v1 2/7] gpio: 74x164: Simplify code with cleanup helpers
Date: Mon,  3 Feb 2025 14:17:18 +0200
Message-ID: <20250203121843.3183991-3-andriy.shevchenko@linux.intel.com>
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


