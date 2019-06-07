Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF803877D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 11:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbfFGJ7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 05:59:02 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:51478 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbfFGJ7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 05:59:02 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id Mlz02000n3XaVaC01lz0si; Fri, 07 Jun 2019 11:59:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZBeG-00040z-HB; Fri, 07 Jun 2019 11:59:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZBeG-0002cb-GD; Fri, 07 Jun 2019 11:59:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/4] irqchip/renesas-irqc: Use proper irq_chip name and parent
Date:   Fri,  7 Jun 2019 11:58:56 +0200
Message-Id: <20190607095858.10028-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607095858.10028-1-geert+renesas@glider.be>
References: <20190607095858.10028-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq_chip .name field should contain the device's class (not
instance) name, while .parent_device should point to the device itself.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-irqc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
index cde9f9c0687e94a4..11abc09ef76c62b5 100644
--- a/drivers/irqchip/irq-renesas-irqc.c
+++ b/drivers/irqchip/irq-renesas-irqc.c
@@ -176,7 +176,7 @@ static int irqc_probe(struct platform_device *pdev)
 	}
 
 	ret = irq_alloc_domain_generic_chips(p->irq_domain, p->number_of_irqs,
-					     1, name, handle_level_irq,
+					     1, "irqc", handle_level_irq,
 					     0, 0, IRQ_GC_INIT_NESTED_LOCK);
 	if (ret) {
 		dev_err(dev, "cannot allocate generic chip\n");
@@ -187,6 +187,7 @@ static int irqc_probe(struct platform_device *pdev)
 	p->gc->reg_base = p->cpu_int_base;
 	p->gc->chip_types[0].regs.enable = IRQC_EN_SET;
 	p->gc->chip_types[0].regs.disable = IRQC_EN_STS;
+	p->gc->chip_types[0].chip.parent_device = dev;
 	p->gc->chip_types[0].chip.irq_mask = irq_gc_mask_disable_reg;
 	p->gc->chip_types[0].chip.irq_unmask = irq_gc_unmask_enable_reg;
 	p->gc->chip_types[0].chip.irq_set_type	= irqc_irq_set_type;
-- 
2.17.1

