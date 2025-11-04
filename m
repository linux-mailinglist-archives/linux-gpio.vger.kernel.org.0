Return-Path: <linux-gpio+bounces-28028-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BE7C31A9D
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 15:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98F1B34A5A3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B994233343C;
	Tue,  4 Nov 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDBk7nzZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4753321CD;
	Tue,  4 Nov 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268303; cv=none; b=jDTRvvCEmGH70kOjpY7ksBguxrkGt9+0d22xxQ4fNUymB5Lxbn+w5eqfdX+WW1I2iA0B7UcKQzjTGK5+MNuXTDfjG4sRX0nfU/KU7HxKJWlCcKubwUgn0ETT27k1GRyIVbWJmtIbuKuqDUJi7OC7uhFVDS8NcGcoslr8mKjEqw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268303; c=relaxed/simple;
	bh=ZIKXmr511Auw39XGML1y2aLd/n6rSlhHJPqfUnURYRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6XBgr79wz2C2ozKUW/iac4gqAl4tCuQWaG0PgTl9/AxGRMuprAyv4IfA1UJaUu30Ai2h4bCpqqePJRaXVyACRmdxGqawQhXkfBWlmYKQJ9e7DiX1i5/U+VXDCSiroqUZGs4zauWSGyzxjaDd4hl037dIG15QMWbnuuqC9pujtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDBk7nzZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268300; x=1793804300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZIKXmr511Auw39XGML1y2aLd/n6rSlhHJPqfUnURYRY=;
  b=CDBk7nzZVLnxguq9x0L8l5sbm/onbChXCebHI7j6gxY+vgcXTr3agt9u
   x4sCIBWjUsn19oCKktNeUk4IgPJqmYw5Yp6dRUCZvwu2Cqs3CSW9olDEO
   /UvKztGDfAX1BUsleypeyhggKxdGMR4fg8XU04jYMZiWrewjJnYPPI0kt
   U32xCBqbadb0Q9hnD3c8V7mucFmtONAOOnPLowSNy+4JgIbNZ68w1FPqE
   jGsUZPMViGVmVRflQvJ0IIrFiUCUhORTXJKluiFfgrmqx6iyHRxBzMmpB
   gHfnmIoVi4STWRZP/qMFGL9LXLVyWuMZN5zi82Kt9bJ5pmPiF1Er4hDq+
   A==;
X-CSE-ConnectionGUID: z6XawiHoTLay7WXs8k6i6w==
X-CSE-MsgGUID: d3XFRUXmQemZB/R07zeZ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63567819"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="63567819"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:19 -0800
X-CSE-ConnectionGUID: /13eOEfxQeehuei4IEJldg==
X-CSE-MsgGUID: 1grSeDpoSYuxZ7X2EsDt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="187128667"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2025 06:58:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D4C5098; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 03/10] pinctrl: cannonlake: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:37 +0100
Message-ID: <20251104145814.1018867-4-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cannonlake.c | 68 ++++++++++------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index 14a5d339385d..a3ffd19fd5be 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -28,14 +28,6 @@
 #define CNL_H_GPI_IS		0x100
 #define CNL_H_GPI_IE		0x120
 
-#define CNL_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define CNL_LP_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, CNL_LP)
 
