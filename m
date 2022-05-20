Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08FF52E9D6
	for <lists+linux-gpio@lfdr.de>; Fri, 20 May 2022 12:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346302AbiETKYX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 May 2022 06:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348104AbiETKYX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 06:24:23 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179D2ED79B
        for <linux-gpio@vger.kernel.org>; Fri, 20 May 2022 03:24:21 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:cdaa:735b:3efc:39fe])
        by michel.telenet-ops.be with bizsmtp
        id YyQK2700638adXi06yQKuV; Fri, 20 May 2022 12:24:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrznu-000zvt-JF; Fri, 20 May 2022 12:24:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrznu-003vKC-4K; Fri, 20 May 2022 12:24:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: sifive: Make the irqchip immutable
Date:   Fri, 20 May 2022 12:24:16 +0200
Message-Id: <26519be2a2fdd4c6741658144e3a8d78cf4d000b.1653042202.git.geert+renesas@glider.be>
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
now observed for the sifive driver:

    gpio gpiochip1: (38001000.gpio-controller): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the sifive driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against gpio/for-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).

v2:
  - Factor out hwirq using preferred helper.
---
 drivers/gpio/gpio-sifive.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 03b8c4de2e91e3c4..238f3210970cfa0e 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -75,10 +75,12 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
-	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int offset = hwirq % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, hwirq);
 	irq_chip_enable_parent(d);
 
 	/* Switch to input */
@@ -101,11 +103,13 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
-	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int offset = hwirq % SIFIVE_GPIO_MAX;
 
 	assign_bit(offset, &chip->irq_state, 0);
 	sifive_gpio_set_ie(chip, offset);
 	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void sifive_gpio_irq_eoi(struct irq_data *d)
@@ -137,7 +141,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
 	return -EINVAL;
 }
 
-static struct irq_chip sifive_gpio_irqchip = {
+static const struct irq_chip sifive_gpio_irqchip = {
 	.name		= "sifive-gpio",
 	.irq_set_type	= sifive_gpio_irq_set_type,
 	.irq_mask	= irq_chip_mask_parent,
@@ -146,6 +150,8 @@ static struct irq_chip sifive_gpio_irqchip = {
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -242,7 +248,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	chip->gc.parent = dev;
 	chip->gc.owner = THIS_MODULE;
 	girq = &chip->gc.irq;
-	girq->chip = &sifive_gpio_irqchip;
+	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
 	girq->fwnode = of_node_to_fwnode(node);
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
-- 
2.25.1

