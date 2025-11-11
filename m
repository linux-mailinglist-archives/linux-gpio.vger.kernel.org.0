Return-Path: <linux-gpio+bounces-28362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA6C4F8DB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 20:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 15B194F6779
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 19:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4942E7F1C;
	Tue, 11 Nov 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLp5t4sX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313D2E6CC4;
	Tue, 11 Nov 2025 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888340; cv=none; b=oy7CrJQtu5ZEiZ1JaOG23+2toCbgA7UiqawxqSqtWJvV8GJIGz1HL/F76ZnBhz5ORlPDM9+wOlxXac1izXVVj4zINvAmpGKJdnmdU/qwReb7DCW2X0QVc85L2rtwiMZ9eb7W0SYLgKogUuezpXonk00qQ/MXNcYuGV2UKyOl1Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888340; c=relaxed/simple;
	bh=mf4aN27BQ4yYu33h+39yZ+K4Sum6d+LtC2ozmowTP4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MY8q5Tr2SMxfEhxyXLiJv6x4Uou/4O0bWVVTRjOMmq2DmG82/y5YsJ2ZRseKrygef/gghf5K9Wpcm+1KZas7pcaSufmgTmDUCcPEMVH69ZY18Hep2NCnv4IU0Bka2EtLXDSLo6ucbEPmaDWvqDu0mJ3sY7HB7+b/9cGymtcs288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLp5t4sX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762888338; x=1794424338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mf4aN27BQ4yYu33h+39yZ+K4Sum6d+LtC2ozmowTP4I=;
  b=TLp5t4sXYxvZzbf2nx77zUrZLkScogiE0CjoaB+EITUMk3Wg2A5cIQKq
   CkT8JOsPd6jvM5GM67nsUfx7z46OzN2iImVSjnldQRQOwfYq6bUDYx3T0
   eixF+65EyG2IRQO9sYran3yA8knU7n49Ej1xim9yelHERqDndxKxHVbBO
   PO4N503zdaB3c+IPLms+Gm8pOaWYOAI4QN1cUWLGW3pZJWYLE/USmrK3G
   1m5dfRh6fq0BV2ulONl14dWO560Be3Ld7DztOeeuvgCTKW8w7iYVOl72P
   0kLD/GUEtj0+jRR56iPSw8YoXxDhFNEgANJKbO95xdzF2IgYifnmA1HA9
   g==;
X-CSE-ConnectionGUID: gv7SD7SNT8euMPpHn4QF8g==
X-CSE-MsgGUID: WVBEawugSNG674CjICzZqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64860907"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="64860907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:12:17 -0800
X-CSE-ConnectionGUID: bPdKA7BkR3u87WyGlsmsCQ==
X-CSE-MsgGUID: mQGXjtgtQB+9eYoIjUH8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="189000902"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 11 Nov 2025 11:12:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 04DF296; Tue, 11 Nov 2025 20:12:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/5] pinctrl: cedarfork: Switch to INTEL_GPP() macro
Date: Tue, 11 Nov 2025 20:10:25 +0100
Message-ID: <20251111191214.1378051-2-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-cedarfork.c | 37 +++++++++--------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cedarfork.c b/drivers/pinctrl/intel/pinctrl-cedarfork.c
index 2ce97abeb0e4..2916f7d90090 100644
--- a/drivers/pinctrl/intel/pinctrl-cedarfork.c
+++ b/drivers/pinctrl/intel/pinctrl-cedarfork.c
@@ -21,13 +21,6 @@
 #define CDF_GPI_IS	0x200
 #define CDF_GPI_IE	0x230
 
-#define CDF_GPP(r, s, e)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-	}
-
 #define CDF_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, CDF)
 
@@ -288,24 +281,24 @@ static const struct pinctrl_pin_desc cdf_pins[] = {
 };
 
 static const struct intel_padgroup cdf_community0_gpps[] = {
-	CDF_GPP(0, 0, 23),	/* WEST2 */
-	CDF_GPP(1, 24, 47),	/* WEST3 */
-	CDF_GPP(2, 48, 70),	/* WEST01 */
-	CDF_GPP(3, 71, 90),	/* WEST5 */
-	CDF_GPP(4, 91, 96),	/* WESTC */
-	CDF_GPP(5, 97, 101),	/* WESTC_DFX */
-	CDF_GPP(6, 102, 111),	/* WESTA */
-	CDF_GPP(7, 112, 123),	/* WESTB */
-	CDF_GPP(8, 124, 143),	/* WESTD */
-	CDF_GPP(9, 144, 144),	/* WESTD_PECI */
-	CDF_GPP(10, 145, 167),	/* WESTF */
+	INTEL_GPP(0, 0, 23, 0),		/* WEST2 */
+	INTEL_GPP(1, 24, 47, 24),	/* WEST3 */
+	INTEL_GPP(2, 48, 70, 48),	/* WEST01 */
+	INTEL_GPP(3, 71, 90, 71),	/* WEST5 */
+	INTEL_GPP(4, 91, 96, 91),	/* WESTC */
+	INTEL_GPP(5, 97, 101, 97),	/* WESTC_DFX */
+	INTEL_GPP(6, 102, 111, 102),	/* WESTA */
+	INTEL_GPP(7, 112, 123, 112),	/* WESTB */
+	INTEL_GPP(8, 124, 143, 124),	/* WESTD */
+	INTEL_GPP(9, 144, 144, 144),	/* WESTD_PECI */
+	INTEL_GPP(10, 145, 167, 145),	/* WESTF */
 };
 
 static const struct intel_padgroup cdf_community1_gpps[] = {
-	CDF_GPP(0, 168, 191),	/* EAST2 */
-	CDF_GPP(1, 192, 202),	/* EAST3 */
-	CDF_GPP(2, 203, 225),	/* EAST0 */
-	CDF_GPP(3, 226, 236),	/* EMMC */
+	INTEL_GPP(0, 168, 191, 168),	/* EAST2 */
+	INTEL_GPP(1, 192, 202, 192),	/* EAST3 */
+	INTEL_GPP(2, 203, 225, 203),	/* EAST0 */
+	INTEL_GPP(3, 226, 236, 226),	/* EMMC */
 };
 
 static const struct intel_community cdf_communities[] = {
-- 
2.50.1


