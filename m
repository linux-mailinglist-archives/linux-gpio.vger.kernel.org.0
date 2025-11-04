Return-Path: <linux-gpio+bounces-28032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6496C31B6D
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B38C33A8B31
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA7F33373A;
	Tue,  4 Nov 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQCly/4H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746AF332EAD;
	Tue,  4 Nov 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268304; cv=none; b=o3BkiXnBaLP0GJu/HY8JCavxhmckFlXkwH5C/Xt1+QYpvEh683+xrV02gMXU2Hyx0wpmCOao/OOVuMCw1sJPmd73HWW6/V03yZGwzcOMwKSq6cK0k35xHXpdjpMjTnY+zROaYRon7a4UYczSQgcubT4CjdE3z47ZvhBdBHjRrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268304; c=relaxed/simple;
	bh=VxCT3NihwUnVUvoDH4Z/dm+zU6QfSOXa5q/h15Syfmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYg47bgsSqLNeP0oZd/3e56auj0ReqLPFG1GG1R6eg6ZRW4NwyXTTImsZhOJ1Vc1gSyHA7FIGlo5QzuMiC0PEgbaG7VHnqOabDn/NY5OTCSq1/VXfc5upKX7UreGs5sKxIXRGLTrFV1TboeO+XdMoHsYz/JT4zRW/gRYITzqQo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQCly/4H; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268302; x=1793804302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VxCT3NihwUnVUvoDH4Z/dm+zU6QfSOXa5q/h15Syfmo=;
  b=KQCly/4HHZpNyHA1nPMLSiLZNcr1c85jbbVW4FVKdGgREj+zoM318o/L
   VLRESaAk9kORmNGqyM7nMfWtLPSwKz751FCRzEgKsnnBY7Na1ckR/D1vv
   BzAjeSD+6v713xV65iDSKwYuTrce+bT8/FV5bKnLq6TkeDMCun42t06R3
   E6g0VnmnbTOJLpJ3qgw/lpb2ZhvLU7mVU5Wq8TAXUOFrmEngE6SoF3O+J
   wa8OM0gic/HEaZ9JPlIdKFJ4KVwVLSetdzgT6R2nC6Xo1bwpnoTSHvw72
   k6aE04R10sdjFUK7QSwgwF+maS2aHeWc5FjI78m3OM2lltaFJ960S2aeW
   w==;
X-CSE-ConnectionGUID: dnK7C0THSBKJpFZ8MbD8fw==
X-CSE-MsgGUID: Du8pzEkxTNOV+vAWXvt0pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51933795"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="51933795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:21 -0800
X-CSE-ConnectionGUID: 5B5PDcHqSjOeXKSTo7d46g==
X-CSE-MsgGUID: AGeHX+0jQqS6TPRkeKVp7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186863949"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 06:58:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EF7229E; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 09/10] pinctrl: tigerlake: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:43 +0100
Message-ID: <20251104145814.1018867-10-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 70 ++++++++++-------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index c43576e10273..c0887596d113 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -28,14 +28,6 @@
 #define TGL_H_GPI_IS		0x100
 #define TGL_H_GPI_IE		0x120
 
-#define TGL_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define TGL_LP_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, TGL_LP)
 
