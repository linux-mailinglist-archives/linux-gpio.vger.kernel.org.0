Return-Path: <linux-gpio+bounces-9591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5BB9689A3
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 16:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92248B229DA
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC2F19F12E;
	Mon,  2 Sep 2024 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbuKjkmA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDF1E49F;
	Mon,  2 Sep 2024 14:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286574; cv=none; b=GaJQbZiw9TxRnCE6yqLvuZvF1nHMg913dkV2JYg/3nnyx3Tf4Oo9x6CgfrO06oDUxby48gGhoag3iDQ+xikQE46qdb0PX29Xhn3muhcqVtvid61wZyn+dYkAZn4gwTTsZfULYcq44mvMPCg+ecssy199rP+05dGZTSDfpo/O4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286574; c=relaxed/simple;
	bh=OQ9+0BsynHs3lhDXF9g42KhKU0JzeGzoLakIKq0NXjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQFF1ItFZYQ19esmsorDlkk8dHQl6RkOBBD90YLTGV2eZz8Z0RIvJjU7omaUvctB+vYPmW2SE5x4bLlktabww+5/vF9BIRB+NB4B5NAS4DbP20oiN5DK0sGTnmYz7jwd+Kx7aKgaI3IHszzMh2yrfKTdj3/IAOtUd8vhfRxLu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbuKjkmA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725286572; x=1756822572;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OQ9+0BsynHs3lhDXF9g42KhKU0JzeGzoLakIKq0NXjM=;
  b=HbuKjkmAOaiFtsMDJMv2fyxuVWS73dR1feLst8H80s288ne9bYbXDCVy
   sojHuIwcWdnk6XdB2A6vNOJ7glekrQQeTYlJwkih+EwHH1z42gyOrrLi0
   uw31i0fBWyb7wLO4vli+TDwpQDTVou1TgJTY+kS0nulSOMeFfSbSv2r/u
   u/yZqDGQouagivoPcyA1iTNDJugd4Xnk06naGu9gkfqgclLk8I5njfW76
   xyShoWOJb5Hpfhid1RYb7NBL3JsE074J3PaKoMZcfr568lh6gilOm9tLc
   8tHBSFJNdZlx3LYfYUrWYSE/+a0DlBVoGklEo7f0ivyscUsl2MMZ9ppKA
   Q==;
X-CSE-ConnectionGUID: YcOefIWoSwSXmIhgf0Zkkg==
X-CSE-MsgGUID: FYr6ibn8QpOfkKgi9k8TCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27662035"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="27662035"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 07:16:12 -0700
X-CSE-ConnectionGUID: s+k7yPQsRZSeejwdixsXLw==
X-CSE-MsgGUID: qFYkkhNTSNaSiNHH5ivhgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64596270"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2024 07:16:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ACE30233; Mon, 02 Sep 2024 17:16:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: intel: Constify struct intel_pinctrl parameter
Date: Mon,  2 Sep 2024 17:15:11 +0300
Message-ID: <20240902141607.2694988-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a few functions that do not and should not change
the state of the pin control object. Constify the respective
parameter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

