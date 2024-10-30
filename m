Return-Path: <linux-gpio+bounces-12308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 842C39B67EB
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 16:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BBAB1F22175
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 15:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97922213EED;
	Wed, 30 Oct 2024 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BK4/xtV3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01B1F429A;
	Wed, 30 Oct 2024 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730302330; cv=none; b=X7K3is+USzYTE7oXSrfuerQGAszja9uoIDjuS/jC6e5tjF5ki73+3GjNBOukGxQv1W63DhhBdD3qTS74/pTG9zffYDIoj1v4msJjYGX4aN0w/Njtd6RAj5NOXjZYfa3IBJVTfXTvwdMLqsqMU227Edd5kzZoiLYQiCsMQNlUfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730302330; c=relaxed/simple;
	bh=XkRyR4vb8NiO1sAqWwgBmOjrmW7ZkuprxDvtvUi+zfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5tp3U54UUTBvqjoLSF7McSw4ASDmAHPN8o6g66GZnUyPsAtFMdjsr8iNglLgKnfdCeNzx3bVwDfuqqh0YrrW++rwfjIl5XR+hRFqMr5nIca4/aLDZbayvbFxBYaq02DdjckIPnAl7LKCVIX1RzYT26VMFLdUMvsyw877iB8DnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BK4/xtV3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730302329; x=1761838329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XkRyR4vb8NiO1sAqWwgBmOjrmW7ZkuprxDvtvUi+zfo=;
  b=BK4/xtV32e8up877BPnZB9ByNJMvlKmLkY1DtXQ3uXMB+Fl7CopYZVDY
   QTiet9SENkbn2wXXqmkSbGOafTfrOdoG8RpaFhjrkawgxtPLNBEaLFkmh
   mGHXpAVR0HHjtGmyx04FvFO0C3qU/SkHmHJWb0rsiubz4lDx1WIzH3mVP
   xgPjNI2DQRMFpCkfIUVjLmaQaFakGHMn1pZC5wK4qTS66Q9bAXBWYcdt1
   D/7Ez31wjIbtDuwUYhtrW0JbD7C9LCEyAer51GojzVg1rEi/zVwArdlqT
   /jyw316dcQQEqCRykMsFItxBzb9ZzTls42ZvrA0kDti65mhzn7JXhbdfR
   g==;
X-CSE-ConnectionGUID: nz9j6NUESZ2ZvIvqGAk/Lg==
X-CSE-MsgGUID: /U7oLxl/S8u4yDLXCA66JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33699860"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33699860"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:32:06 -0700
X-CSE-ConnectionGUID: hxoW5s/rRemcHwYTPSYtBw==
X-CSE-MsgGUID: wcDxARzQTJOMEig83mkuwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82514082"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 30 Oct 2024 08:32:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 873172A0; Wed, 30 Oct 2024 17:32:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mary Strodl <mstrodl@csh.rit.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/2] gpio: sloppy-logic-analyzer: Check for error code from devm_mutex_init() call
Date: Wed, 30 Oct 2024 17:30:27 +0200
Message-ID: <20241030153201.2078266-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
References: <20241030153201.2078266-1-andriy.shevchenko@linux.intel.com>
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


