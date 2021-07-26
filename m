Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3C53D50FD
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 03:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhGZAy4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Jul 2021 20:54:56 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:60948 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbhGZAyz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Jul 2021 20:54:55 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id CA366D52AB;
        Mon, 26 Jul 2021 09:35:22 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P26933T140041269528320S1627263320641911_;
        Mon, 26 Jul 2021 09:35:22 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1840bc973205fe87b8a890dee21bbec9>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: linus.walleij@linaro.org
X-RCPT-COUNT: 9
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     linus.walleij@linaro.org, heiko@sntech.de
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v7 6/9] gpio/rockchip: use struct rockchip_gpio_regs for gpio controller
Date:   Mon, 26 Jul 2021 09:35:19 +0800
Message-Id: <20210726013519.1634666-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <210726013345.1634442-1-jay.xu@rock-chips.com>
References: <210726013345.1634442-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Store register offsets in the struct rockchip_gpio_regs, this patch
prepare for the driver update for new gpio controller.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
v7:
 - none. from v1

 drivers/gpio/gpio-rockchip.c       | 86 ++++++++++++++++--------------
 drivers/pinctrl/pinctrl-rockchip.h | 38 +++++++++++++
 2 files changed, 85 insertions(+), 39 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index b455fcf7efda..d6c07a957bd8 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -24,19 +24,21 @@
 #include "../pinctrl/core.h"
 #include "../pinctrl/pinctrl-rockchip.h"
 
-/* GPIO control registers */
-#define GPIO_SWPORT_DR		0x00
-#define GPIO_SWPORT_DDR		0x04
-#define GPIO_INTEN		0x30
-#define GPIO_INTMASK		0x34
-#define GPIO_INTTYPE_LEVEL	0x38
-#define GPIO_INT_POLARITY	0x3c
-#define GPIO_INT_STATUS		0x40
-#define GPIO_INT_RAWSTATUS	0x44
-#define GPIO_DEBOUNCE		0x48
-#define GPIO_PORTS_EOI		0x4c
-#define GPIO_EXT_PORT		0x50
-#define GPIO_LS_SYNC		0x60
+#define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
+
+static const struct rockchip_gpio_regs gpio_regs_v1 = {
+	.port_dr = 0x00,
+	.port_ddr = 0x04,
+	.int_en = 0x30,
+	.int_mask = 0x34,
+	.int_type = 0x38,
+	.int_polarity = 0x3c,
+	.int_status = 0x40,
+	.int_rawstatus = 0x44,
+	.debounce = 0x48,
+	.port_eoi = 0x4c,
+	.ext_port = 0x50,
+};
 
 static int rockchip_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
@@ -44,7 +46,7 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip,
 	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
 	u32 data;
 
-	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	data = readl_relaxed(bank->reg_base + bank->gpio_regs->port_ddr);
 	if (data & BIT(offset))
 		return GPIO_LINE_DIRECTION_OUT;
 
@@ -60,13 +62,13 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
-	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	data = readl_relaxed(bank->reg_base + bank->gpio_regs->port_ddr);
 	/* set bit to 1 for output, 0 for input */
 	if (!input)
 		data |= BIT(offset);
 	else
 		data &= ~BIT(offset);
-	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
+	writel_relaxed(data, bank->reg_base + bank->gpio_regs->port_ddr);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
@@ -77,7 +79,7 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	void __iomem *reg = bank->reg_base + GPIO_SWPORT_DR;
+	void __iomem *reg = bank->reg_base + bank->gpio_regs->port_dr;
 	unsigned long flags;
 	u32 data;
 
@@ -97,9 +99,10 @@ static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	u32 data;
 
-	data = readl(bank->reg_base + GPIO_EXT_PORT);
+	data = readl(bank->reg_base + bank->gpio_regs->ext_port);
 	data >>= offset;
 	data &= 1;
+
 	return data;
 }
 
