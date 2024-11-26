Return-Path: <linux-gpio+bounces-13289-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2289D9C5F
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 18:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357EC165E90
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 17:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11431DDA3F;
	Tue, 26 Nov 2024 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiGV+7tF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1241DC04B;
	Tue, 26 Nov 2024 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732641777; cv=none; b=V1mhw7xypDQjVRaHf70awcl9zDSI+sy4ykEZ8eAndxiH9shd8zTrNAUffx1BVL+9kqyiylVJlnV0pLSAfgoBCR7hmlvUU2fFkfCNzEJPmTUk7bRzB7jntCvdvqXLqXdyKN6JdQfEANY+jehPHEUE0TyE6wCe/7NEhbQHygq3bgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732641777; c=relaxed/simple;
	bh=UMESgxlu6dg0rI3zXwf63L7oJ9xxwpAQqZvdoZhqkuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dF7t3qk7BFxlzmpv5y+R4e6upkwBmcCvWK8AMQSjD/UVpQgIgPEz3oAQQ+Gq+glve6YuISwOdIC5yM7Lx7fjP2qr4yljtbBTTBFk0glYlEqmCaO2Hh3d7ynog8myUp3LyCUWm41REwolQ6JtBinDY4ANaHf4X1ORURZW3/XMMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=none smtp.mailfrom=ecsmtp.iind.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiGV+7tF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ecsmtp.iind.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732641777; x=1764177777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UMESgxlu6dg0rI3zXwf63L7oJ9xxwpAQqZvdoZhqkuE=;
  b=aiGV+7tFu1M62WnbgPemblIu9+u/Fy6PBHvpihRJy0ex8nmewbOpp+sZ
   ApEYJYvdMQd8bYujh1Dt7Zw68hBCWb1OpJ7J/n//bLXeZsyPN5qredVTH
   QV5A15lXDYp4oq7xQjLywyb7SuD1kFY/JH5n5sHipNEM4bhNKmvpqNXoY
   rMtSZODAQrY0fmdaJ6BrRKkdBBaKJhL9ySEaxjcZznQ4/b/ww7N5j7kfX
   sQDTpgtM+48aRssB/FsyblhnauyETvKbBzEbEiUD7vCqWlV1hUJbRFjNm
   M2ZWpDqqON9GKGri6Hew9QVV/DtxUyhYxzk65pbBnRMd6kDn/5ZI2dSLA
   A==;
X-CSE-ConnectionGUID: IR2mzrG1SAGGOxZuChk1iQ==
X-CSE-MsgGUID: cv2Fu/E6QqCIr3JP6jJAcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43312951"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43312951"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 09:22:53 -0800
X-CSE-ConnectionGUID: sEbO+bYwR7mQgRtJkql7+w==
X-CSE-MsgGUID: Kg/OWGVOTYWPG7nSCrJgpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96730559"
Received: from inesxmail01.iind.intel.com ([10.223.57.40])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 09:22:49 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
	by inesxmail01.iind.intel.com (Postfix) with ESMTP id 3C80C1CADC;
	Tue, 26 Nov 2024 22:52:48 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
	id 378BA1600125; Tue, 26 Nov 2024 22:52:48 +0530 (IST)
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
Subject: [PATCH v2 4/6] pinctrl: pxa2xx: use devm_kmemdup_array()
Date: Tue, 26 Nov 2024 22:52:38 +0530
Message-Id: <20241126172240.6044-5-raag.jadav@intel.com>
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
 drivers/pinctrl/pxa/pinctrl-pxa2xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
index 9e34b92ff5f2..9fd7a8fb2bc4 100644
--- a/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
+++ b/drivers/pinctrl/pxa/pinctrl-pxa2xx.c
@@ -281,9 +281,8 @@ static int pxa2xx_build_functions(struct pxa_pinctrl *pctl)
 		for (df = pctl->ppins[i].functions; df->name; df++)
 			if (!pxa2xx_find_function(pctl, df->name, functions))
 				(functions + pctl->nfuncs++)->name = df->name;
-	pctl->functions = devm_kmemdup(pctl->dev, functions,
-				       pctl->nfuncs * sizeof(*functions),
-				       GFP_KERNEL);
+	pctl->functions = devm_kmemdup_array(pctl->dev, functions, pctl->nfuncs,
+					     sizeof(*functions), GFP_KERNEL);
 	if (!pctl->functions)
 		return -ENOMEM;
 
@@ -314,7 +313,8 @@ static int pxa2xx_build_groups(struct pxa_pinctrl *pctl)
 						pctl->ppins[j].pin.name;
 		func = pctl->functions + i;
 		func->ngroups = ngroups;
-		func->groups = devm_kmemdup(pctl->dev, gtmp, ngroups * sizeof(*gtmp), GFP_KERNEL);
+		func->groups = devm_kmemdup_array(pctl->dev, gtmp, ngroups,
+						  sizeof(*gtmp), GFP_KERNEL);
 		if (!func->groups)
 			return -ENOMEM;
 	}
-- 
2.35.3


