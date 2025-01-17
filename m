Return-Path: <linux-gpio+bounces-14891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD2A151A8
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A9A41651FB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE786146A69;
	Fri, 17 Jan 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSI69XP4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB66670825;
	Fri, 17 Jan 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123793; cv=none; b=DWsRWn27xGbChqI4NMpoCqtYh1ye9t3dpWPjPG/uat0aeCKRhaNZdH6GjAL1JnRTXZr1QSrmAL5awyojlUTxn6MJeWAhv/9ASZCnomCpJognW+Y5bg6s3nn1XY5PuBHcU64MXOIxomOB8+NFCfKeu+6BqJFTHYHeTbcq6dprWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123793; c=relaxed/simple;
	bh=QLp24WDAzoklZEblJoqFiQkUgp0gzMdJjU3KaVmbl68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jr5R73LI54bdebrf9FJDVQJonBqh96sIsJ3Xvr/TyT426/Z2xscOPd05eKa6cUeWPdxIR+MTJMMa3ernvk7TssmFnIi88pDq5lddWX9JWJy/3S0F11B/3g0Jfs2pjEM3/xALayrT0B1PWzqH3Qv9Dm1yWiz74tIHTH4JmzIbbYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSI69XP4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123791; x=1768659791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QLp24WDAzoklZEblJoqFiQkUgp0gzMdJjU3KaVmbl68=;
  b=CSI69XP4S68T9EIAiD0AobPsO26okpaiaI0+whSdGYiceZKmnXi+IR20
   xnlxJkjp+hHU+ubZdpD+wxsNKMkVrW4nDePsXwOzzXaWEfLvnTMK2xiQD
   9I71gMkSvEvzmntYAxOo1+qkDuvz2iwz5ajcEvzQ3Z1FX+O4t90X6OWH4
   tpd1pVWziX/LyUYpBd2VFg8EyguOHHxMUhE02iboPNyu3ZbXhk9rnS4xw
   uLJ6RRRPICCdgAYQtTGOTsnSsRX0N0dqJ/YV/kh4wIJ9wGmYC7ljdply/
   LPbB6cTYm8kdP0p6uZzD8YaHSMoHpAY88ywttesvQZpUuQbiHouZl1Hcn
   A==;
X-CSE-ConnectionGUID: OcJV1G3xTxK2DUrW8f/IOg==
X-CSE-MsgGUID: kx7l8WodTgGZsa9Y+j+nBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792821"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792821"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:09 -0800
X-CSE-ConnectionGUID: GoGrKLGxQ4e54MhR9GMFeg==
X-CSE-MsgGUID: Y2V5SRVCS/Goi32Ye0YfSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671221"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 32FF9320; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 02/16] pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
Date: Fri, 17 Jan 2025 16:21:46 +0200
Message-ID: <20250117142304.596106-3-andriy.shevchenko@linux.intel.com>
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
index 825bd1e528b5..d767bbc66256 100644
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
@@ -365,8 +365,8 @@ static bool cy8c95x0_volatile_register(struct device *dev, unsigned int reg)
 	case CY8C95X0_INPUT_(0) ... CY8C95X0_INPUT_(7):
 	case CY8C95X0_INTSTATUS_(0) ... CY8C95X0_INTSTATUS_(7):
 	case CY8C95X0_INTMASK:
+	case CY8C95X0_SELPWM:
 	case CY8C95X0_INVERT:
-	case CY8C95X0_PWMSEL:
 	case CY8C95X0_DIRECTION:
 	case CY8C95X0_DRV_PU:
 	case CY8C95X0_DRV_PD:
@@ -395,7 +395,7 @@ static bool cy8c95x0_muxed_register(unsigned int reg)
 {
 	switch (reg) {
 	case CY8C95X0_INTMASK:
-	case CY8C95X0_PWMSEL:
+	case CY8C95X0_SELPWM:
 	case CY8C95X0_INVERT:
 	case CY8C95X0_DIRECTION:
 	case CY8C95X0_DRV_PU:
@@ -789,7 +789,7 @@ static int cy8c95x0_gpio_get_pincfg(struct cy8c95x0_pinctrl *chip,
 		reg = CY8C95X0_DIRECTION;
 		break;
 	case PIN_CONFIG_MODE_PWM:
-		reg = CY8C95X0_PWMSEL;
+		reg = CY8C95X0_SELPWM;
 		break;
 	case PIN_CONFIG_OUTPUT:
 		reg = CY8C95X0_OUTPUT;
@@ -868,7 +868,7 @@ static int cy8c95x0_gpio_set_pincfg(struct cy8c95x0_pinctrl *chip,
 		reg = CY8C95X0_DRV_PP_FAST;
 		break;
 	case PIN_CONFIG_MODE_PWM:
-		reg = CY8C95X0_PWMSEL;
+		reg = CY8C95X0_SELPWM;
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		return cy8c95x0_pinmux_direction(chip, off, !arg);
@@ -1153,7 +1153,7 @@ static void cy8c95x0_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *
 	bitmap_zero(mask, MAX_LINE);
 	__set_bit(pin, mask);
 
-	if (cy8c95x0_read_regs_mask(chip, CY8C95X0_PWMSEL, pwm, mask)) {
+	if (cy8c95x0_read_regs_mask(chip, CY8C95X0_SELPWM, pwm, mask)) {
 		seq_puts(s, "not available");
 		return;
 	}
@@ -1198,7 +1198,7 @@ static int cy8c95x0_set_mode(struct cy8c95x0_pinctrl *chip, unsigned int off, bo
 	u8 port = cypress_get_port(chip, off);
 	u8 bit = cypress_get_pin_mask(chip, off);
 
-	return cy8c95x0_regmap_write_bits(chip, CY8C95X0_PWMSEL, port, bit, mode ? bit : 0);
+	return cy8c95x0_regmap_write_bits(chip, CY8C95X0_SELPWM, port, bit, mode ? bit : 0);
 }
 
 static int cy8c95x0_pinmux_mode(struct cy8c95x0_pinctrl *chip,
-- 
2.43.0.rc1.1336.g36b5255a03ac


