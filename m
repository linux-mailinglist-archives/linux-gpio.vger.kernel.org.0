Return-Path: <linux-gpio+bounces-9694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF796A508
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E4E1F26C8B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59DC18C92D;
	Tue,  3 Sep 2024 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHnbzuiP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDED1E492;
	Tue,  3 Sep 2024 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383290; cv=none; b=MMTDtAU8fc9Mt+dnPnW9BzHUVQeCRGVRLWf6YhOT05HqHhh3DPubVjL6POxiwaTtkNm1BLP9LKW45eWAEi9hp6Iddg2M9koTX6dtVnbKUxOsjVwLOSSx/9vjcXL7y17n8lpSAyF4iR8ONeT0v6uHyIxZzf6moS/vHqU54bHuEAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383290; c=relaxed/simple;
	bh=2h6WU4d4gnSqJg4lm2yVF0fkfzoQG2SQOxD8Q9ulcxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNaDHArosc04zYXQlU0pxdzdCQkFuFRX/XNUyVTlc88g/eQZXgksAw1T+RNb73Fd3BEgeqVC2nXZ4c/kgiLyAnb6FrDbqf7OfLVNzoG/n0WyOQtx/a7t6YqyVMLGzd0BuLwts7JMNDCMAS9eNi+sPywH+pyEzeNC9R91kpNMi6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHnbzuiP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725383289; x=1756919289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2h6WU4d4gnSqJg4lm2yVF0fkfzoQG2SQOxD8Q9ulcxs=;
  b=iHnbzuiPipiRAMv/4r3OZC1dU00vayE6hsE/WTJKAsP2COhMnmdH7MSj
   FS4O3s0/mWbUIDT/BdeCOB7tUSIb5jI1AcjcwKv2zQ22oAXZ1pRTJnp0u
   Hxo14JRW+Dvl39GS1yIYq93y9vCpwmLPqQqENVa1kuxfocr4TA6iTR5dT
   r/z3UT33r5fVZ3vFJdYzvzOnmRizTPhO2sC6/h6jkECAPutZvzSCRKkAv
   If10OTlNTlZD/IJJc1cMXhYiqzCcgpzcb+QmlHC4WVGi4qc9pX36gCn3U
   v2YElrfkhAWUmBQUY202dWt5ouzzo3Gm8VAEdDFZYguMn7dHaFphQgPtY
   A==;
X-CSE-ConnectionGUID: c/6L9XWmT0qYMOmEJb28jw==
X-CSE-MsgGUID: kF/tgDd3TQaOKgEkLnx0Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41494093"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41494093"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:08:08 -0700
X-CSE-ConnectionGUID: PcgFFg9rRCiABUACKkBCQQ==
X-CSE-MsgGUID: XfbGCjzOT+y+8Xw+Ef6NrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69767199"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 03 Sep 2024 10:08:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 854FC1FA; Tue, 03 Sep 2024 20:07:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/3] pinctrl: baytrail: Replace ifdeffery by pm_sleep_ptr() macro
Date: Tue,  3 Sep 2024 20:04:50 +0300
Message-ID: <20240903170752.3564538-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
References: <20240903170752.3564538-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-baytrail.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4533c4d0a9e7..7aa0ddca7a59 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1514,13 +1514,6 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 	gc->parent	= vg->dev;
 	gc->ngpio	= vg->soc->npins;
 
-#ifdef CONFIG_PM_SLEEP
-	vg->context.pads = devm_kcalloc(vg->dev, gc->ngpio, sizeof(*vg->context.pads),
-					GFP_KERNEL);
-	if (!vg->context.pads)
-		return -ENOMEM;
-#endif
-
 	/* set up interrupts  */
 	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
@@ -1581,6 +1574,16 @@ static const struct acpi_device_id byt_gpio_acpi_match[] = {
 	{ }
 };
 
+static int byt_pinctrl_pm_init(struct intel_pinctrl *vg)
+{
+	vg->context.pads = devm_kcalloc(vg->dev, vg->soc->npins,
+					sizeof(*vg->context.pads), GFP_KERNEL);
+	if (!vg->context.pads)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int byt_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct intel_pinctrl_soc_data *soc_data;
@@ -1603,6 +1606,10 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = pm_sleep_ptr(byt_pinctrl_pm_init) ? byt_pinctrl_pm_init(vg) : 0;
+	if (ret)
+		return ret;
+
 	vg->pctldesc		= byt_pinctrl_desc;
 	vg->pctldesc.name	= dev_name(dev);
 	vg->pctldesc.pins	= vg->soc->pins;
-- 
2.43.0.rc1.1336.g36b5255a03ac


