Return-Path: <linux-gpio+bounces-13291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD99D9C63
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25E331662C1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE581DDC3C;
	Tue, 26 Nov 2024 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSIZi8RI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0F1DC720;
	Tue, 26 Nov 2024 17:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641778; cv=none; b=qLhACSBQ3mY7lkwm1C2MmO/HkvHSLuw9Xe2ko/sOTpHlJ8+oZ4ZsBS43uSX/x4/cHW3qJ1r3jmJ+cFpfVEU1se5UUg96oVskC20dLlnZEHiOqmK+kt8javxhm8vbMTJkRDb4kqLbKYeyFNaN69R5fEgffhao6ma2gaR+R4EoeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641778; c=relaxed/simple;
	bh=9qSDs2DhXJtTEGGKgTgmjQhtxSNlD5ksC3zvH9JONfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JxyvtoM12NFwF7n0muTdJ2YT5iTeI50LI+wRPswiINTmWhsasyb3Xa38c29Buu5Z2zTbQwAASd8XxlBRZGPIB/acWwoYEbV03m1D8GcykYLfRYfB1DKMrH2uNPiYik3E2kfEQ3Ivm9wxpUFw+deijw/GfjpdpcAK6ONocvDLaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSIZi8RI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641777; x=1764177777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9qSDs2DhXJtTEGGKgTgmjQhtxSNlD5ksC3zvH9JONfk=;
  b=dSIZi8RIYvjgVBNgkKTkorDOvjNH1r+waM/W1YzvQJVC0mHzLCkJ6acT
   J8j7cjHQJk+NU+KbenA3vMIz82o9HBkeJn12IYbDtUMG6oPPjWR//9pU+
   qBo3Vr6Ft9DmXhkbZGL9mT7T4VwiRHJ8xA2y3q5Y5DyOh8tjXTuQk89Bg
   2n1fQkkz+A3aSFXYq6BrpPkkuzWZQcHQx8tJZ/0euAUTJvxZrUuimbAsd
   hVp2ZZmDgPlUDFKeKX7yPwYzT6NQ6Jgie0NVwVGpIEbN31Sy/353gRQ4E
   lP5N+LBhTwdsBIvpRGDQhL2A1LfUoZG3QDC9QKiV0q2jPOfyg/PfBJbGH
   w==;
X-CSE-ConnectionGUID: DIuoBMgNTeacDM7kf3jn6w==
X-CSE-MsgGUID: Hru7lU/eTLWAG5vSpoPQDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312970"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:56 -0800
X-CSE-ConnectionGUID: U0NSgnahTAig5s/BYIjRSQ==
X-CSE-MsgGUID: 8RHzaKPXS1ylxZP+cJGspg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730577"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:52 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 3E7101CADD;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 36CCD1600124; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	dmitry.torokhov@gmail.com,
	broonie@kernel.org,
	pierre-louis.bossart@linux.dev
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/6] pinctrl: tangier: use devm_kmemdup_array()
Date: Tue, 26 Nov 2024 22:52:37 +0530
Message-Id: <20241126172240.6044-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241126172240.6044-1-raag.jadav@intel.com>
References: <20241126172240.6044-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to use devm_kmemdup_array() which is more robust.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/pinctrl/intel/pinctrl-tangier.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-tangier.c b/drivers/pinctrl/intel/pinctrl-tangier.c
index 2cb0b4758269..305547100baa 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.c
+++ b/drivers/pinctrl/intel/pinctrl-tangier.c
@@ -524,7 +524,6 @@ static int tng_pinctrl_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct tng_family *families;
 	struct tng_pinctrl *tp;
-	size_t families_len;
 	void __iomem *regs;
 	unsigned int i;
 
@@ -543,8 +542,8 @@ static int tng_pinctrl_probe(struct platform_device *pdev,
 	 * Make a copy of the families which we can use to hold pointers
 	 * to the registers.
 	 */
-	families_len = size_mul(sizeof(*families), tp->nfamilies);
-	families = devm_kmemdup(dev, tp->families, families_len, GFP_KERNEL);
+	families = devm_kmemdup_array(dev, tp->families, tp->nfamilies,
+				      sizeof(*families), GFP_KERNEL);
 	if (!families)
 		return -ENOMEM;
 
-- 
2.35.3


