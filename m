Return-Path: <linux-gpio+bounces-9012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B595C124
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 00:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAEF91F24F6A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A571D173D;
	Thu, 22 Aug 2024 22:53:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD9F168488
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 22:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724367186; cv=none; b=K6xnbHtjH84f8X3SerdaMCL+IiS8lpRulGLomm7QYVr5bArG7UE7gRSQS9dTwMEhgxecfHGH3jRujiECnFz+RwEzKGYUnMDvDCJUvumPBYdmRr2HI8yV7g09TPsyzbBLvmOKhjCCSihwzpB3F6OGBbOVlDK67s0mILdK7GoeAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724367186; c=relaxed/simple;
	bh=bVTyzq9tWfmjf/QYtU8YKaBeMzUFCnU6edSPRSjWjgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHz2/GiVdCTxKTAdxASkb62qFCMO6gdbjqfSvxBVm1Ifo5C12Ey9MFFcBNuAPN4I8kw/vW+cEG0hkgLDylesY97I7ptEuuPNbtJ4LO463427P/edBvrI5zRwAU0JDUUAU4TWLU250hmrbqnxQVZ41lhF7J6paTF7zdI+CS6VR/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 493c4dce-60d9-11ef-ab99-005056bdd08f;
	Fri, 23 Aug 2024 01:53:02 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Richter <rric@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 1/1] gpio: thunderx: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:53:00 +0300
Message-ID: <20240822225300.707178-1-andy.shevchenko@gmail.com>
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
 drivers/gpio/gpio-thunderx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index 8521c6aacace..5b851e904c11 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 
 #define GPIO_RX_DAT	0x0
@@ -533,7 +534,7 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	chip->set_config = thunderx_gpio_set_config;
 	girq = &chip->irq;
 	gpio_irq_chip_set_chip(girq, &thunderx_gpio_irq_chip);
-	girq->fwnode = of_node_to_fwnode(dev->of_node);
+	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain =
 		irq_get_irq_data(txgpio->msix_entries[0].vector)->domain;
 	girq->child_to_parent_hwirq = thunderx_gpio_child_to_parent_hwirq;
@@ -549,7 +550,7 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	for (i = 0; i < ngpio; i++) {
 		struct irq_fwspec fwspec;
 
-		fwspec.fwnode = of_node_to_fwnode(dev->of_node);
+		fwspec.fwnode = dev_fwnode(dev);
 		fwspec.param_count = 2;
 		fwspec.param[0] = i;
 		fwspec.param[1] = IRQ_TYPE_NONE;
-- 
2.46.0