There are more opportunities, but they will make the code inconsistent,
for example, .get uses const, while .set may not due to locking.

 drivers/pinctrl/intel/pinctrl-intel.c | 33 ++++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-intel.h |  3 ++-
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a2194d2ab178..7a790c437f68 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -132,7 +132,8 @@ struct intel_community_context {
 	for_each_intel_pad_group(pctrl, community, grp)			\
 		if (grp->gpio_base == INTEL_GPIO_BASE_NOMAP) {} else
 
-const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin)
+const struct intel_community *intel_get_community(const struct intel_pinctrl *pctrl,
+						  unsigned int pin)
 {
 	const struct intel_community *community;
 
@@ -161,7 +162,7 @@ intel_community_get_padgroup(const struct intel_community *community,
 	return NULL;
 }
 
-static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl,
+static void __iomem *intel_get_padcfg(const struct intel_pinctrl *pctrl,
 				      unsigned int pin, unsigned int reg)
 {
 	const struct intel_community *community;
@@ -181,7 +182,7 @@ static void __iomem *intel_get_padcfg(struct intel_pinctrl *pctrl,
 	return community->pad_regs + reg + padno * nregs * 4;
 }
 
-static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned int pin)
+static bool intel_pad_owned_by_host(const struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
@@ -206,7 +207,7 @@ static bool intel_pad_owned_by_host(struct intel_pinctrl *pctrl, unsigned int pi
 	return !(readl(padown) & PADOWN_MASK(gpp_offset));
 }
 
-static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned int pin)
+static bool intel_pad_acpi_mode(const struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
@@ -248,7 +249,7 @@ enum {
 	PAD_LOCKED_FULL	= PAD_LOCKED | PAD_LOCKED_TX,
 };
 
-static int intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
+static int intel_pad_locked(const struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
@@ -286,19 +287,19 @@ static int intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
 	return ret;
 }
 
-static bool intel_pad_is_unlocked(struct intel_pinctrl *pctrl, unsigned int pin)
+static bool intel_pad_is_unlocked(const struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	return (intel_pad_locked(pctrl, pin) & PAD_LOCKED) == PAD_UNLOCKED;
 }
 
-static bool intel_pad_usable(struct intel_pinctrl *pctrl, unsigned int pin)
+static bool intel_pad_usable(const struct intel_pinctrl *pctrl, unsigned int pin)
 {
 	return intel_pad_owned_by_host(pctrl, pin) && intel_pad_is_unlocked(pctrl, pin);
 }
 
 int intel_get_groups_count(struct pinctrl_dev *pctldev)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->ngroups;
 }
@@ -306,7 +307,7 @@ EXPORT_SYMBOL_NS_GPL(intel_get_groups_count, PINCTRL_INTEL);
 
 const char *intel_get_group_name(struct pinctrl_dev *pctldev, unsigned int group)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->groups[group].grp.name;
 }
@@ -315,7 +316,7 @@ EXPORT_SYMBOL_NS_GPL(intel_get_group_name, PINCTRL_INTEL);
 int intel_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
 			 const unsigned int **pins, unsigned int *npins)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	*pins = pctrl->soc->groups[group].grp.pins;
 	*npins = pctrl->soc->groups[group].grp.npins;
@@ -326,7 +327,7 @@ EXPORT_SYMBOL_NS_GPL(intel_get_group_pins, PINCTRL_INTEL);
 static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 			       unsigned int pin)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	void __iomem *padcfg;
 	u32 cfg0, cfg1, mode;
 	int locked;
@@ -383,7 +384,7 @@ static const struct pinctrl_ops intel_pinctrl_ops = {
 
 int intel_get_functions_count(struct pinctrl_dev *pctldev)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->nfunctions;
 }
@@ -391,7 +392,7 @@ EXPORT_SYMBOL_NS_GPL(intel_get_functions_count, PINCTRL_INTEL);
 
 const char *intel_get_function_name(struct pinctrl_dev *pctldev, unsigned int function)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	return pctrl->soc->functions[function].func.name;
 }
@@ -400,7 +401,7 @@ EXPORT_SYMBOL_NS_GPL(intel_get_function_name, PINCTRL_INTEL);
 int intel_get_function_groups(struct pinctrl_dev *pctldev, unsigned int function,
 			      const char * const **groups, unsigned int * const ngroups)
 {
-	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	*groups = pctrl->soc->functions[function].func.groups;
 	*ngroups = pctrl->soc->functions[function].func.ngroups;
@@ -952,7 +953,7 @@ static const struct pinctrl_desc intel_pinctrl_desc = {
  * Return: a pin number and pointers to the community and pad group, which
  * the pin belongs to, or negative error code if translation can't be done.
  */
-static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
+static int intel_gpio_to_pin(const struct intel_pinctrl *pctrl, unsigned int offset,
 			     const struct intel_community **community,
 			     const struct intel_padgroup **padgrp)
 {
@@ -982,7 +983,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
  *
  * Return: a GPIO offset, or negative error code if translation can't be done.
  */
-static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
+static int intel_pin_to_gpio(const struct intel_pinctrl *pctrl, int pin)
 {
 	const struct intel_community *community;
 	const struct intel_padgroup *padgrp;
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index c7b025ea989a..4d4e1257afdf 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -264,7 +264,8 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
 
 extern const struct dev_pm_ops intel_pinctrl_pm_ops;
 
-const struct intel_community *intel_get_community(struct intel_pinctrl *pctrl, unsigned int pin);
+const struct intel_community *intel_get_community(const struct intel_pinctrl *pctrl,
+						  unsigned int pin);
 
 int intel_get_groups_count(struct pinctrl_dev *pctldev);
 const char *intel_get_group_name(struct pinctrl_dev *pctldev, unsigned int group);
-- 
2.43.0.rc1.1336.g36b5255a03ac


