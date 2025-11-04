Return-Path: <linux-gpio+bounces-28025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A15C31AE3
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16792189FC0B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8596E3314C5;
	Tue,  4 Nov 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W194yjdA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDC32E75C;
	Tue,  4 Nov 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268302; cv=none; b=i8ibunp6zzi61/8ueUWF/RCWfvut0E1zD/CoOVq8riEb8TnsFUA7Vvp2+ZIL0NBtEviDLzwWGkWMD/IdZzr+jZuTiYGFwjNp2wSiK0gIglDTDx752pEmwatbnlc1bfxKf7UTz/UsjGj9VsROTZNeP2aZZ2X9JU2GJbvt847F5+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268302; c=relaxed/simple;
	bh=rz1kLy40sBJGSd1r/2FGE4ULVhOo4wI3OnUqI+/j0uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNelr4BtTtYe89LLsTkVv+IKu5NvBrItVERBgYmSWtBtGZdjfQd0kBEBpHPosRZpZswNvnbEwJAI812D/7Iy17p9IJ7geqsZMQfxaOxpiNMbNRqaftG6WlAJePFXTlYvX9dEiY6bAPHaqSOGl3X3y84mnb5QlC7F4Qb4jwPiozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W194yjdA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268299; x=1793804299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rz1kLy40sBJGSd1r/2FGE4ULVhOo4wI3OnUqI+/j0uw=;
  b=W194yjdAh0jSNQm3EoEBtZQiFBp09h8vaza4n/tGRC0on+GXpl+WrxVf
   OY5N9k6FNQmL9XmbDaccF2/0s7htFtRPmq4Qlz+8jV4a+DDt1DbwlDdFF
   UiEEOXiSA5UYzxpyjATs9sZxsGtXnMAYOcla34MLRVi/QgvOy0kACj4As
   JxPk/H7BcvBRBhfKEpvIfECVZO9a1JZukspMPdh1jX9d1NWv1ijhlEJA9
   vKnmIO4sxGd45nIzSp0In56EToGQFSE7qGCfDwogsu2tg5KcD+oHkr0Gl
   SbIO+G2tWhOkmEXDuZXzlpioihncsGYiJVVU2FP1EP8K9KcutFKUJRdzZ
   w==;
X-CSE-ConnectionGUID: uBz22fKBRVSKuhhxgmmtug==
X-CSE-MsgGUID: VRXqPQVZSHOEmSP172LRDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75813595"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="75813595"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:19 -0800
X-CSE-ConnectionGUID: GOSegdnyR7ijWuWoxgS8Sg==
X-CSE-MsgGUID: +tU4GH0eT22QmZI0OugFsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="187906420"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2025 06:58:17 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D0A5B97; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 02/10] pinctrl: alderlake: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:36 +0100
Message-ID: <20251104145814.1018867-3-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-alderlake.c | 68 ++++++++++-------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 108eac205aa9..7bf1d5c285a0 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -27,14 +27,6 @@
 #define ADL_S_GPI_IS		0x200
 #define ADL_S_GPI_IE		0x220
 
-#define ADL_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define ADL_N_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, ADL_N)
 