@@ -107,7 +110,7 @@ static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
 				       unsigned int offset, bool enable)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	void __iomem *reg = bank->reg_base + GPIO_DEBOUNCE;
+	void __iomem *reg = bank->reg_base + bank->gpio_regs->debounce;
 	unsigned long flags;
 	u32 data;
 
@@ -207,7 +210,7 @@ static void rockchip_irq_demux(struct irq_desc *desc)
 
 	chained_irq_enter(chip, desc);
 
-	pend = readl_relaxed(bank->reg_base + GPIO_INT_STATUS);
+	pend = readl_relaxed(bank->reg_base + bank->gpio_regs->int_status);
 
 	while (pend) {
 		unsigned int irq, virq;
@@ -231,24 +234,26 @@ static void rockchip_irq_demux(struct irq_desc *desc)
 			u32 data, data_old, polarity;
 			unsigned long flags;
 
-			data = readl_relaxed(bank->reg_base + GPIO_EXT_PORT);
+			data = readl_relaxed(bank->reg_base +
+					     bank->gpio_regs->ext_port);
 			do {
 				raw_spin_lock_irqsave(&bank->slock, flags);
 
 				polarity = readl_relaxed(bank->reg_base +
-							 GPIO_INT_POLARITY);
+							 bank->gpio_regs->int_polarity);
 				if (data & BIT(irq))
 					polarity &= ~BIT(irq);
 				else
 					polarity |= BIT(irq);
 				writel(polarity,
-				       bank->reg_base + GPIO_INT_POLARITY);
+				       bank->reg_base +
+				       bank->gpio_regs->int_polarity);
 
 				raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 				data_old = data;
 				data = readl_relaxed(bank->reg_base +
-						     GPIO_EXT_PORT);
+						     bank->gpio_regs->ext_port);
 			} while ((data & BIT(irq)) != (data_old & BIT(irq)));
 		}
 
@@ -270,9 +275,9 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
-	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	data = readl_relaxed(bank->reg_base + bank->gpio_regs->port_ddr);
 	data &= ~mask;
-	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
+	writel_relaxed(data, bank->reg_base + bank->gpio_regs->port_ddr);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
@@ -284,8 +289,8 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	irq_gc_lock(gc);
 
-	level = readl_relaxed(gc->reg_base + GPIO_INTTYPE_LEVEL);
-	polarity = readl_relaxed(gc->reg_base + GPIO_INT_POLARITY);
+	level = readl_relaxed(gc->reg_base + bank->gpio_regs->int_type);
+	polarity = readl_relaxed(gc->reg_base + bank->gpio_regs->int_polarity);
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_BOTH:
@@ -296,7 +301,7 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 		 * Determine gpio state. If 1 next interrupt should be falling
 		 * otherwise rising.
 		 */
-		data = readl(bank->reg_base + GPIO_EXT_PORT);
+		data = readl(bank->reg_base + bank->gpio_regs->ext_port);
 		if (data & mask)
 			polarity &= ~mask;
 		else
@@ -329,8 +334,8 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	writel_relaxed(level, gc->reg_base + GPIO_INTTYPE_LEVEL);
-	writel_relaxed(polarity, gc->reg_base + GPIO_INT_POLARITY);
+	writel_relaxed(level, gc->reg_base + bank->gpio_regs->int_type);
+	writel_relaxed(polarity, gc->reg_base + bank->gpio_regs->int_polarity);
 
 	irq_gc_unlock(gc);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
@@ -343,8 +348,8 @@ static void rockchip_irq_suspend(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
-	bank->saved_masks = irq_reg_readl(gc, GPIO_INTMASK);
-	irq_reg_writel(gc, ~gc->wake_active, GPIO_INTMASK);
+	bank->saved_masks = irq_reg_readl(gc, bank->gpio_regs->int_mask);
+	irq_reg_writel(gc, ~gc->wake_active, bank->gpio_regs->int_mask);
 }
 
 static void rockchip_irq_resume(struct irq_data *d)
