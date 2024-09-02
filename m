Return-Path: <linux-gpio+bounces-9590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30E4968998
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 16:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E07AB1C21AAB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0CA19E977;
	Mon,  2 Sep 2024 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpmy5LWL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4F19F139;
	Mon,  2 Sep 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286513; cv=none; b=nBXxGN7VEwUEzeV59CvqD0m7yTtbmxjjp6MZmT2EMOru9hj58maiSilOJ4TVBnHC8cdFe5yACsyv8NGdkIZD1QAwdc895k+dmjrTWT8lErAEQWQa/CPkSlK7MmfWCQ/mYo6cVsnoTAaOSNxOGb2IbjzQ6Q/3TkxbJ0wJflgGffs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286513; c=relaxed/simple;
	bh=WcWeVPSp0tT51Ye5Obld4BMVGdh83tPeXUYqSFlZLLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2EoHiSbPtJUxpsoQgxXQkkiXMHDanuH10w4JM41yl7SoHP3W2wln22pxDUgHbFrkPvvIum/OWmdtcsS14L9os/JSRxGdITp5qZmUWfCuGQFBbNDgJsPMFoITUhqECfP3da5e9yXGUjJQ3Ycebf2HVOp2bRTXooV0hpIS05SmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpmy5LWL; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725286511; x=1756822511;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WcWeVPSp0tT51Ye5Obld4BMVGdh83tPeXUYqSFlZLLM=;
  b=gpmy5LWLxpPhjdRCxjDgdbcwZ7WblYpzizSjoCB1pKDtX1bONKbtzISc
   jlwnOJVXYnfsZGbmQiiQRIXr+DuoW/WXXo5EwFf9qSWi1SMd1J/rMsVqE
   31Q634EWd97p7NjRl3OZuFBMuT1Yj6A5ppQuJ6wnD4eVDxZFsAtnB8gm5
   tGZQbCBo5i+8DrudopMPnvEW6G0aVKNysocImcFqIhFUQF5Kv6qZMhKk4
   TqxJAh6KKaBFa/Dg3j3esMm4Xq0dXcNoPXJQ+Yca9WJh3NNErmvb0ERrW
   VT0SzeepE3U5u/yDpEG2qq0H1vzyHz7uOzhhji7A5Tt+vBBsBNfgL1wGk
   g==;
X-CSE-ConnectionGUID: FYhs3uwrTlqtnytd2VAc3Q==
X-CSE-MsgGUID: GhswVH7dRCaxfTiyGmt/KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27661649"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="27661649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 07:14:45 -0700
X-CSE-ConnectionGUID: rdWh2PHiT0CwILtymYGAIw==
X-CSE-MsgGUID: lw9omZDbTRiUYDjU8DVjkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69429059"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2024 07:14:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7BEE8233; Mon, 02 Sep 2024 17:14:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Inline intel_gpio_community_irq_handler()
Date: Mon,  2 Sep 2024 17:14:41 +0300
Message-ID: <20240902141441.2683122-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we have for_each_intel_pad_group() helper, there is
no advantage of having intel_gpio_community_irq_handler().
Inline it into intel_gpio_irq().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 02dd8107e250..a2194d2ab178 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1256,14 +1256,16 @@ static const struct irq_chip intel_gpio_irq_chip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
-					    const struct intel_community *community)
+static irqreturn_t intel_gpio_irq(int irq, void *data)
 {
+	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
-	struct gpio_chip *gc = &pctrl->chip;
+	struct intel_pinctrl *pctrl = data;
 	int ret = 0;
 
-	for_each_intel_community_pad_group(community, padgrp) {
+	/* Need to check all communities for pending interrupts */
+	for_each_intel_pad_group(pctrl, community, padgrp) {
+		struct gpio_chip *gc = &pctrl->chip;
 		unsigned long pending, enabled;
 		unsigned int gpp, gpp_offset;
 		void __iomem *reg, *is;
@@ -1287,19 +1289,6 @@ static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 		ret += pending ? 1 : 0;
 	}
 
-	return ret;
-}
-
-static irqreturn_t intel_gpio_irq(int irq, void *data)
-{
-	const struct intel_community *community;
-	struct intel_pinctrl *pctrl = data;
-	int ret = 0;
-
-	/* Need to check all communities for pending interrupts */
-	for_each_intel_pin_community(pctrl, community)
-		ret += intel_gpio_community_irq_handler(pctrl, community);
-
 	return IRQ_RETVAL(ret);
 }
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


