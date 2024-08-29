Return-Path: <linux-gpio+bounces-9374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3D964779
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EAA61F23481
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23931AD41B;
	Thu, 29 Aug 2024 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGtaTjz9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59FF1A00F5;
	Thu, 29 Aug 2024 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940252; cv=none; b=c1M+8gBcBA2npSoGJ/QWn04Y1I9d5sfplU7bg/eDmKPu139NFfmGNx2zy4TCceG8FslYxzAehZFT8/A9usbdG63eHU+8o4L70wwnXcPDstr2OLQ/6/EEe8bJ1oRKiM683a93JpDNuGOwL8KApMeCf9aiYaddrli44FWltBsK1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940252; c=relaxed/simple;
	bh=6TsQJEpx40Gdt61bEp0DJNlMY99R94dfd9FhL3VBi2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUPHP8VLgryd/yqrNb9XHb+zc/LAHDBr8CI/voYyT+iOVMQdpV/asZfyHPpDNDOzyEb6KJsOCXlBPNruo9Qhd0ndN8FPFI+uLvHVfg+pjGYoeReoBij/J+L4ff0xzDbrIaghJeDs2g90t87cbp6hfiinommOJZFDKVCM0ahAJe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGtaTjz9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940251; x=1756476251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6TsQJEpx40Gdt61bEp0DJNlMY99R94dfd9FhL3VBi2U=;
  b=kGtaTjz946HyFtYYkQh0SFZF37x/mxsWGuoO4Xo+d8E+SPyJ9/q6ss3h
   m5XZGx3UcUTwXq2386diO5WuQTl6PpJl0QYDPTOQxSQRbMjbna0I/IVw/
   67rVoYA4KmGuaonc9L3/2G4YU7GvQJlMjrn+jfAK54T6ca8HJ9/ttJxzp
   IWCgVtFjDLBmdDNzjqZ9mU4ToH1xH2Rk2b+32N+Es3+w0iV7Hbs5AvqU4
   dcuFW72GaKPIx8wsZadWpumxYZfu44OKezQgX+j72JI60B/UvXV7roIN5
   FvQ4LR/mJqyPgt/hloENRK2txV77tYpNcPU8XpbyUZOSjLflF4+fgoLj3
   g==;
X-CSE-ConnectionGUID: bTa28t2jQKuz+zDYl8NLsQ==
X-CSE-MsgGUID: 4aUxRD4/SFCBt37xp1FjlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690581"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690581"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:10 -0700
X-CSE-ConnectionGUID: RarmInICSeSqrrFH/i8rKQ==
X-CSE-MsgGUID: +i2/xBWWTRetUDWMrrxceg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419829"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 470DF170; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 1/6] pinctrl: intel: Move debounce validation out of the lock
Date: Thu, 29 Aug 2024 16:59:15 +0300
Message-ID: <20240829140406.357612-2-andriy.shevchenko@linux.intel.com>
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

There is no need to validate debounce value under the lock.
Move it outside.

It also results in a smaller binary:

  add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-11 (-11)
  Total: Before=15374, After=15363, chg -0.07%

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 89bd7ce6711a..959413c8f4c9 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -758,6 +758,15 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 {
 	void __iomem *padcfg0, *padcfg2;
 	u32 value0, value2;
+	unsigned long v;
+
+	if (debounce) {
+		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NSEC);
+		if (v < 3 || v > 15)
+			return -EINVAL;
+	} else {
+		v = 0;
+	}
 
 	padcfg2 = intel_get_padcfg(pctrl, pin, PADCFG2);
 	if (!padcfg2)
@@ -770,21 +779,15 @@ static int intel_config_set_debounce(struct intel_pinctrl *pctrl,
 	value0 = readl(padcfg0);
 	value2 = readl(padcfg2);
 
-	/* Disable glitch filter and debouncer */
-	value0 &= ~PADCFG0_PREGFRXSEL;
-	value2 &= ~(PADCFG2_DEBEN | PADCFG2_DEBOUNCE_MASK);
-
-	if (debounce) {
-		unsigned long v;
-
-		v = order_base_2(debounce * NSEC_PER_USEC / DEBOUNCE_PERIOD_NSEC);
-		if (v < 3 || v > 15)
-			return -EINVAL;
-
+	value2 = (value2 & ~PADCFG2_DEBOUNCE_MASK) | (v << PADCFG2_DEBOUNCE_SHIFT);
+	if (v) {
 		/* Enable glitch filter and debouncer */
 		value0 |= PADCFG0_PREGFRXSEL;
-		value2 |= v << PADCFG2_DEBOUNCE_SHIFT;
 		value2 |= PADCFG2_DEBEN;
+	} else {
+		/* Disable glitch filter and debouncer */
+		value0 &= ~PADCFG0_PREGFRXSEL;
+		value2 &= ~PADCFG2_DEBEN;
 	}
 
 	writel(value0, padcfg0);
-- 
2.43.0.rc1.1336.g36b5255a03ac


