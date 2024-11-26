Return-Path: <linux-gpio+bounces-13286-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819B9D9C57
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA7F284547
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B396B1DB52D;
	Tue, 26 Nov 2024 17:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3lPOEly"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DEC1AC8A6;
	Tue, 26 Nov 2024 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641774; cv=none; b=chtUWXHjidHR7nF6ZjaWWAyiVHJHDTZW2DI3c2iHPrzMpTGYYGG0PD+K2liUyAEq9DDpDai1UqmosMvgRrHORAXIz0WJXKYlFZ+O0FJwXHsqILb21i4gaNdSCMgaS01hCjzcQ8Ax3CzBh7rE5P6xFqEv1JAS0Nvk+qSc7sShEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641774; c=relaxed/simple;
	bh=6Tidakgtdfgzj7ArIO1jYC1ie3c1/PQNJd0mdhYzvBc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aGoQMnOpAehaCNxLRzvEHHnYzy1xkSR8dX+0Zw08r9KM0gdtIW8LQIJJDT4s8/plysQ/8QAbheTxcK1YAonlR15SulgR7/S6ZW05qsep2O2b75EyJFkXB9mjnjE4u7f/hW5OAx5n9EspBU6aXMYqm+iD4nPh0uLKvB/GCbeaVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3lPOEly; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641773; x=1764177773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Tidakgtdfgzj7ArIO1jYC1ie3c1/PQNJd0mdhYzvBc=;
  b=n3lPOElyiE6wLCUlNdo36XQGV0es/uSoqC+U+XwURTcPx1qbVjI3TZzZ
   W3RBBQGKjymNFrteTA7oQTPk777HpyHhOfVvnNMzO28tQGnjbZx1a7Npn
   fzznQqom1NPv4PuKzsnaZ4U4IODKbfuRqUlimGZe+EU6XUWmR4+bbfPMV
   I+tyS5hPv8otllRAScv77AUcjJe7WNTyXg4S3fwjP2oKo94pu5Xk2Wb7j
   rVmVZ/fV7iUVeYIMN7FihqVqu3JhgM5sSVR+4NQzGjXxTc1z7/GZd8GlM
   RztXb7w1MS/0L4LRYA7KcYjl7zOyx7Wa8w89BSlR7x86aHW0KxNWVwu4K
   A==;
X-CSE-ConnectionGUID: GffJNyGISWq3cTudwjrI7w==
X-CSE-MsgGUID: XZopSM0iQsqdT+ucQNErug==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312937"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312937"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:53 -0800
X-CSE-ConnectionGUID: gIkcqG14SgyFOerpmhkkkQ==
X-CSE-MsgGUID: FiJf5ZuJTju7+iTxJB69Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730555"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:49 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 3A1FD1CADA;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 3676F160011E; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
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
Subject: [PATCH v2 2/6] pinctrl: intel: copy communities using devm_kmemdup_array()
Date: Tue, 26 Nov 2024 22:52:36 +0530
Message-Id: <20241126172240.6044-3-raag.jadav@intel.com>
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


