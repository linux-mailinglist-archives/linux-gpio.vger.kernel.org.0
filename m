Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694DA66BADE
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjAPJue (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjAPJuS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:50:18 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1840014EBC
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:50:17 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 30DEB84F3E;
        Mon, 16 Jan 2023 10:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1673862615;
        bh=WAmnVGsimjmdvnZWXULuuXp7+Eh9H18zFKGwj3xn/gs=;
        h=From:To:Cc:Subject:Date:From;
        b=jvrQpwCTcn7TIyWrrVeHpSeEO3sD0ykuOQIblPV/nUs9oU1TD41x3dcU5BjBdrSKn
         DMw/OCvKEZZ0Gqu3ssg4mFI7hZKovk04pTEGg5Sy/11l3Km6FG09uWfIv4MlJeDTMs
         GXrRFpYSeDoxSuc0CVshywlOJ/isC4beBb0u8M+moIIeL4c/b6hVR5jPODMgBuRzWQ
         tK8QEWS2ff7kxftpf7zWAICE3ocuZ8VhDJMFgB2zIP1i0Ob7HbfOR5r9BR7+GD4/zx
         D3re6XqLxBQNC8nbsp6sCtWF8g9Ppavj/ALVu433P+YK31CGDVpx9nZvD51+LjqwH9
         /wf5k5padCX/A==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v7 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
Date:   Mon, 16 Jan 2023 10:49:56 +0100
Message-Id: <20230116094957.5756-1-marex@denx.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The driver currently performs register read-modify-write without locking
in its irqchip part, this could lead to a race condition when configuring
interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
the register read-modify-write.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
V3: New patch
V4: Include linux/spinlock.h
V5: Use raw_spinlock per 3c938cc5cebcb ("gpio: use raw spinlock for gpio chip shadowed data")
V6: No change
V7: Rebase on current next-20230116
---
 drivers/gpio/gpio-mxc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index d5626c572d24e..2d9d498727f10 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/syscore_ops.h>
 #include <linux/gpio/driver.h>
 #include <linux/of.h>
@@ -159,6 +160,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
+	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -197,6 +199,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
+	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+
 	if (GPIO_EDGE_SEL >= 0) {
 		val = readl(port->base + GPIO_EDGE_SEL);
 		if (edge == GPIO_INT_BOTH_EDGES)
@@ -217,15 +221,20 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 	writel(1 << gpio_idx, port->base + GPIO_ISR);
 	port->pad_type[gpio_idx] = type;
 
+	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
+
 	return 0;
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
+	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
+	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
 	val = readl(reg);
@@ -243,6 +252,8 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
+
+	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */
-- 
2.39.0

