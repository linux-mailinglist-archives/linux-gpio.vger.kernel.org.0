Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8A6D1E98
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 04:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731134AbfJJCnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 22:43:00 -0400
Received: from inva021.nxp.com ([92.121.34.21]:54892 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbfJJCnA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Oct 2019 22:43:00 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D228F200432;
        Thu, 10 Oct 2019 04:42:57 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F2C3200048;
        Thu, 10 Oct 2019 04:42:52 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 4DC24402DA;
        Thu, 10 Oct 2019 10:42:46 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v7] gpio/mpc8xxx: change irq handler from chained to normal
Date:   Thu, 10 Oct 2019 10:32:05 +0800
Message-Id: <20191010023205.8071-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

More than one gpio controllers can share one interrupt, change the
driver to request shared irq.

While this will work, it will mess up userspace accounting of the number
of interrupts per second in tools such as vmstat.  The reason is that
for every GPIO interrupt, /proc/interrupts records the count against GIC
interrupt 68 or 69, as well as the GPIO itself.  So, for every GPIO
interrupt, the total number of interrupts that the system has seen
increments by two.

Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
Changes in v7:
	- make unsigned int convert to unsigned long.
Changes in v6:
	- change request_irq to devm_request_irq and add commit message.
Changes in v5:
	- add traverse every bit function.
Changes in v4:
	- convert 'pr_err' to 'dev_err'.
Changes in v3:
	- update the patch description.
Changes in v2:
	- delete the compatible of ls1088a.
 drivers/gpio/gpio-mpc8xxx.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 16a47de..5a0f030 100644
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
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = data;
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
-	unsigned int mask;
+	unsigned long mask;
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
@@ -409,8 +410,16 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (devtype->gpio_dir_in_init)
 		devtype->gpio_dir_in_init(gc);
 
-	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
-					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
+	ret = devm_request_irq(&pdev->dev, mpc8xxx_gc->irqn,
+			       mpc8xxx_gpio_irq_cascade,
+			       IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade",
+			       mpc8xxx_gc);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: failed to devm_request_irq(%d), ret = %d\n",
+			np->full_name, mpc8xxx_gc->irqn, ret);
+		goto err;
+	}
+
 	return 0;
 err:
 	iounmap(mpc8xxx_gc->regs);
-- 
2.9.5

