Return-Path: <linux-gpio+bounces-9008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B92695C0ED
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 00:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DBC0B238FC
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827EE183CB7;
	Thu, 22 Aug 2024 22:33:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F71684AE
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366030; cv=none; b=etacoV3CZGV2S9DAaLKb3sRsREq1tvS77GnL29buLzb/z3ZCFKGfcNaYA3FtKomNL9/wnDQiPhnFKOFmpwDcbD5287g7FGHlKOVGIsQ5PM/IJfj1E1qqwBHzVQ8q7+e0l6fvDuQ5PXdKVcPBoLdvd4GGC/eqr8F9/u+6Mn5aXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366030; c=relaxed/simple;
	bh=FT0kKBJEilF9HFOA6nBNwFqpvbQ57ltoffU79H7w/7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=svXFl3/DwSXgzNjY7bKlSOXs1huhyWsLS+MLRd7u3DjU+Q7tfap8UjJZ6FcSzWWGv47i5/c4Vl5rX9i6m4L0RJf4OeQzXbR11ba9LNs4fcq7qakxXMjur1HNkw8L1H1ziPF8rPybtAlKF6LXE9soiGNmOtJJ4iugAdnyBjtI3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 941db896-60d6-11ef-8eb9-005056bdf889;
	Fri, 23 Aug 2024 01:33:40 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: ixp4xx: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:33:32 +0300
Message-ID: <20240822223332.705560-1-andy.shevchenko@gmail.com>
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
 drivers/gpio/gpio-ixp4xx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
index c5a9fa640566..28a8a6a8f05f 100644
--- a/drivers/gpio/gpio-ixp4xx.c
+++ b/drivers/gpio/gpio-ixp4xx.c
@@ -6,6 +6,7 @@
 // based on previous work and know-how from:
 // Deepak Saxena <dsaxena@plexity.net>
 
+#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -13,7 +14,7 @@
 #include <linux/irqchip.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
+#include <linux/property.h>
 
 #define IXP4XX_REG_GPOUT	0x00
 #define IXP4XX_REG_GPOE		0x04
@@ -53,16 +54,14 @@
 /**
  * struct ixp4xx_gpio - IXP4 GPIO state container
  * @dev: containing device for this instance
- * @fwnode: the fwnode for this GPIO chip
  * @gc: gpiochip for this instance
  * @base: remapped I/O-memory base
  * @irq_edge: Each bit represents an IRQ: 1: edge-triggered,
  * 0: level triggered
  */
 struct ixp4xx_gpio {
-	struct device *dev;
-	struct fwnode_handle *fwnode;
 	struct gpio_chip gc;
+	struct device *dev;
 	void __iomem *base;
 	unsigned long long irq_edge;
 };
@@ -237,7 +236,6 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 		dev_err(dev, "no IRQ parent domain\n");
 		return -ENODEV;
 	}
-	g->fwnode = of_node_to_fwnode(np);
 
 	/*
 	 * If either clock output is enabled explicitly in the device tree
@@ -322,7 +320,7 @@ static int ixp4xx_gpio_probe(struct platform_device *pdev)
 
 	girq = &g->gc.irq;
 	gpio_irq_chip_set_chip(girq, &ixp4xx_gpio_irqchip);
-	girq->fwnode = g->fwnode;
+	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = ixp4xx_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
-- 
2.46.0


