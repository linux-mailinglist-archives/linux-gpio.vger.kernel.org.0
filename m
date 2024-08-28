Return-Path: <linux-gpio+bounces-9291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1892963042
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B588B2360A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9721ABECE;
	Wed, 28 Aug 2024 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZp/ZfA/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD4C1AB521;
	Wed, 28 Aug 2024 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870433; cv=none; b=Z7/+aNK8J3+OHMqIdznxADOoRICGje1d2ANRwBf8sECBc1zORg+k1YIZ0WZH5khiSGohxMUJrfGwNFTXdtKhXoEOZUW5tK8I6V93ewDikKFs5+p7LkC9BDhuzngTsfA9srLYBB0aQ381ASUSpMT/2y5JzfSI10wDywEQcTPRg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870433; c=relaxed/simple;
	bh=8kMR0Nn0wmCia0F4Cfot9scgy1I9LJF4kFu2QFhReBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1xduKYoLg8YhdtyGVUaCFgftxVoV39QvhDPj3UQfMHso1WaSdL539Bvf8jd17n7QILW1xhaXNRQlmme5PQnIJWwdP8GgV3nAhXEvLIkS0dSmgvWQsk3o6NkaMgJK/qcY/amUi0/OiKWyjqCn2XJ07SYdHWjADyGZ5XFPJEky5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZp/ZfA/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724870431; x=1756406431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8kMR0Nn0wmCia0F4Cfot9scgy1I9LJF4kFu2QFhReBk=;
  b=JZp/ZfA/ZpPj4qnYPHmE8WWJYyjPL8mkEwkZxcDrZRbEe3Skv9cm0iSp
   Bmwphcz7YbaFMGdg0++gKpDMvvBeHKzqp4v63PstPovYg9EPQ1H4ygsD4
   xQ/01jOZrNUbAaay9qmFACCrPmExIy4hD2PoStiMNoWSoGDA6wEiRiGhw
   /rXkKw/ZD5uqb4Jn/8AM9/YiZBbY+wC5vgLkv8rAgwI/x0SplM3uXvn/8
   gmT3kjdkPumqtyybQQu7pJPwn/Tg3GJu+pezcUDsGbJLZRzJpJAlxRmNm
   /NuoIugYUzpKy9ANE7SiJpCg5Rg1h5VFX8KcM0XitzvdF2QCpzzy40CIJ
   Q==;
X-CSE-ConnectionGUID: cykhSyKGSnme/o+pMejWiA==
X-CSE-MsgGUID: DtS9B1LXSpuADBovlxBj2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13265381"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="13265381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 11:40:27 -0700
X-CSE-ConnectionGUID: JAzHSZAyTr6KyDKVguGDKQ==
X-CSE-MsgGUID: UXD8t9o9T/Kk+LhHkMQBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63376485"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 11:40:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DA8E31F5; Wed, 28 Aug 2024 21:40:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/5] pinctrl: intel: Refactor __intel_gpio_set_direction() to be more useful
Date: Wed, 28 Aug 2024 21:38:35 +0300
Message-ID: <20240828184018.3097386-3-andriy.shevchenko@linux.intel.com>
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

Refactor __intel_gpio_set_direction() to be more useful, i.e.
1) use one parameter per each direction to support all combinatios;
2) move IO to the only user that needs it.

With that done, update current users and deduplicate existing code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 31 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 371b21d8f90b..2a3d44f35348 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -429,19 +429,19 @@ static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void __intel_gpio_set_direction(void __iomem *padcfg0, bool input)
+static u32 __intel_gpio_set_direction(u32 value, bool input, bool output)
 {
-	u32 value;
-
-	value = readl(padcfg0);
-	if (input) {
+	if (input)
 		value &= ~PADCFG0_GPIORXDIS;
-		value |= PADCFG0_GPIOTXDIS;
-	} else {
-		value &= ~PADCFG0_GPIOTXDIS;
+	else
 		value |= PADCFG0_GPIORXDIS;
-	}
-	writel(value, padcfg0);
+
+	if (output)
+		value &= ~PADCFG0_GPIOTXDIS;
+	else
+		value |= PADCFG0_GPIOTXDIS;
+
+	return value;
 }
 
 static int __intel_gpio_get_gpio_mode(u32 value)
@@ -465,8 +465,7 @@ static void intel_gpio_set_gpio_mode(void __iomem *padcfg0)
 	value |= PADCFG0_PMODE_GPIO;
 
 	/* Disable TX buffer and enable RX (this will be input) */
-	value &= ~PADCFG0_GPIORXDIS;
-	value |= PADCFG0_GPIOTXDIS;
+	value = __intel_gpio_set_direction(value, true, false);
 
 	/* Disable SCI/SMI/NMI generation */
 	value &= ~(PADCFG0_GPIROUTIOXAPIC | PADCFG0_GPIROUTSCI);
@@ -512,12 +511,18 @@ static int intel_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *padcfg0;
+	u32 value;
 
 	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
 
 	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
-	__intel_gpio_set_direction(padcfg0, input);
+	value = readl(padcfg0);
+	if (input)
+		value = __intel_gpio_set_direction(value, true, false);
+	else
+		value = __intel_gpio_set_direction(value, false, true);
+	writel(value, padcfg0);
 
 	return 0;
 }
-- 
2.43.0.rc1.1336.g36b5255a03ac


