Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25DE26CC74
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2019 12:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389894AbfGRJ7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Jul 2019 05:59:00 -0400
Received: from inva020.nxp.com ([92.121.34.13]:35456 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726383AbfGRJ7A (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 18 Jul 2019 05:59:00 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 812141A0047;
        Thu, 18 Jul 2019 11:58:57 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 802091A00EE;
        Thu, 18 Jul 2019 11:58:51 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 479FE402D5;
        Thu, 18 Jul 2019 17:58:44 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH 2/2] gpio: mpc8xxx: Add ls1028a device specify function.
Date:   Thu, 18 Jul 2019 17:49:02 +0800
Message-Id: <20190718094902.15562-2-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190718094902.15562-1-hui.song_1@nxp.com>
References: <20190718094902.15562-1-hui.song_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

There is a device specify register(named GPIO_IBE)
on ls1028a need to enable in initial stage.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index c8673a5..1a680aa 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -32,6 +32,7 @@
 #define GPIO_IMR		0x10
 #define GPIO_ICR		0x14
 #define GPIO_ICR2		0x18
+#define GPIO_IBE		0x18
 
 struct mpc8xxx_gpio_chip {
 	struct gpio_chip	gc;
@@ -45,6 +46,27 @@ struct mpc8xxx_gpio_chip {
 	unsigned int irqn;
 };
 
+/* The GPIO Input Buffer Enable register(GPIO_IBE) is used to
+ * control the input enable of each individual GPIO port.
+ * When an individual GPIO port’s direction is set to
+ * input (GPIO_GPDIR[DRn=0]), the associated input enable must be
+ * set (GPIOxGPIE[IEn]=1) to propagate the port value to the GPIO
+ * Data Register.
+ */
+static int ls1028a_gpio_dir_in_init(struct gpio_chip *gc)
+{
+	unsigned long flags;
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+
+	gc->write_reg(mpc8xxx_gc->regs + GPIO_IBE, 0xffffffff);
+
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	return 0;
+}
+
 /*
  * This hardware has a big endian bit assignment such that GPIO line 0 is
  * connected to bit 31, line 1 to bit 30 ... line 31 to bit 0.
@@ -261,6 +283,7 @@ static const struct irq_domain_ops mpc8xxx_gpio_irq_ops = {
 };
 
 struct mpc8xxx_gpio_devtype {
+	int (*gpio_dir_in_init)(struct gpio_chip *chip);
 	int (*gpio_dir_out)(struct gpio_chip *, unsigned int, int);
 	int (*gpio_get)(struct gpio_chip *, unsigned int);
 	int (*irq_set_type)(struct irq_data *, unsigned int);
@@ -271,6 +294,10 @@ static const struct mpc8xxx_gpio_devtype mpc512x_gpio_devtype = {
 	.irq_set_type = mpc512x_irq_set_type,
 };
 
+static const struct mpc8xxx_gpio_devtype ls1028a_gpio_devtype = {
+	.gpio_dir_in_init = ls1028a_gpio_dir_in_init,
+};
+
 static const struct mpc8xxx_gpio_devtype mpc5125_gpio_devtype = {
 	.gpio_dir_out = mpc5125_gpio_dir_out,
 	.irq_set_type = mpc512x_irq_set_type,
@@ -291,6 +318,7 @@ static const struct of_device_id mpc8xxx_gpio_ids[] = {
 	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
 	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
 	{ .compatible = "fsl,pq3-gpio",     },
+	{ .compatible = "fsl,ls1028a-gpio", .data = &ls1028a_gpio_devtype, },
 	{ .compatible = "fsl,qoriq-gpio",   },
 	{}
 };
@@ -376,6 +404,9 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	/* ack and mask all irqs */
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
+	/* enable input buffer  */
+	if (devtype->gpio_dir_in_init)
+		devtype->gpio_dir_in_init(gc);
 
 	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
 					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
-- 
2.9.5

