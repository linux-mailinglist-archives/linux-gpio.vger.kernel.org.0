Return-Path: <linux-gpio+bounces-9010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4E095C0FA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 00:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD038B213C4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37A41D173D;
	Thu, 22 Aug 2024 22:41:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0017555
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366496; cv=none; b=RAL6HVRQ/9gcxj8Db9jtd1k1QPBMv/WKK9SQlza3F9TkXLKqmUboveoidUOpXJTrdftKg7JJgpi+qL3tzSNF6edetMbGz13n/BseCxCVj4+DhdYRnxBx5z8UP97Nmg8q8Zbqqs5enZnF0CQHq1ZKGdNnDBkX3liaAiWdZI+r0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366496; c=relaxed/simple;
	bh=ah2LQoFi9t8cBQbN1fxOwFCAfVp/BobnJB+H+Ga9H7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gMnvo8ZpdUDHrBHlGdC3aWHUF7RUiurx1w2TlW1QM+dvuNMWfhLcpwgRx6GCVpPKUr9EDhfWNEhd/onNJUIzmXxAPRYVB5hxwSuuthWTDiC7yzllhoNk+bxIWifeBsF6UjsjiSu9y91fLxih75lMHC/jA+fFMOX7Vu3lU37227g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id ad8c4d70-60d7-11ef-8eb9-005056bdf889;
	Fri, 23 Aug 2024 01:41:32 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: msc313: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:41:30 +0300
Message-ID: <20240822224130.706564-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is a IRQ domain specific implementation of
of_fwnode_handle(). Replace the former with more suitable API.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/gpio/gpio-msc313.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 2f448eb23abb..6db9e469e0dc 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -3,13 +3,14 @@
 
 #include <linux/bitops.h>
 #include <linux/kernel.h>
-#include <linux/types.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/types.h>
 
 #include <dt-bindings/gpio/msc313-gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -662,7 +663,7 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 
 	gpioirqchip = &gpiochip->irq;
 	gpio_irq_chip_set_chip(gpioirqchip, &msc313_gpio_irqchip);
-	gpioirqchip->fwnode = of_node_to_fwnode(dev->of_node);
+	gpioirqchip->fwnode = dev_fwnode(dev);
 	gpioirqchip->parent_domain = parent_domain;
 	gpioirqchip->child_to_parent_hwirq = msc313e_gpio_child_to_parent_hwirq;
 	gpioirqchip->populate_parent_alloc_arg = msc313_gpio_populate_parent_fwspec;
-- 
2.46.0


