Return-Path: <linux-gpio+bounces-14892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203FA151A9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8814A188CE17
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0637814883F;
	Fri, 17 Jan 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnLUcZDR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4D386337;
	Fri, 17 Jan 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123793; cv=none; b=uoNhQqmx0gkhHFBWaG178KXPIAfq7FVdnBtfb7lVMywsWJXXEfrHu95HwWi80WTbyTiIVgzKL+DuvUh4bDIb9rOa9dpDTNEAk/cbbizv+2VUmQlREkTg13og6ODuTuyVOsIiaFWuogWekp10E7bNYTGewYDubldkGMvRs7Yb0qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123793; c=relaxed/simple;
	bh=F+XJXT+/fE/nkkU1+BJo/7c9vhFWPsBG/v2E/LfH2+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fb9812twqfCuJM0k8btd4KZjkxfeZL54uhn5ER15yDXRwv70ALwGr+9M4nfD9Cuytr8735EP2tebfJfFtT/hUsh5dQ43AmJGPVacaFesGAst7ZgCk4OJh3IxhVj4V6wL1JUTMdMhBCk2vqVrO4HKLHuskuPpdEsWO/ELgdEd4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnLUcZDR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123792; x=1768659792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F+XJXT+/fE/nkkU1+BJo/7c9vhFWPsBG/v2E/LfH2+Q=;
  b=AnLUcZDRVTGkasMfCs5x7rarg02GMU0jfVdQe8A/EqYt7mXZKqBIUUYS
   D1zI77SrkAwn89N1ge4mXYZw6+/At0Kse3o+4xYExvyeCD2hj/uPE+B2V
   zuiVCJMH39MMIkMjLK9HsQW/5xVXTkcviJ9KEzeeSidiXzchL4g66SCJn
   DAw7mZrfHJO/sjK9wpHzrZ6Eq6Lmy8axHk6SZThy4FAi2ZR4ZapGfcbQV
   rBWlsklykIXNV2ZogIvet0iFABwrjQKNNajks7pzXyDth3UypGmaruJvU
   Klo3Z69hRi91pYG1f6wWdGpzJsG2Cl4rUB4BVIAjq6XFVjcVXZ4k0KLRV
   A==;
X-CSE-ConnectionGUID: pB+Z7vwLR86TiDv4seiHyA==
X-CSE-MsgGUID: mP9uOvHhTa+juppvloGMgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41323655"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41323655"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:10 -0800
X-CSE-ConnectionGUID: lABIR2mVRTSDKcqqVflH/A==
X-CSE-MsgGUID: JpGprDdmRo6/ZE1vb6Rwng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143100380"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 06:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5191B329; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 04/16] pinctrl: cy8c95x0: Fix off-by-one in the regmap range settings
Date: Fri, 17 Jan 2025 16:21:48 +0200
Message-ID: <20250117142304.596106-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
References: <20250117142304.596106-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The range_max is inclusive, so we need to use the number of
the last accessible register address.

Fixes: 8670de9fae49 ("pinctrl: cy8c95x0: Use regmap ranges")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 6833ac41d419..a94fade0ebc2 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1442,15 +1442,15 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	switch (chip->tpin) {
 	case 20:
 		strscpy(chip->name, cy8c95x0_id[0].name);
-		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 3 * MUXED_STRIDE;
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 3 * MUXED_STRIDE - 1;
 		break;
 	case 40:
 		strscpy(chip->name, cy8c95x0_id[1].name);
-		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 6 * MUXED_STRIDE;
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 6 * MUXED_STRIDE - 1;
 		break;
 	case 60:
 		strscpy(chip->name, cy8c95x0_id[2].name);
-		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 8 * MUXED_STRIDE;
+		regmap_range_conf.range_max = CY8C95X0_VIRTUAL + 8 * MUXED_STRIDE - 1;
 		break;
 	default:
 		return -ENODEV;
-- 
2.43.0.rc1.1336.g36b5255a03ac


