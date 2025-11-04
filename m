Return-Path: <linux-gpio+bounces-28029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B61C31AF5
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B63A18992F5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF9B330D30;
	Tue,  4 Nov 2025 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eP42UUK7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0923328FC;
	Tue,  4 Nov 2025 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268304; cv=none; b=JUKHntI81D8afuI0RW0H4b7x5y6wqh9UyfHZUhbSBJseCz6+fCLLH803pXxpRxumff7npeUir6myo/vgpbMUxu/60Ao0stFZya7+A9fYN6zKRCUvvBkL7AGyCpoCpSE97V1F9LwCvUtgaau5vXFTTxRLLs++yHO9fRplotlDWyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268304; c=relaxed/simple;
	bh=yeurysAID7kvhi1Md4ZoKridBb+8ZAmwRpzGIu7vJY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0ush/evn9fDxG767VUuHwJeJjE8fQuy7DZ/4+Hv2FXh2Cgwsb73okjij/YWJ7+JNRsBaSOK4pv6XkBnGrc7/04nfpBpvd5ltaSU1Oc5d7kuIlzaNRGKsPkVoTLDpQRUZqK5TXRAQHcMCdkXlB0wTMyj5/JrK56ajcERXjySmiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eP42UUK7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268302; x=1793804302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yeurysAID7kvhi1Md4ZoKridBb+8ZAmwRpzGIu7vJY4=;
  b=eP42UUK7BMuXTfwgPrH5QMdH6ejE62J6bPIDPeJmx1vstr96hrYkldgt
   /76xDSGVbopxUCRwIUNk6avLBoUwW1VQwZ8HJzBMS8tWsNji9+QCvFIve
   4wY2KHz71WogsE6OltMsatcIIIBBSgDg+nWtEMcrGJo71o08MG8d+T4/R
   28mZSG2GqxGGnOP32nppE0J4Wy1oTHixSGu5esL8kyr2aUYVlwR8db8Ng
   y5cQhTImmUCaq5yWAD2L4Y7380cxQLMV0RrD2DCHW5rOkCho/qiVBsvGz
   pD3i/dK2edqc0tUhfO0SfpZozpCYroCQoGY5RbJdjIJ4mr1pF3SnKrFI/
   w==;
X-CSE-ConnectionGUID: DoZ1CKh3S2GMxIaFGcYSag==
X-CSE-MsgGUID: w/ysXyEYT3ab9TlxnqFT5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68018509"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="68018509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:22 -0800
X-CSE-ConnectionGUID: XJFELR9xQduE2r10EWAifw==
X-CSE-MsgGUID: 4mM+HpnZTcKdYJlwbsxJzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="192345117"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 06:58:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E24059B; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 06/10] pinctrl: lakefield: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:40 +0100
Message-ID: <20251104145814.1018867-7-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-lakefield.c | 26 ++++++++---------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-lakefield.c b/drivers/pinctrl/intel/pinctrl-lakefield.c
index 60281f421608..bfb8b565d15c 100644
--- a/drivers/pinctrl/intel/pinctrl-lakefield.c
+++ b/drivers/pinctrl/intel/pinctrl-lakefield.c
@@ -21,14 +21,6 @@
 #define LKF_GPI_IS	0x100
 #define LKF_GPI_IE	0x110
 
-#define LKF_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define LKF_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, LKF)
 
@@ -308,24 +300,24 @@ static const struct pinctrl_pin_desc lkf_pins[] = {
 };
 
 static const struct intel_padgroup lkf_community0_gpps[] = {
-	LKF_GPP(0, 0, 31, 0),		/* EAST_0 */
-	LKF_GPP(1, 32, 59, 32),		/* EAST_1 */
+	INTEL_GPP(0, 0, 31, 0),		/* EAST_0 */
+	INTEL_GPP(1, 32, 59, 32),	/* EAST_1 */
 };
 
 static const struct intel_padgroup lkf_community1_gpps[] = {
-	LKF_GPP(0, 60, 91, 64),		/* NORTHWEST_0 */
-	LKF_GPP(1, 92, 123, 96),	/* NORTHWEST_1 */
-	LKF_GPP(2, 124, 148, 128),	/* NORTHWEST_2 */
+	INTEL_GPP(0, 60, 91, 64),	/* NORTHWEST_0 */
+	INTEL_GPP(1, 92, 123, 96),	/* NORTHWEST_1 */
+	INTEL_GPP(2, 124, 148, 128),	/* NORTHWEST_2 */
 };
 
 static const struct intel_padgroup lkf_community2_gpps[] = {
-	LKF_GPP(0, 149, 180, 160),	/* WEST_0 */
-	LKF_GPP(1, 181, 212, 192),	/* WEST_1 */
-	LKF_GPP(2, 213, 237, 224),	/* WEST_2 */
+	INTEL_GPP(0, 149, 180, 160),	/* WEST_0 */
+	INTEL_GPP(1, 181, 212, 192),	/* WEST_1 */
+	INTEL_GPP(2, 213, 237, 224),	/* WEST_2 */
 };
 
 static const struct intel_padgroup lkf_community3_gpps[] = {
-	LKF_GPP(0, 238, 266, 256),	/* SOUTHEAST */
+	INTEL_GPP(0, 238, 266, 256),	/* SOUTHEAST */
 };
 
 static const struct intel_community lkf_communities[] = {
-- 
2.50.1


