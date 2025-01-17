Return-Path: <linux-gpio+bounces-14895-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AEA151B1
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 896EF188C6D0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A560016DC3C;
	Fri, 17 Jan 2025 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys7IuLAC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D434B1487F4;
	Fri, 17 Jan 2025 14:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123795; cv=none; b=CkppRYVlhRY7czwRw3tz+aJOqboIZh35DdP9SkrVpB113OXsAFRXJjkZoNmhFmRl96YnhsSBRzJKoL4n0xJAp0dMD8jgNSTzqshzEmqD771LSqbOquMRi+9l4YgbRuRbrKo27VK55PYy7P7ybCuFavJ3+kJcHmhRbAUJ1NBNGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123795; c=relaxed/simple;
	bh=XS+UUnRGq3B0ChjLpuElVdPAkASgtGbIkUQS75861PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/ia5eOzsP1fEQLrhgNIRKYgoBLpRoNNxRENdLqxPulP7uNI+qxV48BJB4e9CK28B0vmTpyUdmM3GzigA1vWSLuvxy9YjXOP1z/dFbTGYL8l4FVsR0ANXkgKVAneG4qGPBMmLol0SfkQGeGUdb1sYzBGBmvpmX6ldivRh3OrITo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys7IuLAC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123794; x=1768659794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XS+UUnRGq3B0ChjLpuElVdPAkASgtGbIkUQS75861PQ=;
  b=Ys7IuLACC3pmFLNX85tyIBhfjGYExEtl6jnyfncPfVr/SoQfb2ePyqTq
   w40mrvQHsCspwRwbGSJfxnlx91+u0wahjO7mLTEfm8AXW0MOpE5G4ohPF
   b6jrEGkAao5NiZweyIoivaykQxPhr1d532dd5hbYwUAE2i2wyJJOecBpe
   /wBowOefLVDM9DLcdjPctCRA2RV1869eCxrAH3dKhTe0QlOyroyv2yRj8
   zl9/VWVBznO87OQH8v62m1SDmkSgIFS/WGhPRkTzBLI2bdBOGOlvo9S51
   +u0ax5x3+wcBKBOvEruWcVaQ3oq0230ghIEBg7Y9fFRdJDnG1PHh4XdFu
   g==;
X-CSE-ConnectionGUID: c5RxQkq5RCarT2Q9+3zVcw==
X-CSE-MsgGUID: VeWA20lNTimD0ep/SVa6YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41323658"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41323658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:12 -0800
X-CSE-ConnectionGUID: n5k99ET2TQSVpjaz2DAMdQ==
X-CSE-MsgGUID: TFa7vzuvSJ2NwjcoQilCzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143100384"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 06:23:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 64F253B1; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 05/16] pinctrl: cy8c95x0: Remove incorrectly set fields in regmap configuration
Date: Fri, 17 Jan 2025 16:21:49 +0200
Message-ID: <20250117142304.596106-6-andriy.shevchenko@linux.intel.com>
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

We don't provide defaults for the regmap, we shouldn't provide
the number of them either.

Remove incorrectly set fields in regmap configuration.

Fixes: 8670de9fae49 ("pinctrl: cy8c95x0: Use regmap ranges")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index a94fade0ebc2..e98eba17cd13 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -464,7 +464,6 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 	.ranges	= NULL,			/* Updated at runtime */
 	.num_ranges = 1,
 	.max_register = 0,		/* Updated at runtime */
-	.num_reg_defaults_raw = 0,	/* Updated at runtime */
 	.use_single_read = true,	/* Workaround for regcache bug */
 #if IS_ENABLED(CONFIG_DEBUG_PINCTRL)
 	.disable_locking = false,
@@ -1475,7 +1474,6 @@ static int cy8c95x0_probe(struct i2c_client *client)
 	memcpy(&regmap_conf, &cy8c9520_i2c_regmap, sizeof(regmap_conf));
 	regmap_conf.ranges = &regmap_range_conf;
 	regmap_conf.max_register = regmap_range_conf.range_max;
-	regmap_conf.num_reg_defaults_raw = regmap_range_conf.range_max;
 
 	chip->regmap = devm_regmap_init_i2c(client, &regmap_conf);
 	if (IS_ERR(chip->regmap))
-- 
2.43.0.rc1.1336.g36b5255a03ac


