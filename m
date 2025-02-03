Return-Path: <linux-gpio+bounces-15267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C5A25A94
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F04C3A88DB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050D205E0F;
	Mon,  3 Feb 2025 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3Vt8VUC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD8205503;
	Mon,  3 Feb 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588516; cv=none; b=qbyf8GqJTmpjnOCSkQTUyP/U8pptuN0/E1WYl7xhV0WZF2tbL6nV2kRnH/rzVQRQZNOmyq+uLSNBWhOeyHs0YlzT137Ih8TYSyQf4EswbxInUk9RGT7mLVkKiskUeUSoaekxcnS1z6xup6yQ1TXz96f1UNDZjt8g0VbcKpSnQjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588516; c=relaxed/simple;
	bh=2hAKTMMqjEXGla9aasq+OrZMKP1a3APtYe0wzu7JSCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRGGBp/fOLPNdYN/nb/yVk67VS6dOuEK6TQwapyQNGJOmDR2LLwhRe1cmA1mz4ieMcKMgpAZj0ACcux6xdfTfbC2++sQ5Lq/Xg6PLl5lDhCvVecFAcjo8UjLldOW0QXufImpy6+Kvyv4fo7telEZqnSiPi3FRq/T2b3EbiLUekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3Vt8VUC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588515; x=1770124515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2hAKTMMqjEXGla9aasq+OrZMKP1a3APtYe0wzu7JSCM=;
  b=I3Vt8VUCC/lbv4H4Ry6lGiLzPobC8fmcOZceqSeb/c0+B7soj0TwyV4V
   LDmuSjItYg0ww/TSGl69U9twQgmVMth9Hv8/LdIuVRV1ln+np0CLhRL2w
   6tGBGrPnKzoXz0A9afDQOdVe2+h/yQUTvv3ZF3G3okxAXrVCl3nyOhDeS
   UdYufV2zDdnLQ1MySTJkzKGvmavEj6eGKaF4RuqC0ljQry51qo8X05eed
   em0IroYfgka5ibzZBsIOW7m5w0osXWo2MEBYZ8wq7TGMbdYnrp9CL8oKN
   x+y9oZcNqnJUkGeawU8m+kx0p8C/hp62WvlQgbjORdYqHfLYrQf3+9vxm
   A==;
X-CSE-ConnectionGUID: 7CXEF6XnTsilYw+vrE4tFg==
X-CSE-MsgGUID: DGnCjxbBQGSv5GDMOlzBNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56615951"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56615951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:15:11 -0800
X-CSE-ConnectionGUID: qC1FDvEnSzmuaPDebLCUpA==
X-CSE-MsgGUID: duZsFJkEQqaRwuqOWXxBqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110854192"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2025 05:15:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CD92F3B1; Mon, 03 Feb 2025 15:15:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 04/14] pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
Date: Mon,  3 Feb 2025 15:10:30 +0200
Message-ID: <20250203131506.3318201-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
References: <20250203131506.3318201-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two registers in the hardware, one, "Select PWM",
is per-port configuration enabling PWM function instead of GPIO.
The other one is "PWM Select" is per-PWM selector to configure
PWM itself. Original code uses abbreviation of the latter
to describe the former. Rename it to follow the datasheet.

Fixes: e6cbbe42944d ("pinctrl: Add Cypress cy8c95x0 support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0bcecebb1c0c..d73004b4a45e 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -42,7 +42,7 @@
 #define CY8C95X0_PORTSEL	0x18
 /* Port settings, write PORTSEL first */
 #define CY8C95X0_INTMASK	0x19
-#define CY8C95X0_PWMSEL		0x1A
+#define CY8C95X0_SELPWM		0x1A
 #define CY8C95X0_INVERT		0x1B
 #define CY8C95X0_DIRECTION	0x1C
 /* Drive mode register change state on writing '1' */
@@ -369,8 +369,8 @@ static bool cy8c95x0_volatile_register(struct device *dev, unsigned int reg)
 	case CY8C95X0_INPUT_(0) ... CY8C95X0_INPUT_(7):
 	case CY8C95X0_INTSTATUS_(0) ... CY8C95X0_INTSTATUS_(7):
 	case CY8C95X0_INTMASK:
+	case CY8C95X0_SELPWM:
 	case CY8C95X0_INVERT:
-	case CY8C95X0_PWMSEL:
 	case CY8C95X0_DIRECTION:
 	case CY8C95X0_DRV_PU:
 	case CY8C95X0_DRV_PD:
@@ -399,7 +399,7 @@ static bool cy8c95x0_muxed_register(unsigned int reg)
 {
 	switch (reg) {
 	case CY8C95X0_INTMASK:
-	case CY8C95X0_PWMSEL:
+	case CY8C95X0_SELPWM:
 	case CY8C95X0_INVERT:
 	case CY8C95X0_DIRECTION:
 	case CY8C95X0_DRV_PU:
@@ -797,7 +797,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 		reg = CY8C95X0_DIRECTION;
 		break;
 	case PIN_CONFIG_MODE_PWM:
-		reg = CY8C95X0_PWMSEL;
+		reg = CY8C95X0_SELPWM;
 		break;
 	case PIN_CONFIG_OUTPUT:
 		reg = CY8C95X0_OUTPUT;
@@ -876,7 +876,7 @@ static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
 		reg = CY8C95X0_DRV_PP_FAST;
 		break;
 	case PIN_CONFIG_MODE_PWM:
-		reg = CY8C95X0_PWMSEL;
+		reg = CY8C95X0_SELPWM;
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		return cy8c95x0_pinmux_direction(chip, off, !arg);
@@ -1161,7 +1161,7 @@ static void cy8c95x0_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *
 	bitmap_zero(mask, MAX_LINE);
 	__set_bit(pin, mask);
 
-	if (cy8c95x0_read_regs_mask(chip, CY8C95X0_PWMSEL, pwm, mask)) {
+	if (cy8c95x0_read_regs_mask(chip, CY8C95X0_SELPWM, pwm, mask)) {
 		seq_puts(s, "not available");
 		return;
 	}
@@ -1206,7 +1206,7 @@ static int cy8c95x0_set_mode(struct cy8c95x0_pinctrl *chip, unsigned int off, bo
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
 
-	return cy8c95x0_regmap_write_bits(chip, CY8C95X0_PWMSEL, port, bit, mode ? bit : 0);
+	return cy8c95x0_regmap_write_bits(chip, CY8C95X0_SELPWM, port, bit, mode ? bit : 0);
 }
 
 static int cy8c95x0_pinmux_mode(struct cy8c95x0_pinctrl *chip,
-- 
2.43.0.rc1.1336.g36b5255a03ac


