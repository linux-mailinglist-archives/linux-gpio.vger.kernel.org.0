Return-Path: <linux-gpio+bounces-28034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4EC31BAC
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 660FB4FE8D6
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 15:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC96E334C13;
	Tue,  4 Nov 2025 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmKNzxBe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F04332EC8;
	Tue,  4 Nov 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268307; cv=none; b=nxatwyMoUhkJX8JxO5mwi0UTI7MQu3vX2NU55QJ3sT9ZydQWEuGSYNQuqt7Wr/vbrhKHQ3kir6DedWegG+PYeUWDZLIZVm1S9E4QKnQYJTGIx4+MiDQIx1Y/1ix6cGDoqBp982o3uc0i4f9aWg3g/6/NauKNriHwM/+f6VmVz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268307; c=relaxed/simple;
	bh=dnYlcrntSTfSV4lmEvJsP3e4ZMlrBa8mS9x9H57G4gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tivqM7nsjA0fkTBwjzu7SZIFSBtAKumOfSlMCEjfMwm9pAaTs1tN2wkUX5VKFmwnC/tFxJu/QLZ3RwSFJD6KsGWpEKlCf8Nkyygp4Qkgjlb1fB2kvQMDwA0jYgZOxq/dOapl4akbdw1cHIXJkFPUrNXnHoKKthBGXc1I/7BQCos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmKNzxBe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268304; x=1793804304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dnYlcrntSTfSV4lmEvJsP3e4ZMlrBa8mS9x9H57G4gc=;
  b=BmKNzxBe0Lda+T8TLzI/Joj7eMg/Bg/iyi9E7Umf76ZGlW8EqBQC28/y
   CfwJ0aUgtdeUgrCNJU+euPuPVdkJ5jZxlx8OkN6zZZcdbGPZRFk5OIXhd
   lTN3LwkaWo6aT1QMRDvnG5UyhqFvN39QmL8t+ZGz2h7zeAtnwUJZRejhg
   qCvWVJ7RbiwUp6TrV58gVr1Ipt7XUccPgVr2uFkmwURiLIot/k3f6yXnN
   sSbFyX170nuyNJW9xb/F78e8Hj/1shv1rQzHpQAzfNiC1sc7uJMCOxSGE
   dmkkAjY5+NNGK0sp5iJ5lJYSDLWL29biDxPx5G9W1nh9MFQt7PRWBGsKR
   w==;
X-CSE-ConnectionGUID: wxa62fUBROyrG2DfmmfJwA==
X-CSE-MsgGUID: kzrcXT4kRTmK/K0rLM0EUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68222787"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="68222787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:22 -0800
X-CSE-ConnectionGUID: kzrvh/H9S/iE9qAWMSOFOQ==
X-CSE-MsgGUID: +wTxYo8TTuCfXt66vxw2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="217822669"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 06:58:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E71EA9C; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 07/10] pinctrl: meteorlake: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:41 +0100
Message-ID: <20251104145814.1018867-8-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-meteorlake.c | 54 +++++++++-------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index f564376ce437..b7395947569a 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -27,14 +27,6 @@
 #define MTL_S_GPI_IS		0x200
 #define MTL_S_GPI_IE		0x210
 
-#define MTL_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define MTL_P_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, MTL_P)
 
