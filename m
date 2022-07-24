Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4112F57F61C
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jul 2022 19:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbiGXRLO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jul 2022 13:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGXRLN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jul 2022 13:11:13 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958EF6568
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jul 2022 10:11:11 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BAE9A82119;
        Sun, 24 Jul 2022 19:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1658682669;
        bh=P0Zh7M6+7SwBXtsauIfRW+58aUCtGChVQAC86ph7HS4=;
        h=From:To:Cc:Subject:Date:From;
        b=ZHL/DZlmwDJYt4EmVigMi1gvlKXPSZgYR9laEbIbCeqAVtgTdOXf/3uqNsbRyFj8Y
         qpS8wfn0QTvOa5iENdf4LUtc/u95q1v0HE/nPXtI8GEDuHZF1Vp0ex/wZrQg07i8ER
         V7KbcbSLTa1i4l28LM5ZhQWSy+2bU4DFsYXgv6VJGtxSmKJynidHuY/Xq9KBudhoO9
         A4nEZhBGdBn6K70UWELOYv8nZBL2ibQYOUl00e7L+dkliuDqVGpqlwscTMMgbVVmOH
         kMslcBJxGZco+wG7HSfMJFpS+IG9GCGYmJDkb7kWfhhgLtjdldqBN83Og/Zasld50U
         KvspFAec/fjAw==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v3 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
Date:   Sun, 24 Jul 2022 19:10:56 +0200
Message-Id: <20220724171057.18549-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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

Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
V3: New patch
---
 drivers/gpio/gpio-mxc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c871602fc5ba9..74a50139c9202 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -147,6 +147,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
+	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -185,6 +186,8 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
+	spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+
 	if (GPIO_EDGE_SEL >= 0) {
 		val = readl(port->base + GPIO_EDGE_SEL);
 		if (edge == GPIO_INT_BOTH_EDGES)
@@ -204,15 +207,20 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 
 	writel(1 << gpio_idx, port->base + GPIO_ISR);
 
+	spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
+
 	return 0;
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
+	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
+	spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
 	val = readl(reg);
@@ -230,6 +238,8 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
+
+	spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */
-- 
2.35.1

