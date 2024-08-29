Return-Path: <linux-gpio+bounces-9376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D784496477C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 078AB1C231A8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC321AED23;
	Thu, 29 Aug 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihKDHYwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A6B1AD9E0;
	Thu, 29 Aug 2024 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940254; cv=none; b=jqciyswFsjIZbP8dBftH6VftHESTcmORmPXaaN6X7aF1+yNf29tuuECLaLBTXHE1VoWYMSPijHilKyFbMNHvOM7DfVuhp7QMQWiOdjoqbP8Xfu3C0c8dLH75GVmBtJKnOI8MPpQMIyoFnZxqP4D/yg46RdwyvBVB73u/MNHSWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940254; c=relaxed/simple;
	bh=4HqtMEah6wWfucw8geyKxw6lBWPHOS+cJ/EoGOv4+KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVXJZM1RHv/nuvgaKGX3XttzsiA35fB8AmT88aL/SFEmUYIbf7VVMBiSw5Cs2dpfbOZIP+qg9IY5ZWa6J89vq9KGdFubie+EmJ9mWo1KVP2vDf6wwzUuFadkXcISvetVbsOTZTZzuHfkBLTuSkdbFeK0XNv1XIgJqVr/uoenayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihKDHYwX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940253; x=1756476253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4HqtMEah6wWfucw8geyKxw6lBWPHOS+cJ/EoGOv4+KI=;
  b=ihKDHYwXZ7gHSohVpDZWCdQQPytLgoTv2JmK0zGMBnWjJxrwe9xEdpQ/
   nGt1MjbwrVbzIaXB6Xn/pkVSJKFsj5dolls0UY6dVlGcKJly9LR+ke88Z
   6xHKnsIfVtNC7Izx16uFf047LyPosr1OfbXHkqIg/zwHQxQS3f/eq1MUW
   vbtBR/0wHSPe09EkRGRpKUBkkK1XRQbOXWKgHZHWnB1dYt+jyoFlknti9
   nJeNU5dIqeP8eUtehvodXN9Winh+wY3JNFVZwjd8gllhZOMxrupsw+Hv5
   IJlDgWGvH0xR0JD1osMmdBLGEnxY/wRqgQSWV8QL+S4shI/pllZ8fbftN
   w==;
X-CSE-ConnectionGUID: Roy3zAMGSgCbmTo+s6iJGg==
X-CSE-MsgGUID: NvQMoA/fRDeQiCkzTuNBcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690590"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:10 -0700
X-CSE-ConnectionGUID: was2n8LYTlygeKq1tAhBnQ==
X-CSE-MsgGUID: BH6WS9gaTGe3XiJ3FMnrjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419833"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 55B852A0; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 2/6] pinctrl: intel: Refactor __intel_gpio_set_direction() to be more useful
Date: Thu, 29 Aug 2024 16:59:16 +0300
Message-ID: <20240829140406.357612-3-andriy.shevchenko@linux.intel.com>
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

Refactor __intel_gpio_set_direction() to be more useful, i.e.
1) use one parameter per each direction to support all combinatios;
2) move IO to the only user that needs it.

With that done, update current users and deduplicate existing code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 31 ++++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 959413c8f4c9..b9f3d94a6256 100644
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


