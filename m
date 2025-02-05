Return-Path: <linux-gpio+bounces-15377-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1333A2870A
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05941881A1F
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383F022B8AA;
	Wed,  5 Feb 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0IhnNaZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF0422B581;
	Wed,  5 Feb 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749177; cv=none; b=LPfR+tXt+RzTopdzsea83UXiVr8f7dUTDdxloyDlUnW6D68w20KyX/GbeO9FchLBO6wrLEN9F8JpQvKemn5oJ3QTICTsu9qAWSXCjH285RhSBSzKKE+sRKAgAeXilkEf5qRIUltLRcv8gaP1IPsUswHltXsLBaFcEipQx3Z9nRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749177; c=relaxed/simple;
	bh=WHK9fb8+ayViHTHccDGl4xThI9FDf2VmEmsUNQRZRDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NEhzfDPxkT5Zf9E4RmGEEhmcz9HC5jVzD8EXCWD6J4we9+zKxbVm+tA6aDxpXI0vfjYik0KAHoW5gQYmiWI6PWnv1TSbDPKUcQmPaBX+WcGpLGOxwAPYofVr9F6tFNDDT/u/cDg8mK4BlIdnweZQ4jtdHFPRL8o5szvklYF7Sv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0IhnNaZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749176; x=1770285176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WHK9fb8+ayViHTHccDGl4xThI9FDf2VmEmsUNQRZRDo=;
  b=c0IhnNaZGibdvY9oOJEz18h8NUPEaGWBlsiXvwT3tFEMUAgOvqObM8S9
   hZOmz6YMJVmkgLGwkTlCMhQwDricra53kVrmIsObTPRCxjswTOzZ8cxqJ
   3j6f8Ve6ruywoUgkylvLcyGR/RTc+eraaDgaZhyh5gLGwDTvh2ZhouKrT
   JQL12ui+fBZq5FQysK3mfpIp6kl4mvUF9JX5kkJ325J284anWvuBASVcE
   ElFAhf9qYGgIyzDi8PKCRIbFJHklnL1vNO8vaHxsx6dzxqKT1BlQRDAvg
   lqR/MYOEsIb6nXV/IVKL/hUdocID1CO7ZBnp9H5MweomggTBW8VwBc0FM
   w==;
X-CSE-ConnectionGUID: OQHciC4CSUWJ0I7xgFp6JQ==
X-CSE-MsgGUID: gScozbGmQqewosrL0eOJ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49922057"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49922057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:49 -0800
X-CSE-ConnectionGUID: RVXUa+O4TYyH4fTq5leG4w==
X-CSE-MsgGUID: 63Z1QRr4SZ6pGm+CQxIhgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115822422"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:52:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D319349A; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 04/10] pinctrl: cy8c95x0: Remove redundant check in cy8c95x0_regmap_update_bits_base()
Date: Wed,  5 Feb 2025 11:51:14 +0200
Message-ID: <20250205095243.512292-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is never called with the PORTSEL register in the argument.
Drop unneeded check, but rescue a comment. While at it, drop inline
and allow any compiler to choose better stragy (note, that inline in
C code is only a recomendation to most of the modern compilers anyway).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 0d732e7a0868..04b534b950d0 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -477,20 +477,14 @@ static const struct regmap_config cy8c9520_i2c_regmap = {
 #endif
 };
 
-static inline int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
-						   unsigned int reg,
-						   unsigned int port,
-						   unsigned int mask,
-						   unsigned int val,
-						   bool *change, bool async,
-						   bool force)
+/* Caller should never modify PORTSEL directly */
+static int cy8c95x0_regmap_update_bits_base(struct cy8c95x0_pinctrl *chip,
+					    unsigned int reg, unsigned int port,
+					    unsigned int mask, unsigned int val,
+					    bool *change, bool async, bool force)
 {
 	int ret, off, i;
 
-	/* Caller should never modify PORTSEL directly */
-	if (reg == CY8C95X0_PORTSEL)
-		return -EINVAL;
-
 	/* Registers behind the PORTSEL mux have their own range in regmap */
 	if (cy8c95x0_muxed_register(reg)) {
 		off = CY8C95X0_MUX_REGMAP_TO_OFFSET(reg, port);
-- 
2.43.0.rc1.1336.g36b5255a03ac


