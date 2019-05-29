Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83DE2D7DE
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 10:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfE2IbO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 04:31:14 -0400
Received: from inva021.nxp.com ([92.121.34.21]:60804 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbfE2IbO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 May 2019 04:31:14 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F2BF22011DC;
        Wed, 29 May 2019 10:31:10 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F8912011D2;
        Wed, 29 May 2019 10:31:05 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 10C44402CB;
        Wed, 29 May 2019 16:30:58 +0800 (SGT)
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chuanhua Han <chuanhua.han@nxp.com>,
        Zhang Ying-22455 <ying.zhang22455@nxp.com>
Subject: [PATCH 2/3] gpio: mpc8xxx: Use IRQF_SHARED mode to request IRQ
Date:   Wed, 29 May 2019 16:32:53 +0800
Message-Id: <20190529083254.39581-2-chuanhua.han@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529083254.39581-1-chuanhua.han@nxp.com>
References: <20190529083254.39581-1-chuanhua.han@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO3 and GPIO4 controllers share one irq number on Layerscape
platform. In the current implementation, only one GPIO controller
can register successfully.

This patch is to allow two controllers to share a single interrupt
number.

Signed-off-by: Zhang Ying-22455 <ying.zhang22455@nxp.com>
Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 43 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 555e0e7957d9..63c8586fe5c8 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -11,6 +11,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -105,10 +106,9 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 		return -ENXIO;
 }
 
-static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
+static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *dev_id)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = dev_id;
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned int mask;
 
@@ -117,8 +117,7 @@ static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
 	if (mask)
 		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
 						     32 - ffs(mask)));
-	if (chip->irq_eoi)
-		chip->irq_eoi(&desc->irq_data);
+	return IRQ_HANDLED;
 }
 
 static void mpc8xxx_irq_unmask(struct irq_data *d)
@@ -129,6 +128,9 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
+		      gc->pin2mask(gc, irqd_to_hwirq(d)));
+
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
 		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
 		| mpc_pin2mask(irqd_to_hwirq(d)));
@@ -302,21 +304,31 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	struct gpio_chip	*gc;
 	const struct mpc8xxx_gpio_devtype *devtype =
 		of_device_get_match_data(&pdev->dev);
-	int ret;
+	int ret, irq;
 
 	mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERNEL);
 	if (!mpc8xxx_gc)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, mpc8xxx_gc);
-
-	raw_spin_lock_init(&mpc8xxx_gc->lock);
-
 	mpc8xxx_gc->regs = of_iomap(np, 0);
 	if (!mpc8xxx_gc->regs)
 		return -ENOMEM;
 
 	gc = &mpc8xxx_gc->gc;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(&pdev->dev, "can't get irq number\n");
+		return irq;
+	}
+
+	mpc8xxx_gc->gc.label = pdev->name;
+	mpc8xxx_gc->gc.owner = THIS_MODULE;
+	mpc8xxx_gc->gc.base = -1;
+	mpc8xxx_gc->gc.ngpio = MPC8XXX_GPIO_PINS;
+
+	platform_set_drvdata(pdev, mpc8xxx_gc);
+
+	raw_spin_lock_init(&mpc8xxx_gc->lock);
 
 	if (of_property_read_bool(np, "little-endian")) {
 		ret = bgpio_init(gc, &pdev->dev, 4,
@@ -364,7 +376,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	mpc8xxx_gc->irqn = irq_of_parse_and_map(np, 0);
+	mpc8xxx_gc->irqn = platform_get_irq(pdev, 0);
 	if (!mpc8xxx_gc->irqn)
 		return 0;
 
@@ -378,8 +390,13 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0xffffffff);
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR2, 0xffffffff);
 
-	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
-					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
+	/* Request IRQ */
+	ret = devm_request_irq(&pdev->dev, irq, mpc8xxx_gpio_irq_cascade,
+			       IRQF_SHARED, pdev->name, mpc8xxx_gc);
+	if (ret) {
+		dev_err(&pdev->dev, "can't claim irq %d\n", mpc8xxx_gc->irqn);
+		goto err;
+	}
 	return 0;
 err:
 	iounmap(mpc8xxx_gc->regs);
-- 
2.17.1

