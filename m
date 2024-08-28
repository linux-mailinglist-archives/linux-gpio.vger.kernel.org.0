Return-Path: <linux-gpio+bounces-9292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE392963045
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 20:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0931BB238B1
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D901AC426;
	Wed, 28 Aug 2024 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lC5og4HO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858161ABEAD;
	Wed, 28 Aug 2024 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724870434; cv=none; b=n76wiHBxwJ3geDsiggUh0SyNa5/mXSCwFeGdMbmrvk2kTQ27zFTFPfgARGcJvovU9UrfouEVEFZd6vqKQIoZGf5ztBA5XzFFuKUcrWUhaFGUISFGubHqWzNC4lvOQP8SJYekTwMzBAQUbyIykZWjmsfL6g0ofqOhmyaAYcnSzfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724870434; c=relaxed/simple;
	bh=L2midZcE3RpsA1pL7Eb1ZxiCa4N4cRx/7eog+sTwjSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czWL5LJQTYI30tjLJFDsC0tUwzhgnDvsGEHaYYCq2LB46AlMtYC6ti22eLyit5SW5h2ho6BY1uQjUiF9OESWOrnyUMs8+HlP1UWakANkM8EoAMtCibp4C++4iUeYThv4VPBU+8KKAvrc3cjHUwztKX8/TC5q3296MylDlDqZJ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lC5og4HO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724870433; x=1756406433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L2midZcE3RpsA1pL7Eb1ZxiCa4N4cRx/7eog+sTwjSE=;
  b=lC5og4HOWvr4GL7Jz2P5Ls6r6ME/QPFP42kZvsDaiqmvumRqde37rEcD
   7Q6CAB6/E5UlpJm3Jjzyoa8m6jplZW0d1UVHo6/tBZLCG4sjSK5CmRKth
   XWZEoZ3y9yofCkiq+IbpT2OlQodVFSyJVNahRRbyRJO4zogx5s89ZQhFg
   G5ZMsj/q+y++2rLRPKIbXji0+WEEHsGjw8cR5wPGViQWJlCZuPGlr0o0Y
   0g6GBjFHCaP+HilxfqxjlrV3SCou2fHzFzHgWfG7r8A+tvK4yaawKu9HH
   q7kPTLxjjo37iLFGUehoj41u0m7jkaKSsECQ0d+KgRSknz5EBo7GonOZs
   w==;
X-CSE-ConnectionGUID: i+sZB/o4SyGhNcy3LMnhzw==
X-CSE-MsgGUID: yc8OvjA/SL2gfseplBezjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="13265387"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="13265387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 11:40:30 -0700
X-CSE-ConnectionGUID: IAs/nJTPSguOEIG/loV13w==
X-CSE-MsgGUID: 36UOymo/SHyU2aS8LW3TZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63376498"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 11:40:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1263F2E6; Wed, 28 Aug 2024 21:40:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 5/5] pinctrl: intel: Introduce for_each_intel_gpio_group() helper
Date: Wed, 28 Aug 2024 21:38:38 +0300
Message-ID: <20240828184018.3097386-6-andriy.shevchenko@linux.intel.com>
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

Introduce a helper macro for_each_intel_gpio_group().
With that in place, update users.

It reduces the C code base as well as shrinks the binary:

  add/remove: 0/0 grow/shrink: 1/8 up/down: 37/-106 (-69)
  Total: Before=15611, After=15542, chg -0.44%

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 89 +++++++++------------------
 1 file changed, 29 insertions(+), 60 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index ae30969b2dee..143174abda32 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -931,6 +931,15 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+#define for_each_intel_gpio_group(pctrl, community, grp)				\
+	for (unsigned int __i = 0;							\
+	     __i < pctrl->ncommunities && (community = &pctrl->communities[__i]);	\
+	     __i++)									\
+		for (unsigned int __j = 0;						\
+		     __j < community->ngpps && (grp = &community->gpps[__j]);		\
+		     __j++)								\
+			if (grp->gpio_base == INTEL_GPIO_BASE_NOMAP) {} else
+
 /**
  * intel_gpio_to_pin() - Translate from GPIO offset to pin number
  * @pctrl: Pinctrl structure
@@ -949,30 +958,17 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
 			     const struct intel_community **community,
 			     const struct intel_padgroup **padgrp)
 {
-	int i;
+	const struct intel_community *c;
+	const struct intel_padgroup *gpp;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		const struct intel_community *comm = &pctrl->communities[i];
-		int j;
+	for_each_intel_gpio_group(pctrl, c, gpp) {
+		if (offset >= gpp->gpio_base && offset < gpp->gpio_base + gpp->size) {
+			if (community)
+				*community = c;
+			if (padgrp)
+				*padgrp = gpp;
 
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
+			return gpp->base + offset - gpp->gpio_base;
 		}
 	}
 
@@ -1348,36 +1344,17 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
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
+	struct intel_community *community;
+	const struct intel_padgroup *gpp;
+	int ret;
 
-	for (i = 0; i < pctrl->ncommunities; i++) {
-		struct intel_community *community = &pctrl->communities[i];
-
-		ret = intel_gpio_add_community_ranges(pctrl, community);
+	for_each_intel_gpio_group(pctrl, community, gpp) {
+		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
+					     gpp->gpio_base, gpp->base,
+					     gpp->size);
 		if (ret) {
 			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
 			return ret;
@@ -1390,20 +1367,12 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 {
 	const struct intel_community *community;
+	const struct intel_padgroup *gpp;
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
+	for_each_intel_gpio_group(pctrl, community, gpp) {
+		if (gpp->gpio_base + gpp->size > ngpio)
+			ngpio = gpp->gpio_base + gpp->size;
 	}
 
 	return ngpio;
-- 
2.43.0.rc1.1336.g36b5255a03ac


