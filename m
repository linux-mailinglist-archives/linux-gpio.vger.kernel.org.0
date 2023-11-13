Return-Path: <linux-gpio+bounces-61-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2CF7E9CE0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:16:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B475A1F20FC4
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193951DFEA;
	Mon, 13 Nov 2023 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHj9hizD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F031E511
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5FF1724;
	Mon, 13 Nov 2023 05:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699881377; x=1731417377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cVMB2JEbcvllLrApb7yUV501OiVQ89spuRHP1dIfQB0=;
  b=MHj9hizDydxhMqNLgi0oM0+3rCZP+2ddYOI83bNt52QA3M9PK+1IcC38
   2QOdpTIb+l7lPIPrJGNdtWz+QlzKrMy8yF6O7LBXd2kioUu3SvRwR6PlU
   1muyvej7YuVkmsSOaxH+SiekOPMP8sOaHV8T3jAAlP8sjcjcATLOqnc3b
   TM7AFSoGm/rMKIUeaFojxQqPhlglTqq2tA43RXCDO182VqOWq5mB9/JoX
   qJcjY3WxcNrvbpcHFeAl4nSX9lVmsaTD/3yqyeqpDOOoYdm2zGlPar2R8
   6Xng2+wDNxKO9Zx+T8jUkRP4QJcj2W97hTsVpu5bC2t1KBX4uuU7OEBXh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454726910"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="454726910"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:16:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5649403"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2023 05:16:14 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mallikarjunappa.sangannavar@intel.com,
	bala.senthil@intel.com,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/3] gpio: elkhartlake: reuse pm_ops from Intel Tangier driver
Date: Mon, 13 Nov 2023 18:45:59 +0530
Message-Id: <20231113131600.10828-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231113131600.10828-1-raag.jadav@intel.com>
References: <20231113131600.10828-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Reuse tng_gpio_pm_ops from Intel Tangier driver instead of calling
them through a local copy.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpio/gpio-elkhartlake.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/gpio-elkhartlake.c
index a9c8b16215be..887c0fe99d39 100644
--- a/drivers/gpio/gpio-elkhartlake.c
+++ b/drivers/gpio/gpio-elkhartlake.c
@@ -55,18 +55,6 @@ static int ehl_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int ehl_gpio_suspend(struct device *dev)
-{
-	return tng_gpio_suspend(dev);
-}
-
-static int ehl_gpio_resume(struct device *dev)
-{
-	return tng_gpio_resume(dev);
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(ehl_gpio_pm_ops, ehl_gpio_suspend, ehl_gpio_resume);
-
 static const struct platform_device_id ehl_gpio_ids[] = {
 	{ "gpio-elkhartlake" },
 	{ }
@@ -76,7 +64,7 @@ MODULE_DEVICE_TABLE(platform, ehl_gpio_ids);
 static struct platform_driver ehl_gpio_driver = {
 	.driver	= {
 		.name	= "gpio-elkhartlake",
-		.pm	= pm_sleep_ptr(&ehl_gpio_pm_ops),
+		.pm	= pm_sleep_ptr(&tng_gpio_pm_ops),
 	},
 	.probe		= ehl_gpio_probe,
 	.id_table	= ehl_gpio_ids,
-- 
2.17.1


