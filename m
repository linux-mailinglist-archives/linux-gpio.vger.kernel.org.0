Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E330EB3498
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2019 08:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729660AbfIPGIq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Sep 2019 02:08:46 -0400
Received: from inva020.nxp.com ([92.121.34.13]:53098 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729398AbfIPGIp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Sep 2019 02:08:45 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 384761A053A;
        Mon, 16 Sep 2019 08:08:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 254F11A0532;
        Mon, 16 Sep 2019 08:08:38 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A02CD402BF;
        Mon, 16 Sep 2019 14:08:31 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v5] gpio/mpc8xxx: change irq handler from chained to normal
Date:   Mon, 16 Sep 2019 13:58:17 +0800
Message-Id: <20190916055817.43425-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

More than one gpio controllers can share one interrupt, change the
driver to request shared irq.

Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
Changes in v5:
	- add traverse every bit function.
Changes in v4:
	- convert 'pr_err' to 'dev_err'.
Changes in v3:
	- update the patch description.
Changes in v2:
	- delete the compatible of ls1088a.
 drivers/gpio/gpio-mpc8xxx.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 16a47de..3a06ca9 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -22,6 +22,7 @@
 #include <linux/irq.h>
 #include <linux/gpio/driver.h>
 #include <linux/bitops.h>
+#include <linux/interrupt.h>
 
 #define MPC8XXX_GPIO_PINS	32
 
@@ -127,20 +128,20 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 		return -ENXIO;
 }
 
-static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
+static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = (struct mpc8xxx_gpio_chip *)data;
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned int mask;
+	int i;
 
 	mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
 		& gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
-	if (mask)
+	for_each_set_bit(i, &mask, 32)
 		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
-						     32 - ffs(mask)));
-	if (chip->irq_eoi)
-		chip->irq_eoi(&desc->irq_data);
+						     31 - i));
+
+	return IRQ_HANDLED;
 }
 
 static void mpc8xxx_irq_unmask(struct irq_data *d)
@@ -388,8 +389,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
 	if (ret) {
-		pr_err("%pOF: GPIO chip registration failed with status %d\n",
-		       np, ret);
+		dev_err(&pdev->dev, "%pOF: GPIO chip registration failed with status %d\n",
+			np, ret);
 		goto err;
 	}
 
@@ -409,8 +410,15 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (devtype->gpio_dir_in_init)
 		devtype->gpio_dir_in_init(gc);
 
-	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
-					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
+	ret = request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
+			  IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
+			  mpc8xxx_gc);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: failed to request_irq(%d), ret = %d\n",
+			np->full_name, mpc8xxx_gc->irqn, ret);
+		goto err;
+	}
+
 	return 0;
 err:
 	iounmap(mpc8xxx_gc->regs);
-- 
2.9.5

