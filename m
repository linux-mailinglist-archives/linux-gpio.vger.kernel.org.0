Return-Path: <linux-gpio+bounces-374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6167F4EAF
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 18:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C622813AE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 17:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002BF584FC;
	Wed, 22 Nov 2023 17:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmdDKZzD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1269D9A;
	Wed, 22 Nov 2023 09:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700675459; x=1732211459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vjM99oJF/e2ni3/auPFYtDFRthGYsyUVZgmaU1qFAN0=;
  b=XmdDKZzDMDCjZ1URGjnyH3YjR/q71E3JctUi/QIK/rnWmpwYSLuWWo3e
   IGJRngLZRRcgVMgoj0S+ClsTdZbhhGw79qVhikeJBRbXl2DGhuid++OWS
   A+9dztKxixvXgMCLgAQNx+6f+l0Fc6kI1W5ke7ztMp6te8ijw3qOUAtxS
   OV7go9NUwvhVHpsIOnN5eySUeGbMkyaq4zpwRvZjuO8PN4G+iiYgNbhNq
   Cf/aHeum6QZ6KjCpbdeNF4/Lmj+V/rptsjjPTL5e4Lq/IJZtlu0gMEwz4
   gZjWnEJ0G/LJ5HSJRmn6cM08CrEoV85gU873Y6HM0tPzz+/vsO9uyAecG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456431556"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456431556"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 09:50:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="770707124"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="770707124"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 22 Nov 2023 09:50:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E02AC2A2; Wed, 22 Nov 2023 19:50:54 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/4] pinctrl: baytrail: Fix types of config value in byt_pin_config_set()
Date: Wed, 22 Nov 2023 19:50:36 +0200
Message-ID: <20231122175039.2289945-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unpacked, the config value is split to two of different types.
Fix the types accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 3cd0798ee631..f1af21dbd5fb 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -918,13 +918,14 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			      unsigned int num_configs)
 {
 	struct intel_pinctrl *vg = pinctrl_dev_get_drvdata(pctl_dev);
-	unsigned int param, arg;
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	void __iomem *db_reg = byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG);
 	u32 conf, val, db_pulse, debounce;
+	enum pin_config_param param;
 	unsigned long flags;
 	int i, ret = 0;
+	u32 arg;
 
 	raw_spin_lock_irqsave(&byt_lock, flags);
 
-- 
2.43.0.rc1.1.gbec44491f096