@@ -339,30 +331,30 @@ static const struct pinctrl_pin_desc tgllp_pins[] = {
 };
 
 static const struct intel_padgroup tgllp_community0_gpps[] = {
-	TGL_GPP(0, 0, 25, 0),				/* GPP_B */
-	TGL_GPP(1, 26, 41, 32),				/* GPP_T */
-	TGL_GPP(2, 42, 66, 64),				/* GPP_A */
+	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
+	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
+	INTEL_GPP(2, 42, 66, 64),			/* GPP_A */
 };
 
 static const struct intel_padgroup tgllp_community1_gpps[] = {
-	TGL_GPP(0, 67, 74, 96),				/* GPP_S */
-	TGL_GPP(1, 75, 98, 128),			/* GPP_H */
-	TGL_GPP(2, 99, 119, 160),			/* GPP_D */
-	TGL_GPP(3, 120, 143, 192),			/* GPP_U */
-	TGL_GPP(4, 144, 170, 224),			/* vGPIO */
+	INTEL_GPP(0, 67, 74, 96),			/* GPP_S */
+	INTEL_GPP(1, 75, 98, 128),			/* GPP_H */
+	INTEL_GPP(2, 99, 119, 160),			/* GPP_D */
+	INTEL_GPP(3, 120, 143, 192),			/* GPP_U */
+	INTEL_GPP(4, 144, 170, 224),			/* vGPIO */
 };
 
 static const struct intel_padgroup tgllp_community4_gpps[] = {
-	TGL_GPP(0, 171, 194, 256),			/* GPP_C */
-	TGL_GPP(1, 195, 219, 288),			/* GPP_F */
-	TGL_GPP(2, 220, 225, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
-	TGL_GPP(3, 226, 250, 320),			/* GPP_E */
-	TGL_GPP(4, 251, 259, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	INTEL_GPP(0, 171, 194, 256),			/* GPP_C */
+	INTEL_GPP(1, 195, 219, 288),			/* GPP_F */
+	INTEL_GPP(2, 220, 225, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	INTEL_GPP(3, 226, 250, 320),			/* GPP_E */
+	INTEL_GPP(4, 251, 259, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
 static const struct intel_padgroup tgllp_community5_gpps[] = {
-	TGL_GPP(0, 260, 267, 352),			/* GPP_R */
-	TGL_GPP(1, 268, 276, INTEL_GPIO_BASE_NOMAP),	/* SPI */
+	INTEL_GPP(0, 260, 267, 352),			/* GPP_R */
+	INTEL_GPP(1, 268, 276, INTEL_GPIO_BASE_NOMAP),	/* SPI */
 };
 
 static const struct intel_community tgllp_communities[] = {
@@ -691,34 +683,34 @@ static const struct pinctrl_pin_desc tglh_pins[] = {
 };
 
 static const struct intel_padgroup tglh_community0_gpps[] = {
-	TGL_GPP(0, 0, 24, 0),				/* GPP_A */
-	TGL_GPP(1, 25, 44, 32),				/* GPP_R */
-	TGL_GPP(2, 45, 70, 64),				/* GPP_B */
-	TGL_GPP(3, 71, 78, 96),				/* vGPIO_0 */
+	INTEL_GPP(0, 0, 24, 0),				/* GPP_A */
+	INTEL_GPP(1, 25, 44, 32),			/* GPP_R */
+	INTEL_GPP(2, 45, 70, 64),			/* GPP_B */
+	INTEL_GPP(3, 71, 78, 96),			/* vGPIO_0 */
 };
 
 static const struct intel_padgroup tglh_community1_gpps[] = {
-	TGL_GPP(0, 79, 104, 128),			/* GPP_D */
-	TGL_GPP(1, 105, 128, 160),			/* GPP_C */
-	TGL_GPP(2, 129, 136, 192),			/* GPP_S */
-	TGL_GPP(3, 137, 153, 224),			/* GPP_G */
-	TGL_GPP(4, 154, 180, 256),			/* vGPIO */
+	INTEL_GPP(0, 79, 104, 128),			/* GPP_D */
+	INTEL_GPP(1, 105, 128, 160),			/* GPP_C */
+	INTEL_GPP(2, 129, 136, 192),			/* GPP_S */
+	INTEL_GPP(3, 137, 153, 224),			/* GPP_G */
+	INTEL_GPP(4, 154, 180, 256),			/* vGPIO */
 };
 
 static const struct intel_padgroup tglh_community3_gpps[] = {
-	TGL_GPP(0, 181, 193, 288),			/* GPP_E */
-	TGL_GPP(1, 194, 217, 320),			/* GPP_F */
+	INTEL_GPP(0, 181, 193, 288),			/* GPP_E */
+	INTEL_GPP(1, 194, 217, 320),			/* GPP_F */
 };
 
 static const struct intel_padgroup tglh_community4_gpps[] = {
-	TGL_GPP(0, 218, 241, 352),			/* GPP_H */
-	TGL_GPP(1, 242, 251, 384),			/* GPP_J */
-	TGL_GPP(2, 252, 266, 416),			/* GPP_K */
+	INTEL_GPP(0, 218, 241, 352),			/* GPP_H */
+	INTEL_GPP(1, 242, 251, 384),			/* GPP_J */
+	INTEL_GPP(2, 252, 266, 416),			/* GPP_K */
 };
 
 static const struct intel_padgroup tglh_community5_gpps[] = {
-	TGL_GPP(0, 267, 281, 448),			/* GPP_I */
-	TGL_GPP(1, 282, 290, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	INTEL_GPP(0, 267, 281, 448),			/* GPP_I */
+	INTEL_GPP(1, 282, 290, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
 static const struct intel_community tglh_communities[] = {
-- 
2.50.1


