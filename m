Return-Path: <linux-gpio+bounces-28364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A91C4F8CE
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 20:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E42BA3B535F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 19:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567C72FCC12;
	Tue, 11 Nov 2025 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHcvEx3S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4F22E92BA;
	Tue, 11 Nov 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762888342; cv=none; b=SU033ngWrYiuK9MUkFF4+Sr/yz2u4gAkD9M40MrE6L+klJn0XO1SONMx57ul7zfvUBfVgU5a6Vc9ySVLA+05ZCWldSELuEjkES3pv+ydYpKttg77hwf0Rf4HJ9JFX3fCjCZsDj/d2EbnPv61ZgvGSD5Mf9y1j1Hz1RyWX2Xh2MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762888342; c=relaxed/simple;
	bh=7OjPLN07ajVSwDmB1effsrEhrvHEPeDQA2M3/lWlMfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnub8VA1nAw+nuilAZdIhBQ8Uo6CsqyxjIevSB1shyepBz6PmbfW28QEkZgYY8oQ+pfAqtYmVhxBDjraDo7Ouv23mqjCu8kaqJApQnuk0zWH/uRVvLHsOar2RztALOZaD2SNoqmWZJm6k+LtuMpwnKVX/syOvsvoNy9HJLiIIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHcvEx3S; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762888340; x=1794424340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7OjPLN07ajVSwDmB1effsrEhrvHEPeDQA2M3/lWlMfo=;
  b=iHcvEx3SOBUDLqHimn20LrNIB19rMMC1bDLNZ99Uomo6r+IHldfXGEfx
   SRoeEVaR4mCG3ospqwqNT4caOXJKTOSAeveW8qaZwRsVv3OyDFnun7Z1L
   jUTyPY4gpdzHu6IAFQduepmdBYUlsyvBQzk5AcU7OHMs8KLsIqOlav/A0
   BNPxDU12Lqrt4dRONQ/hOsdU/hawMPJ1ZnywqjvSEXx/DG+8XaShe7gOM
   b+2YXnnezbh/ZX9gQe31eGrUJ45fiSk/vWkemZn/GrXbVlGerYjruRRBK
   gczC6oLkXIp6izRJPtLwvtyfzXuFn4pmg/295d3GNOo948duzfPrOKRt1
   g==;
X-CSE-ConnectionGUID: xDGhhx11Qum3X/cDpkpozg==
X-CSE-MsgGUID: Zr8trOgdT7+oPTBmlSxAOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90425956"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="90425956"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:12:17 -0800
X-CSE-ConnectionGUID: 8ASUBluHT+yG3xxvouo8OA==
X-CSE-MsgGUID: kMoI1FENQ+GfcxsPcPyluQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188334539"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 11 Nov 2025 11:12:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0953097; Tue, 11 Nov 2025 20:12:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/5] pinctrl: denverton: Switch to INTEL_GPP() macro
Date: Tue, 11 Nov 2025 20:10:26 +0100
Message-ID: <20251111191214.1378051-3-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-denverton.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index fef44c663be6..f492f73ba246 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -21,13 +21,6 @@
 #define DNV_GPI_IS	0x100
 #define DNV_GPI_IE	0x120
 
-#define DNV_GPP(n, s, e)				\
-	{						\
-		.reg_num = (n),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-	}
-
 #define DNV_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, DNV)
 
@@ -222,16 +215,16 @@ static const struct intel_function dnv_functions[] = {
 };
 
 static const struct intel_padgroup dnv_north_gpps[] = {
-	DNV_GPP(0, 0, 31),	/* North ALL_0 */
-	DNV_GPP(1, 32, 40),	/* North ALL_1 */
+	INTEL_GPP(0, 0, 31, 0),		/* North ALL_0 */
+	INTEL_GPP(1, 32, 40, 32),	/* North ALL_1 */
 };
 
 static const struct intel_padgroup dnv_south_gpps[] = {
-	DNV_GPP(0, 41, 58),	/* South DFX */
-	DNV_GPP(1, 59, 90),	/* South GPP0_0 */
-	DNV_GPP(2, 91, 111),	/* South GPP0_1 */
-	DNV_GPP(3, 112, 143),	/* South GPP1_0 */
-	DNV_GPP(4, 144, 153),	/* South GPP1_1 */
+	INTEL_GPP(0, 41, 58, 41),	/* South DFX */
+	INTEL_GPP(1, 59, 90, 59),	/* South GPP0_0 */
+	INTEL_GPP(2, 91, 111, 91),	/* South GPP0_1 */
+	INTEL_GPP(3, 112, 143, 112),	/* South GPP1_0 */
+	INTEL_GPP(4, 144, 153, 144),	/* South GPP1_1 */
 };
 
 static const struct intel_community dnv_communities[] = {
-- 
2.50.1


