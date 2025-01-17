Return-Path: <linux-gpio+bounces-14900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D552FA151BB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2722F188D85F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2AE1991B8;
	Fri, 17 Jan 2025 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKRBXuri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11650183CA9;
	Fri, 17 Jan 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123797; cv=none; b=F5Q+ium9A3Vi8K+SdG7Y8oLuHwErprA7ZxMXHTB9bst4dmXZL8DlkLBIYcBhWUADBYZ/FeWgOJkGeHziYW0oqFKF/LlT7xZiAZjOvkG287Bds3VX3R8YrnJeVtIXyJzWuL5vGPa0XkLjfLo5nV/A2dTiDjkQmEQJLFIE98KZsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123797; c=relaxed/simple;
	bh=0Vn0hLTtzWwsCxhSkJ63h32Fb84lQ9l8Bglv9xcHwAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rFpK/3vQ0KPHS6H3CekHKkDwg5Lm8ljMV8dRWrWM3iLLLwv7V2KkdUsDQERrYqkWhhjhloPRNxBFZ3i7nd3I35koP5hOMXDcqO/XtSVL9ko3lolCmV+JT9lbkDx2C0TPkIb0IJhNe7ViR4XwD+omRPMLB96BmVjcacG+XFglXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKRBXuri; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123796; x=1768659796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Vn0hLTtzWwsCxhSkJ63h32Fb84lQ9l8Bglv9xcHwAY=;
  b=lKRBXuricfN7FuHFzBhn3Pelye+bBZdAzDCGfCHAGt2vdwHtYOJKBx4y
   //h78rM2/xfk6Fde96zCv4BmUPhrvuBPvzgsDOLU4wZpFUon/G1eKh9Jz
   ZSfwn+9N0m+8BfUXY0yZ+sdYAsA5bTWZOMKBU/qx84P2PRxkMrAqafZ1D
   kgfw6uRLL9bU/dRkZq+njdOvYNnDaYxEEoJUvsuwh0o4PIqLkWTOPD/r6
   V/d9HtZ8iMtpKrJXltdgXw2Dk2WODwiab5ScnuhnDFsjtQmafNmuXLSjX
   1/eUAs5/ewiX3obH5opd6GdQOS4WEkG7g0josGMOlwecehxOI5y03CWj/
   Q==;
X-CSE-ConnectionGUID: OUZlYNTxRTWlcU1oLAMZ3g==
X-CSE-MsgGUID: fnSl4/XXQMKbNauxmggSYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37792839"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37792839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: tuZdDntcTcudD201Z3ti0g==
X-CSE-MsgGUID: 3biE6QnUTJ2fzPbHS/ZZQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105671226"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 06:23:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A410B4F0; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 11/16] pinctrl: cy8c95x0: Replace 'return ret' by 'return 0' in some cases
Date: Fri, 17 Jan 2025 16:21:55 +0200
Message-ID: <20250117142304.596106-12-andriy.shevchenko@linux.intel.com>
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

When it's known that the returned value can't be non-zero,
use 'return 0' explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 3907970a3e6e..d29898151a9e 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -516,7 +516,7 @@ static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
 		regcache_cache_only(chip->regmap, false);
 	}
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1285,7 +1285,7 @@ static int cy8c95x0_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned int num_configs)
 {
 	struct cy8c95x0_pinctrl *chip = pinctrl_dev_get_drvdata(pctldev);
-	int ret = 0;
+	int ret;
 	int i;
 
 	for (i = 0; i < num_configs; i++) {
@@ -1294,7 +1294,7 @@ static int cy8c95x0_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct pinconf_ops cy8c95x0_pinconf_ops = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


