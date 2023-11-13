Return-Path: <linux-gpio+bounces-62-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3057E9CE2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 14:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F29280D06
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Nov 2023 13:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED451E524;
	Mon, 13 Nov 2023 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVXHOBgb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959501F60A
	for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2023 13:16:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A332A171A;
	Mon, 13 Nov 2023 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699881380; x=1731417380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aKYkLQ60x1KnWYEBMDdCZzSTS/+78cy9Ut9qwrapwDw=;
  b=PVXHOBgb+6b5NIfC0hFmx0NrJPbsD7oIDXBglqvYtssatpDnnDBTTpQl
   AFtIRxdWBe6HYsDWmd6kmIuqusvRS6JzXlrGH6J8+JbYPuCiRo6aEI9lD
   IwM+QtEnzIOaoJm365i4FSEDsvvLAaEzn1TUaSQSvv+k24/luwZQHwQX0
   SbrwogojwWwC4MkfJrjHnVWAqs4T19LWScdBF0BMP421o0BZaJMLkdOnn
   WaomKQbwRDsUOP3L4VIAcgS9/oBVQK3OBPSBJ4S9fkuo2UFQAkwM5Tddr
   2htrlyKd/pVm/ByPf0gd3xzmy/Xo2JHj1h2yUVPuTcdxRfYLD5v45fl9T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="454726918"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="454726918"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="5649419"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2023 05:16:17 -0800
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
Subject: [PATCH v1 3/3] gpio: tangier: unexport suspend/resume handles
Date: Mon, 13 Nov 2023 18:46:00 +0530
Message-Id: <20231113131600.10828-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231113131600.10828-1-raag.jadav@intel.com>
References: <20231113131600.10828-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Unexport suspend/resume handles for the lack of external users and while
at it, make them static, so that they can be discarded by the compiler
if not used (CONFIG_PM_SLEEP=n).

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpio/gpio-tangier.c | 6 ++----
 drivers/gpio/gpio-tangier.h | 3 ---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index 52d0868476e1..158fa9054e9c 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -478,7 +478,7 @@ int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio)
 }
 EXPORT_SYMBOL_NS_GPL(devm_tng_gpio_probe, GPIO_TANGIER);
 
-int tng_gpio_suspend(struct device *dev)
+static int tng_gpio_suspend(struct device *dev)
 {
 	struct tng_gpio *priv = dev_get_drvdata(dev);
 	struct tng_gpio_context *ctx = priv->ctx;
@@ -503,9 +503,8 @@ int tng_gpio_suspend(struct device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(tng_gpio_suspend, GPIO_TANGIER);
 
-int tng_gpio_resume(struct device *dev)
+static int tng_gpio_resume(struct device *dev)
 {
 	struct tng_gpio *priv = dev_get_drvdata(dev);
 	struct tng_gpio_context *ctx = priv->ctx;
@@ -530,7 +529,6 @@ int tng_gpio_resume(struct device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(tng_gpio_resume, GPIO_TANGIER);
 
 EXPORT_NS_GPL_SIMPLE_DEV_PM_OPS(tng_gpio_pm_ops, tng_gpio_suspend, tng_gpio_resume, GPIO_TANGIER);
 
diff --git a/drivers/gpio/gpio-tangier.h b/drivers/gpio/gpio-tangier.h
index 333e5f79b908..ca7ab6cf6fa5 100644
--- a/drivers/gpio/gpio-tangier.h
+++ b/drivers/gpio/gpio-tangier.h
@@ -112,9 +112,6 @@ struct tng_gpio {
 
 int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio);
 
-int tng_gpio_suspend(struct device *dev);
-int tng_gpio_resume(struct device *dev);
-
 extern const struct dev_pm_ops tng_gpio_pm_ops;
 
 #endif /* _GPIO_TANGIER_H_ */
-- 
2.17.1


