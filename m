Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C614552E9D5
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 12:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346589AbiETKX1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 06:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346302AbiETKXY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 06:23:24 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FD9E2776
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 03:23:22 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
        by baptiste.telenet-ops.be with bizsmtp
        id YyPL2700E38adXi01yPL1G; Fri, 20 May 2022 12:23:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzmx-000zvD-Su; Fri, 20 May 2022 12:23:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzmx-003vIE-Bo; Fri, 20 May 2022 12:23:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: dwapb: Make the irqchip immutable
Date:   Fri, 20 May 2022 12:23:18 +0200
Message-Id: <01f7a990654697ca7ec8b2d0025f41403462c8d9.1653042121.git.geert+renesas@glider.be>
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
now observed for the dwapb driver:

    gpio gpiochip0: (50200000.gpio): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the dwapb driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).

v2:
  - Factor out hwirq using preferred helper.
---
 drivers/gpio/gpio-dwapb.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7130195da48d75dd..04afe728e18748df 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -95,7 +95,6 @@ struct dwapb_context {
 #endif
 
 struct dwapb_gpio_port_irqchip {
-	struct irq_chip		irqchip;
 	unsigned int		nr_irqs;
 	unsigned int		irq[DWAPB_MAX_GPIOS];
 };
@@ -252,24 +251,30 @@ static void dwapb_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 val;
 
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
+	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void dwapb_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 val;
 
+	gpiochip_enable_irq(gc, hwirq);
+
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
+	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(hwirq);
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
@@ -364,8 +369,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return 0;
 }
+#else
+#define dwapb_irq_set_wake	NULL
 #endif
 
+static const struct irq_chip dwapb_irq_chip = {
+	.name		= DWAPB_DRIVER_NAME,
+	.irq_ack	= dwapb_irq_ack,
+	.irq_mask	= dwapb_irq_mask,
+	.irq_unmask	= dwapb_irq_unmask,
+	.irq_set_type	= dwapb_irq_set_type,
+	.irq_enable	= dwapb_irq_enable,
+	.irq_disable	= dwapb_irq_disable,
+	.irq_set_wake	= dwapb_irq_set_wake,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 				   unsigned offset, unsigned debounce)
 {
@@ -439,16 +459,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 	girq->default_type = IRQ_TYPE_NONE;
 
 	port->pirq = pirq;
-	pirq->irqchip.name = DWAPB_DRIVER_NAME;
-	pirq->irqchip.irq_ack = dwapb_irq_ack;
-	pirq->irqchip.irq_mask = dwapb_irq_mask;
-	pirq->irqchip.irq_unmask = dwapb_irq_unmask;
-	pirq->irqchip.irq_set_type = dwapb_irq_set_type;
-	pirq->irqchip.irq_enable = dwapb_irq_enable;
-	pirq->irqchip.irq_disable = dwapb_irq_disable;
-#ifdef CONFIG_PM_SLEEP
-	pirq->irqchip.irq_set_wake = dwapb_irq_set_wake;
-#endif
 
 	/*
 	 * Intel ACPI-based platforms mostly have the DesignWare APB GPIO
@@ -475,7 +485,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		girq->parent_handler = dwapb_irq_handler;
 	}
 
-	girq->chip = &pirq->irqchip;
+	gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
 
 	return;
 
-- 
2.25.1

