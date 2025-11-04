Return-Path: <linux-gpio+bounces-28026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DDAC31B8B
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A90854FDC7B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43598330D3B;
	Tue,  4 Nov 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ensPm7IR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BFC3321D0;
	Tue,  4 Nov 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268302; cv=none; b=BfLXnwKEVz0TWYVWMU+TTKydnavdWD5WyHUzz2ADot7NvdVs7sDAOMee66HWlewfQ9QzgGSBmkbjsQxcuhzeCGVb/QtWl2PwLzOYpHBKMxxXD8wSPNQH8Idde1vlFfGsd6Mjm6v9tYENYqy84Ex9kdB7NGkM+yxnbJDpjjAmEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268302; c=relaxed/simple;
	bh=T3LvZnYRt6ptWner4E1qYsyAkOGYoiPLAdCTUes5emM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abCBjhUkCFMigRqTIAPwIT/aU0D953cGZ++bIpCugetLWxeoThBZX5hqA4+cxiEa2v0ZLD3+Pr2hDmEHCcyFHUw23/Z1AUjNaU92YcEuV8N2oBtptyAbY0xHYQ/4B9P4vFZpdezkmAv2XbmOeThqQadXhON9tFEFpnxAxO2KDjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ensPm7IR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268300; x=1793804300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T3LvZnYRt6ptWner4E1qYsyAkOGYoiPLAdCTUes5emM=;
  b=ensPm7IRdVId1KtOLC5pWyvNZE4zGEv0IWNHszc7kqp5W9+qvb2nYD0Z
   dojSMbyH8XXxAM0q9xr0YHyHG8A1H6pYgjZlpe55YbidBn9wg9MZNDB2t
   smrXd830VPViEsNcZs5YpoA+KZCV/+hozrsWPHJbt6L/AKbyOgnF4WgQX
   bor6KfmJ52nbZxJssVXdwDZVxl8kN+BS/APPz9SM5KLT43/A2r4AiC0IC
   WfleZZsK1/oRqxIDdxJglCOjBHqZ0sfRNyJJbvRGOfEJshkE9rUdqUZT8
   9XmCJ0QbR6tLNnys1KwCUuXYfuIT/sPADtOSdnSFSTGAWOddm6i4uH16i
   A==;
X-CSE-ConnectionGUID: gZgbG4DJSB6sT+N0Vrak3w==
X-CSE-MsgGUID: ilhJbpqhTSulsHSmjKFz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64461627"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="64461627"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:20 -0800
X-CSE-ConnectionGUID: d8SZHjvFTci2yTcP1cp7FQ==
X-CSE-MsgGUID: Yo+iCYj/T7Wej64wE/8ccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="187482411"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2025 06:58:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D9A1D99; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 04/10] pinctrl: icelake: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:38 +0100
Message-ID: <20251104145814.1018867-5-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-icelake.c | 60 +++++++++++--------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
index 7e028c61ed0f..1516fe7b4e4a 100644
--- a/drivers/pinctrl/intel/pinctrl-icelake.c
+++ b/drivers/pinctrl/intel/pinctrl-icelake.c
@@ -28,14 +28,6 @@
 #define ICL_N_GPI_IS		0x100
 #define ICL_N_GPI_IE		0x120
 
-#define ICL_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define ICL_LP_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, ICL_LP)
 
