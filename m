Return-Path: <linux-gpio+bounces-28031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE349C31B70
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 16:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76ECC3ACD37
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244D8333738;
	Tue,  4 Nov 2025 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6yxe5Mo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9832E73A;
	Tue,  4 Nov 2025 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268304; cv=none; b=dlIcLEA6EFLnC9a1R5ulAktNELEkQ08qoe9jzpoIn9uZBlJmePn8zJIzz/8JJ1XmbUBPWaiAqUWkKNZNYILuxzLo/VJ0VF1I1lKC2Ccg8/oiYoKIRp61XI3Lhnk5JTTkVJAUhDkXrk8yxyuwTdhRHZLavY1ZvpxoxLdJzj8GfXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268304; c=relaxed/simple;
	bh=V/a8BaAKJhCUGYuXolbLDKWldl6q6263ihLX4KvSAVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SoFDxkTL0vHRmZyh6Pyh1lEiHrmyGUDTZ03Eh5z3YteqNOetRd58GL8CiWdz2t/43n88Ptp8Lw56iyYuLv9zigixvhweETgUtvnWrztySCicV3wrJKq7u+vvUHsYPagR4K3qb4Zyo0cAz3kj0P08XossmvpFq0Vc1dzhaq84M60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6yxe5Mo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762268302; x=1793804302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V/a8BaAKJhCUGYuXolbLDKWldl6q6263ihLX4KvSAVc=;
  b=V6yxe5MoRyT9Lb8NVJAUQU9XqeetY7yw5//XM09XxxEkDaVOwNoUYFpm
   CumpT13btq8tCnzN+z70Sv+zMeg+1J4j8OrVEv7Sypi6rXKH6SV/KC16/
   SoMaRFhyLqSOelXvzxgI8jKoOW76+apSMLwAXGuYlfDAumgjxF/dRF+bz
   pKSvxbFT76wh5UDmaUzblQi7UmhCBBGrlKiIb4cfQuX0+D04s6fDukRVm
   CN74/ijPPk3ugZ+DV2zJvre3Qhu619zUkn6JoSfvQhM2CcPdRCtILXNYy
   hE2pthNU9CqVkJrHg1r9cnIeigqKsW8m0ECJ0pdib+zzFSlETisbPbcbV
   w==;
X-CSE-ConnectionGUID: QfVscxYNTv6cpGGSe05kMA==
X-CSE-MsgGUID: ApnEiU6YRxC74UUMxYSthw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51933794"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="51933794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:58:21 -0800
X-CSE-ConnectionGUID: WtWlbygsRsST9xbkWLUrCw==
X-CSE-MsgGUID: FZVGghYbR5ictR/OBIGfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186863944"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 06:58:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EB9189D; Tue, 04 Nov 2025 15:58:16 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 08/10] pinctrl: meteorpoint: Switch to INTEL_GPP() macro
Date: Tue,  4 Nov 2025 15:56:42 +0100
Message-ID: <20251104145814.1018867-9-andriy.shevchenko@linux.intel.com>
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
 drivers/pinctrl/intel/pinctrl-meteorpoint.c | 46 +++++++++------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-meteorpoint.c b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
index ab46ac5f3b15..b7858c2b2c5c 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
@@ -21,14 +21,6 @@
 #define MTP_GPI_IS	0x200
 #define MTP_GPI_IE	0x220
 
-#define MTP_GPP(r, s, e, g)				\
-	{						\
-		.reg_num = (r),				\
-		.base = (s),				\
-		.size = ((e) - (s) + 1),		\
-		.gpio_base = (g),			\
-	}
-
 #define MTP_COMMUNITY(b, s, e, g)			\
 	INTEL_COMMUNITY_GPPS(b, s, e, g, MTP)
 
@@ -395,37 +387,37 @@ static const struct pinctrl_pin_desc mtps_pins[] = {
 };
 
 static const struct intel_padgroup mtps_community0_gpps[] = {
-	MTP_GPP(0, 0, 24, 0),		/* GPP_D */
-	MTP_GPP(1, 25, 38, 32),		/* GPP_R */
-	MTP_GPP(2, 39, 56, 64),		/* GPP_J */
-	MTP_GPP(3, 57, 87, 96),		/* vGPIO */
+	INTEL_GPP(0, 0, 24, 0),		/* GPP_D */
+	INTEL_GPP(1, 25, 38, 32),	/* GPP_R */
+	INTEL_GPP(2, 39, 56, 64),	/* GPP_J */
+	INTEL_GPP(3, 57, 87, 96),	/* vGPIO */
 };
 
 static const struct intel_padgroup mtps_community1_gpps[] = {
-	MTP_GPP(0, 88, 102, 128),	/* GPP_A */
-	MTP_GPP(1, 103, 114, 160),	/* DIR_ESPI */
-	MTP_GPP(2, 115, 136, 192),	/* GPP_B */
+	INTEL_GPP(0, 88, 102, 128),	/* GPP_A */
+	INTEL_GPP(1, 103, 114, 160),	/* DIR_ESPI */
+	INTEL_GPP(2, 115, 136, 192),	/* GPP_B */
 };
 
 static const struct intel_padgroup mtps_community3_gpps[] = {
-	MTP_GPP(0, 137, 145, 224),	/* SPI0 */
-	MTP_GPP(1, 146, 169, 256),	/* GPP_C */
-	MTP_GPP(2, 170, 189, 288),	/* GPP_H */
-	MTP_GPP(3, 190, 193, 320),	/* vGPIO_3 */
-	MTP_GPP(4, 194, 201, 352),	/* vGPIO_0 */
-	MTP_GPP(5, 202, 232, 384),	/* vGPIO_4 */
+	INTEL_GPP(0, 137, 145, 224),	/* SPI0 */
+	INTEL_GPP(1, 146, 169, 256),	/* GPP_C */
+	INTEL_GPP(2, 170, 189, 288),	/* GPP_H */
+	INTEL_GPP(3, 190, 193, 320),	/* vGPIO_3 */
+	INTEL_GPP(4, 194, 201, 352),	/* vGPIO_0 */
+	INTEL_GPP(5, 202, 232, 384),	/* vGPIO_4 */
 };
 
 static const struct intel_padgroup mtps_community4_gpps[] = {
-	MTP_GPP(0, 233, 240, 416),	/* GPP_S */
-	MTP_GPP(1, 241, 263, 448),	/* GPP_E */
-	MTP_GPP(2, 264, 277, 480),	/* GPP_K */
-	MTP_GPP(3, 278, 301, 512),	/* GPP_F */
+	INTEL_GPP(0, 233, 240, 416),	/* GPP_S */
+	INTEL_GPP(1, 241, 263, 448),	/* GPP_E */
+	INTEL_GPP(2, 264, 277, 480),	/* GPP_K */
+	INTEL_GPP(3, 278, 301, 512),	/* GPP_F */
 };
 
 static const struct intel_padgroup mtps_community5_gpps[] = {
-	MTP_GPP(0, 302, 322, 544),	/* GPP_I */
-	MTP_GPP(1, 323, 338, 576),	/* JTAG_CPU */
+	INTEL_GPP(0, 302, 322, 544),	/* GPP_I */
+	INTEL_GPP(1, 323, 338, 576),	/* JTAG_CPU */
 };
 
 static const struct intel_community mtps_communities[] = {
-- 
2.50.1


