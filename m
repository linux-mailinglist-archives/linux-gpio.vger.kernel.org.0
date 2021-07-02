Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765943BA04E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 14:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhGBM0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 08:26:39 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:42421 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232149AbhGBM0i (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Jul 2021 08:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228646; x=1656764646;
  h=from:to:cc:subject:date:message-id;
  bh=iThrbaf/3eOT5wm4rBD4w/ehi8bk8I/n0po1O+9VxAA=;
  b=a7FK0qODlUYVMsi/582+Zbi74lA80BNyj84YbizNk1jPhb3+HyC9nIEc
   loDIbnpJAATBwG2ByALjWbfykxoVY4AN+vfChf7Rdbk8M6P6RW4mTfF+M
   Oi04inE4dJHSeOjgOweu95LFwmzJJtsaoJ0NeSNuLXLKUED+aLvN+v63I
   ZmFjDmn9Sa5HBOUsE9pZKAY5qrphRXk0kiLNPa11YYDfm74b7JejMHjuL
   QESokQOjht1f2riOqeTTLiSLReC1cEXhdUXbUMnhMR7NFV/0Pk7WCkk6z
   KDT7ySoWrO+O15h5u+srG+a+C6+VKnmyCRRwa8zxcqFXPajfqKkaTCbjk
   w==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252568"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Jul 2021 14:24:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 02 Jul 2021 14:24:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 02 Jul 2021 14:24:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625228644; x=1656764644;
  h=from:to:cc:subject:date:message-id;
  bh=iThrbaf/3eOT5wm4rBD4w/ehi8bk8I/n0po1O+9VxAA=;
  b=HkWjLbjf7tJ+G8opwppg3jfX+4u/YwxFhEDePL+ThO4aDO0OxwWpN2rT
   cWBrPn/OqEzoXnBiq+vj3o0f92Hz8R73K4qb9ZhYedQYYZB4nrE++mftX
   ofjdhSGUuIygKWtPCb5XoQbtgCbW5ngb1HuknVhnZmPM7B2/kiZ6oy2z0
   2b2j5PafztpVej/M/AU7w0IFrTrLueuzeDol6GxJkWRiQYTXhnnpzfk1a
   tmIgeIgfhloox6mEbRnjuMmogOdSdK/zCsB/Xg/Ka17Tp2/a9ta4T/iFf
   1T6VBcgujN/AgWysji4/y5P/cPiX/tbcFm2eCIrzAZRDl6tdhn7ZA13QZ
   g==;
X-IronPort-AV: E=Sophos;i="5.83,317,1616454000"; 
   d="scan'208";a="18252567"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Jul 2021 14:24:04 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 76F79280075;
        Fri,  2 Jul 2021 14:24:04 +0200 (CEST)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/7] gpio: tqmx86: really make IRQ optional
Date:   Fri,  2 Jul 2021 14:23:47 +0200
Message-Id: <aee1d5a46b75fcaf4c231ddaf221f9ac2538440d.1625227382.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
causes warnings with newer kernels.

Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
missing IRQ properly.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: add Fixes line

The "irq != -ENXIO" check can be removed again if
platform_get_irq_optional() is modified to return 0 when no IRQ is
found; the current code will work with both -ENXIO and 0 returns.


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

