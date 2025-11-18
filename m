Return-Path: <linux-gpio+bounces-28660-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EB322C69687
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B693036551B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5485734DCEA;
	Tue, 18 Nov 2025 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTS6GESK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E52D4B66;
	Tue, 18 Nov 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763469292; cv=none; b=FM1Pq9AEs9+aBnmLQsTJ/+XDqTEcv7XIx/9uRhKZoQR/Ttth5z52mywR35onszULUbl4cq59B26DqkDktzOBFjd5Mx6sQnv9Ta6DZSkLip8owfB8f+Pgw6ScTscD36WqLb5g8inR8kTc1sdZeQStrMoVgUfgJpx0Mjnap6PT6Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763469292; c=relaxed/simple;
	bh=JHXZO90DwjmwUsYLD66MEd19r4Z4m05X0McdsCrGPWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up47BUZCv+YYNSEVJ0zT7gGscNj+B0cK2OSo5Y7qhoNK/JxS3m0r+DwAcG3nWiEKggjkJfonMwZbCLPgWEFEyyC0wzJHTDO2brWIzzRlRv1GkHtWoojfqujkf39244nO7Nn9eomQDnSz+YW90YYSzsPrGX6tWRio/v/Cq2Kc2m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTS6GESK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763469291; x=1795005291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JHXZO90DwjmwUsYLD66MEd19r4Z4m05X0McdsCrGPWA=;
  b=mTS6GESK+NBJ7nRr4xKitUt4o7l7TodYsWxRPWjaWXCIq7UMyyXUj/iI
   Kto22ppBCAnQtAiPm2ihxHjBegCs4G+mJ0tbrJxoVnGhPd9Esbt2Z4KDu
   gYVLSVjJHriR0tlBhuIFUCJkd1crLBRWfRzHwFV2Yfz7moAtwSaff5iMK
   ol/q5Ncv063JO8seijPqOVEorCBZFSaQ/ubIuh841TiZE09C/vyETH8p6
   OuYeJNMPya/HcD1L5G7sAvG1DVPziFAGTYN9f3M8p6KKNdDmS7xKjIvD8
   g1Eu6EOZWlhzzwmSKNso66JnHw88t9gw+nEVAXDk8aOoksO+xoxKLxr6z
   w==;
X-CSE-ConnectionGUID: /HsxULTeSr6mW+D/C6G+2g==
X-CSE-MsgGUID: ZVmQWLiVQB6GJX+Mh04ung==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65193282"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65193282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 04:34:50 -0800
X-CSE-ConnectionGUID: 0qj9ic3dQyeJZ5kS6m1Wxg==
X-CSE-MsgGUID: 46IGWRheQg+gYCQvPiRgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190032765"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 04:34:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C1EFC99; Tue, 18 Nov 2025 13:34:47 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/2] pinctrl: intel: Export intel_gpio_add_pin_ranges()
Date: Tue, 18 Nov 2025 13:34:01 +0100
Message-ID: <20251118123444.1217863-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251118123444.1217863-1-andriy.shevchenko@linux.intel.com>
References: <20251118123444.1217863-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export intel_gpio_add_pin_ranges() for reuse in other drivers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 12 +++++++++++-
 drivers/pinctrl/intel/pinctrl-intel.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 8e067aaf3399..10e8f82e4543 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1345,7 +1345,16 @@ static int intel_gpio_irq_init_hw(struct gpio_chip *gc)
 	return 0;
 }
 
-static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
+/**
+ * intel_gpio_add_pin_ranges - add GPIO pin ranges for all groups in all communities
+ * @gc: GPIO chip structure
+ *
+ * This function iterates over all communities and all groups and adds the respective
+ * GPIO pin ranges, so the GPIO library will correctly map a GPIO offset to a pin number.
+ *
+ * Return: 0, or negative error code if range can't be added.
+ */
+int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 {
 	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct intel_community *community;
@@ -1362,6 +1371,7 @@ static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
 
 	return 0;
 }
+EXPORT_SYMBOL_NS_GPL(intel_gpio_add_pin_ranges, "PINCTRL_INTEL");
 
 static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
 {
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 654af5977603..c1520797f895 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -276,6 +276,8 @@ extern const struct dev_pm_ops intel_pinctrl_pm_ops;
 const struct intel_community *intel_get_community(const struct intel_pinctrl *pctrl,
 						  unsigned int pin);
 
+int intel_gpio_add_pin_ranges(struct gpio_chip *gc);
+
 int intel_get_groups_count(struct pinctrl_dev *pctldev);
 const char *intel_get_group_name(struct pinctrl_dev *pctldev, unsigned int group);
 int intel_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
-- 
2.50.1


