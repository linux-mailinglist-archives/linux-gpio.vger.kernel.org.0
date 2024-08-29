Return-Path: <linux-gpio+bounces-9379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B09964783
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E258284ECF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1F41B012C;
	Thu, 29 Aug 2024 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyd/XJnZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F0A1AE87E;
	Thu, 29 Aug 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940256; cv=none; b=oP5JF+4I2lsC8fTqQjCbs7YMQSlA92gw6pfZI9hmJt+bmtujl5FAHbkRoskLlZmkGnWD3Yc3TY8ix2l49a/TQ+6Kvu21OeSEUJlf3pDku/dzV2mw2gA4Krlr6medUw83is4gPL+/478sRbFtsHOtWC9unXwM+WCVv1ijHFjXVwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940256; c=relaxed/simple;
	bh=k2PwSvZYFdl7kv4T21M8UGj2BdKAlVrNXFFxCI+mEe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L/9cB0cv0J7/hV9ht8BJyV2jvjMEtyJdjbLK021oYdHHtzKh5cZuywJF4zcPl/oV+FPv4wJcXEgab9xnLK5BudoU4CMvuV1xCVgur3ejF0R1DUBhpiRD35OA5LnpD18DmJTTngM5VxgcIr8aJyLo25KIlwGnM52WVqREd4pUu1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyd/XJnZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940254; x=1756476254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k2PwSvZYFdl7kv4T21M8UGj2BdKAlVrNXFFxCI+mEe4=;
  b=fyd/XJnZM00wk/mm0ZGNdHgh3UHXjx5WnU2IjOrcNJhOi5PHvmhPS6wz
   npF04NGLeNrI3Clv29L8hZufAQ8oo4UZexZmhg7zNmkh7JgcQ7jk0lc/j
   1TTzzq04Z3h+5rGcN+q22/rw6sAtaHV3HiSx37TC1VGm84NV1ENPgRORl
   Q18ouFVI27n5u9RK94P/YvRxTCYXo8u5u1cZJQSN/RXyyENIOWgbKvHhi
   QNja2/il6FtR0SfIgr97xGBIJnOutJW8G8o34X/Ng7ypshP+oLWv+K9sp
   s+vxm6eriFkTc7p5X+QAPdUYRaDWmO/S6OsLQUuCDXP62caQj+ymQSYCz
   Q==;
X-CSE-ConnectionGUID: WAQzjsNySXuNn9id6MpkMg==
X-CSE-MsgGUID: NMeWr0uTR8OM3kTfD8ZpoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690606"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690606"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:13 -0700
X-CSE-ConnectionGUID: c7dJiZaCTM+Gjwv7eUllIg==
X-CSE-MsgGUID: mhD5uFGzS+2/ua2YjWSm/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419862"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8AE1C22C; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 6/6] pinctrl: intel: Introduce for_each_intel_gpio_group() helper et al.
Date: Thu, 29 Aug 2024 16:59:20 +0300
Message-ID: <20240829140406.357612-7-andriy.shevchenko@linux.intel.com>
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

Introduce a helper macro for_each_intel_gpio_group() et al.
With those in place, update the users.

