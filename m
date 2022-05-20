Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A222F52E9C3
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 12:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348087AbiETKTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 06:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241099AbiETKTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 06:19:04 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D088106563
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 03:19:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
        by baptiste.telenet-ops.be with bizsmtp
        id YyJy2700P38adXi01yJywi; Fri, 20 May 2022 12:18:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzik-000ztt-CY; Fri, 20 May 2022 12:18:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzij-003v6M-S6; Fri, 20 May 2022 12:18:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: rcar: Make the irqchip immutable
Date:   Fri, 20 May 2022 12:18:56 +0200
Message-Id: <7b57347151a452286cc88358bfc839de30937089.1653041878.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips.  Following this change the following warning is
now observed for the gpio-rcar driver:

    gpio gpiochip0: (e6050000.gpio): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the gpio-rcar driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Tested on the koelsch development board (R-Car M2-W).

v2:
  - Factor out hwirq using preferred helper.
---
 drivers/gpio/gpio-rcar.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 356aac4de17cf142..5b117f3bd322b5a7 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -44,7 +44,6 @@ struct gpio_rcar_priv {
 	spinlock_t lock;
 	struct device *dev;
 	struct gpio_chip gpio_chip;
-	struct irq_chip irq_chip;
 	unsigned int irq_parent;
 	atomic_t wakeup_path;
 	struct gpio_rcar_info info;
@@ -96,16 +95,20 @@ static void gpio_rcar_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	gpio_rcar_write(p, INTMSK, ~BIT(irqd_to_hwirq(d)));
+	gpio_rcar_write(p, INTMSK, ~BIT(hwirq));
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void gpio_rcar_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	gpio_rcar_write(p, MSKCLR, BIT(irqd_to_hwirq(d)));
+	gpiochip_enable_irq(gc, hwirq);
+	gpio_rcar_write(p, MSKCLR, BIT(hwirq));
 }
 
 static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
@@ -203,6 +206,17 @@ static int gpio_rcar_irq_set_wake(struct irq_data *d, unsigned int on)
 	return 0;
 }
 
+static const struct irq_chip gpio_rcar_irq_chip = {
+	.name		= "gpio-rcar",
+	.irq_mask	= gpio_rcar_irq_disable,
+	.irq_unmask	= gpio_rcar_irq_enable,
+	.irq_set_type	= gpio_rcar_irq_set_type,
+	.irq_set_wake	= gpio_rcar_irq_set_wake,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static irqreturn_t gpio_rcar_irq_handler(int irq, void *dev_id)
 {
 	struct gpio_rcar_priv *p = dev_id;
@@ -481,7 +495,6 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 {
 	struct gpio_rcar_priv *p;
 	struct gpio_chip *gpio_chip;
-	struct irq_chip *irq_chip;
 	struct gpio_irq_chip *girq;
 	struct device *dev = &pdev->dev;
 	const char *name = dev_name(dev);
@@ -531,16 +544,8 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	gpio_chip->base = -1;
 	gpio_chip->ngpio = npins;
 
-	irq_chip = &p->irq_chip;
-	irq_chip->name = "gpio-rcar";
-	irq_chip->irq_mask = gpio_rcar_irq_disable;
-	irq_chip->irq_unmask = gpio_rcar_irq_enable;
-	irq_chip->irq_set_type = gpio_rcar_irq_set_type;
-	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
-	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
-
 	girq = &gpio_chip->irq;
-	girq->chip = irq_chip;
+	gpio_irq_chip_set_chip(girq, &gpio_rcar_irq_chip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.25.1

