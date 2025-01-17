Return-Path: <linux-gpio+bounces-14890-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A33A151A7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 15:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2702F3A0FB6
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 14:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E871E8635A;
	Fri, 17 Jan 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZbEh7Jg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6A38DD1;
	Fri, 17 Jan 2025 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123792; cv=none; b=Wu3rAUDBvexvfFT7K01U2tBy/5flaTzEQw0wXCiwHX2nE6oQ7m9b5262ZRpPadf2CZVl8I1Yxiyq74y0mYUh/KibtH2zokDYyfusZ9Zv5p7MfYq+ZhgBgMnvln1eUK5UwrzB9W3zYj2+nZsC6RETjQSHt8wonIK/y8n7HzwppDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123792; c=relaxed/simple;
	bh=nvHcuhAxp3MMFaxPEPiHMerxA9dBRwrijTUgc/rzR1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmpTcYDX7TcqZjgrbHt9KtmBSYtyIKhYZsOyl1D0C3FruP1W8s7D9/ycsEAyZmP7eCtKhPJBV3Xy8zBCdAIs5MvqjIJFLNsstLKB5oiVNmlPedqJsG7ddEJljY77iTKUPzFf9FurRbyDyHF+vREdCdHR37Uhlo0nFit/uj7fSS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZbEh7Jg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737123791; x=1768659791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nvHcuhAxp3MMFaxPEPiHMerxA9dBRwrijTUgc/rzR1o=;
  b=nZbEh7JgC0VaE1w42tNkrRzsC2SmspqL5i3Vr7geYGe33/DKikHPRMEf
   ICQoiJkkTCYv/q0DrGztuBFc7a6HpLrF99LZd3KY1nW9r2RVE0wKfxCfL
   tP8rqhrgN8zcBjJOTrZqX+qG3sZfOGGz4WDX3AsgigDzTzLEwzK56eR1S
   paCu6HscXfVsIKKY2Jhn5wfyrUWt9FxAJ1Ww6i1IABsb2bwJpVmU21KRp
   uW1aWV1mAxQ/7ylhQdm/XV1o2yk2xDPrtmxch4eTzqbs4n4FAK/sADJfE
   sVgZeZT2FG1Lb1ymVsc88KNC3IT+u7//KvlqM0Ii/7rFkwKoGRLnC3Xy+
   Q==;
X-CSE-ConnectionGUID: +PM4dMM2R4uM7qwfitd8UQ==
X-CSE-MsgGUID: LVSCfUQ0S/CbDIcShciINA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41323653"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41323653"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:23:10 -0800
X-CSE-ConnectionGUID: uK0+KijfTDSFOBLFK5PyIQ==
X-CSE-MsgGUID: PUHZWFU3Sga688pVJHKDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143100378"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 06:23:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 47A66399; Fri, 17 Jan 2025 16:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 03/16] pinctrl: cy8c95x0: Enable regmap locking for debug
Date: Fri, 17 Jan 2025 16:21:47 +0200
Message-ID: <20250117142304.596106-4-andriy.shevchenko@linux.intel.com>
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

When regmap locking is disabled, debugfs is also disabled.
Enable locking for debug when CONFIG_DEBUG_PINCTRL is set.

Fixes: f71aba339a66 ("pinctrl: cy8c95x0: Use single I2C lock")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index d767bbc66256..6833ac41d419 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -466,7 +466,11 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 	.max_register = 0,		/* Updated at runtime */
 	.num_reg_defaults_raw = 0,	/* Updated at runtime */
 	.use_single_read = true,	/* Workaround for regcache bug */
+#if IS_ENABLED(CONFIG_DEBUG_PINCTRL)
+	.disable_locking = false,
+#else
 	.disable_locking = true,
+#endif
 };
 
 static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
-- 
2.43.0.rc1.1336.g36b5255a03ac


