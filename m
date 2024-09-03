Return-Path: <linux-gpio+bounces-9695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4696A509
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 811DEB25D89
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB40E18CC1C;
	Tue,  3 Sep 2024 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMW5qUla"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF916F315;
	Tue,  3 Sep 2024 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383290; cv=none; b=EYJ+XPJ7ItgMo7rCGAWXK2trDEaP60stmV+baBxWzk/ZlF9OSVCXHoGmuAm/RA23s5hMaiNu4TL552I0DxafwGYfSgcw12w9ROD0Uh4olcI9yoTC+Cym01Yn15geGtH/f+ukyKT8SFCQ7nYdNPTz1EnXSHSL2hdyaKI3faqpPQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383290; c=relaxed/simple;
	bh=9nNi3scBnr8Vk69ggkoW6jfBHFxQMg5IiD0KQUEmAqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1Un+eWY6nrRKyWUEEL0xuNzfXmyxGpbU/5/IZ+Mjmk1Rwpdn5N4b2kQ5ZRGgN8oPk3irdoeW86QziGtxne65HPiW976waLStNxC1x6tOEKJcOxzB7x3FIdnS31JoTxZgBBekey/P/Di0j4OrnW8RRTutJ0cz5MDFxHka79W3XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMW5qUla; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725383289; x=1756919289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9nNi3scBnr8Vk69ggkoW6jfBHFxQMg5IiD0KQUEmAqk=;
  b=nMW5qUla2NHnVClno9wWecnC7D4Aw4my5Y2JF/z6G5yu/FBfFxzjJD29
   aQ3+VfxZBH7UAjEX9OR4VZoxieih9FueF9wtLH5BX+txipW7Jx7t1dQho
   L56XcQMNXCuYrAkoJM8rD7pIAuqPCecRZW7XClUZsug3ZF43ERm9OH5Sq
   4jD0MLemLLeh/0BwWv12X31miGbn1/2THIQgpY+CX9mtFf8r3BoTbY5h1
   +JvCSwDwqbWYPPvCtqkNUzMNzHJeQCrWpOIozvc8anc6pfDzB3VWtQ/c+
   +Gnb8ZqHWbJizYFSAXqJaIFT6bZQSsQkyrYZROmRYmETzDnnVudreHIks
   w==;
X-CSE-ConnectionGUID: noc8U4/kTR2lDeHwuU86sw==
X-CSE-MsgGUID: gjHU/CdLRouW15j0CCPpRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34661710"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34661710"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 10:08:08 -0700
X-CSE-ConnectionGUID: WyKWepZKS1KLNJypnXhnhg==
X-CSE-MsgGUID: VRY3WbaeRheXO9Iuq8ZfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69837981"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 03 Sep 2024 10:08:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8A92FB34; Tue, 03 Sep 2024 20:07:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/3] pinctrl: intel: Replace ifdeffery by pm_sleep_ptr() macro
Date: Tue,  3 Sep 2024 20:04:49 +0300
Message-ID: <20240903170752.3564538-2-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-intel.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 7a790c437f68..bfe891522044 100644
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
+	ret = pm_sleep_ptr(intel_pinctrl_pm_init) ? intel_pinctrl_pm_init(pctrl) : 0;
 	if (ret)
 		return ret;
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


