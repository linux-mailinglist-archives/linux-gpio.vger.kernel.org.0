Return-Path: <linux-gpio+bounces-9846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A2196DBB0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 16:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022EA1F221D3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 14:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC1BDDBE;
	Thu,  5 Sep 2024 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM+eRsFr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654881CA84;
	Thu,  5 Sep 2024 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725546181; cv=none; b=NnorXjUIYzSkRIqSyWTynDTJFk/SLd1nPxF/YSovPln0SarWTtZK7A9kc6nGcrQLATEvWT3pFctK/poNkQIGnUjg8+CfnCNzSLRD6VQCHXyvLUGtRuztCmS3SYVO2lKrgKezaIdiZAArQhkq85XT03KY6jg9QdK2tV9P5lUzdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725546181; c=relaxed/simple;
	bh=rLNyEBQDkZqcHhPUa6TayxFxwoSgkdma4B13Esk2aCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkwoGxPBkb/wfO7RYGtw6d0SmP589gG9IEuJQmQvIu3vBnqejVjWaCCAAF9GCtX9Wuj8PfLsX+scHZEHEr9sq8W9mi2vUnGqpYdusIz+bBmCtJroWdKGlciKgL14fVlXN63b9yf5PNxrCGZjXI8oWBXcoyD+KGlPyTzOS46sZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM+eRsFr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725546179; x=1757082179;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rLNyEBQDkZqcHhPUa6TayxFxwoSgkdma4B13Esk2aCE=;
  b=YM+eRsFriidMt4AhSCx4dZz8DxPIl3hEDTeZwgZsRICIE9uTdLOU0drd
   RCgyvZLCW7n2BOjSGigEYNzZnRu1TpJ+j8911tCwONNDoy0PqEA0FBGyb
   ZssDY77a0/fxrPn7IpU5pb1+CUPj0F8pu8ZuxAvuEAVtFkttEjpheTUam
   wT4URH77R+8/1Gct0SmIyQeR2RUqAKOCwzZrDBAYq0nHONr8yVozVTgxa
   Sf+fWj6w44QYrZ5ejFYE34oozEYUw0ZHivCgPVyWfSDdOtdvmbnyqrpbH
   jEBGKklcmVawuGVcZTO6Ooi0iKqkX1VKL96IaOYbc5V5zwejFIIFSEWpr
   A==;
X-CSE-ConnectionGUID: 6vmY9gUZSzGdbo/ZY2pY4Q==
X-CSE-MsgGUID: WhqncnODQmGpuAn1rq2pOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49675517"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="49675517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:22:54 -0700
X-CSE-ConnectionGUID: uZZZ8sT1RzuAWLdUbyBz7Q==
X-CSE-MsgGUID: SOETt3ElSJGD0TSNfawUEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="70226852"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 05 Sep 2024 07:22:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 02118A1; Thu, 05 Sep 2024 17:22:50 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/1] pinctrl: intel: Constify struct intel_pinctrl parameter
Date: Thu,  5 Sep 2024 17:21:38 +0300
Message-ID: <20240905142249.707556-1-andriy.shevchenko@linux.intel.com>
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
v2: dropped cases like <non-const TYPE>* foo(const *pctrl) (Mika)
 drivers/pinctrl/intel/pinctrl-intel.c | 29 ++++++++++++++-------------
 drivers/pinctrl/intel/pinctrl-intel.h |  3 ++-
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index a2194d2ab178..f6f6d3970d5d 100644
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


