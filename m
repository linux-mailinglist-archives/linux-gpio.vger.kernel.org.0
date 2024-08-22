Return-Path: <linux-gpio+bounces-9011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5C95C11B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 00:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7951C232B4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 22:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA1D1D1F58;
	Thu, 22 Aug 2024 22:47:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03C218130D
	for <linux-gpio@vger.kernel.org>; Thu, 22 Aug 2024 22:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724366862; cv=none; b=Kwl67bvetUpZ2a8hi2M521QCOHc4wCWDf3S86mYrpOgcUsTsndDYs7V7cRSJk0RvEIFj0jx0AOmKlYSfxERPCgKdXXxmC/7ApHoBWyWKBVsekzjW9jnm4T7qqr+LaTZwqhAGfs3gbIP0z3IX5fUY/MwAZMAN5tzrqJ5IAC5GAfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724366862; c=relaxed/simple;
	bh=1rMKw9UC6oo+REg5Z8MwVw2U7Asv5iEsjJzJB6Xcj8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJG/oKWcdRJoLjYGebc1EmrvdR4TzbI8M2LuPXcdcoILX3Q2Cl3xwy7vXewIg/1bGyNIrKZPcRpcUhT621oyI6uwRbmalMUPxl1BkTngFE5RBnLcozg9DlWqd5nyLtjQ+gFzlYa4tFdo9rl5uglFjJqErFACRtnMB/tBVW/Sp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 883d3ed8-60d8-11ef-822f-005056bdfda7;
	Fri, 23 Aug 2024 01:47:38 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Prathamesh Shete <pshete@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] gpio: tegra186: Replace of_node_to_fwnode() with more suitable API
Date: Fri, 23 Aug 2024 01:47:37 +0300
Message-ID: <20240822224737.706870-1-andy.shevchenko@gmail.com>
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
 drivers/gpio/gpio-tegra186.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9130c691a2dd..1ecb733a5e88 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/seq_file.h>
 
 #include <dt-bindings/gpio/tegra186-gpio.h>
@@ -928,7 +929,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	irq = &gpio->gpio.irq;
 	gpio_irq_chip_set_chip(irq, &tegra186_gpio_irq_chip);
-	irq->fwnode = of_node_to_fwnode(pdev->dev.of_node);
+	irq->fwnode = dev_fwnode(&pdev->dev);
 	irq->child_to_parent_hwirq = tegra186_gpio_child_to_parent_hwirq;
 	irq->populate_parent_alloc_arg = tegra186_gpio_populate_parent_fwspec;
 	irq->child_offset_to_irq = tegra186_gpio_child_offset_to_irq;
-- 
2.46.0


