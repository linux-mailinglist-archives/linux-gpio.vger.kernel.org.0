Return-Path: <linux-gpio+bounces-28033-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D2C31AAC
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 15:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01FCC348A5B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5733334692;
	Tue,  4 Nov 2025 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkXpfXWC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90209332EB0;
	Tue,  4 Nov 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268306; cv=none; b=GFF+wRWDSHDYgjfD1mTn/+xQyfpS79Qb/ufyER6xaH5S/JnLJp3WYMMNR38HOgtMvWu9z2CffvfTDalkp+6EFIUGjvW3dkBCJ/OzlTAzoZEtHCnrywZ5KvOoO1X+hh9duPGomN767ZU8BP7873cAs7+f3nm2QI4/U3RkkwMBnPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268306; c=relaxed/simple;
	bh=JbsU/grDN2NP6b+IlhIQmfd+dNS5kjC5Vx9sy3Adkf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKoNp2rxgBDwV+U86p6C0amdCzqvGmlloEEQr2crq59FE+T6DtDx/woNKNiL3+sobml9aclhMDVBcrBd/tFiSCxSIiDSMIqhdX1vE0rEWASNDzyfHhBk7p7Ekh0+m3rzAyCNMXB557eO76ranRdrxCXBTRes42Oyc/sxGFq6m/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkXpfXWC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268303; x=1793804303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JbsU/grDN2NP6b+IlhIQmfd+dNS5kjC5Vx9sy3Adkf4=;
  b=TkXpfXWC1XfRqHUIbunIXx1hAZS956tX3nSr1xUxzw97gnvmCRjSi2T8
   o5brx9x304gjpHmbK8Bd0bBDbfH+ZfRaTq1G7ByKqBPH9jgvglqfNcUiH
   caZM3PRzZ6w2GUbyckMvARhUdqdYVd6gLfSU0vxC2IQR2PvXoxrPvPrv1
   8Sf/Z2xHkJUfzkq2D5+JmDu9B4QWPkRvTWUmG7/VR9boF/xiMyxGXyMMs
   DJ8H02w442Cykzr5XUJ0OGVkj7qklscIuPPNmK3lgro+zUeMw1HO9fS1e
   zZuk8Cck3vV8I80ONHE4ebNX9RbdITzi+oGrlNB0duS8NJkC0SbJM0C3o
   g==;
X-CSE-ConnectionGUID: WgS+nR2YTjeTG2OrO96nTA==
X-CSE-MsgGUID: 00i8oYHSSoG1a9NEJ48Nmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64268043"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64268043"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:22 -0800
X-CSE-ConnectionGUID: GlXh5wCRR2CJatTmBmssNA==
X-CSE-MsgGUID: wVSXYqpiS0CA56oGqltb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191482766"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 06:58:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F413A9F; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 10/10] pinctrl: sunrisepoint: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:44 +0100
Message-ID: <20251104145814.1018867-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
References: <20251104145814.1018867-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom macro with the recently defined INTEL_GPP().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 26 +++++++-------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index a7a5fa65fd9d..b51befde9e8b 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -28,14 +28,6 @@
 #define SPT_LP_GPI_IS		0x100
 #define SPT_LP_GPI_IE		0x120
 
-#define SPT_H_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define SPT_H_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, SPT_H)
 
@@ -538,21 +530,21 @@ static const struct intel_function spth_functions[] = {
 };
 
 static const struct intel_padgroup spth_community0_gpps[] = {
-	SPT_H_GPP(0, 0, 23, 0),		/* GPP_A */
-	SPT_H_GPP(1, 24, 47, 24),	/* GPP_B */
+	INTEL_GPP(0, 0, 23, 0),		/* GPP_A */
+	INTEL_GPP(1, 24, 47, 24),	/* GPP_B */
 };
 
 static const struct intel_padgroup spth_community1_gpps[] = {
-	SPT_H_GPP(0, 48, 71, 48),	/* GPP_C */
-	SPT_H_GPP(1, 72, 95, 72),	/* GPP_D */
-	SPT_H_GPP(2, 96, 108, 96),	/* GPP_E */
-	SPT_H_GPP(3, 109, 132, 120),	/* GPP_F */
-	SPT_H_GPP(4, 133, 156, 144),	/* GPP_G */
-	SPT_H_GPP(5, 157, 180, 168),	/* GPP_H */
+	INTEL_GPP(0, 48, 71, 48),	/* GPP_C */
+	INTEL_GPP(1, 72, 95, 72),	/* GPP_D */
+	INTEL_GPP(2, 96, 108, 96),	/* GPP_E */
+	INTEL_GPP(3, 109, 132, 120),	/* GPP_F */
+	INTEL_GPP(4, 133, 156, 144),	/* GPP_G */
+	INTEL_GPP(5, 157, 180, 168),	/* GPP_H */
 };
 
 static const struct intel_padgroup spth_community3_gpps[] = {
-	SPT_H_GPP(0, 181, 191, 192),	/* GPP_I */
+	INTEL_GPP(0, 181, 191, 192),	/* GPP_I */
 };
 
 static const struct intel_community spth_communities[] = {
-- 
2.50.1


