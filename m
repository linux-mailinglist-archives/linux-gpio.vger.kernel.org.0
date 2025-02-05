Return-Path: <linux-gpio+bounces-15375-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B47A28705
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C22AF3A5BBD
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA7A22B584;
	Wed,  5 Feb 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/yPGDV4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C322ACDF;
	Wed,  5 Feb 2025 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749175; cv=none; b=c4avof/T4TKraXC7awb595/nfHdrm0cdMkzpYjNeSISPbh5MeE6rhTkfrjG5vSSbUPz4tfaIWJNhOSzK2I/EEXqEebdpJ1D9SeFb1gQNgW2F0CQSIGWzYUeGh0L3PilgnWzykqmnDpt8Dx8vevdYEiG8Mlfbly5Iv78WAOFs7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749175; c=relaxed/simple;
	bh=XjzpqwWtdQHVRnKD94VMrrwrQ6eYKxVsJnhtKTlNRCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBHCWNTjcWRopjkEySNk4QHmmkz3qDJK76kJ42TqH7dIofqNFMxHZLXALsMiPtYcjhZhZtM5xOPNvZW5N7gcF1k3Bs5SVkES8Zkx91deRxOIBwMfBe2z/Qs6jduMc2FX/aDtgpWiCbBsGUB90pHdTMzvjGMvx6tYkgSK8POe7lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/yPGDV4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749174; x=1770285174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XjzpqwWtdQHVRnKD94VMrrwrQ6eYKxVsJnhtKTlNRCY=;
  b=N/yPGDV44ETfH0cQXt+VzOv9nR2dFVYBKRy0wg4y4QenCtnMYxW8H+rI
   WpOaPXQBjXtwnVWwQhNgAxduYWyHDbtiaN1cNXFySe2ulslbL7LaS+leh
   ojPL348fezIvlx5YI49kqZjhpvKoAYi2KDGvBizHgWZWJLonnbQBrYU9+
   Ijnc4tS6nzon30L8Dz6HTaWCf0AVRGnjPXKxiA5RrRjQkERsBy1gPvDt8
   +FBQbU+FurXmhGFcgqkgl5d7CO7HZXWf30WaEHMVq3j1F1hY1MTEjDNjn
   dGEQbWYBrgF02FN9A6FzcHYPF/LAEtzrKkPSQhQ4B8Djvqf/EShTCOHJ8
   w==;
X-CSE-ConnectionGUID: Az/OzIn4QqCMzlzbBSI2sQ==
X-CSE-MsgGUID: yrf26Mc7Rfq4aU3ks0h7Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49922052"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49922052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:49 -0800
X-CSE-ConnectionGUID: jUCim4aKSYyu/5XCRyF5kg==
X-CSE-MsgGUID: vQ2Po2amR/yYwiOM9lDb4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115822423"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:52:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BEAED399; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 03/10] pinctrl: cy8c95x0: Transform to cy8c95x0_regmap_read_bits()
Date: Wed,  5 Feb 2025 11:51:13 +0200
Message-ID: <20250205095243.512292-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The returned value of cy8c95x0_regmap_read() is used always with
a bitmask being applied. Move that bitmasking code into the function.
At the same time transform it to cy8c95x0_regmap_read_bits() which
will be in align with the write and update counterparts.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 45 +++++++++++++++++-------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0eb570952f3f..0d732e7a0868 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -575,12 +575,13 @@ static int cy8c95x0_regmap_update_bits(struct cy8c95x0_pinctrl *chip, unsigned i
 }
 
 /**
- * cy8c95x0_regmap_read() - reads a register using the regmap cache
+ * cy8c95x0_regmap_read_bits() - reads a register using the regmap cache
  * @chip: The pinctrl to work on
  * @reg: The register to read from. Can be direct access or muxed register.
  * @port: The port to be used for muxed registers or quick path direct access
  *        registers. Otherwise unused.
- * @read_val: Value read from hardware or cache
+ * @mask: Bitmask to apply
+ * @val: Value read from hardware or cache
  *
  * This function handles the register reads from the direct access registers and
  * the muxed registers while caching all register accesses, internally handling
@@ -590,10 +591,12 @@ static int cy8c95x0_regmap_update_bits(struct cy8c95x0_pinctrl *chip, unsigned i
  *
  * Return: 0 for successful request, else a corresponding error value
  */