@@ -362,32 +354,32 @@ static const struct pinctrl_pin_desc cnlh_pins[] = {
 };
 
 static const struct intel_padgroup cnlh_community0_gpps[] = {
-	CNL_GPP(0, 0, 24, 0),			/* GPP_A */
-	CNL_GPP(1, 25, 50, 32),			/* GPP_B */
+	INTEL_GPP(0, 0, 24, 0),				/* GPP_A */
+	INTEL_GPP(1, 25, 50, 32),			/* GPP_B */
 };
 
 static const struct intel_padgroup cnlh_community1_gpps[] = {
-	CNL_GPP(0, 51, 74, 64),				/* GPP_C */
-	CNL_GPP(1, 75, 98, 96),				/* GPP_D */
-	CNL_GPP(2, 99, 106, 128),			/* GPP_G */
-	CNL_GPP(3, 107, 114, INTEL_GPIO_BASE_NOMAP),	/* AZA */
-	CNL_GPP(4, 115, 146, 160),			/* vGPIO_0 */
-	CNL_GPP(5, 147, 154, INTEL_GPIO_BASE_NOMAP),	/* vGPIO_1 */
+	INTEL_GPP(0, 51, 74, 64),			/* GPP_C */
+	INTEL_GPP(1, 75, 98, 96),			/* GPP_D */
+	INTEL_GPP(2, 99, 106, 128),			/* GPP_G */
+	INTEL_GPP(3, 107, 114, INTEL_GPIO_BASE_NOMAP),	/* AZA */
+	INTEL_GPP(4, 115, 146, 160),			/* vGPIO_0 */
+	INTEL_GPP(5, 147, 154, INTEL_GPIO_BASE_NOMAP),	/* vGPIO_1 */
 };
 
 static const struct intel_padgroup cnlh_community3_gpps[] = {
-	CNL_GPP(0, 155, 178, 192),			/* GPP_K */
-	CNL_GPP(1, 179, 202, 224),			/* GPP_H */
-	CNL_GPP(2, 203, 215, 256),			/* GPP_E */
-	CNL_GPP(3, 216, 239, 288),			/* GPP_F */
-	CNL_GPP(4, 240, 248, INTEL_GPIO_BASE_NOMAP),	/* SPI */
+	INTEL_GPP(0, 155, 178, 192),			/* GPP_K */
+	INTEL_GPP(1, 179, 202, 224),			/* GPP_H */
+	INTEL_GPP(2, 203, 215, 256),			/* GPP_E */
+	INTEL_GPP(3, 216, 239, 288),			/* GPP_F */
+	INTEL_GPP(4, 240, 248, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_padgroup cnlh_community4_gpps[] = {
-	CNL_GPP(0, 249, 259, INTEL_GPIO_BASE_NOMAP),	/* CPU */
-	CNL_GPP(1, 260, 268, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
-	CNL_GPP(2, 269, 286, 320),			/* GPP_I */
-	CNL_GPP(3, 287, 298, 352),			/* GPP_J */
+	INTEL_GPP(0, 249, 259, INTEL_GPIO_BASE_NOMAP),	/* CPU */
+	INTEL_GPP(1, 260, 268, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	INTEL_GPP(2, 269, 286, 320),			/* GPP_I */
+	INTEL_GPP(3, 287, 298, 352),			/* GPP_J */
 };
 
 static const unsigned int cnlh_spi0_pins[] = { 40, 41, 42, 43 };
@@ -780,25 +772,25 @@ static const struct intel_function cnllp_functions[] = {
 };
 
 static const struct intel_padgroup cnllp_community0_gpps[] = {
-	CNL_GPP(0, 0, 24, 0),				/* GPP_A */
-	CNL_GPP(1, 25, 50, 32),				/* GPP_B */
-	CNL_GPP(2, 51, 58, 64),				/* GPP_G */
-	CNL_GPP(3, 59, 67, INTEL_GPIO_BASE_NOMAP),	/* SPI */
+	INTEL_GPP(0, 0, 24, 0),				/* GPP_A */
+	INTEL_GPP(1, 25, 50, 32),			/* GPP_B */
+	INTEL_GPP(2, 51, 58, 64),			/* GPP_G */
+	INTEL_GPP(3, 59, 67, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_padgroup cnllp_community1_gpps[] = {
-	CNL_GPP(0, 68, 92, 96),				/* GPP_D */
-	CNL_GPP(1, 93, 116, 128),			/* GPP_F */
-	CNL_GPP(2, 117, 140, 160),			/* GPP_H */
-	CNL_GPP(3, 141, 172, 192),			/* vGPIO */
-	CNL_GPP(4, 173, 180, 224),			/* vGPIO */
+	INTEL_GPP(0, 68, 92, 96),			/* GPP_D */
+	INTEL_GPP(1, 93, 116, 128),			/* GPP_F */
+	INTEL_GPP(2, 117, 140, 160),			/* GPP_H */
+	INTEL_GPP(3, 141, 172, 192),			/* vGPIO */
+	INTEL_GPP(4, 173, 180, 224),			/* vGPIO */
 };
 
 static const struct intel_padgroup cnllp_community4_gpps[] = {
-	CNL_GPP(0, 181, 204, 256),			/* GPP_C */
-	CNL_GPP(1, 205, 228, 288),			/* GPP_E */
-	CNL_GPP(2, 229, 237, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
-	CNL_GPP(3, 238, 243, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	INTEL_GPP(0, 181, 204, 256),			/* GPP_C */
+	INTEL_GPP(1, 205, 228, 288),			/* GPP_E */
+	INTEL_GPP(2, 229, 237, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	INTEL_GPP(3, 238, 243, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
 };
 
 static const struct intel_community cnllp_communities[] = {
-- 
2.50.1


