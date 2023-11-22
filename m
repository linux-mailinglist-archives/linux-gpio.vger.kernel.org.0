Return-Path: <linux-gpio+bounces-349-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D57F445A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 11:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BCB2814D6
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 10:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA341BDF6;
	Wed, 22 Nov 2023 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R701NI3F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0700ED8;
	Wed, 22 Nov 2023 02:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700650453; x=1732186453;
  h=from:to:cc:subject:date:message-id;
  bh=L6bHYCHdpbaSIiykCkw+XvZL0tDlt0dAm6zfnBSOkH4=;
  b=R701NI3FN2a/a53VP7VD5zOpFbAB2cPL4WBcvOlBOrKYcWlfE6rgIfja
   13myN08Xj0sbAP8W09WXVZY7f3bSnXALrBsS+RD717sof98JtMy+jcQwA
   O+DWBV6q6i63ol/HWHp/q9MMa0Qu3TCGyWk7rUNw+5DPqzekrjUVD1u1a
   fc8QNQcxXhaWWZHcF++9mUiG7j3nVJQiybS849k5Ulob4AVkgDH+FSnvk
   xlq0svEzeikqmbhZLv9aj+nxdWPkk0pGuHA2eLB1lv7qHxJbWQ3VGG5qj
   6eG+9OaDzAghZAc0+Ye/kjXr6DTRv1WO5ZuCoc3gxRLSotyH9FuCO5MrO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="372207210"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="372207210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="8393146"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 02:54:10 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] pinctrl: intel: use the correct _PM_OPS() export macro
Date: Wed, 22 Nov 2023 16:24:01 +0530
Message-Id: <20231122105401.11006-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Since we don't have runtime PM handles here, we should be using
EXPORT_NS_GPL_DEV_SLEEP_PM_OPS() macro, so that the compiler can
discard it in case CONFIG_PM_SLEEP=n.

Fixes: b10a74b5c0c1 ("pinctrl: intel: Provide Intel pin control wide PM ops structure")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 2367c2747a83..d6f29e6faab7 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1879,7 +1879,7 @@ static int intel_pinctrl_resume_noirq(struct device *dev)
 	return 0;
 }
 
-EXPORT_NS_GPL_DEV_PM_OPS(intel_pinctrl_pm_ops, PINCTRL_INTEL) = {
+EXPORT_NS_GPL_DEV_SLEEP_PM_OPS(intel_pinctrl_pm_ops, PINCTRL_INTEL) = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(intel_pinctrl_suspend_noirq, intel_pinctrl_resume_noirq)
 };
 

base-commit: c5860e4a2737a8b29dc426c800d01c5be6aad811
-- 
2.17.1


