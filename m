Return-Path: <linux-gpio+bounces-9891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3975496F361
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 13:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA3A286892
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BB51CBEA5;
	Fri,  6 Sep 2024 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKDgJwLb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F01CB154;
	Fri,  6 Sep 2024 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623036; cv=none; b=S0YBS9buDJ9Ci4LRkAt0puLo0GeA9ZMTGbcCcwdx3sljLoxgq6zR0so52nPweloqf5Z8n1Nmf+6ctRCZUBCZRQts/pRZTAcyHURmSuscTjs+Gex8SiTmdP8kILYf40k25VU7B7ZRX7AX7kOcK8TK2I9mVNhctgRq1nxkoIWkgMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623036; c=relaxed/simple;
	bh=k2nGLLAeLRhr+YcEzVH1i4afIkU6w/zHEyW7VQqdBPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKMNG90Pp6X9x2h8d0sNsPHhharhaG5XkoPc71iHDHZXRFe8cigknoV9i4sW8MPd1kXeS9MGYXQvoHqaSrPHNJ4/vSNShRgJLSagHfWuil4JQH6I38Z3iEW/PGxB7/nLvYrqdz8q10vvGrkY/4O5WIeVW3eoM7zvKelWiDlV9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKDgJwLb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725623036; x=1757159036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k2nGLLAeLRhr+YcEzVH1i4afIkU6w/zHEyW7VQqdBPI=;
  b=GKDgJwLbd13a8tw68awCVJuwYRckGncvyoKj9cSgUCO749yZcqns50SL
   69JhlaZ2fmzb5kv2kFBEN34j0eq2I2ci4dB9iltrTt3M/5Xf+lkxu/9rl
   SZdWVphkvfVhTNuQAa297/c5fZEqnVq0Cttsaxtsw8CquZrCpblkFz4h3
   eQKFQeLKID5+SlmQWcEq3bhH3e+A0pl05SUW1TPx4WnSFUgR9veRbxNnc
   V20O7vXwVhqnwcPlUkBH6ZeXXmEIZrmwSeoGqPNV8B4yhJLNCr7IuIcEb
   5I2tdu+EwWXg+0ikJv95DAFumKo2j14Ya8WpqRenA30uQqpD2oKU9JI+F
   w==;
X-CSE-ConnectionGUID: pyepTlqeQdK0FlOJrdLIqA==
X-CSE-MsgGUID: FRtYnJoMRO2v/yrXtWVOxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24488701"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24488701"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:43:55 -0700
X-CSE-ConnectionGUID: AqcyRIx+Qq6fKaYYQJNfZQ==
X-CSE-MsgGUID: a9wONoX+ShCVfnMUHsK6lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="66272496"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2024 04:43:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5C3131C4; Fri, 06 Sep 2024 14:37:14 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 3/3] pinctrl: cherryview: Replace ifdeffery by pm_sleep_ptr() macro
Date: Fri,  6 Sep 2024 14:36:08 +0300
Message-ID: <20240906113710.467716-4-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 2f0e29c78dfb..5cf99caf511f 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1608,6 +1608,16 @@ static acpi_status chv_pinctrl_mmio_access_handler(u32 function,
 	return AE_OK;
 }
 
+static int chv_pinctrl_pm_init(struct intel_pinctrl *pctrl)
+{
+	pctrl->context.pads = devm_kcalloc(pctrl->dev, pctrl->soc->npins,
+					   sizeof(*pctrl->context.pads), GFP_KERNEL);
+	if (!pctrl->context.pads)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int chv_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc_data;
@@ -1648,13 +1658,9 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 
 	community->pad_regs = community->regs + FAMILY_PAD_REGS_OFF;
 
-#ifdef CONFIG_PM_SLEEP
-	pctrl->context.pads = devm_kcalloc(dev, pctrl->soc->npins,
-					   sizeof(*pctrl->context.pads),
-					   GFP_KERNEL);
-	if (!pctrl->context.pads)
-		return -ENOMEM;
-#endif
+	ret = intel_pinctrl_context_alloc(pctrl, chv_pinctrl_pm_init);
+	if (ret)
+		return ret;
 
 	pctrl->context.communities = devm_kcalloc(dev, pctrl->soc->ncommunities,
 						  sizeof(*pctrl->context.communities),
-- 
2.43.0.rc1.1336.g36b5255a03ac


