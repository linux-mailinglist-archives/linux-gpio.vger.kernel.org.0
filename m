Return-Path: <linux-gpio+bounces-9674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718C96A33A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9D431C23796
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A6D188A08;
	Tue,  3 Sep 2024 15:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeccBDcV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E83A1E492;
	Tue,  3 Sep 2024 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378499; cv=none; b=NDFud1KdZJWSYy5QLlW29Pz/FmQDwLWHmJFUdQ1p1qT+ZrTWC4U+K5wCErZucEwIaFX9W8mkFx+MXuUfi7El5sQzwhTfFRTkhvRdS2ciX5/iLeyRE/A4h8nW7ogK8vqTWXrZ4nBn98L99QI3rhRy6jdJROsgvwZWMFOWg/HiX3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378499; c=relaxed/simple;
	bh=mHodSV3xioRI39Wwv+Ql0YTtiQAzSTQ32PxYoucNwzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GH/Z+tl2Q4nByszjuc0of+Y9us3EVVjUEb9I9SRuZLY8yJP6/VTsUQWxq87OSApbKw4ww37zFcv3Y9egnEZpSmUGwoW6WrbA48/GRWhR10GE0Ldo7n8Z/7ab2XhYDJk9fdPbIsiqyzFQSHCdaS0CEbGCsLxlYlUReQ5sl6q/Z0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeccBDcV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725378497; x=1756914497;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mHodSV3xioRI39Wwv+Ql0YTtiQAzSTQ32PxYoucNwzE=;
  b=AeccBDcV9YrJh54eQDzuGWjri7x4CQ2h59mplXTTr9Fb6cHD6fMkP4XE
   dtiTmbVfMZYCmdCltHCjw/kP7c2hmZllozGOEWFPPcNKfthuk40uwW+HS
   KEvDR3d5k3PAizqEjaPoV5pFuJU37QZp7U4SBEayPBJBUcSmzLPyEkAG9
   0YIYj49RHbtu12b1Ogxb8pbh6SaB8kAD+fA2sykrEYSWGKBWW3UDJHTHZ
   EVDgRkXxDWWmQuFmE7qUc6J+KavyykWXboC6y1cPYS2HqHTNY3oLRsRA0
   +jFpquhGawNS5adpkGVoBu0rCeBw1xLqFJeGVM3FhfopnFQ6bjYtnVj4S
   w==;
X-CSE-ConnectionGUID: /uLK4j1STLqo6Pic6iKVlA==
X-CSE-MsgGUID: Lo3MoLy1Qf6kVDwtnOU7SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13348023"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="13348023"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:47:59 -0700
X-CSE-ConnectionGUID: 7zM06NTTTCKywPQieFKqzA==
X-CSE-MsgGUID: 2c5kyVAoS/eHTvZmd/nPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65464055"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2024 08:47:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 294B63C1; Tue, 03 Sep 2024 18:47:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: baytrail: Drop duplicate return statement
Date: Tue,  3 Sep 2024 18:47:55 +0300
Message-ID: <20240903154755.3460442-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to repeat 'return ret;' inside and outside conditional.
Just use one outside conditional for both cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 6dab0316715b..ad6a5e7157ee 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1535,10 +1535,8 @@ static int byt_gpio_probe(struct intel_pinctrl *vg)
 	}
 
 	ret = devm_gpiochip_add_data(vg->dev, gc, vg);
-	if (ret) {
+	if (ret)
 		dev_err(vg->dev, "failed adding byt-gpio chip\n");
-		return ret;
-	}
 
 	return ret;
 }
-- 
2.43.0.rc1.1336.g36b5255a03ac