@@ -349,33 +341,33 @@ static const struct pinctrl_pin_desc mtlp_pins[] = {
 };
 
 static const struct intel_padgroup mtlp_community0_gpps[] = {
-	MTL_GPP(0, 0, 4, 0),		/* CPU */
-	MTL_GPP(1, 5, 28, 32),		/* GPP_V */
-	MTL_GPP(2, 29, 52, 64),		/* GPP_C */
+	INTEL_GPP(0, 0, 4, 0),		/* CPU */
+	INTEL_GPP(1, 5, 28, 32),	/* GPP_V */
+	INTEL_GPP(2, 29, 52, 64),	/* GPP_C */
 };
 
 static const struct intel_padgroup mtlp_community1_gpps[] = {
-	MTL_GPP(0, 53, 77, 96),		/* GPP_A */
-	MTL_GPP(1, 78, 102, 128),	/* GPP_E */
+	INTEL_GPP(0, 53, 77, 96),	/* GPP_A */
+	INTEL_GPP(1, 78, 102, 128),	/* GPP_E */
 };
 
 static const struct intel_padgroup mtlp_community3_gpps[] = {
-	MTL_GPP(0, 103, 128, 160),	/* GPP_H */
-	MTL_GPP(1, 129, 154, 192),	/* GPP_F */
-	MTL_GPP(2, 155, 169, 224),	/* SPI0 */
-	MTL_GPP(3, 170, 183, 256),	/* vGPIO_3 */
+	INTEL_GPP(0, 103, 128, 160),	/* GPP_H */
+	INTEL_GPP(1, 129, 154, 192),	/* GPP_F */
+	INTEL_GPP(2, 155, 169, 224),	/* SPI0 */
+	INTEL_GPP(3, 170, 183, 256),	/* vGPIO_3 */
 };
 
 static const struct intel_padgroup mtlp_community4_gpps[] = {
-	MTL_GPP(0, 184, 191, 288),	/* GPP_S */
-	MTL_GPP(1, 192, 203, 320),	/* JTAG */
+	INTEL_GPP(0, 184, 191, 288),	/* GPP_S */
+	INTEL_GPP(1, 192, 203, 320),	/* JTAG */
 };
 
 static const struct intel_padgroup mtlp_community5_gpps[] = {
-	MTL_GPP(0, 204, 228, 352),	/* GPP_B */
-	MTL_GPP(1, 229, 253, 384),	/* GPP_D */
-	MTL_GPP(2, 254, 285, 416),	/* vGPIO_0 */
-	MTL_GPP(3, 286, 288, 448),	/* vGPIO_1 */
+	INTEL_GPP(0, 204, 228, 352),	/* GPP_B */
+	INTEL_GPP(1, 229, 253, 384),	/* GPP_D */
+	INTEL_GPP(2, 254, 285, 416),	/* vGPIO_0 */
+	INTEL_GPP(3, 286, 288, 448),	/* vGPIO_1 */
 };
 
 static const struct intel_community mtlp_communities[] = {
@@ -554,20 +546,20 @@ static const struct pinctrl_pin_desc mtls_pins[] = {
 };
 
 static const struct intel_padgroup mtls_community0_gpps[] = {
-	MTL_GPP(0, 0, 27, 0),		/* GPP_A */
-	MTL_GPP(1, 28, 46, 32),		/* vGPIO_0 */
-	MTL_GPP(2, 47, 73, 64),		/* GPP_C */
+	INTEL_GPP(0, 0, 27, 0),		/* GPP_A */
+	INTEL_GPP(1, 28, 46, 32),	/* vGPIO_0 */
+	INTEL_GPP(2, 47, 73, 64),	/* GPP_C */
 };
 
 static const struct intel_padgroup mtls_community1_gpps[] = {
-	MTL_GPP(0, 74, 93, 96),		/* GPP_B */
-	MTL_GPP(1, 94, 95, 128),	/* vGPIO_3 */
-	MTL_GPP(2, 96, 119, 160),	/* GPP_D */
+	INTEL_GPP(0, 74, 93, 96),	/* GPP_B */
+	INTEL_GPP(1, 94, 95, 128),	/* vGPIO_3 */
+	INTEL_GPP(2, 96, 119, 160),	/* GPP_D */
 };
 
 static const struct intel_padgroup mtls_community3_gpps[] = {
-	MTL_GPP(0, 120, 135, 192),	/* JTAG_CPU */
-	MTL_GPP(1, 136, 147, 224),	/* vGPIO_4 */
+	INTEL_GPP(0, 120, 135, 192),	/* JTAG_CPU */
+	INTEL_GPP(1, 136, 147, 224),	/* vGPIO_4 */
 };
 
 static const struct intel_community mtls_communities[] = {
-- 
2.50.1


