Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826D7AD1CF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 04:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732634AbfIICWe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 22:22:34 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58806 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732582AbfIICWe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 8 Sep 2019 22:22:34 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9868E2003A5;
        Mon,  9 Sep 2019 04:22:31 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 99F2E20038A;
        Mon,  9 Sep 2019 04:22:26 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 96418402AE;
        Mon,  9 Sep 2019 10:22:20 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v3] gpio/mpc8xxx: change irq handler from chained to normal
Date:   Mon,  9 Sep 2019 10:12:14 +0800
Message-Id: <20190909021214.25646-1-hui.song_1@nxp.com>
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
Changes in v3:
	- update the patch description.
Changes in v2:
	- delete the compatible of ls1088a.
 drivers/gpio/gpio-mpc8xxx.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 16a47de..4006250 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -22,6 +22,7 @@
 #include <linux/irq.h>
 #include <linux/gpio/driver.h>
 #include <linux/bitops.h>
+#include <linux/interrupt.h>
 
 #define MPC8XXX_GPIO_PINS	32
 
@@ -127,10 +128,9 @@ static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
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
 
@@ -139,8 +139,8 @@ static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
 	if (mask)
 		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
 						     32 - ffs(mask)));
-	if (chip->irq_eoi)
-		chip->irq_eoi(&desc->irq_data);
+
+	return IRQ_HANDLED;
 }
 
 static void mpc8xxx_irq_unmask(struct irq_data *d)
@@ -409,8 +409,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	if (devtype->gpio_dir_in_init)
 		devtype->gpio_dir_in_init(gc);
 
-	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
-					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
+	ret = request_irq(mpc8xxx_gc->irqn, mpc8xxx_gpio_irq_cascade,
+		IRQF_NO_THREAD | IRQF_SHARED, "gpio-cascade", mpc8xxx_gc);
+	if (ret) {
+		pr_err("%s: failed to request_irq(%d), ret = %d\n",
+				np->full_name, mpc8xxx_gc->irqn, ret);
+		goto err;
+	}
+
 	return 0;
 err:
 	iounmap(mpc8xxx_gc->regs);
-- 
2.9.5

