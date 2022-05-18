Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70FC852BE38
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 17:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238682AbiEROk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 10:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238715AbiEROk4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 10:40:56 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7C160EC
        for <linux-gpio@vger.kernel.org>; Wed, 18 May 2022 07:40:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:1425:89ca:2e9e:5fc1])
        by andre.telenet-ops.be with bizsmtp
        id YEgp2700J10zdRX01Egp1A; Wed, 18 May 2022 16:40:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrKr2-000qwB-Ou; Wed, 18 May 2022 16:40:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrKr2-00BtJk-8G; Wed, 18 May 2022 16:40:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: sifive: Make the irqchip immutable
Date:   Wed, 18 May 2022 16:40:46 +0200
Message-Id: <73c75a67d1c87b049d633057c0e765e708ee02a2.1652884788.git.geert+renesas@glider.be>
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
Against linux-next.
Boot-tested on SiPEED MAiXBiT (Canaan K210).
---
 drivers/gpio/gpio-sifive.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 03b8c4de2e91e3c4..a48f62780e099040 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -79,6 +79,7 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 	u32 bit = BIT(offset);
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, d->hwirq);
 	irq_chip_enable_parent(d);
 
 	/* Switch to input */
@@ -106,6 +107,7 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
 	assign_bit(offset, &chip->irq_state, 0);
 	sifive_gpio_set_ie(chip, offset);
 	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static void sifive_gpio_irq_eoi(struct irq_data *d)
@@ -137,7 +139,7 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
 	return -EINVAL;
 }
 
-static struct irq_chip sifive_gpio_irqchip = {
+static const struct irq_chip sifive_gpio_irqchip = {
 	.name		= "sifive-gpio",
 	.irq_set_type	= sifive_gpio_irq_set_type,
 	.irq_mask	= irq_chip_mask_parent,
@@ -146,6 +148,8 @@ static struct irq_chip sifive_gpio_irqchip = {
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
@@ -242,7 +246,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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

