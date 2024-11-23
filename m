Return-Path: <linux-gpio+bounces-13212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B89D6B63
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 21:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6081AB22800
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Nov 2024 20:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A3E1AAE39;
	Sat, 23 Nov 2024 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVls4Txp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF61A2C04;
	Sat, 23 Nov 2024 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732392372; cv=none; b=hynJHXyuW4OwLwpxgEEEAM932pC+RdDIG3pf7E7ODsVjJcPdkDH0mSQO/MaGDLeDkfVv5ciVybVUIj4kCI3YkJf+nGwCe6MUmWWDhHKLepZaglCQJsoB66WtXDvodhD23Omo155w8MU6kNwkZiJC+JoPs5UHnNP64uiLDa+Jdks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732392372; c=relaxed/simple;
	bh=6Tidakgtdfgzj7ArIO1jYC1ie3c1/PQNJd0mdhYzvBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DQl2dp9bj15JOYAR+/ZUmhMYttCJwr0TorV4R/Fi+cdHdjtP5UhoyoVvIX2Bf2Ne6mn3CwDAD5SrxGZUMKIYPD9HjSaio46Shi44QZhrYrHYmnyBZtgGalpgWvIk+jQ/7d11YFko53dAJ4+5FPvLyYj4hl/1XO4AZK8Ez9QjFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVls4Txp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732392371; x=1763928371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Tidakgtdfgzj7ArIO1jYC1ie3c1/PQNJd0mdhYzvBc=;
  b=ZVls4TxpWL9TOFkLWuavA58QCniCnFf1yoa8hOgbo5DSqZtnd0hy4cnv
   4A01qrhCp+cd1miramVWRWCbYG6l7Wa9Nrh6luy1oNaLOXuJlEB3o7j5s
   sOOjJ3XUEQ/Bx/4CB6USWRTWi1blLwhE4P3+laIXk4J7cAYVhokKQobQN
   cDepYdY9XfqU+ZJ/eTkgk25zK8yahfQF/Py1b9UBEDtmOPX9P8/p3dUW9
   Tz6VntDRgG/nXKR+bJsga+vx0IghkbV6fa5TQvWI2/4q/b+SOcqya36bH
   lwxX6quGPRwplw9WXcqJLmNPvGZOFXUAcYEkK+yJHTPCgFOmDDoiWkXxb
   w==;
X-CSE-ConnectionGUID: z1+T5w8pR6+qbw0ctwv01w==
X-CSE-MsgGUID: UzrV04f2SNaQHrnnJZHR6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32678568"
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="32678568"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 12:06:11 -0800
X-CSE-ConnectionGUID: gq5XiFlmQXaPSQXFGjj4Uw==
X-CSE-MsgGUID: GYw/XiXGRxuIzfgUMMrHPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,179,1728975600"; 
   d="scan'208";a="121738002"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2024 12:06:08 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 3179E1CAE1;
	Sun, 24 Nov 2024 01:36:03 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 00C2A1600110; Sun, 24 Nov 2024 01:36:02 +0530 (IST)
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
Subject: [PATCH v1 2/5] pinctrl: intel: copy communities using devm_kmemdup_array()
Date: Sun, 24 Nov 2024 01:35:24 +0530
Message-Id: <20241123200527.7830-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241123200527.7830-1-raag.jadav@intel.com>
References: <20241123200527.7830-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Copy communities using devm_kmemdup_array() instead of doing it manually.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 04b438f63ccb..e165bd5b5811 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1577,8 +1577,8 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 	 * to the registers.
 	 */
 	pctrl->ncommunities = pctrl->soc->ncommunities;
-	pctrl->communities = devm_kcalloc(dev, pctrl->ncommunities,
-					  sizeof(*pctrl->communities), GFP_KERNEL);
+	pctrl->communities = devm_kmemdup_array(dev, pctrl->soc->communities, pctrl->ncommunities,
+						sizeof(*pctrl->communities), GFP_KERNEL);
 	if (!pctrl->communities)
 		return -ENOMEM;
 
@@ -1588,8 +1588,6 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 		u32 offset;
 		u32 value;
 
-		*community = pctrl->soc->communities[i];
-
 		regs = devm_platform_ioremap_resource(pdev, community->barno);
 		if (IS_ERR(regs))
 			return PTR_ERR(regs);
-- 
2.35.3