@@ -352,7 +357,7 @@ static void rockchip_irq_resume(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
-	irq_reg_writel(gc, bank->saved_masks, GPIO_INTMASK);
+	irq_reg_writel(gc, bank->saved_masks, bank->gpio_regs->int_mask);
 }
 
 static void rockchip_irq_enable(struct irq_data *d)
@@ -400,8 +405,8 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	gc = irq_get_domain_generic_chip(bank->domain, 0);
 	gc->reg_base = bank->reg_base;
 	gc->private = bank;
-	gc->chip_types[0].regs.mask = GPIO_INTMASK;
-	gc->chip_types[0].regs.ack = GPIO_PORTS_EOI;
+	gc->chip_types[0].regs.mask = bank->gpio_regs->int_mask;
+	gc->chip_types[0].regs.ack = bank->gpio_regs->port_eoi;
 	gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
 	gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
 	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
@@ -418,9 +423,9 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	 * Our driver only uses the concept of masked and always keeps
 	 * things enabled, so for us that's all masked and all enabled.
 	 */
-	writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
-	writel_relaxed(0xffffffff, bank->reg_base + GPIO_PORTS_EOI);
-	writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
+	writel_relaxed(0xffffffff, bank->reg_base + bank->gpio_regs->int_mask);
+	writel_relaxed(0xffffffff, bank->reg_base + bank->gpio_regs->port_eoi);
+	writel_relaxed(0xffffffff, bank->reg_base + bank->gpio_regs->int_en);
 	gc->mask_cache = 0xffffffff;
 
 	irq_set_chained_handler_and_data(bank->irq,
@@ -510,6 +515,9 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 
 	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
 
+	bank->gpio_regs = &gpio_regs_v1;
+	bank->gpio_type = GPIO_TYPE_V1;
+
 	bank->clk = of_clk_get(bank->of_node, 0);
 	if (!IS_ERR(bank->clk))
 		return clk_prepare_enable(bank->clk);
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 4aa3d2f1fa67..1b774b6bbc3e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -32,6 +32,42 @@ enum rockchip_pinctrl_type {
 	RK3568,
 };
 
+/**
+ * struct rockchip_gpio_regs
+ * @port_dr: data register
+ * @port_ddr: data direction register
+ * @int_en: interrupt enable
+ * @int_mask: interrupt mask
+ * @int_type: interrupt trigger type, such as high, low, edge trriger type.
+ * @int_polarity: interrupt polarity enable register
+ * @int_bothedge: interrupt bothedge enable register
+ * @int_status: interrupt status register
+ * @int_rawstatus: int_status = int_rawstatus & int_mask
+ * @debounce: enable debounce for interrupt signal
+ * @dbclk_div_en: enable divider for debounce clock
+ * @dbclk_div_con: setting for divider of debounce clock
+ * @port_eoi: end of interrupt of the port
+ * @ext_port: port data from external
+ * @version_id: controller version register
+ */
+struct rockchip_gpio_regs {
+	u32 port_dr;
+	u32 port_ddr;
+	u32 int_en;
+	u32 int_mask;
+	u32 int_type;
+	u32 int_polarity;
+	u32 int_bothedge;
+	u32 int_status;
+	u32 int_rawstatus;
+	u32 debounce;
+	u32 dbclk_div_en;
+	u32 dbclk_div_con;
+	u32 port_eoi;
+	u32 ext_port;
+	u32 version_id;
+};
+
 /**
  * struct rockchip_iomux
  * @type: iomux variant using IOMUX_* constants
@@ -126,6 +162,8 @@ struct rockchip_pin_bank {
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	grange;
 	raw_spinlock_t			slock;
+	const struct rockchip_gpio_regs	*gpio_regs;
+	u32				gpio_type;
 	u32				toggle_edge_mode;
 	u32				recalced_mask;
 	u32				route_mask;
-- 
2.25.1



