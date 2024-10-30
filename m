Return-Path: <linux-gpio+bounces-12318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E679B6B2F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 18:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC73BB21444
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 17:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A960214424;
	Wed, 30 Oct 2024 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECapYbuW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9C1F4288;
	Wed, 30 Oct 2024 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730310102; cv=none; b=U8Otl4vD71oBywKELHcrPre77dhmOuFwurOCgsI+1MAKSSO7iz5mBUdEjkE6i9Pkw6p/xu18DgQT3/s9bflqIyoAEkgpvhruPqkxmL4HI+kpWjystdKDDKSrDty+yvOcvFHiOL3XajgWHX5lAI2BI2s5Z1XKONFPREQ08OE8KjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730310102; c=relaxed/simple;
	bh=1JhAr/qSbGl0+jJqHyFn53hwrLBBQ7z05YXmMWrbeaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGasDtluRPnmCy178psg+6OCiGH/gue9PnNHn12dGZP+IOVEHaKHtS/geuasWLJAFat7j844M5HeoOjW3nk96OLt70RwbDzhAQhVIbhSVO3WJMKwrVatgPndfwvtDbUchWbYH7dFc2dN3sY01HORvPLxEnTw/B99IveT5K8vAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECapYbuW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730310100; x=1761846100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1JhAr/qSbGl0+jJqHyFn53hwrLBBQ7z05YXmMWrbeaM=;
  b=ECapYbuWI9E5482nbU1yu9Wbbv7rUtA+pmCQg0I9GDTft661hZJ0JCu+
   5D3frqxpwdyoSxov9CmAsAm/hs8AFkWhNT/HsK2O0WDRhY6yykqcsV6Md
   u+RIPsJSFG4r56S4co7MOOzd16NVeOn82G5wqoW5tyq1grmqdl1xPRd9U
   0T8vmyxYvtb+d333W6qaObRFAfyfnkQJknwHi6rjVjT4863OMGpMNRNuj
   /gRvkjPnKt5LGYTVADXCQdwCI7EsjhHM9niv8kYtNU7GaSVmfiPaNNWWn
   Dj6pV41f5KujMY5rYvihhwBhHxw6DSIAssNPQCyHBLMXP6sPMrRyWbjJV
   A==;
X-CSE-ConnectionGUID: hrQNBKojQFyYsIZnNQJ9xA==
X-CSE-MsgGUID: PR+jjy+JTliY6CMEMxT5FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29446062"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="29446062"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 10:41:37 -0700
X-CSE-ConnectionGUID: 7kNOEoDKQ2Gg70LXNT/38A==
X-CSE-MsgGUID: iYZLfrOYRJae39aFxcW8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="119846377"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 10:41:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4AD162A0; Wed, 30 Oct 2024 19:41:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/2] gpio: sloppy-logic-analyzer: Check for error code from devm_mutex_init() call
Date: Wed, 30 Oct 2024 19:36:52 +0200
Message-ID: <20241030174132.2113286-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
References: <20241030174132.2113286-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if it's not critical, the avoidance of checking the error code
from devm_mutex_init() call today diminishes the point of using devm
variant of it. Tomorrow it may even leak something. Add the missed
check.

Fixes: 7828b7bbbf20 ("gpio: add sloppy logic analyzer using polling")
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-sloppy-logic-analyzer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 64f2ca4a72b2..8cf3b171c599 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -234,7 +234,9 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	devm_mutex_init(dev, &priv->blob_lock);
+	ret = devm_mutex_init(dev, &priv->blob_lock);
+	if (ret)
+		return ret;
 
 	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


