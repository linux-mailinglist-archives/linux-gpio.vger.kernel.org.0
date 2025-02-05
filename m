Return-Path: <linux-gpio+bounces-15382-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6060A28715
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A566B1882898
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3C322D4EB;
	Wed,  5 Feb 2025 09:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOBSc6fZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD47322B8B9;
	Wed,  5 Feb 2025 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749183; cv=none; b=mDYCjCrry7BhFQpUx4+QDEsTaqyxxeOW8jQxiwMioCBRDYqSzR3TDi+HIfP4NbVpRYobewvkRp/nul4+P6Y+wk6uyu9w7UV0ZWwsAzf7k1rzafr9CBDOCc8aaEbRF5gLLF2g2D5gbW2eYh94K01m8hrA2C9dQ/1fvukecnwGfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749183; c=relaxed/simple;
	bh=WIStjLvfgR5ngbR7mouxyJ0bpHzXhBGse4C094h8aY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoIdecT6B+yOOucLlzGSndYm+Rb5Egt1PeK03YHYebthllKwP6wUNsdFA4VV5fyuk57z81Sc80E/J9tMTNQuvTM/2gn4FRKcgb2NG1BG8tAVvwV4xIfOzwIJvwqsxKbUgfjWKGaNTMYf3mi99NSkTlrXxUwlrl6SKrhF0oIPEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOBSc6fZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738749178; x=1770285178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WIStjLvfgR5ngbR7mouxyJ0bpHzXhBGse4C094h8aY4=;
  b=iOBSc6fZ2utxcAhd9IQgTASwQdIf/5Toq0YSn1mGsxJAQXZm9XUaUhxf
   3YNFul1/YodSjf5+0SjswcwbO2w1NSFo8KztedK3wxygYpaakg5RxIaKs
   XrgM3BxHvW5WUNjl86+mzn2RR4D4oxNPUNtdLYR/i8oIjvtl5wBMN+vcA
   DiwBKl/aNDkqQsgVgIevCSK9ubJ90LC1AxpdfIzKl8TnSe3fj8aHa9vaO
   KijlL9yI8cgrlgf+T+V3MtDTedmemH8q7PEHfVV7yy9Dgs0Hnn3BmfCBT
   +zS746T6dUSrv/YNVSS+4bzzYI7KRNfMyXPdfJPsxGS3u87STT47GHv+h
   w==;
X-CSE-ConnectionGUID: 0uyPO9LvQYm0qctissNoEQ==
X-CSE-MsgGUID: rKN5enXiSYee/gCHDPywpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49922067"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49922067"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:52:51 -0800
X-CSE-ConnectionGUID: 5Y8xcylkQxeuqFPLRcHp6g==
X-CSE-MsgGUID: S+kweudCT0a5uxdkaXxqjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="115822426"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 01:52:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E7B9957C; Wed, 05 Feb 2025 11:52:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 06/10] pinctrl: cy8c95x0: Initialise boolean variable with boolean values
Date: Wed,  5 Feb 2025 11:51:16 +0200
Message-ID: <20250205095243.512292-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
References: <20250205095243.512292-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'ret' variable in cy8c95x0_irq_handler() is defined as bool,
but is intialised with integers. Avoid implicit castings and
initialise boolean variable with boolean values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 19f92ec83871..7e79f20f4d78 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1076,7 +1076,7 @@ static irqreturn_t cy8c95x0_irq_handler(int irq, void *devid)
 	if (!ret)
 		return IRQ_RETVAL(0);
 
-	ret = 0;
+	ret = false;
 	for_each_set_bit(level, pending, MAX_LINE) {
 		/* Already accounted for 4bit gap in GPort2 */
 		nested_irq = irq_find_mapping(gc->irq.domain, level);
@@ -1095,7 +1095,7 @@ static irqreturn_t cy8c95x0_irq_handler(int irq, void *devid)
 		else
 			handle_nested_irq(nested_irq);
 
-		ret = 1;
+		ret = true;
 	}
 
 	return IRQ_RETVAL(ret);
-- 
2.43.0.rc1.1336.g36b5255a03ac


