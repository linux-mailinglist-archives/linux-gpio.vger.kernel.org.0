Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735A052BE7D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 May 2022 17:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238703AbiEROlr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 May 2022 10:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238718AbiEROlq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 May 2022 10:41:46 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899DD18AAA7
        for <linux-gpio@vger.kernel.org>; Wed, 18 May 2022 07:41:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:1425:89ca:2e9e:5fc1])
        by andre.telenet-ops.be with bizsmtp
        id YEhk2700110zdRX01EhkZc; Wed, 18 May 2022 16:41:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrKrv-000qwT-Gh; Wed, 18 May 2022 16:41:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nrKrv-00BtLm-3X; Wed, 18 May 2022 16:41:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Emil Renner Berthing <kernel@esmil.dk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: starfive: Make the irqchip immutable
Date:   Wed, 18 May 2022 16:41:42 +0200
Message-Id: <5eb66be34356afd5eb0ea9027329e0939d03d3a0.1652884852.git.geert+renesas@glider.be>
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
now observed for the starfive driver:

    gpio gpiochip0: (11910000.pinctrl): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the starfive driver immutable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against linux-next.
Boot-tested on BeagleV Starlight Beta.
---
 drivers/pinctrl/pinctrl-starfive.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
index f2b7d002ccb17900..f82a72f8016f59cc 100644
--- a/drivers/pinctrl/pinctrl-starfive.c
+++ b/drivers/pinctrl/pinctrl-starfive.c
@@ -1078,6 +1078,8 @@ static void starfive_irq_mask(struct irq_data *d)
 	value = readl_relaxed(ie) & ~mask;
 	writel_relaxed(value, ie);
 	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	gpiochip_disable_irq(&sfp->gc, d->hwirq);
 }
 
 static void starfive_irq_mask_ack(struct irq_data *d)
@@ -1106,6 +1108,8 @@ static void starfive_irq_unmask(struct irq_data *d)
 	unsigned long flags;
 	u32 value;
 
+	gpiochip_enable_irq(&sfp->gc, d->hwirq);
+
 	raw_spin_lock_irqsave(&sfp->lock, flags);
 	value = readl_relaxed(ie) | mask;
 	writel_relaxed(value, ie);
@@ -1167,14 +1171,15 @@ static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
 	return 0;
 }
 
-static struct irq_chip starfive_irq_chip = {
+static const struct irq_chip starfive_irq_chip = {
 	.name = "StarFive GPIO",
 	.irq_ack = starfive_irq_ack,
 	.irq_mask = starfive_irq_mask,
 	.irq_mask_ack = starfive_irq_mask_ack,
 	.irq_unmask = starfive_irq_unmask,
 	.irq_set_type = starfive_irq_set_type,
-	.flags = IRQCHIP_SET_TYPE_MASKED,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_SET_TYPE_MASKED,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void starfive_gpio_irq_handler(struct irq_desc *desc)
@@ -1374,7 +1379,7 @@ static int starfive_probe(struct platform_device *pdev)
 	sfp->gc.base = -1;
 	sfp->gc.ngpio = NR_GPIOS;
 
-	sfp->gc.irq.chip = &starfive_irq_chip;
+	gpio_irq_chip_set_chip(&sfp->gc.irq, &starfive_irq_chip);
 	sfp->gc.irq.parent_handler = starfive_gpio_irq_handler;
 	sfp->gc.irq.num_parents = 1;
 	sfp->gc.irq.parents = devm_kcalloc(dev, sfp->gc.irq.num_parents,
-- 
2.25.1

