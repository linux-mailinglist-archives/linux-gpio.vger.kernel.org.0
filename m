Return-Path: <linux-gpio+bounces-9693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BD96A505
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F9501F26BEF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA3E18C92D;
	Tue,  3 Sep 2024 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX6QoEII"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E8B1E492;
	Tue,  3 Sep 2024 17:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383280; cv=none; b=IVVqdvJu61nj14UBNYGw2UTugl/mM7203W4YjGmS9Kp6ouV1XHNM2WVmDtk51pMfjggJTLxjxSSRafY7Hzy3L7A260q1E0IGIOSlg3gQoDEl3KM2NwfSVxcY8d1WC231Jz4nabWY1+dvC3OdhuyUmnkMGaWjLwreZkfJ1Lve1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383280; c=relaxed/simple;
	bh=X+TCqUJQ5rTyv8aAKraFeyml+cLPaiPiSJXWQHfz/J8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSWphcaPmOZdrM/KIBIzjKnN4Z2GkjCPk63NePZXaZsuvIXmgXn1ZTeEzlWa7DsOoEB5u0h9e6rxf6oZKSD0exSOX3k/rI5sdXHy+z2OsGPLYCUicXsrfWGAjcLgY6grUpt9ruBp/oVhEtM2xAVaw8HimM9mnSLdXdvprVdA0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX6QoEII; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725383279; x=1756919279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X+TCqUJQ5rTyv8aAKraFeyml+cLPaiPiSJXWQHfz/J8=;
  b=mX6QoEII+4swQIsWPRDtNLqzwFqwr0iFN0POA/wpkhxLmf0s4T+wL+tv
   1IfKib+b4fzEj6tDzHgRzRQnKxP2Q4IRIv8U4Kvll9BeFGgISAHdkwv8M
   uBVYK5Budx0XkQ1BBVY4Pf9ZlORtStgTURJSIDPnQZD5Khv0Kf5J3u2NA
   B6yEw4MSej+MEmzyZjvRYiiVQEefZp9clFgVfXVsM76YOIu6UB43spnC0
   m/pDmXM93RV8epQlwSE69WR1fq8D/gncmdCoC/Kkj++nBunajs7Hm1DuR
   YOfcDU5xXCAWHofd9/r1vFlOkl1HAoq5BGyhU77B1HlZKWmhzg2K7IfSR
   g==;
X-CSE-ConnectionGUID: 1UgS5UOdSK+Tz/1bu4oZ4w==
X-CSE-MsgGUID: l6Eb2E84R3mAbkNO2KJ4wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41494052"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41494052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:07:59 -0700
X-CSE-ConnectionGUID: ybgYp6rNQt+mF8pgWXuqHw==
X-CSE-MsgGUID: 3EVpEHrhQ/KQMVFqwMIAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69767070"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 03 Sep 2024 10:07:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9438848D; Tue, 03 Sep 2024 20:07:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 3/3] pinctrl: cherryview: Replace ifdeffery by pm_sleep_ptr() macro
Date: Tue,  3 Sep 2024 20:04:51 +0300
Message-ID: <20240903170752.3564538-4-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cherryview.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 2f0e29c78dfb..9cdffd73e345 100644
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
+	ret = pm_sleep_ptr(chv_pinctrl_pm_init) ? chv_pinctrl_pm_init(pctrl) : 0;
+	if (ret)
+		return ret;
 
 	pctrl->context.communities = devm_kcalloc(dev, pctrl->soc->ncommunities,
 						  sizeof(*pctrl->context.communities),
-- 
2.43.0.rc1.1336.g36b5255a03ac


