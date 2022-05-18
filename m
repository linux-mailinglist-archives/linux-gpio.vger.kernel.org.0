Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778DE52BDFD
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 17:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238761AbiEROkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 10:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238726AbiEROkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 10:40:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24E11D2FEC
        for <linux-gpio@vger.kernel.org>; Wed, 18 May 2022 07:39:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:1425:89ca:2e9e:5fc1])
        by xavier.telenet-ops.be with bizsmtp
        id YEfl2700H10zdRX01EflEG; Wed, 18 May 2022 16:39:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrKq1-000qvo-7f; Wed, 18 May 2022 16:39:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrKq0-00BtH0-NK; Wed, 18 May 2022 16:39:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: dwapb: Make the irqchip immutable
Date:   Wed, 18 May 2022 16:39:42 +0200
Message-Id: <e6380b316db23ee03a9adbf0a7d1ad83538f9961.1652884676.git.geert+renesas@glider.be>
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
Against linux-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).
---
 drivers/gpio/gpio-dwapb.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 7130195da48d75dd..29b9395548151992 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -95,7 +95,6 @@ struct dwapb_context {
 #endif
 
 struct dwapb_gpio_port_irqchip {
-	struct irq_chip		irqchip;
 	unsigned int		nr_irqs;
 	unsigned int		irq[DWAPB_MAX_GPIOS];
 };
@@ -259,6 +258,8 @@ static void dwapb_irq_mask(struct irq_data *d)
 	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTMASK, val);
 	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static void dwapb_irq_unmask(struct irq_data *d)
@@ -268,6 +269,8 @@ static void dwapb_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	gpiochip_enable_irq(gc, d->hwirq);
+
 	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
 	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTMASK, val);
@@ -364,8 +367,23 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
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
@@ -439,16 +457,6 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
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
@@ -475,7 +483,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 		girq->parent_handler = dwapb_irq_handler;
 	}
 
-	girq->chip = &pirq->irqchip;
+	gpio_irq_chip_set_chip(girq, &dwapb_irq_chip);
 
 	return;
 
-- 
2.25.1

