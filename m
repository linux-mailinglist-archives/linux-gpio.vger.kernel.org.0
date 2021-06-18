Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFCC3AC3DD
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 08:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhFRGaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 02:30:46 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:46328 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhFRGao (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 02:30:44 -0400
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id 66CA1F5188;
        Fri, 18 Jun 2021 14:28:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P5457T140566159423232S1623997713569343_;
        Fri, 18 Jun 2021 14:28:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <d8c6175975f99c703a9d640f271486a5>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh+dt@kernel.org, kever.yang@rock-chips.com,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 7/9] gpio/rockchip: support next version gpio controller
Date:   Fri, 18 Jun 2021 14:28:31 +0800
Message-Id: <20210618062831.1067435-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618062449.1067106-1-jay.xu@rock-chips.com>
References: <20210618062449.1067106-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The next version gpio controller on SoCs like rk3568 have more write
mask bits for registers.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c       | 283 +++++++++++++++++++++--------
 drivers/pinctrl/pinctrl-rockchip.h |   2 +
 2 files changed, 213 insertions(+), 72 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index eb134731b9ae..db1ce402e7dc 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -25,6 +25,7 @@
 #include "../pinctrl/pinctrl-rockchip.h"
 
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
+#define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -40,13 +41,106 @@ static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.ext_port = 0x50,
 };
 
+static const struct rockchip_gpio_regs gpio_regs_v2 = {
+	.port_dr = 0x00,
+	.port_ddr = 0x08,
+	.int_en = 0x10,
+	.int_mask = 0x18,
+	.int_type = 0x20,
+	.int_polarity = 0x28,
+	.int_bothedge = 0x30,
+	.int_status = 0x50,
+	.int_rawstatus = 0x58,
+	.debounce = 0x38,
+	.dbclk_div_en = 0x40,
+	.dbclk_div_con = 0x48,
+	.port_eoi = 0x60,
+	.ext_port = 0x70,
+	.version_id = 0x78,
+};
+
+static inline void gpio_writel_v2(u32 val, void __iomem *reg)
+{
+	writel((val & 0xffff) | 0xffff0000, reg);
+	writel((val >> 16) | 0xffff0000, reg + 0x4);
+}
+
+static inline u32 gpio_readl_v2(void __iomem *reg)
+{
+	return readl(reg + 0x4) << 16 | readl(reg);
+}
+
+static inline void rockchip_gpio_writel(struct rockchip_pin_bank *bank,
+					u32 value, unsigned int offset)
+{
+	void __iomem *reg = bank->reg_base + offset;
+
+	if (bank->gpio_type == GPIO_TYPE_V2)
+		gpio_writel_v2(value, reg);
+	else
+		writel(value, reg);
+}
+
+static inline u32 rockchip_gpio_readl(struct rockchip_pin_bank *bank,
+				      unsigned int offset)
+{
+	void __iomem *reg = bank->reg_base + offset;
+	u32 value;
+
+	if (bank->gpio_type == GPIO_TYPE_V2)
+		value = gpio_readl_v2(reg);
+	else
+		value = readl(reg);
+
+	return value;
+}
+
+static inline void rockchip_gpio_writel_bit(struct rockchip_pin_bank *bank,
+					    u32 bit, u32 value,
+					    unsigned int offset)
+{
+	void __iomem *reg = bank->reg_base + offset;
+	u32 data;
+
+	if (bank->gpio_type == GPIO_TYPE_V2) {
+		if (value)
+			data = BIT(bit % 16) | BIT(bit % 16 + 16);
+		else
+			data = BIT(bit % 16 + 16);
+		writel(data, bit >= 16 ? reg + 0x4 : reg);
+	} else {
+		data = readl(reg);
+		data &= ~BIT(bit);
+		if (value)
+			data |= BIT(bit);
+		writel(data, reg);
+	}
+}
+
+static inline u32 rockchip_gpio_readl_bit(struct rockchip_pin_bank *bank,
+					  u32 bit, unsigned int offset)
+{
+	void __iomem *reg = bank->reg_base + offset;
+	u32 data;
+
+	if (bank->gpio_type == GPIO_TYPE_V2) {
+		data = readl(bit >= 16 ? reg + 0x4 : reg);
+		data >>= bit % 16;
+	} else {
+		data = readl(reg);
+		data >>= bit;
+	}
+
+	return data & (0x1);
+}
+
 static int rockchip_gpio_get_direction(struct gpio_chip *chip,
 				       unsigned int offset)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
 	u32 data;
 
-	data = readl_relaxed(bank->reg_base + bank->gpio_regs->port_ddr);
+	data = rockchip_gpio_readl_bit(bank, offset, bank->gpio_regs->port_ddr);
 	if (data & BIT(offset))
 		return GPIO_LINE_DIRECTION_OUT;
 
@@ -58,18 +152,10 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
 	unsigned long flags;
