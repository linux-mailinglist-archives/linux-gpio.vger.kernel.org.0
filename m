Return-Path: <linux-gpio+bounces-9587-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA09688E4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39681286207
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEFA2101AC;
	Mon,  2 Sep 2024 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBkBq1Kr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933BC20FABF;
	Mon,  2 Sep 2024 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283926; cv=none; b=sC9zDkFBbJRmffTxcCk2o8u0mQVq9PGixfFQqA5dXItn9bTdcIBILhhiJZ2k247YtYRIHfB410XSx1SLjQkMv0YI1i4sT9IBm4W0enxQcyE1dZ9Q59OMq5T/2NBa5w5u9uLN/taH8TD7WfMDNsq3gOLXAQ+1Df4N4xhcizk97o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283926; c=relaxed/simple;
	bh=TOdIiE5tZOppfGkiAtqdeQ7Xsi+hc/W2Ft00cv2eZik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZA4fEynh4okpy1pFIlNY/TsqmGELQnwNE3Qt6okZxrly6h1/TZHPDen0gwxj3HD44KukPNPu3KmAAzQpgJOZJYgtpSOU+eFONVMgNPBH8GICglAotbfuh/L3UOjDKSO+PfUQybgxgSqGDiB1jDjQ0Rsl8/1+TYzoQc+xDGnEPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBkBq1Kr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725283925; x=1756819925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TOdIiE5tZOppfGkiAtqdeQ7Xsi+hc/W2Ft00cv2eZik=;
  b=hBkBq1Krkm6+6VRWl1cXu5kg9ziFu3NmUXaLAQ2nM8dVHQAjpGXBhtHi
   +bb9kZwT/9ACLDs5q9CndTAFSAiEOgBG8H1ygnQgr534aeCBmadxZITuB
   lfGLSpCljkrHavDVgnkdl+DuidZAJrS+TTbtqUKhlLiMU5huzAvWrpejx
   IomAqkijdA38hOpBQZHkxOLf2lL67A2Bkw0L1CmCLM0rt3bbrgGl6gv8r
   11fGPekP1b1/xkAHkdxo2VL8E4TOVNj2jjuHK2I2ojHxzbjE/uwFqs02T
   hg+LLdPQ/8hvCynGL8tCB48aYWQ2Bjlw7hEAbj+udgZt5GuzSii9pWWdS
   w==;
X-CSE-ConnectionGUID: X1yRjw/QSpKQ8Boh8iyxZQ==
X-CSE-MsgGUID: NnRiflPqTyyieNH/ZEWOsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022580"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35022580"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: UdwefpfjQBKyswgyCVLfIA==
X-CSE-MsgGUID: VvLoTozcSb+WvrB1eDpLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65114780"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3FDD8233; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 1/5] gpio: stmpe: Fix IRQ related error messages
Date: Mon,  2 Sep 2024 16:30:40 +0300
Message-ID: <20240902133148.2569486-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, remove duplicate message that platform_get_irq()
does already print. Second, correct the error message when unable
to register a handler, which is broken in two ways:
1) the misleading 'get' vs. 'register';
2) missing '\n' at the end.

(Yes, for the curious ones, the dev_*() cases do not require '\n'
and issue it automatically, but it's better to have them explicit)

Fix all this here.

Fixes: 1882e769362b ("gpio: stmpe: Simplify with dev_err_probe()")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index abd42a975b09..4e171f9075bf 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -464,6 +464,7 @@ static void stmpe_gpio_disable(void *stmpe)
 
 static int stmpe_gpio_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct stmpe_gpio *stmpe_gpio;
@@ -493,12 +494,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	of_property_read_u32(np, "st,norequest-mask",
 			&stmpe_gpio->norequest_mask);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		dev_info(&pdev->dev,
-			"device configured in no-irq mode: "
-			"irqs are not available\n");
-
 	ret = stmpe_enable(stmpe, STMPE_BLOCK_GPIO);
 	if (ret)
 		return ret;
@@ -507,6 +502,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
@@ -514,8 +510,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 				stmpe_gpio_irq, IRQF_ONESHOT,
 				"stmpe-gpio", stmpe_gpio);
 		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "unable to get irq");
+			return dev_err_probe(dev, ret, "unable to register IRQ handler\n");
 
 		girq = &stmpe_gpio->chip.irq;
 		gpio_irq_chip_set_chip(girq, &stmpe_gpio_irq_chip);
-- 
2.43.0.rc1.1336.g36b5255a03ac


