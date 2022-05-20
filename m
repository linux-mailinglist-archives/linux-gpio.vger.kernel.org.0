Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8461752E9CF
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 12:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348108AbiETKWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 06:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346498AbiETKWB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 06:22:01 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF995931B
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 03:21:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
        by andre.telenet-ops.be with bizsmtp
        id YyMx2700238adXi01yMxDm; Fri, 20 May 2022 12:21:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzlc-000zus-Ky; Fri, 20 May 2022 12:21:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrzlc-003vG3-0o; Fri, 20 May 2022 12:21:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marc Zyngier <maz@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: pca953x: Make the irqchip immutable
Date:   Fri, 20 May 2022 12:21:54 +0200
Message-Id: <658f37ac17921a4770853635153fd6173dc4ef69.1653042074.git.geert+renesas@glider.be>
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
now observed for the pca953x driver:

    gpio gpiochip7: (0-0020): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the pca953x driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Boot-tested with pca9654 on the r8a77990/ebisu development board.

v2:
  - Use existing hwirq variable.
---
 drivers/gpio/gpio-pca953x.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index ba36de7a384527de..b444c6ab958bfd06 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -201,7 +201,6 @@ struct pca953x_chip {
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
 	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
-	struct irq_chip irq_chip;
 #endif
 	atomic_t wakeup_path;
 
@@ -629,6 +628,7 @@ static void pca953x_irq_mask(struct irq_data *d)
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
 	clear_bit(hwirq, chip->irq_mask);
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void pca953x_irq_unmask(struct irq_data *d)
@@ -637,6 +637,7 @@ static void pca953x_irq_unmask(struct irq_data *d)
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
+	gpiochip_enable_irq(gc, hwirq);
 	set_bit(hwirq, chip->irq_mask);
 }
 
@@ -721,6 +722,26 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 	clear_bit(hwirq, chip->irq_trig_fall);
 }
 
+static void pca953x_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	seq_printf(p, dev_name(gc->parent));
+}
+
+static const struct irq_chip pca953x_irq_chip = {
+	.irq_mask		= pca953x_irq_mask,
+	.irq_unmask		= pca953x_irq_unmask,
+	.irq_set_wake		= pca953x_irq_set_wake,
+	.irq_bus_lock		= pca953x_irq_bus_lock,
+	.irq_bus_sync_unlock	= pca953x_irq_bus_sync_unlock,
+	.irq_set_type		= pca953x_irq_set_type,
+	.irq_shutdown		= pca953x_irq_shutdown,
+	.irq_print_chip		= pca953x_irq_print_chip,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
 static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pending)
 {
 	struct gpio_chip *gc = &chip->gpio_chip;
@@ -812,7 +833,6 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 {
 	struct i2c_client *client = chip->client;
-	struct irq_chip *irq_chip = &chip->irq_chip;
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
 	DECLARE_BITMAP(irq_stat, MAX_LINE);
 	struct gpio_irq_chip *girq;
@@ -846,17 +866,8 @@ static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 	bitmap_and(chip->irq_stat, irq_stat, reg_direction, chip->gpio_chip.ngpio);
 	mutex_init(&chip->irq_lock);
 
-	irq_chip->name = dev_name(&client->dev);
-	irq_chip->irq_mask = pca953x_irq_mask;
-	irq_chip->irq_unmask = pca953x_irq_unmask;
-	irq_chip->irq_set_wake = pca953x_irq_set_wake;
-	irq_chip->irq_bus_lock = pca953x_irq_bus_lock;
-	irq_chip->irq_bus_sync_unlock = pca953x_irq_bus_sync_unlock;
-	irq_chip->irq_set_type = pca953x_irq_set_type;
-	irq_chip->irq_shutdown = pca953x_irq_shutdown;
-
 	girq = &chip->gpio_chip.irq;
-	girq->chip = irq_chip;
+	gpio_irq_chip_set_chip(girq, &pca953x_irq_chip);
 	/* This will let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.25.1

