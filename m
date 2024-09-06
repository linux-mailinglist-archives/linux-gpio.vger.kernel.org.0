Return-Path: <linux-gpio+bounces-9890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81D196F333
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69E35B23848
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5521CB33A;
	Fri,  6 Sep 2024 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHzakOu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB821CB31E;
	Fri,  6 Sep 2024 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622649; cv=none; b=dfW6SfFe2tDjksQkgAdJkqBDiRCJwpKkY3ssaRU5+J3slIbPXs0MUD4CaewBsCPTKKYXJ9gglWgH3FG8JrrdpKAu/jTKHjFt8cz/CiFeqhZ9+niOxvMdLhLa6nCM+zOMqSInNdXFLU/TDBd1V7roi6c+LzCijJVlpByUkbw0xuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622649; c=relaxed/simple;
	bh=oQfWANU6iaKsyQvsJZPGF//Ae4LjPw243PXhm0Jo4zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERVd4JKXzJXnwCQUext4MRtoiUi2lpqBqXiatKwk0wLbOpY+Onx/T1hRYtkDwliSKQxiqzFjHtVkYFPaTEVe988lGh7y8ezjCSsYGg0lz5VHKmGQ3z4ymh3XC+TjpZR/5WN7XIukaRpvXp1Z2jE0h+OiAMMdzAoLHrdNQg1UFrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHzakOu8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725622648; x=1757158648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQfWANU6iaKsyQvsJZPGF//Ae4LjPw243PXhm0Jo4zQ=;
  b=DHzakOu8YWwXx7ZwaQ+xsSCGv8LxICf/k5OmwF6Vi+orXzFEBANfe3nY
   7C2cuLNMs6O05DLbTyTApLrLFaRRdIrYUWJtV3gwMTf1VHDEOPLdYhHiE
   qiFVZH9vKFqPDB2XYJ3C+RDso2x3ACH2rDHpRV1xw9SmR0uSadkaVh0+o
   GRGMHN5gq79gLgowqJwnIb4K/Wbeb82UgObbjobHi9FZtBa/r49cKu8Oa
   D3l2AyBxbR1EhLKbOevYs7NOQfokdYMbJYrXaIHHMiShqh2K4ivRhw1jv
   /W0DY54kyJ6GbI+RBWLFO6quHivePBieQ4bTSYf7yJIdbRy2OVHBbVK/M
   A==;
X-CSE-ConnectionGUID: aX7HEiUvTXWJETgTUjJ22g==
X-CSE-MsgGUID: QQPXnAtCQC2jgbtnh4l+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="34952552"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="34952552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:37:27 -0700
X-CSE-ConnectionGUID: f1EiUjwQQ4eKdDWBBiHpow==
X-CSE-MsgGUID: wB04rXIWSnSTK9Q8NU3vnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70729709"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2024 04:37:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 40EA7161; Fri, 06 Sep 2024 14:37:14 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 1/3] pinctrl: intel: Replace ifdeffery by pm_sleep_ptr() macro
Date: Fri,  6 Sep 2024 14:36:06 +0300
Message-ID: <20240906113710.467716-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240906113710.467716-1-andriy.shevchenko@linux.intel.com>
References: <20240906113710.467716-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicit ifdeffery is ugly and theoretically might be not synchronised
with the rest of functions that are assigned via pm_sleep_ptr() macro.
Replace ifdeffery by pm_sleep_ptr() macro to improve this.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c |  5 +----
 drivers/pinctrl/intel/pinctrl-intel.h | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index f6f6d3970d5d..e3f9d4d9667c 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1482,7 +1482,6 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
 
 static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 {
-#ifdef CONFIG_PM_SLEEP
 	const struct intel_pinctrl_soc_data *soc = pctrl->soc;
 	struct intel_community_context *communities;
 	struct intel_pad_context *pads;
@@ -1497,7 +1496,6 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 	if (!communities)
 		return -ENOMEM;
 
-
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
 		u32 *intmask, *hostown;
@@ -1519,7 +1517,6 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
 
 	pctrl->context.pads = pads;
 	pctrl->context.communities = communities;
-#endif
 
 	return 0;
 }
@@ -1649,7 +1646,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 	if (irq < 0)
 		return irq;
 
-	ret = intel_pinctrl_pm_init(pctrl);
+	ret = intel_pinctrl_context_alloc(pctrl, intel_pinctrl_pm_init);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 4d4e1257afdf..7d8d1c5668d3 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -256,6 +256,20 @@ struct intel_pinctrl {
 	int irq;
 };
 
+typedef int (*intel_pinctrl_context_alloc_fn)(struct intel_pinctrl *pctrl);
+
+static inline int intel_pinctrl_context_alloc(struct intel_pinctrl *pctrl,
+					      intel_pinctrl_context_alloc_fn alloc_fn)
+{
+	intel_pinctrl_context_alloc_fn fn;
+
+	fn = pm_sleep_ptr(alloc_fn);
+	if (fn)
+		return fn(pctrl);
+
+	return 0;
+}
+
 int intel_pinctrl_probe(struct platform_device *pdev,
 			const struct intel_pinctrl_soc_data *soc_data);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


