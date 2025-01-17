Return-Path: <linux-gpio+bounces-14898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CFA151AF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CB76165106
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E682189905;
	Fri, 17 Jan 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUw5b3YI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7185E1547F0;
	Fri, 17 Jan 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123796; cv=none; b=DbyAmkVkVtrTKxcClB24cCTm1Bw6nDsMRQeF0/fIMEvNLgeySzxMwyX1Bkv1EbhJZIRdcraVnCM3mTG8N4leQYuProwGykYLP6XY2Ey/F4puKOODvz3jLGxp9Ceh1jBjYT54DTIud62jgioh+AVMyBNE6kZwiUE0InTAT8wn94k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123796; c=relaxed/simple;
	bh=bJSTUKa30oR+rHEf/3sfdXyG2IOYAjfAU47RSdM9/sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpU7cF5yunT5qxl8qbuGGnDb1MjTTl8DJgzZgb4hQrpbH9yAH4Wxm6iBPwZQV/8TbpG+qq1GhUxtOMoHNurkMZfskBRv2s1TrKAB8YiDyZGCUP8LLXoHWtEgnrrncyboyk4n+i7/Fnbzz9qv6oTeyEyU/RTIIMzcFhKmP9dnuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUw5b3YI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123794; x=1768659794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bJSTUKa30oR+rHEf/3sfdXyG2IOYAjfAU47RSdM9/sA=;
  b=bUw5b3YIm0ckljgxjdWKX3HLjSumbUyekCuUTYCIkPjCx5uVCQdeyL0y
   bkaYsLFrmPddJrcP4X4ewjCZRya7/Gj+hbNYQltCgI0YDEJi0P0pIgWwV
   f0RlYW92ZxGBEVVDWVSqn9leEyx2ggrbWajeeXRMMp5/M4kBpNi5jcq0b
   LfFGQ+ZakhwI6jBwXnNEumRtLva48dEEOKt1eORwC6pWhc9/lebOe3/nx
   B1jIwojV/otYJumcz7yHrVPRys3Nhtdu057ULLKQmHWfehGRbrj69FWMp
   SsV+jyn8DWwf8oNZ2oufNdvQwuClvxEXoPSIG/JuXXJrLmAIVrGJ+d6Xe
   A==;
X-CSE-ConnectionGUID: g+OTWpcAQoiYhayTGxbNWA==
X-CSE-MsgGUID: LFHUHbJiQk29RCn93T/CPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41323665"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41323665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: rxwCx8YpQb+oWaLCcnHC3A==
X-CSE-MsgGUID: XIDejBjZSrCUXUG8GVoVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143100385"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8F6EE3C5; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 09/16] pinctrl: cy8c95x0: Transform to cy8c95x0_regmap_read_bits()
Date: Fri, 17 Jan 2025 16:21:53 +0200
Message-ID: <20250117142304.596106-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
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
index 851b4b4fd4cb..61225beb0714 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -574,12 +574,13 @@ static int cy8c95x0_regmap_update_bits(struct cy8c95x0_pinctrl *chip, unsigned i
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
@@ -589,10 +590,12 @@ static int cy8c95x0_regmap_update_bits(struct cy8c95x0_pinctrl *chip, unsigned i
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
@@ -604,11 +607,14 @@ static int cy8c95x0_regmap_read(struct cy8c95x0_pinctrl *chip, unsigned int reg,
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
@@ -645,7 +651,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 	DECLARE_BITMAP(tmask, MAX_LINE);
 	DECLARE_BITMAP(tval, MAX_LINE);
 	unsigned long bits, offset;
-	int read_val;
+	unsigned int read_val;
 	int ret;
 
 	/* Add the 4 bit gap of Gport2 */
@@ -655,13 +661,12 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
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
@@ -698,10 +703,10 @@ static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
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
@@ -712,7 +717,7 @@ static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
 		return 0;
 	}
 
-	return !!(reg_val & bit);
+	return reg_val ? 1 : 0;
 }
 
 static void cy8c95x0_gpio_set_value(struct gpio_chip *gc, unsigned int off,
@@ -730,14 +735,14 @@ static int cy8c95x0_gpio_get_direction(struct gpio_chip *gc, unsigned int off)
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
@@ -750,8 +755,8 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
+	unsigned int reg_val;
 	unsigned int reg;
-	u32 reg_val;
 	u16 arg = 0;
 	int ret;
 
@@ -808,11 +813,11 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
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


