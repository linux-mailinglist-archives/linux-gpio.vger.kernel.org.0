Return-Path: <linux-gpio+bounces-9287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42DD96303C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01E6DB2284D
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D525C1AAE3C;
	Wed, 28 Aug 2024 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9vZweFO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAB1AAE32;
	Wed, 28 Aug 2024 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870429; cv=none; b=Ukcvm5GXaanxRm2jk/TSq0+g0YV38wnJ5IRyhXfHP62qvbUc9XwpVh5ThfKKn32ihCnNPK+SzY9XQc6AUYlK1ZDFadxBpxtuz6BpiDd/cLXj0vCslNrdcmm5+0RHQThfcEdONhFoVowNJa2CM+91/ZJIHqf9S9xrtM9vBsZMhmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870429; c=relaxed/simple;
	bh=7e/Uv6vMVmfewqcbdLUysl0ePTLsqz5fLO634IElZwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSygy3ul3GB/yZ2sY0KFlfu5iExPYfUeKLqjo1ciMo+pXWU+kRyDEUN3+Zgr0SfYQekhYB96nFi0QtkYJFnJQex2EY4wL4XSoPjanKtUok/gMbDT7tBUFHe52cN1tObQgm2weVB9woj+K/72GczT0kjURvUP8+SyF9hrYRm+A1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9vZweFO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724870428; x=1756406428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7e/Uv6vMVmfewqcbdLUysl0ePTLsqz5fLO634IElZwI=;
  b=K9vZweFOoyfs5dQjjr686t9hYFBxOxRvXyCSoW3nv4kgMp+kR291ZFvT
   F/Cuipe5p1LRf/cjGlFixfc4cXT0phvx4Y0krCn+A7Ft3LZaEeZMgryHA
   6YAOUXzs8rSWG67hguIIIYjgTozxVYAdSthpBbnRW67clbwHZm3hr2Cp/
   WtUTFaWq3PAEh9CMBLs70LPJtaGx7zvhIIPBgSxHzaw5PuN9aZCBh56iw
   6LAQyKrXspelzF+Wmq4hsiAcYYLiN+2jFKkSB44MFG4fO6mjFFllg//kZ
   p5Acbq5p30UT30h0lrXLfv03oI6RFaMEEkWULfIkJGmfNJSOZ9Hu7D44B
   A==;
X-CSE-ConnectionGUID: O89olL1ETCWS9cyjWJfzNQ==
X-CSE-MsgGUID: a9HnoSRySuivMAwiihQhlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40925316"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="40925316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 11:40:27 -0700
X-CSE-ConnectionGUID: hXcm4XCsQzOgnacn6QFWCQ==
X-CSE-MsgGUID: kY1w9LngTCmUTn0B4poqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63021548"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2024 11:40:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EA4BD30D; Wed, 28 Aug 2024 21:40:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 3/5] pinctrl: intel: Add __intel_gpio_get_direction() helper
Date: Wed, 28 Aug 2024 21:38:36 +0300
Message-ID: <20240828184018.3097386-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
References: <20240828184018.3097386-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 48 ++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 2a3d44f35348..3a135cfe435f 100644
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
@@ -429,6 +435,37 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+/**
+ * enum - possible pad physical configurations
+ *
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
+		return PAD_CONNECT_FULL;
+	};
+}
+
 static u32 __intel_gpio_set_direction(u32 value, bool input, bool output)
 {
 	if (input)
@@ -937,7 +974,7 @@ static int intel_gpio_get(struct gpio_chip *chip, unsigned int offset)
 		return -EINVAL;
 
 	padcfg0 = readl(reg);
-	if (!(padcfg0 & PADCFG0_GPIOTXDIS))
+	if (__intel_gpio_get_direction(padcfg0) & PAD_CONNECT_OUTPUT)
 		return !!(padcfg0 & PADCFG0_GPIOTXSTATE);
 
 	return !!(padcfg0 & PADCFG0_GPIORXSTATE);
@@ -990,10 +1027,10 @@ static int intel_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
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
@@ -1690,7 +1727,8 @@ EXPORT_SYMBOL_NS_GPL(intel_pinctrl_get_soc_data, PINCTRL_INTEL);
 
 static bool __intel_gpio_is_direct_irq(u32 value)
 {
-	return (value & PADCFG0_GPIROUTIOXAPIC) && (value & PADCFG0_GPIOTXDIS) &&
+	return (value & PADCFG0_GPIROUTIOXAPIC) &&
+	       (__intel_gpio_get_direction(value) == PAD_CONNECT_INPUT) &&
 	       (__intel_gpio_get_gpio_mode(value) == PADCFG0_PMODE_GPIO);
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