-	u32 data;
+	u32 data = input ? 0 : 1;
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-
-	data = readl_relaxed(bank->reg_base + bank->gpio_regs->port_ddr);
-	/* set bit to 1 for output, 0 for input */
-	if (!input)
-		data |= BIT(offset);
-	else
-		data &= ~BIT(offset);
-	writel_relaxed(data, bank->reg_base + bank->gpio_regs->port_ddr);
-
+	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	return 0;
@@ -79,18 +165,10 @@ static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int value)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	void __iomem *reg = bank->reg_base + bank->gpio_regs->port_dr;
 	unsigned long flags;
-	u32 data;
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-
-	data = readl(reg);
-	data &= ~BIT(offset);
-	if (value)
-		data |= BIT(offset);
-	writel(data, reg);
-
+	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 }
 
@@ -106,24 +184,65 @@ static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return data;
 }
 
-static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
-				       unsigned int offset, bool enable)
+static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
+				      unsigned int offset,
+				      unsigned int debounce)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	void __iomem *reg = bank->reg_base + bank->gpio_regs->debounce;
-	unsigned long flags;
-	u32 data;
+	const struct rockchip_gpio_regs	*reg = bank->gpio_regs;
+	unsigned long flags, div_reg, freq, max_debounce;
+	bool div_debounce_support;
+	unsigned int cur_div_reg;
+	u64 div;
+
+	if (!IS_ERR(bank->db_clk)) {
+		div_debounce_support = true;
+		freq = clk_get_rate(bank->db_clk);
+		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
+		if (debounce > max_debounce)
+			return -EINVAL;
+
+		div = debounce * freq;
+		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
+	} else {
+		div_debounce_support = false;
+	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
-	data = readl(reg);
-	if (enable)
-		data |= BIT(offset);
-	else
-		data &= ~BIT(offset);
-	writel(data, reg);
+	/* Only the v1 needs to configure div_en and div_con for dbclk */
+	if (debounce) {
+		if (div_debounce_support) {
+			/* Configure the max debounce from consumers */
+			cur_div_reg = readl(bank->reg_base +
+					    reg->dbclk_div_con);
+			if (cur_div_reg < div_reg)
+				writel(div_reg, bank->reg_base +
+				       reg->dbclk_div_con);
+			rockchip_gpio_writel_bit(bank, offset, 1,
+						 reg->dbclk_div_en);
+		}
+
+		rockchip_gpio_writel_bit(bank, offset, 1, reg->debounce);
+	} else {
+		if (div_debounce_support)
+			rockchip_gpio_writel_bit(bank, offset, 0,
+						 reg->dbclk_div_en);
+
+		rockchip_gpio_writel_bit(bank, offset, 0, reg->debounce);
+	}
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	/* Enable or disable dbclk at last */
+	if (div_debounce_support) {
+		if (debounce)
+			clk_prepare_enable(bank->db_clk);
+		else
+			clk_disable_unprepare(bank->db_clk);
+	}
+
+	return 0;
 }
 
 static int rockchip_gpio_direction_input(struct gpio_chip *gc,
@@ -272,12 +391,12 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 level;
 	u32 data;
 	unsigned long flags;
+	int ret = 0;
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 
-	data = readl_relaxed(bank->reg_base + bank->gpio_regs->port_ddr);
-	data &= ~mask;
-	writel_relaxed(data, bank->reg_base + bank->gpio_regs->port_ddr);
+	rockchip_gpio_writel_bit(bank, d->hwirq, 0,
+				 bank->gpio_regs->port_ddr);
 
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
@@ -289,23 +408,30 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	irq_gc_lock(gc);
 
-	level = readl_relaxed(gc->reg_base + bank->gpio_regs->int_type);
-	polarity = readl_relaxed(gc->reg_base + bank->gpio_regs->int_polarity);
+	level = rockchip_gpio_readl(bank, bank->gpio_regs->int_type);
+	polarity = rockchip_gpio_readl(bank, bank->gpio_regs->int_polarity);
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_BOTH:
-		bank->toggle_edge_mode |= mask;
-		level |= mask;
-
-		/*
-		 * Determine gpio state. If 1 next interrupt should be falling
-		 * otherwise rising.
-		 */
-		data = readl(bank->reg_base + bank->gpio_regs->ext_port);
-		if (data & mask)
-			polarity &= ~mask;
-		else
-			polarity |= mask;
+		if (bank->gpio_type == GPIO_TYPE_V2) {
+			bank->toggle_edge_mode &= ~mask;
+			rockchip_gpio_writel_bit(bank, d->hwirq, 1,
+						 bank->gpio_regs->int_bothedge);
+			goto out;
+		} else {
+			bank->toggle_edge_mode |= mask;
+			level |= mask;
+
+			/*
+			 * Determine gpio state. If 1 next interrupt should be
+			 * falling otherwise rising.
+			 */
+			data = readl(bank->reg_base + bank->gpio_regs->ext_port);
+			if (data & mask)
+				polarity &= ~mask;
+			else
+				polarity |= mask;
+		}
 		break;
 	case IRQ_TYPE_EDGE_RISING:
 		bank->toggle_edge_mode &= ~mask;
@@ -328,19 +454,17 @@ static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
 		polarity &= ~mask;
 		break;
 	default:
-		irq_gc_unlock(gc);
-		raw_spin_unlock_irqrestore(&bank->slock, flags);
-		clk_disable(bank->clk);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
-	writel_relaxed(level, gc->reg_base + bank->gpio_regs->int_type);
-	writel_relaxed(polarity, gc->reg_base + bank->gpio_regs->int_polarity);
-
+	rockchip_gpio_writel(bank, level, bank->gpio_regs->int_type);
+	rockchip_gpio_writel(bank, polarity, bank->gpio_regs->int_polarity);
+out:
 	irq_gc_unlock(gc);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	return 0;
+	return ret;
 }
 
 static void rockchip_irq_suspend(struct irq_data *d)