@@ -302,29 +294,29 @@ static const struct pinctrl_pin_desc icllp_pins[] = {
 };
 
 static const struct intel_padgroup icllp_community0_gpps[] = {
-	ICL_GPP(0, 0, 7, 0),				/* GPP_G */
-	ICL_GPP(1, 8, 33, 32),				/* GPP_B */
-	ICL_GPP(2, 34, 58, 64),				/* GPP_A */
+	INTEL_GPP(0, 0, 7, 0),				/* GPP_G */
+	INTEL_GPP(1, 8, 33, 32),			/* GPP_B */
+	INTEL_GPP(2, 34, 58, 64),			/* GPP_A */
 };
 
 static const struct intel_padgroup icllp_community1_gpps[] = {
-	ICL_GPP(0, 59, 82, 96),				/* GPP_H */
-	ICL_GPP(1, 83, 103, 128),			/* GPP_D */
-	ICL_GPP(2, 104, 123, 160),			/* GPP_F */
-	ICL_GPP(3, 124, 152, 192),			/* vGPIO */
+	INTEL_GPP(0, 59, 82, 96),			/* GPP_H */
+	INTEL_GPP(1, 83, 103, 128),			/* GPP_D */
+	INTEL_GPP(2, 104, 123, 160),			/* GPP_F */
+	INTEL_GPP(3, 124, 152, 192),			/* vGPIO */
 };
 
 static const struct intel_padgroup icllp_community4_gpps[] = {
-	ICL_GPP(0, 153, 176, 224),			/* GPP_C */
-	ICL_GPP(1, 177, 182, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
-	ICL_GPP(2, 183, 206, 256),			/* GPP_E */
-	ICL_GPP(3, 207, 215, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	INTEL_GPP(0, 153, 176, 224),			/* GPP_C */
+	INTEL_GPP(1, 177, 182, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	INTEL_GPP(2, 183, 206, 256),			/* GPP_E */
+	INTEL_GPP(3, 207, 215, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
 static const struct intel_padgroup icllp_community5_gpps[] = {
-	ICL_GPP(0, 216, 223, 288),			/* GPP_R */
-	ICL_GPP(1, 224, 231, 320),			/* GPP_S */
-	ICL_GPP(2, 232, 240, INTEL_GPIO_BASE_NOMAP),	/* SPI */
+	INTEL_GPP(0, 216, 223, 288),			/* GPP_R */
+	INTEL_GPP(1, 224, 231, 320),			/* GPP_S */
+	INTEL_GPP(2, 232, 240, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_community icllp_communities[] = {
@@ -632,27 +624,27 @@ static const struct pinctrl_pin_desc icln_pins[] = {
 };
 
 static const struct intel_padgroup icln_community0_gpps[] = {
-	ICL_GPP(0, 0, 8, INTEL_GPIO_BASE_NOMAP),	/* SPI */
-	ICL_GPP(1, 9, 34, 32),				/* GPP_B */
-	ICL_GPP(2, 35, 55, 64),				/* GPP_A */
-	ICL_GPP(3, 56, 63, 96),				/* GPP_S */
-	ICL_GPP(4, 64, 71, 128),			/* GPP_R */
+	INTEL_GPP(0, 0, 8, INTEL_GPIO_BASE_NOMAP),	/* SPI */
+	INTEL_GPP(1, 9, 34, 32),			/* GPP_B */
+	INTEL_GPP(2, 35, 55, 64),			/* GPP_A */
+	INTEL_GPP(3, 56, 63, 96),			/* GPP_S */
+	INTEL_GPP(4, 64, 71, 128),			/* GPP_R */
 };
 
 static const struct intel_padgroup icln_community1_gpps[] = {
-	ICL_GPP(0, 72, 95, 160),			/* GPP_H */
-	ICL_GPP(1, 96, 121, 192),			/* GPP_D */
-	ICL_GPP(2, 122, 150, 224),			/* vGPIO */
-	ICL_GPP(3, 151, 174, 256),			/* GPP_C */
+	INTEL_GPP(0, 72, 95, 160),			/* GPP_H */
+	INTEL_GPP(1, 96, 121, 192),			/* GPP_D */
+	INTEL_GPP(2, 122, 150, 224),			/* vGPIO */
+	INTEL_GPP(3, 151, 174, 256),			/* GPP_C */
 };
 
 static const struct intel_padgroup icln_community4_gpps[] = {
-	ICL_GPP(0, 175, 180, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
-	ICL_GPP(1, 181, 204, 288),			/* GPP_E */
+	INTEL_GPP(0, 175, 180, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	INTEL_GPP(1, 181, 204, 288),			/* GPP_E */
 };
 
 static const struct intel_padgroup icln_community5_gpps[] = {
-	ICL_GPP(0, 205, 212, INTEL_GPIO_BASE_ZERO),	/* GPP_G */
+	INTEL_GPP(0, 205, 212, INTEL_GPIO_BASE_ZERO),	/* GPP_G */
 };
 
 static const struct intel_community icln_communities[] = {
-- 
2.50.1