@@ -316,28 +308,28 @@ static const struct pinctrl_pin_desc adln_pins[] = {
 };
 
 static const struct intel_padgroup adln_community0_gpps[] = {
-	ADL_GPP(0, 0, 25, 0),				/* GPP_B */
-	ADL_GPP(1, 26, 41, 32),				/* GPP_T */
-	ADL_GPP(2, 42, 66, 64),				/* GPP_A */
+	INTEL_GPP(0, 0, 25, 0),				/* GPP_B */
+	INTEL_GPP(1, 26, 41, 32),			/* GPP_T */
+	INTEL_GPP(2, 42, 66, 64),			/* GPP_A */
 };
 
 static const struct intel_padgroup adln_community1_gpps[] = {
-	ADL_GPP(0, 67, 74, 96),				/* GPP_S */
-	ADL_GPP(1, 75, 94, 128),			/* GPP_I */
-	ADL_GPP(2, 95, 118, 160),			/* GPP_H */
-	ADL_GPP(3, 119, 139, 192),			/* GPP_D */
-	ADL_GPP(4, 140, 168, 224),			/* vGPIO */
+	INTEL_GPP(0, 67, 74, 96),			/* GPP_S */
+	INTEL_GPP(1, 75, 94, 128),			/* GPP_I */
+	INTEL_GPP(2, 95, 118, 160),			/* GPP_H */
+	INTEL_GPP(3, 119, 139, 192),			/* GPP_D */
+	INTEL_GPP(4, 140, 168, 224),			/* vGPIO */
 };
 
 static const struct intel_padgroup adln_community4_gpps[] = {
-	ADL_GPP(0, 169, 192, 256),			/* GPP_C */
-	ADL_GPP(1, 193, 217, 288),			/* GPP_F */
-	ADL_GPP(2, 218, 223, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
-	ADL_GPP(3, 224, 248, 320),			/* GPP_E */
+	INTEL_GPP(0, 169, 192, 256),			/* GPP_C */
+	INTEL_GPP(1, 193, 217, 288),			/* GPP_F */
+	INTEL_GPP(2, 218, 223, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	INTEL_GPP(3, 224, 248, 320),			/* GPP_E */
 };
 
 static const struct intel_padgroup adln_community5_gpps[] = {
-	ADL_GPP(0, 249, 256, 352),			/* GPP_R */
+	INTEL_GPP(0, 249, 256, 352),			/* GPP_R */
 };
 
 static const struct intel_community adln_communities[] = {
@@ -680,35 +672,35 @@ static const struct pinctrl_pin_desc adls_pins[] = {
 };
 
 static const struct intel_padgroup adls_community0_gpps[] = {
-	ADL_GPP(0, 0, 24, 0),				/* GPP_I */
-	ADL_GPP(1, 25, 47, 32),				/* GPP_R */
-	ADL_GPP(2, 48, 59, 64),				/* GPP_J */
-	ADL_GPP(3, 60, 86, 96),				/* vGPIO */
-	ADL_GPP(4, 87, 94, 128),			/* vGPIO_0 */
+	INTEL_GPP(0, 0, 24, 0),				/* GPP_I */
+	INTEL_GPP(1, 25, 47, 32),			/* GPP_R */
+	INTEL_GPP(2, 48, 59, 64),			/* GPP_J */
+	INTEL_GPP(3, 60, 86, 96),			/* vGPIO */
+	INTEL_GPP(4, 87, 94, 128),			/* vGPIO_0 */
 };
 
 static const struct intel_padgroup adls_community1_gpps[] = {
-	ADL_GPP(0, 95, 118, 160),			/* GPP_B */
-	ADL_GPP(1, 119, 126, 192),			/* GPP_G */
-	ADL_GPP(2, 127, 150, 224),			/* GPP_H */
+	INTEL_GPP(0, 95, 118, 160),			/* GPP_B */
+	INTEL_GPP(1, 119, 126, 192),			/* GPP_G */
+	INTEL_GPP(2, 127, 150, 224),			/* GPP_H */
 };
 
 static const struct intel_padgroup adls_community3_gpps[] = {
-	ADL_GPP(0, 151, 159, INTEL_GPIO_BASE_NOMAP),	/* SPI0 */
-	ADL_GPP(1, 160, 175, 256),			/* GPP_A */
-	ADL_GPP(2, 176, 199, 288),			/* GPP_C */
+	INTEL_GPP(0, 151, 159, INTEL_GPIO_BASE_NOMAP),	/* SPI0 */
+	INTEL_GPP(1, 160, 175, 256),			/* GPP_A */
+	INTEL_GPP(2, 176, 199, 288),			/* GPP_C */
 };
 
 static const struct intel_padgroup adls_community4_gpps[] = {
-	ADL_GPP(0, 200, 207, 320),			/* GPP_S */
-	ADL_GPP(1, 208, 230, 352),			/* GPP_E */
-	ADL_GPP(2, 231, 245, 384),			/* GPP_K */
-	ADL_GPP(3, 246, 269, 416),			/* GPP_F */
+	INTEL_GPP(0, 200, 207, 320),			/* GPP_S */
+	INTEL_GPP(1, 208, 230, 352),			/* GPP_E */
+	INTEL_GPP(2, 231, 245, 384),			/* GPP_K */
+	INTEL_GPP(3, 246, 269, 416),			/* GPP_F */
 };
 
 static const struct intel_padgroup adls_community5_gpps[] = {
-	ADL_GPP(0, 270, 294, 448),			/* GPP_D */
-	ADL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	INTEL_GPP(0, 270, 294, 448),			/* GPP_D */
+	INTEL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
 };
 
 static const struct intel_community adls_communities[] = {
-- 
2.50.1