@@ -362,19 +486,12 @@ static void rockchip_irq_resume(struct irq_data *d)
 
 static void rockchip_irq_enable(struct irq_data *d)
 {
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-
 	irq_gc_mask_clr_bit(d);
 }
 
 static void rockchip_irq_disable(struct irq_data *d)
 {
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-
 	irq_gc_mask_set_bit(d);
-	clk_disable(bank->clk);
 }
 
 static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
@@ -403,6 +520,11 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	}
 
 	gc = irq_get_domain_generic_chip(bank->domain, 0);
+	if (bank->gpio_type == GPIO_TYPE_V2) {
+		gc->reg_writel = gpio_writel_v2;
+		gc->reg_readl = gpio_readl_v2;
+	}
+
 	gc->reg_base = bank->reg_base;
 	gc->private = bank;
 	gc->chip_types[0].regs.mask = bank->gpio_regs->int_mask;
@@ -423,9 +545,9 @@ static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
 	 * Our driver only uses the concept of masked and always keeps
 	 * things enabled, so for us that's all masked and all enabled.
 	 */
-	writel_relaxed(0xffffffff, bank->reg_base + bank->gpio_regs->int_mask);
-	writel_relaxed(0xffffffff, bank->reg_base + bank->gpio_regs->port_eoi);
-	writel_relaxed(0xffffffff, bank->reg_base + bank->gpio_regs->int_en);
+	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->int_mask);
+	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->port_eoi);
+	rockchip_gpio_writel(bank, 0xffffffff, bank->gpio_regs->int_en);
 	gc->mask_cache = 0xffffffff;
 
 	irq_set_chained_handler_and_data(bank->irq,
@@ -503,6 +625,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 {
 	struct resource res;
+	int id = 0;
 
 	if (of_address_to_resource(bank->of_node, 0, &res)) {
 		dev_err(bank->dev, "cannot find IO resource for bank\n");
@@ -514,15 +637,31 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		return PTR_ERR(bank->reg_base);
 
 	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
-
-	bank->gpio_regs = &gpio_regs_v1;
-	bank->gpio_type = GPIO_TYPE_V1;
+	if (!bank->irq)
+		return -EINVAL;
 
 	bank->clk = of_clk_get(bank->of_node, 0);
-	if (!IS_ERR(bank->clk))
-		return clk_prepare_enable(bank->clk);
+	if (IS_ERR(bank->clk))
+		return PTR_ERR(bank->clk);
+
+	clk_prepare_enable(bank->clk);
+	id = readl(bank->reg_base + gpio_regs_v2.version_id);
+
+	/* If not gpio v2, that is default to v1. */
+	if (id == GPIO_TYPE_V2) {
+		bank->gpio_regs = &gpio_regs_v2;
+		bank->gpio_type = GPIO_TYPE_V2;
+		bank->db_clk = of_clk_get(bank->of_node, 1);
+		if (IS_ERR(bank->db_clk)) {
+			dev_err(bank->dev, "cannot find debounce clk\n");
+			clk_disable_unprepare(bank->clk);
+			return -EINVAL;
+		}
+	} else {
+		bank->gpio_regs = &gpio_regs_v1;
+		bank->gpio_type = GPIO_TYPE_V1;
+	}
 
-	bank->clk = NULL;
 	return 0;
 }
 
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 1b774b6bbc3e..589d4d2a98c9 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -121,6 +121,7 @@ struct rockchip_drv {
  * @reg_base: register base of the gpio bank
  * @regmap_pull: optional separate register for additional pull settings
  * @clk: clock of the gpio bank
+ * @db_clk: clock of the gpio debounce
  * @irq: interrupt of the gpio bank
  * @saved_masks: Saved content of GPIO_INTEN at suspend time.
  * @pin_base: first pin number
@@ -146,6 +147,7 @@ struct rockchip_pin_bank {
 	void __iomem			*reg_base;
 	struct regmap			*regmap_pull;
 	struct clk			*clk;
+	struct clk			*db_clk;
 	int				irq;
 	u32				saved_masks;
 	u32				pin_base;
-- 
2.25.1



