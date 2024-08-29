Return-Path: <linux-gpio+bounces-9378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D744A96477F
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D3B1F23EA3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F4E1B0107;
	Thu, 29 Aug 2024 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TErwXhZ3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C721AE056;
	Thu, 29 Aug 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940255; cv=none; b=WTyZlnlXuOS4XnTX8oLpX5V2w5MJ85Vwn5dKZVV6u4qHA5CgCudF0iqdz8ec7JGg6hQojo1SVJQLwM5VD8tvd9xdQw36CkjQRe1wi+KwPL+Wpa2Z61o5w/b5KpUwNFLCY2qHjsTc23GZlH/8JRYk5Fy8AqRfdIuLz1vVPguMs04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940255; c=relaxed/simple;
	bh=HfAC9k88m8qzRdpxFVwDu3XV5gNVnyqC8Xhm2vTsHoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/uDgLNJXf/RPPp4HIfBVsNE72tH3/9p9TABIvzKlU8lxCWSmHvhDtg4LbdDa+iERvULa+LHARskUbxU18/ZNldfZH2clKTM+QENiRdYKfX73TG7M4+qRNBD1mxJrRZQAA2qax+xpfKe0wBPdpJ1r/iwhXr/l1VFa7vuxRpgnHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TErwXhZ3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940254; x=1756476254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HfAC9k88m8qzRdpxFVwDu3XV5gNVnyqC8Xhm2vTsHoM=;
  b=TErwXhZ3UHJKrNSzs5i3P7ZA8ayuHaU2DNCzERQtFeNpqp4YrkMMOnVq
   ZQbldZDy0Zl0P8S8gJ4dXiMGz0REFsIMuvXo4KAIiAWVJyFCXj3gKr1Qc
   +XVqOdYmf2zjR3mNY+Hglsphknh08euGZ1/U2T8lhRJGqh/0g792wX8qF
   Knt++/LvoKm68C1O8uTCJt4K0V0hpt47Tj+N3O3l+KObbShBWYoPSzzUN
   R50zE7qpDh0THj8boKhwHW6jDxh0NWIsz3M77IZ7a5W7mZBAsGMfFv/it
   0dw8gSWZOsTwPdM+00VTd0eWs7M5RrBCrlKm4mGyNQQyQAEacZIGc1V7C
   A==;
X-CSE-ConnectionGUID: GDFE97iSTJqvbd94ZMeExQ==
X-CSE-MsgGUID: dLFKKeTkSG2Ts9inSAVCPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690599"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690599"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:10 -0700
X-CSE-ConnectionGUID: N9LJz+SBR2qCNtCPaE2eww==
X-CSE-MsgGUID: G5LkWX9rTVaGe1KrFBUDWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419835"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 656902E1; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 3/6] pinctrl: intel: Add __intel_gpio_get_direction() helper
Date: Thu, 29 Aug 2024 16:59:17 +0300
Message-ID: <20240829140406.357612-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
References: <20240829140406.357612-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __intel_gpio_get_direction() helper which provides all possible
physical states of the pad.

With that done, update current users and make the respective checks
consistent.

While at it, make the style of anonymous enum kernel documentation
consistent.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 48 +++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index b9f3d94a6256..c6013d967fa6 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -70,6 +70,12 @@
 #define PADCFG0_PMODE_SHIFT		10
 #define PADCFG0_PMODE_MASK		GENMASK(13, 10)
 #define PADCFG0_PMODE_GPIO		0
+#define PADCFG0_GPIODIS_SHIFT		8
+#define PADCFG0_GPIODIS_MASK		GENMASK(9, 8)
+#define PADCFG0_GPIODIS_NONE		0
+#define PADCFG0_GPIODIS_OUTPUT		1
+#define PADCFG0_GPIODIS_INPUT		2
+#define PADCFG0_GPIODIS_FULL		3
 #define PADCFG0_GPIORXDIS		BIT(9)
 #define PADCFG0_GPIOTXDIS		BIT(8)
 #define PADCFG0_GPIORXSTATE		BIT(1)
@@ -212,7 +218,6 @@ static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned int pin)
 
 /**
  * enum - Locking variants of the pad configuration
- *
  * @PAD_UNLOCKED:	pad is fully controlled by the configuration registers
  * @PAD_LOCKED:		pad configuration registers, except TX state, are locked
  * @PAD_LOCKED_TX:	pad configuration TX state is locked
@@ -429,6 +434,36 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+/**
+ * enum - Possible pad physical connections
+ * @PAD_CONNECT_NONE:	pad is fully disconnected
+ * @PAD_CONNECT_INPUT:	pad is in input only mode
+ * @PAD_CONNECT_OUTPUT:	pad is in output only mode
+ * @PAD_CONNECT_FULL:	pad is fully connected
+ */
+enum {
+	PAD_CONNECT_NONE	= 0,
+	PAD_CONNECT_INPUT	= 1,
+	PAD_CONNECT_OUTPUT	= 2,
+	PAD_CONNECT_FULL	= PAD_CONNECT_INPUT | PAD_CONNECT_OUTPUT,
+};
+
+static int __intel_gpio_get_direction(u32 value)
+{
+	switch ((value & PADCFG0_GPIODIS_MASK) >> PADCFG0_GPIODIS_SHIFT) {
+	case PADCFG0_GPIODIS_FULL:
+		return PAD_CONNECT_NONE;
+	case PADCFG0_GPIODIS_OUTPUT:
+		return PAD_CONNECT_INPUT;
+	case PADCFG0_GPIODIS_INPUT:
+		return PAD_CONNECT_OUTPUT;
+	case PADCFG0_GPIODIS_NONE:
+		return PAD_CONNECT_FULL;
+	default:
+		return -ENOTSUPP;
+	};
+}
+
 static u32 __intel_gpio_set_direction(u32 value, bool input, bool output)
 {
 	if (input)
@@ -937,7 +972,7 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return -EINVAL;
 
 	padcfg0 = readl(reg);
-	if (!(padcfg0 & PADCFG0_GPIOTXDIS))
+	if (__intel_gpio_get_direction(padcfg0) & PAD_CONNECT_OUTPUT)
 		return !!(padcfg0 & PADCFG0_GPIOTXSTATE);
 
 	return !!(padcfg0 & PADCFG0_GPIORXSTATE);
@@ -990,10 +1025,10 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (padcfg0 & PADCFG0_PMODE_MASK)
 		return -EINVAL;
 
-	if (padcfg0 & PADCFG0_GPIOTXDIS)
-		return GPIO_LINE_DIRECTION_IN;
+	if (__intel_gpio_get_direction(padcfg0) & PAD_CONNECT_OUTPUT)
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return GPIO_LINE_DIRECTION_OUT;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int intel_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -1690,7 +1725,8 @@ EXPORT_SYMBOL_NS_GPL(intel_pinctrl_get_soc_data, PINCTRL_INTEL);
 
 static bool __intel_gpio_is_direct_irq(u32 value)
 {
-	return (value & PADCFG0_GPIROUTIOXAPIC) && (value & PADCFG0_GPIOTXDIS) &&
+	return (value & PADCFG0_GPIROUTIOXAPIC) &&
+	       (__intel_gpio_get_direction(value) == PAD_CONNECT_INPUT) &&
 	       (__intel_gpio_get_gpio_mode(value) == PADCFG0_PMODE_GPIO);
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


