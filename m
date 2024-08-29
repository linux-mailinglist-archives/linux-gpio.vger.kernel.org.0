Return-Path: <linux-gpio+bounces-9380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA96964785
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 16:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDA7B284233
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 14:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC321AD3E4;
	Thu, 29 Aug 2024 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LslRn5qS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928C81AED56;
	Thu, 29 Aug 2024 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940257; cv=none; b=amjr1NjaP/8tmpQuEBUgk0rLJthRQVMld7JLxdMLwaWCVHCY6nM+o7QoaJ49dYReWHbj9mHMQW0eVbuli/NJ6l44GYbeWb5NusCprSDlr5SgXGKT8YJnRnleR47i9Lx9yQuSHw2cxE2iDnymp76ZUmQssOvWajJIaGEEOFiBhOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940257; c=relaxed/simple;
	bh=cN+2HIrkrG28uR5ArFWS9v/3bZcDNz5JbJSWES1ukzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jzqx6w/kJF2SUuOMZljUUdArrBzSplAzQZaEG9eXhpFmwtMLZfXjAu3EkO6w7lUg0VannomLox2Oy7lhzJ3xa1+OHc593M6gWqbxv55WlnMrgRCWv/8RfxiTT6vkqwePXopMTfoZPzYtfT3W1PtXbWlie9lyB0rDIbei+mjm8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LslRn5qS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940255; x=1756476255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cN+2HIrkrG28uR5ArFWS9v/3bZcDNz5JbJSWES1ukzM=;
  b=LslRn5qS67XdL4fju/DO+2mDmgzIU6A17qZPzi8PYecv/o7cnReOWKlQ
   gEqVZngA/9JiMfjGP4ZZ/G6ceA3E0BU+7uqoTYxCywVc+FO9yftpYn+85
   JwnHyAjfu13FUOumZmv6+ephthnRTI+/4OPmhcDVG4SEhUBZ6+6k6M6Qb
   60VX+pKmlQGYbg92G+BqjY+IPSgRNWcrRPAYzrnBsOSUXXbB1mSR/VX9+
   DAXCOaUjK7wZMhKV2ff+kCCnNkva2L3rgymtMTRTCmrLQYGzwHScr3lcu
   qtpy/dCkwWVde8ANPoU73mtyAGo7mAl9/1sYb0mb3UKzPyXeM8XZRG3M1
   A==;
X-CSE-ConnectionGUID: d6mU5rIXQKmybDYd2FK7/g==
X-CSE-MsgGUID: 5wx+mm0bQU+faSAVY6HJZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34690610"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="34690610"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:04:13 -0700
X-CSE-ConnectionGUID: F+yU/Ec/S+yv6A51mJ3ZRw==
X-CSE-MsgGUID: mVNakjymRCy28+xQfepgaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63419863"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2024 07:04:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 851B058F; Thu, 29 Aug 2024 17:04:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 5/6] pinctrl: intel: Constify intel_get_community() returned object
Date: Thu, 29 Aug 2024 16:59:19 +0300
Message-ID: <20240829140406.357612-6-andriy.shevchenko@linux.intel.com>
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

There is nothing prevents us from constifying intel_get_community()
returned object. Do it to make code more robust.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c  | 3 ++-
 drivers/pinctrl/intel/pinctrl-intel.c     | 8 ++++----
 drivers/pinctrl/intel/pinctrl-intel.h     | 2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4e87f5b875c0..d39e666a62df 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -560,9 +560,10 @@ static DEFINE_RAW_SPINLOCK(byt_lock);
 static void __iomem *byt_gpio_reg(struct intel_pinctrl *vg, unsigned int offset,
 				  int reg)
 {
-	struct intel_community *comm = intel_get_community(vg, offset);
+	const struct intel_community *comm;
 	u32 reg_offset;
 
+	comm = intel_get_community(vg, offset);
 	if (!comm)
 		return NULL;
 
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 46530ee6e92d..e8dbaf3964dc 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -114,9 +114,9 @@ struct intel_community_context {
 #define pin_to_padno(c, p)	((p) - (c)->pin_base)
 #define padgroup_offset(g, p)	((p) - (g)->base)
 
-struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin)
+const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin)
 {
-	struct intel_community *community;
+	const struct intel_community *community;
 	int i;
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
@@ -236,7 +236,7 @@ enum {
 
 static int intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
 {
-	struct intel_community *community;
+	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
 	unsigned int offset, gpp_offset;
 	u32 value;
@@ -1368,7 +1368,7 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 	int ret, i;
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
-		struct intel_community *community = &pctrl->communities[i];
+		const struct intel_community *community = &pctrl->communities[i];
 
 		ret = intel_gpio_add_community_ranges(pctrl, community);
 		if (ret) {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 6981e2fab93f..c7b025ea989a 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -264,7 +264,7 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
 
 extern const struct dev_pm_ops intel_pinctrl_pm_ops;
 
-struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin);
+const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin);
 
 int intel_get_groups_count(struct pinctrl_dev *pctldev);
 const char *intel_get_group_name(struct pinctrl_dev *pctldev, unsigned int group);
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 1fb0bba8b386..bcce97f3b897 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -211,7 +211,7 @@ static void __iomem *lp_gpio_reg(struct gpio_chip *chip, unsigned int offset,
 				 int reg)
 {
 	struct intel_pinctrl *lg = gpiochip_get_data(chip);
-	struct intel_community *comm;
+	const struct intel_community *comm;
 	int reg_offset;
 
 	comm = intel_get_community(lg, offset);
-- 
2.43.0.rc1.1336.g36b5255a03ac


