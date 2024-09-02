Return-Path: <linux-gpio+bounces-9584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5C9688DF
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08AB285F08
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5988920FABE;
	Mon,  2 Sep 2024 13:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuGjUvO1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8E20FAA8;
	Mon,  2 Sep 2024 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283924; cv=none; b=n53Vr4SCrTF8Z6obIgriq7clStRiqloTl0ZonD8DjagaSnhOj0vgw1H2a4jakkM1IJfjwIx6NPznyYXx/c/JYlm+vWxRcCESrDfEDwyrMHZndOoAwxc9l98a4/FM+4F6SE9Ri8nYw2mNjXzvBGTd0Tf2GCZlxGJS8NnZGeyykqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283924; c=relaxed/simple;
	bh=f+HzvJdgV9PfmdoJ0kwbhBMaeKBv9YJV29ZR+z0+n+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnjOPoRb8MS1K3/dz8zbQtRC1IgVn5NDH2hqdqHm8U+Y/bux7JzDtsy1AsgDsO6gIWVBmozAKc2pQjMrbuOLsej1SVblQ2Mvf3b/p5cj1blhCvt5Ze6zgrtVdFNTOGs56vFoOEqkEbvWXa80KGjiepIcW6qDuJDW+Q53ZyYi3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuGjUvO1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725283923; x=1756819923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f+HzvJdgV9PfmdoJ0kwbhBMaeKBv9YJV29ZR+z0+n+c=;
  b=EuGjUvO1Zq1nqB+iF7Qcz+QIN7F5AmbdNyNvMtHCcYKnpJOakRgCNOwR
   16r2QyO2twtjG5BBiC38Q8663nPPYIRiv4Jviecz9In9hdpjug5KaFXN/
   lUflovU371tBPiUUMfy5QAOOqv0eX6bTVJkJDrYmvaa3DR/TuMdFnNJOx
   Ga+kSnQziSTHO+i/8seb7ACSzdipuyCa5+yWaHi2jU+ydLGdPv2Vgml2H
   rnS8Q8hmp5nta1zeM7qFVpqUv22ZBsHWWaHneNH+oC2d1hBqywKPucxLH
   QpyImzzxzXuNtlBHpfeD8/vSbFjS3kZnXB9FQTW6RIa7Wr43A/PaHc0HF
   Q==;
X-CSE-ConnectionGUID: OQtHJ33hST+AlAUeithEhQ==
X-CSE-MsgGUID: d11JgbAoTL+y5IzsCd5klg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022566"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35022566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: 8M/PgchhQveOGHNJhOHeFw==
X-CSE-MsgGUID: 6hIwSaeFQmqwfnCItnBdhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65114778"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 669EC48D; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
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
Subject: [PATCH v1 4/5] gpio: stmpe: Make use of device properties
Date: Mon,  2 Sep 2024 16:30:43 +0300
Message-ID: <20240902133148.2569486-5-andriy.shevchenko@linux.intel.com>
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

Convert the module to be property provider agnostic and allow
it to be used on non-OF platforms.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 7f2911c478ea..c1fb06925e09 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -11,8 +11,8 @@
 #include <linux/slab.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
-#include <linux/of.h>
 #include <linux/mfd/stmpe.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
 #include <linux/bitops.h>
 
@@ -465,7 +465,6 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stmpe *stmpe = dev_get_drvdata(dev->parent);
-	struct device_node *np = dev->of_node;
 	struct stmpe_gpio *stmpe_gpio;
 	int ret, irq;
 
@@ -489,8 +488,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
                 stmpe_gpio->chip.dbg_show = stmpe_dbg_show;
 
-	of_property_read_u32(np, "st,norequest-mask",
-			&stmpe_gpio->norequest_mask);
+	device_property_read_u32(dev, "st,norequest-mask", &stmpe_gpio->norequest_mask);
 
 	ret = stmpe_enable(stmpe, STMPE_BLOCK_GPIO);
 	if (ret)
-- 
2.43.0.rc1.1336.g36b5255a03ac