It reduces the C code base as well as shrinks the binary:

  add/remove: 0/0 grow/shrink: 4/21 up/down: 39/-621 (-582)
  Total: Before=15942, After=15360, chg -3.65%

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 125 ++++++++++----------------
 1 file changed, 46 insertions(+), 79 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index e8dbaf3964dc..75201d5c52a1 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -114,13 +114,16 @@ struct intel_community_context {
 #define pin_to_padno(c, p)	((p) - (c)->pin_base)
 #define padgroup_offset(g, p)	((p) - (g)->base)
 
+#define for_each_intel_pin_community(pctrl, community)					\
+	for (unsigned int __ci = 0;							\
+	     __ci < pctrl->ncommunities && (community = &pctrl->communities[__ci]);	\
+	     __ci++)									\
+
 const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	const struct intel_community *community;
-	int i;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		community = &pctrl->communities[i];
+	for_each_intel_pin_community(pctrl, community) {
 		if (pin >= community->pin_base &&
 		    pin < community->pin_base + community->npins)
 			return community;
@@ -131,15 +134,18 @@ const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, u
 }
 EXPORT_SYMBOL_NS_GPL(intel_get_community, PINCTRL_INTEL);
 
+#define for_each_intel_community_pad_group(community, grp)			\
+	for (unsigned int __gi = 0;						\
+	     __gi < community->ngpps && (grp = &community->gpps[__gi]);		\
+	     __gi++)								\
+
 static const struct intel_padgroup *
 intel_community_get_padgroup(const struct intel_community *community,
 			     unsigned int pin)
 {
-	int i;
-
-	for (i = 0; i < community->ngpps; i++) {
-		const struct intel_padgroup *padgrp = &community->gpps[i];
+	const struct intel_padgroup *padgrp;
 
+	for_each_intel_community_pad_group(community, padgrp) {
 		if (pin >= padgrp->base && pin < padgrp->base + padgrp->size)
 			return padgrp;
 	}
@@ -924,6 +930,14 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+#define for_each_intel_pad_group(pctrl, community, grp)			\
+	for_each_intel_pin_community(pctrl, community)			\
+		for_each_intel_community_pad_group(community, grp)
+
+#define for_each_intel_gpio_group(pctrl, community, grp)		\
+	for_each_intel_pad_group(pctrl, community, grp)			\
+		if (grp->gpio_base == INTEL_GPIO_BASE_NOMAP) {} else
+
 /**
  * intel_gpio_to_pin() - Translate from GPIO offset to pin number
  * @pctrl: Pinctrl structure
@@ -942,30 +956,17 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
 			     const struct intel_community **community,
 			     const struct intel_padgroup **padgrp)
 {
-	int i;
+	const struct intel_community *comm;
+	const struct intel_padgroup *grp;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *comm = &pctrl->communities[i];
-		int j;
+	for_each_intel_gpio_group(pctrl, comm, grp) {
+		if (offset >= grp->gpio_base && offset < grp->gpio_base + grp->size) {
+			if (community)
+				*community = comm;
+			if (padgrp)
+				*padgrp = grp;
 
-		for (j = 0; j < comm->ngpps; j++) {
-			const struct intel_padgroup *pgrp = &comm->gpps[j];
-
-			if (pgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
-				continue;
-
-			if (offset >= pgrp->gpio_base &&
-			    offset < pgrp->gpio_base + pgrp->size) {
-				int pin;
-
-				pin = pgrp->base + offset - pgrp->gpio_base;
-				if (community)
-					*community = comm;
-				if (padgrp)
-					*padgrp = pgrp;
-
-				return pin;
-			}
+			return grp->base + offset - grp->gpio_base;
 		}
 	}
 
@@ -1258,12 +1259,11 @@ static const struct irq_chip intel_gpio_irq_chip = {
 static int intel_gpio_community_irq_handler(struct intel_pinctrl *pctrl,
 					    const struct intel_community *community)
 {
+	const struct intel_padgroup *padgrp;
 	struct gpio_chip *gc = &pctrl->chip;
-	unsigned int gpp;
 	int ret = 0;
 
-	for (gpp = 0; gpp < community->ngpps; gpp++) {
-		const struct intel_padgroup *padgrp = &community->gpps[gpp];
+	for_each_intel_community_pad_group(community, padgrp) {
 		unsigned long pending, enabled;
 		unsigned int gpp, gpp_offset;
 		void __iomem *reg, *is;
@@ -1294,29 +1294,23 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 {
 	const struct intel_community *community;
 	struct intel_pinctrl *pctrl = data;
-	unsigned int i;
 	int ret = 0;
 
 	/* Need to check all communities for pending interrupts */
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		community = &pctrl->communities[i];
+	for_each_intel_pin_community(pctrl, community)
 		ret += intel_gpio_community_irq_handler(pctrl, community);
-	}
 
 	return IRQ_RETVAL(ret);
 }
 
 static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
 {
-	int i;
+	const struct intel_community *community;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *community;
+	for_each_intel_pin_community(pctrl, community) {
 		void __iomem *reg, *is;
 		unsigned int gpp;
 
-		community = &pctrl->communities[i];
-
 		for (gpp = 0; gpp < community->ngpps; gpp++) {
 			reg = community->regs + community->ie_offset + gpp * 4;
 			is = community->regs + community->is_offset + gpp * 4;
@@ -1341,36 +1335,17 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
 	return 0;
 }
 
-static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
-				const struct intel_community *community)
-{
-	int ret = 0, i;
-
-	for (i = 0; i < community->ngpps; i++) {
-		const struct intel_padgroup *gpp = &community->gpps[i];
-
-		if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
-			continue;
-
-		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
-					     gpp->gpio_base, gpp->base,
-					     gpp->size);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
 static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
-	int ret, i;
+	const struct intel_community *community;
+	const struct intel_padgroup *grp;
+	int ret;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *community = &pctrl->communities[i];
-
-		ret = intel_gpio_add_community_ranges(pctrl, community);
+	for_each_intel_gpio_group(pctrl, community, grp) {
+		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
+					     grp->gpio_base, grp->base,
+					     grp->size);
 		if (ret) {
 			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
 			return ret;
@@ -1383,20 +1358,12 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 {
 	const struct intel_community *community;
+	const struct intel_padgroup *grp;
 	unsigned int ngpio = 0;
-	int i, j;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		community = &pctrl->communities[i];
-		for (j = 0; j < community->ngpps; j++) {
-			const struct intel_padgroup *gpp = &community->gpps[j];
-
-			if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
-				continue;
-
-			if (gpp->gpio_base + gpp->size > ngpio)
-				ngpio = gpp->gpio_base + gpp->size;
-		}
+	for_each_intel_gpio_group(pctrl, community, grp) {
+		if (grp->gpio_base + grp->size > ngpio)
+			ngpio = grp->gpio_base + grp->size;
 	}
 
 	return ngpio;
-- 
2.43.0.rc1.1336.g36b5255a03ac


