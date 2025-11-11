Return-Path: <linux-gpio+bounces-28365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0DC4F8E9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 20:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7993E4F8B82
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 19:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D39303C9A;
	Tue, 11 Nov 2025 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKmAI6o0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA352F5463;
	Tue, 11 Nov 2025 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888343; cv=none; b=HFpfNAFii/jLr35yFcOEN/h414W6NuobiVJ6M7/deTOZvZvfqcytSAxOYu8eXpx6p+H9f2DPSrefEgQvRTIZNbNKECx/IsEZGhN3yqJbcKuKgmgHgf2GcGanx/bmccHVSFkYJtMKnDSo4aE1DPAWbtRBMW6MXOM7FYfLCAx7I7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888343; c=relaxed/simple;
	bh=tgUL3+6GUcMoeaInV9EcrjvC4q4lZHHc9wAeYei4ZpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRcI8wy4dYQs1fy7pFEKEvNAGxixWxEmgDIpc6fxFkWAcoYq0i/BYJshA3LoZ25DNv4N5x9YYTWUtaWGqx9LZWV4NTwKyqfhsUPTFwPb+KgITkkR/s1fRcHAiW79LD14yzaICOPqaRF2+A1tWmgBXSaJLUPhr6sSMVLDjwcrjs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKmAI6o0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762888342; x=1794424342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tgUL3+6GUcMoeaInV9EcrjvC4q4lZHHc9wAeYei4ZpA=;
  b=TKmAI6o0LxO7aD/xcYNpOZKAGD/7pV5aXrnZbrZ0Ay1lqIxDFeW00nt4
   ja9TEbstUbvaoeDGljGeslTBfeQ+LwzdPPsENOlDxacwJlNeDf5Tw50HB
   LEHXjaUeBlbcs5jxwG578NxnMb3AxaZd+vYxDURFNcUi6yifinZ2TVbP6
   hZv628bRtFHkGyvE5HFaK2azOBLnfnMmTw962CdltIKdNpnoRVvQ7GQ78
   fnd0aO2VMZ/ZAdHFwd82NrjZzRqg8dJLkkA3lG0aNAkWOAbTsBlzcQV65
   7uFF6YxfBpRAOPtvEgZV4ln/95PvFjS6qXwX+RcIpbFVkOmT2H28RgTCv
   Q==;
X-CSE-ConnectionGUID: +nrpoYzSQLWreNY+L5f19A==
X-CSE-MsgGUID: Q6X5wEbUQpGzWWXpGXfKjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90425962"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="90425962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:12:17 -0800
X-CSE-ConnectionGUID: 84L4TRuASxOCO2Z3fnSWGg==
X-CSE-MsgGUID: YtcsOkMHSTaAbKtLwOJXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188334541"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 11:12:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0D7F298; Tue, 11 Nov 2025 20:12:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 3/5] pinctrl: emmitsburg: Switch to INTEL_GPP() macro
Date: Tue, 11 Nov 2025 20:10:27 +0100
Message-ID: <20251111191214.1378051-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>
References: <20251111191214.1378051-1-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-emmitsburg.c | 33 +++++++++-------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-emmitsburg.c b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
index 9d8a32aca177..ba06a9ec239a 100644
--- a/drivers/pinctrl/intel/pinctrl-emmitsburg.c
+++ b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
@@ -21,13 +21,6 @@
 #define EBG_GPI_IS	0x200
 #define EBG_GPI_IE	0x210
 
-#define EBG_GPP(r, s, e)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-	}
-
 #define EBG_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, EBG)
 
@@ -311,31 +304,31 @@ static const struct pinctrl_pin_desc ebg_pins[] = {
 };
 
 static const struct intel_padgroup ebg_community0_gpps[] = {
-	EBG_GPP(0, 0, 20),	/* GPP_A */
-	EBG_GPP(1, 21, 44),	/* GPP_B */
-	EBG_GPP(2, 45, 65),	/* SPI */
+	INTEL_GPP(0, 0, 20, 0),		/* GPP_A */
+	INTEL_GPP(1, 21, 44, 21),	/* GPP_B */
+	INTEL_GPP(2, 45, 65, 45),	/* SPI */
 };
 
 static const struct intel_padgroup ebg_community1_gpps[] = {
-	EBG_GPP(0, 66, 87),	/* GPP_C */
-	EBG_GPP(1, 88, 111),	/* GPP_D */
+	INTEL_GPP(0, 66, 87, 66),	/* GPP_C */
+	INTEL_GPP(1, 88, 111, 88),	/* GPP_D */
 };
 
 static const struct intel_padgroup ebg_community3_gpps[] = {
-	EBG_GPP(0, 112, 135),	/* GPP_E */
-	EBG_GPP(1, 136, 145),	/* JTAG */
+	INTEL_GPP(0, 112, 135, 112),	/* GPP_E */
+	INTEL_GPP(1, 136, 145, 136),	/* JTAG */
 };
 
 static const struct intel_padgroup ebg_community4_gpps[] = {
-	EBG_GPP(0, 146, 165),	/* GPP_H */
-	EBG_GPP(1, 166, 183),	/* GPP_J */
+	INTEL_GPP(0, 146, 165, 146),	/* GPP_H */
+	INTEL_GPP(1, 166, 183, 166),	/* GPP_J */
 };
 
 static const struct intel_padgroup ebg_community5_gpps[] = {
-	EBG_GPP(0, 184, 207),	/* GPP_I */
-	EBG_GPP(1, 208, 225),	/* GPP_L */
-	EBG_GPP(2, 226, 243),	/* GPP_M */
-	EBG_GPP(3, 244, 261),	/* GPP_N */
+	INTEL_GPP(0, 184, 207, 184),	/* GPP_I */
+	INTEL_GPP(1, 208, 225, 208),	/* GPP_L */
+	INTEL_GPP(2, 226, 243, 226),	/* GPP_M */
+	INTEL_GPP(3, 244, 261, 244),	/* GPP_N */
 };
 
 static const struct intel_community ebg_communities[] = {
-- 
2.50.1


