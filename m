Return-Path: <linux-gpio+bounces-9588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8449688E7
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 15:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFEBA1C21AB1
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 13:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622862139CD;
	Mon,  2 Sep 2024 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqRR+hu1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EF21019D;
	Mon,  2 Sep 2024 13:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283927; cv=none; b=LS8ZV7X8ALhuKnKt5pRYMSsHkM/UO2Wknclvn520pVTWXfvUKu8upKpq0toL7cmRZuG0vgrsIA+boRIwMl8V5erXQeOgYkYbgl9pxhv+wJFzLPRLa1Iv0AVfHx0u+FuBHB/C3n9URmoMqCYniMLz5+15Wt3QIWStGtNjS6V22WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283927; c=relaxed/simple;
	bh=sarn8u6DMiqscknv9atERVdrT9dOoz1FqQ1plDaPSJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDx+Z4OfSXv9ei70vS9wZImRW7+Jqes/nyBZkCifAowSOF/GVaf/AnEGUOOzYruLZhTI0+n4HEBpcLcdwKtOFzRRCmrZMW3EhDdeA/EaNrS8jkK5mg9SbKEm8r4+9Zkt5FHAxnr+0m6q457tgtJmue5/bRyXhRcfKUXCxOkpvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqRR+hu1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725283926; x=1756819926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sarn8u6DMiqscknv9atERVdrT9dOoz1FqQ1plDaPSJQ=;
  b=DqRR+hu1Ap9aYL7fGCnk+ZjSXUvWgLffUDpHwUFue83OvtGSXxeMwZhO
   twjzS9qe8wgBkF3RZnwB4gC/k3bM+nwktslbDvsdR4pCWQ++OE6OFwzes
   4ymVv/zVcgr6PUHvRYDivNiV83kINWYZCACcE5+DR8abSrxxpDCisGmpY
   +n/jO8QmVg5XtawlUqsaF18G99kIl0BnbGaUsnRlVvtTQQVdXVYM1d9pP
   vT2e/IJjAu+a4s6JoMo8dqEQwGsKjqgWJLaxQ3YTSE93t+0Vjz7eKA8Kc
   1UvILQshgzMVwUGfY3wgF87ykrea+E3UGizO9/fRDwsphYfBU7ySvnlLK
   Q==;
X-CSE-ConnectionGUID: /Eu4W7FNQJ6Eo1WiESx9Lw==
X-CSE-MsgGUID: qVSpoCK+SKKwCMs1DFwXDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35022556"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35022556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 06:32:02 -0700
X-CSE-ConnectionGUID: hqDPdlbRRteXWf3gwuVu5A==
X-CSE-MsgGUID: qV7iHiwEQIOGNMeFdrM7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="65114777"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2024 06:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 570F348C; Mon, 02 Sep 2024 16:31:58 +0300 (EEST)
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
Subject: [PATCH v1 3/5] gpio: stmpe: Utilise temporary variable for struct device
Date: Mon,  2 Sep 2024 16:30:42 +0300
Message-ID: <20240902133148.2569486-4-andriy.shevchenko@linux.intel.com>
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

We have a temporary variable to keep a pointer to struct device.
Utilise it where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-stmpe.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 99f1482b2ab3..7f2911c478ea 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -464,17 +464,17 @@ static void stmpe_gpio_disable(void *stmpe)
 static int stmpe_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *np = pdev->dev.of_node;
+	struct stmpe *stmpe = dev_get_drvdata(dev->parent);
+	struct device_node *np = dev->of_node;
 	struct stmpe_gpio *stmpe_gpio;
 	int ret, irq;
 
 	if (stmpe->num_gpios > MAX_GPIOS) {
-		dev_err(&pdev->dev, "Need to increase maximum GPIO number\n");
+		dev_err(dev, "Need to increase maximum GPIO number\n");
 		return -EINVAL;
 	}
 
-	stmpe_gpio = devm_kzalloc(&pdev->dev, sizeof(*stmpe_gpio), GFP_KERNEL);
+	stmpe_gpio = devm_kzalloc(dev, sizeof(*stmpe_gpio), GFP_KERNEL);
 	if (!stmpe_gpio)
 		return -ENOMEM;
 
@@ -483,7 +483,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	stmpe_gpio->stmpe = stmpe;
 	stmpe_gpio->chip = template_chip;
 	stmpe_gpio->chip.ngpio = stmpe->num_gpios;
-	stmpe_gpio->chip.parent = &pdev->dev;
+	stmpe_gpio->chip.parent = dev;
 	stmpe_gpio->chip.base = -1;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
@@ -496,7 +496,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(&pdev->dev, stmpe_gpio_disable, stmpe);
+	ret = devm_add_action_or_reset(dev, stmpe_gpio_disable, stmpe);
 	if (ret)
 		return ret;
 
@@ -504,9 +504,8 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		struct gpio_irq_chip *girq;
 
-		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
-				stmpe_gpio_irq, IRQF_ONESHOT,
-				"stmpe-gpio", stmpe_gpio);
+		ret = devm_request_threaded_irq(dev, irq, NULL, stmpe_gpio_irq,
+						IRQF_ONESHOT, "stmpe-gpio", stmpe_gpio);
 		if (ret)
 			return dev_err_probe(dev, ret, "unable to register IRQ handler\n");
 
@@ -522,7 +521,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 		girq->init_valid_mask = stmpe_init_irq_valid_mask;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &stmpe_gpio->chip, stmpe_gpio);
+	return devm_gpiochip_add_data(dev, &stmpe_gpio->chip, stmpe_gpio);
 }
 
 static struct platform_driver stmpe_gpio_driver = {
-- 
2.43.0.rc1.1336.g36b5255a03ac


