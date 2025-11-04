Return-Path: <linux-gpio+bounces-28030-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE455C31AFB
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC02C189992F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07966333732;
	Tue,  4 Nov 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRVj5+LZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F92332907;
	Tue,  4 Nov 2025 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268304; cv=none; b=Jr+VHDZRqD6HBR1Z1mI8s/Q4Xk7P052yYIQ4B8qgIOot6umKCpIe6g3YwrA4vr56Y+OQUtKy58CVaOjXZtx5fM/1Y8ayunqA0acGHjMFqjSDcuVevqW/hLRZdyeywEqCTLINRKMvuyuKTfp7+JETFq65hJMWOB2TtzNl2k0qtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268304; c=relaxed/simple;
	bh=ePyCxv9YyjGONhtM+37JCQ/VfrQw5o+yIIyjxtOjJB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IcRKj9sSM2tOijUs2G54UTwoV4qMXRqg24YN9w9b6+nCSDlAw/v81w25+Z9Iwy59JIAtLa3ONmB4Ky8YdpJiSr5e2rPpd3eOoeYZheLX1Fiy27kDgzwxBkSmkxo84H/wlVNQaQSXwa6nBzFidl0NpDKDoHtR8zSTNKLEfe79GG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRVj5+LZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268302; x=1793804302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePyCxv9YyjGONhtM+37JCQ/VfrQw5o+yIIyjxtOjJB4=;
  b=nRVj5+LZYuGnl0T3WbuQt/r2a55B6iS9197DLprZgxJCmh9UC6wxEUwS
   AHAYKTtMsi2OtXk/SK+4CzBrXPYwjNhA/LmsElE0GYi7ic0zw5jGP/UxZ
   /2QNiMkCTgNlyOxGafKxUy7ZZ0Rcr0mIqkG0c2NMAtGC6NxWFnGZFyZ+P
   xBvGcbFjM6gQaikdtl4oFUItffVPiMDmp2R96KMKMeZ38DM/+VP99Xoi5
   ftW/bvwYgCmNBDZ5E999p0CYBwaZs7Lq3DFmYwEBWF6QTN+KoycMt4F0T
   KjJcYO2egVKbkfL5d2DNgNKj6Ne7Xs4guQN5y7DOZYgg20kkpYSeiJyMd
   Q==;
X-CSE-ConnectionGUID: pSOauAeURqG4rjG8xClpng==
X-CSE-MsgGUID: hyzCGasJTHq86NtDDTNTkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81770097"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="81770097"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:21 -0800
X-CSE-ConnectionGUID: RfANfWqWQCiv5vTgBTRw7A==
X-CSE-MsgGUID: DJUbvA4DSWGhPQ+9NM9TVg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2025 06:58:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DDFF79A; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 05/10] pinctrl: jasperlake: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:39 +0100
Message-ID: <20251104145814.1018867-6-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-jasperlake.c | 34 +++++++++-------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-jasperlake.c b/drivers/pinctrl/intel/pinctrl-jasperlake.c
index aef0e7f92154..c6e1836c69a7 100644
--- a/drivers/pinctrl/intel/pinctrl-jasperlake.c
+++ b/drivers/pinctrl/intel/pinctrl-jasperlake.c
@@ -21,14 +21,6 @@
 #define JSL_GPI_IS	0x100
 #define JSL_GPI_IE	0x120
 
-#define JSL_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define JSL_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, JSL)
 
@@ -283,28 +275,28 @@ static const struct pinctrl_pin_desc jsl_pins[] = {
 };
 
 static const struct intel_padgroup jsl_community0_gpps[] = {
-	JSL_GPP(0, 0, 19, 320),				/* GPP_F */
-	JSL_GPP(1, 20, 28, INTEL_GPIO_BASE_NOMAP),	/* SPI */
-	JSL_GPP(2, 29, 54, 32),				/* GPP_B */
-	JSL_GPP(3, 55, 75, 64),				/* GPP_A */
-	JSL_GPP(4, 76, 83, 96),				/* GPP_S */
-	JSL_GPP(5, 84, 91, 128),			/* GPP_R */
+	INTEL_GPP(0, 0, 19, 320),			/* GPP_F */
+	INTEL_GPP(1, 20, 28, INTEL_GPIO_BASE_NOMAP),	/* SPI */
+	INTEL_GPP(2, 29, 54, 32),			/* GPP_B */
+	INTEL_GPP(3, 55, 75, 64),			/* GPP_A */
+	INTEL_GPP(4, 76, 83, 96),			/* GPP_S */
+	INTEL_GPP(5, 84, 91, 128),			/* GPP_R */
 };
 
 static const struct intel_padgroup jsl_community1_gpps[] = {
-	JSL_GPP(0, 92, 115, 160),			/* GPP_H */
-	JSL_GPP(1, 116, 141, 192),			/* GPP_D */
-	JSL_GPP(2, 142, 170, 224),			/* vGPIO */
-	JSL_GPP(3, 171, 194, 256),			/* GPP_C */
+	INTEL_GPP(0, 92, 115, 160),			/* GPP_H */
+	INTEL_GPP(1, 116, 141, 192),			/* GPP_D */
+	INTEL_GPP(2, 142, 170, 224),			/* vGPIO */
+	INTEL_GPP(3, 171, 194, 256),			/* GPP_C */
 };
 
 static const struct intel_padgroup jsl_community4_gpps[] = {
-	JSL_GPP(0, 195, 200, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
-	JSL_GPP(1, 201, 224, 288),			/* GPP_E */
+	INTEL_GPP(0, 195, 200, INTEL_GPIO_BASE_NOMAP),	/* HVCMOS */
+	INTEL_GPP(1, 201, 224, 288),			/* GPP_E */
 };
 
 static const struct intel_padgroup jsl_community5_gpps[] = {
-	JSL_GPP(0, 225, 232, INTEL_GPIO_BASE_ZERO),	/* GPP_G */
+	INTEL_GPP(0, 225, 232, INTEL_GPIO_BASE_ZERO),	/* GPP_G */
 };
 
 static const struct intel_community jsl_communities[] = {
-- 
2.50.1


