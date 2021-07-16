Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 438813CB589
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 12:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235960AbhGPKEP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 06:04:15 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:62523 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235924AbhGPKEO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 06:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429680; x=1657965680;
  h=from:to:cc:subject:date:message-id;
  bh=F1cMTiNyQduiloL/5dWdJQEDHdYQ/LRfnmH7Jh4T0/M=;
  b=eQfX9uEHPiudeUk6IzuAG6WQkpeRKJqiWecFDH6EgVGk0BWh0mvHi8GN
   3GEwPczoXiSCTvtS+xNsNq7z04d/sZ1JjzC+TnylOiU8D7xcjDBychbVM
   T/dbuc6Aeh4Gw5mU/HYQMegjtJMWMn5aKBv+utbvI4UT8PVj5eAR8q5L3
   dC+TedqCCnV1gBJjLWTR+FedCUnw/fgBmt6Dm1IZRjqTUHldw+RZrEm2o
   2sFH/Xo/PT8Ko5PfOVXHE28TcRgPVXliHi2dGQhIC1Tm2ssv495VYtil/
   gk9E+ZospYME5vMP+V+Lnx9B59JA/sYvXfJowg4gOieJGP/IrSB3xEjMt
   w==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492066"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 12:01:18 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 12:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626429678; x=1657965678;
  h=from:to:cc:subject:date:message-id;
  bh=F1cMTiNyQduiloL/5dWdJQEDHdYQ/LRfnmH7Jh4T0/M=;
  b=HbAwckYomkxY90VV1sc9vWta7Ry+3p4M6Ojt0LeldkqPLRo1BDx1fciI
   lN+lzeT+5rU+DM8p2JIbW0bwslRFSN+OagY9zfQELxYdJ6dyhPo3u+2Dl
   UF79aCSh1qDwzq+J7QTd6DEEbWD2yvIO3Wv+qiWyDssDiDgZs9ETZ8cST
   6epDmouRJMF/Ji8jIUJwXBlQ50APB9edh0k9vn6IidXjDh4/WTQ+XmSXy
   Zv2cA768eeUjtDOiQJhINuHlatyLHHSdBn4lAVtOyN7omW9Pv9FctSeVU
   LvQqpd34vrgD2klt4zOuzXv6mV8LxAn6BXgWSIGzUx/zLPYbTcVDPhttc
   g==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18492065"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 12:01:18 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id EA886280075;
        Fri, 16 Jul 2021 12:01:17 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v3 1/7] gpio: tqmx86: really make IRQ optional
Date:   Fri, 16 Jul 2021 12:00:47 +0200
Message-Id: <34be64092b7b4d0c75085a8c729f5f6fcfb56b61.1626429286.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
causes warnings with newer kernels.

Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
missing IRQ properly.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---

v2: add Fixes line
v3: no changes

 drivers/gpio/gpio-tqmx86.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 5022e0ad0fae..0f5d17f343f1 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -238,8 +238,8 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret, irq;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq < 0 && irq != -ENXIO)
 		return irq;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -278,7 +278,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	if (irq) {
+	if (irq > 0) {
 		struct irq_chip *irq_chip = &gpio->irq_chip;
 		u8 irq_status;
 
-- 
2.17.1