-static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
-				unsigned int port, unsigned int *read_val)
+static int cy8c95x0_regmap_read_bits(struct cy8c95x0_pinctrl *chip, unsigned int reg,
+				     unsigned int port, unsigned int mask, unsigned int *val)
 {
-	int off, ret;
+	unsigned int off;
+	unsigned int tmp;
+	int ret;
 
 	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
@@ -605,11 +608,14 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
 		else
 			off = reg;
 	}
-	guard(mutex)(&chip->i2c_lock);
 
-	ret = regmap_read(chip->regmap, off, read_val);
+	scoped_guard(mutex, &chip->i2c_lock)
+		ret = regmap_read(chip->regmap, off, &tmp);
+	if (ret)
+		return ret;
 
-	return ret;
+	*val = tmp & mask;
+	return 0;
 }
 
 static int cy8c95x0_write_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
@@ -646,7 +652,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	DECLARE_BITMAP(tmask, MAX_LINE);
 	DECLARE_BITMAP(tval, MAX_LINE);
 	unsigned long bits, offset;
-	int read_val;
+	unsigned int read_val;
 	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
@@ -656,13 +662,12 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	for_each_set_clump8(offset, bits, tmask, chip->tpin) {
 		unsigned int i = offset / 8;
 
-		ret = cy8c95x0_regmap_read(chip, reg, i, &read_val);
+		ret = cy8c95x0_regmap_read_bits(chip, reg, i, bits, &read_val);
 		if (ret < 0) {
 			dev_err(chip->dev, "failed reading register %d, port %u: err %d\n", reg, i, ret);
 			return ret;
 		}
 
-		read_val &= bits;
 		read_val |= bitmap_get_value8(tval, offset) & ~bits;
 		bitmap_set_value8(tval, read_val, offset);
 	}
@@ -699,10 +704,10 @@ static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 	struct cy8c95x0_pinctrl *chip = gpiochip_get_data(gc);
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
-	u32 reg_val;
+	unsigned int reg_val;
 	int ret;
 
-	ret = cy8c95x0_regmap_read(chip, CY8C95X0_INPUT, port, &reg_val);
+	ret = cy8c95x0_regmap_read_bits(chip, CY8C95X0_INPUT, port, bit, &reg_val);
 	if (ret < 0) {
 		/*
 		 * NOTE:
@@ -713,7 +718,7 @@ static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 		return 0;
 	}
 
-	return !!(reg_val & bit);
+	return reg_val ? 1 : 0;
 }
 
 static void cy8c95x0_gpio_set_value(struct gpio_chip *gc, unsigned int off,
@@ -731,14 +736,14 @@ static int cy8c95x0_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
 	struct cy8c95x0_pinctrl *chip = gpiochip_get_data(gc);
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
-	u32 reg_val;
+	unsigned int reg_val;
 	int ret;
 
-	ret = cy8c95x0_regmap_read(chip, CY8C95X0_DIRECTION, port, &reg_val);
+	ret = cy8c95x0_regmap_read_bits(chip, CY8C95X0_DIRECTION, port, bit, &reg_val);
 	if (ret < 0)
 		return ret;
 
-	if (reg_val & bit)
+	if (reg_val)
 		return GPIO_LINE_DIRECTION_IN;
 
 	return GPIO_LINE_DIRECTION_OUT;
@@ -751,8 +756,8 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
+	unsigned int reg_val;
 	unsigned int reg;
-	u32 reg_val;
 	u16 arg = 0;
 	int ret;
 
@@ -809,11 +814,11 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	 * Writing 1 to one of the drive mode registers will automatically
 	 * clear conflicting set bits in the other drive mode registers.
 	 */
-	ret = cy8c95x0_regmap_read(chip, reg, port, &reg_val);
+	ret = cy8c95x0_regmap_read_bits(chip, reg, port, bit, &reg_val);
 	if (ret < 0)
 		return ret;
 
-	if (reg_val & bit)
+	if (reg_val)
 		arg = 1;
 	if (param == PIN_CONFIG_OUTPUT_ENABLE)
 		arg = !arg;
-- 
2.43.0.rc1.1336.g36b5255a03ac


