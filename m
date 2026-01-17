Return-Path: <linux-gpio+bounces-30685-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C7D38E19
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 12:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23F46301C0AC
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 11:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07D233469F;
	Sat, 17 Jan 2026 11:17:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822A331A79;
	Sat, 17 Jan 2026 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648658; cv=none; b=cMQUtbH+0bhlMEK9ixLs3R8h490+iI1BFzCQyJ0tkikicilHsj4GU5JAoHXlGTo9VKYaRWk0Y3g/YC8PU6KwfFazq/LfHyh9ypxrsApwJGR15OHeP7gKvcAKxPRpUfovUH9re6hYKT4IuhvDyj/zV1whQ0Z/H4rYv3FSTFLE1fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648658; c=relaxed/simple;
	bh=waDaV8apJ6t/c4i0hcqNZDcoMEOmxJAN2etTE7z0YVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ATeiAlX3H9IEA9eD5DVrYiEKNijhtPUIY5qsOH8kQpQfuauMIA6RIQX0RDmg7htVXP9BSW9b+fGYzpXpFtWke3ISIeZMPzMRbv6vwC3rvSE3VPzfevjb3GWmhj4rI0Fgv8gD7PUDvyHVmTZ9Dp4fAn0+0bqV7AmjC6Za1Ns5PaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 17 Jan
 2026 19:17:17 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 17 Jan 2026 19:17:17 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Sat, 17 Jan 2026 19:17:10 +0800
Subject: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
In-Reply-To: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768648637; l=13990;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=waDaV8apJ6t/c4i0hcqNZDcoMEOmxJAN2etTE7z0YVY=;
 b=WK3cp1IIzqzbmV2my4CSbK3wCzTSC1LiMoaGVO5pfflzPb+If8ydHApY7Pa2elknQnQ/m4T4O
 /wzSxBxZMCuACyPS53E0NqkJXTW36CaB1KVdf8GOBiz1ds3hrzWBsbT
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

Add low-level operations (llops) to abstract the register access for SGPIO
registers. With this abstraction layer, the driver can separate the
hardware and software logic, making it easier to extend the driver to
support different hardware register layouts.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 239 ++++++++++++++++++---------------------
 1 file changed, 111 insertions(+), 128 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index a96ed6d8a55d..a2401f4e8e37 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -27,6 +27,7 @@
 
 struct aspeed_sgpio_pdata {
 	const u32 pin_mask;
+	const struct aspeed_sgpio_llops *llops;
 };
 
 struct aspeed_sgpio {
@@ -36,6 +37,7 @@ struct aspeed_sgpio {
 	raw_spinlock_t lock;
 	void __iomem *base;
 	int irq;
+	const struct aspeed_sgpio_pdata *pdata;
 };
 
 struct aspeed_sgpio_bank {
@@ -90,6 +92,15 @@ enum aspeed_sgpio_reg {
 	reg_tolerance,
 };
 
+struct aspeed_sgpio_llops {
+	void (*reg_bit_set)(struct aspeed_sgpio *gpio, unsigned int offset,
+			    const enum aspeed_sgpio_reg reg, bool val);
+	bool (*reg_bit_get)(struct aspeed_sgpio *gpio, unsigned int offset,
+			    const enum aspeed_sgpio_reg reg);
+	int (*reg_bank_get)(struct aspeed_sgpio *gpio, unsigned int offset,
+			    const enum aspeed_sgpio_reg reg);
+};
+
 #define GPIO_VAL_VALUE      0x00
 #define GPIO_IRQ_ENABLE     0x00
 #define GPIO_IRQ_TYPE0      0x04
@@ -97,9 +108,9 @@ enum aspeed_sgpio_reg {
 #define GPIO_IRQ_TYPE2      0x0C
 #define GPIO_IRQ_STATUS     0x10
 
-static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
-				     const struct aspeed_sgpio_bank *bank,
-				     const enum aspeed_sgpio_reg reg)
+static void __iomem *aspeed_sgpio_g4_bank_reg(struct aspeed_sgpio *gpio,
+					      const struct aspeed_sgpio_bank *bank,
+					      const enum aspeed_sgpio_reg reg)
 {
 	switch (reg) {
 	case reg_val:
@@ -165,14 +176,13 @@ static bool aspeed_sgpio_is_input(unsigned int offset)
 static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_sgpio_bank *bank = to_bank(offset);
 	enum aspeed_sgpio_reg reg;
 	int rc = 0;
 
 	guard(raw_spinlock_irqsave)(&gpio->lock);
 
 	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
-	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
+	rc = gpio->pdata->llops->reg_bit_get(gpio, offset, reg);
 
 	return rc;
 }
@@ -180,26 +190,11 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_sgpio_bank *bank = to_bank(offset);
-	void __iomem *addr_r, *addr_w;
-	u32 reg = 0;
 
 	if (aspeed_sgpio_is_input(offset))
 		return -EINVAL;
 
-	/* Since this is an output, read the cached value from rdata, then
-	 * update val. */
-	addr_r = bank_reg(gpio, bank, reg_rdata);
-	addr_w = bank_reg(gpio, bank, reg_val);
-
-	reg = ioread32(addr_r);
-
-	if (val)
-		reg |= GPIO_BIT(offset);
-	else
-		reg &= ~GPIO_BIT(offset);
-
-	iowrite32(reg, addr_w);
+	gpio->pdata->llops->reg_bit_set(gpio, offset, reg_val, val);
 
 	return 0;
 }
@@ -238,69 +233,34 @@ static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	return !!aspeed_sgpio_is_input(offset);
 }
 
-static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
-					struct aspeed_sgpio **gpio,
-					const struct aspeed_sgpio_bank **bank,
-					u32 *bit, int *offset)
-{
-	struct aspeed_sgpio *internal;
-
-	*offset = irqd_to_hwirq(d);
-	internal = irq_data_get_irq_chip_data(d);
-	WARN_ON(!internal);
-
-	*gpio = internal;
-	*bank = to_bank(*offset);
-	*bit = GPIO_BIT(*offset);
-}
 
 static void aspeed_sgpio_irq_ack(struct irq_data *d)
 {
-	const struct aspeed_sgpio_bank *bank;
-	struct aspeed_sgpio *gpio;
-	void __iomem *status_addr;
-	int offset;
-	u32 bit;
-
-	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
-
-	status_addr = bank_reg(gpio, bank, reg_irq_status);
+	struct aspeed_sgpio *gpio = irq_data_get_irq_chip_data(d);
+	int offset = irqd_to_hwirq(d);
 
 	guard(raw_spinlock_irqsave)(&gpio->lock);
 
-	iowrite32(bit, status_addr);
+	gpio->pdata->llops->reg_bit_set(gpio, offset, reg_irq_status, 1);
 }
 
 static void aspeed_sgpio_irq_set_mask(struct irq_data *d, bool set)
 {
-	const struct aspeed_sgpio_bank *bank;
-	struct aspeed_sgpio *gpio;
-	u32 reg, bit;
-	void __iomem *addr;
-	int offset;
-
-	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
-	addr = bank_reg(gpio, bank, reg_irq_enable);
+	struct aspeed_sgpio *gpio = irq_data_get_irq_chip_data(d);
+	int offset = irqd_to_hwirq(d);
 
 	/* Unmasking the IRQ */
 	if (set)
-		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
-
-	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
-		reg = ioread32(addr);
-		if (set)
-			reg |= bit;
-		else
-			reg &= ~bit;
-
-		iowrite32(reg, addr);
+		gpiochip_enable_irq(&gpio->chip, offset);
+	scoped_guard(raw_spinlock_irqsave, &gpio->lock)
+	{
+		gpio->pdata->llops->reg_bit_set(gpio, offset, reg_irq_enable,
+						set);
 	}
 
 	/* Masking the IRQ */
 	if (!set)
-		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
-
-
+		gpiochip_disable_irq(&gpio->chip, offset);
 }
 
 static void aspeed_sgpio_irq_mask(struct irq_data *d)
@@ -318,30 +278,25 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 	u32 type0 = 0;
 	u32 type1 = 0;
 	u32 type2 = 0;
-	u32 bit, reg;
-	const struct aspeed_sgpio_bank *bank;
 	irq_flow_handler_t handler;
-	struct aspeed_sgpio *gpio;
-	void __iomem *addr;
-	int offset;
-
-	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
+	struct aspeed_sgpio *gpio = irq_data_get_irq_chip_data(d);
+	int offset = irqd_to_hwirq(d);
 
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_BOTH:
-		type2 |= bit;
+		type2 = 1;
 		fallthrough;
 	case IRQ_TYPE_EDGE_RISING:
-		type0 |= bit;
+		type0 = 1;
 		fallthrough;
 	case IRQ_TYPE_EDGE_FALLING:
 		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		type0 |= bit;
+		type0 = 1;
 		fallthrough;
 	case IRQ_TYPE_LEVEL_LOW:
-		type1 |= bit;
+		type1 = 1;
 		handler = handle_level_irq;
 		break;
 	default:
@@ -349,20 +304,9 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 	}
 
 	scoped_guard(raw_spinlock_irqsave, &gpio->lock) {
-		addr = bank_reg(gpio, bank, reg_irq_type0);
-		reg = ioread32(addr);
-		reg = (reg & ~bit) | type0;
-		iowrite32(reg, addr);
-
-		addr = bank_reg(gpio, bank, reg_irq_type1);
-		reg = ioread32(addr);
-		reg = (reg & ~bit) | type1;
-		iowrite32(reg, addr);
-
-		addr = bank_reg(gpio, bank, reg_irq_type2);
-		reg = ioread32(addr);
-		reg = (reg & ~bit) | type2;
-		iowrite32(reg, addr);
+		gpio->pdata->llops->reg_bit_set(gpio, offset, reg_irq_type0, type0);
+		gpio->pdata->llops->reg_bit_set(gpio, offset, reg_irq_type1, type1);
+		gpio->pdata->llops->reg_bit_set(gpio, offset, reg_irq_type2, type2);
 	}
 
 	irq_set_handler_locked(d, handler);
@@ -374,16 +318,14 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
-	struct aspeed_sgpio *data = gpiochip_get_data(gc);
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
 	unsigned int i, p;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
-
-		reg = ioread32(bank_reg(data, bank, reg_irq_status));
+		reg = gpio->pdata->llops->reg_bank_get(gpio, i << 6, reg_irq_status);
 
 		for_each_set_bit(p, &reg, 32)
 			generic_handle_domain_irq(gc->irq.domain, (i * 32 + p) * 2);
@@ -394,12 +336,8 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 
 static void aspeed_sgpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
-	const struct aspeed_sgpio_bank *bank;
-	struct aspeed_sgpio *gpio;
-	u32 bit;
-	int offset;
+	struct aspeed_sgpio *gpio = irq_data_get_irq_chip_data(d);
 
-	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
 	seq_puts(p, dev_name(gpio->dev));
 }
 
@@ -417,7 +355,6 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
 	int rc, i;
-	const struct aspeed_sgpio_bank *bank;
 	struct gpio_irq_chip *irq;
 
 	rc = platform_get_irq(pdev, 0);
@@ -427,12 +364,11 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	gpio->irq = rc;
 
 	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank =  &aspeed_sgpio_banks[i];
+	for (i = 0; i < gpio->chip.ngpio; i += 2) {
 		/* disable irq enable bits */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_enable));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_enable, 0);
 		/* clear status bits */
-		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_status, 1);
 	}
 
 	irq = &gpio->chip.irq;
@@ -446,42 +382,90 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	irq->num_parents = 1;
 
 	/* Apply default IRQ settings */
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank = &aspeed_sgpio_banks[i];
+	for (i = 0; i < gpio->chip.ngpio; i += 2) {
 		/* set falling or level-low irq */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type0, 0);
 		/* trigger type is edge */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type1));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type1, 0);
 		/* single edge trigger */
-		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type2));
+		gpio->pdata->llops->reg_bit_set(gpio, i, reg_irq_type2, 0);
 	}
 
 	return 0;
 }
 
+static void aspeed_sgpio_g4_reg_bit_set(struct aspeed_sgpio *gpio, unsigned int offset,
+				      const enum aspeed_sgpio_reg reg, bool val)
+{
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	void __iomem *addr = aspeed_sgpio_g4_bank_reg(gpio, bank, reg);
+	u32 temp;
+
+	if (reg == reg_val) {
+		/* Since this is an output, read the cached value from rdata, then update val. */
+		addr = aspeed_sgpio_g4_bank_reg(gpio, bank, reg_rdata);
+		temp = ioread32(addr);
+		if (val)
+			temp |= GPIO_BIT(offset);
+		else
+			temp &= ~GPIO_BIT(offset);
+
+		addr = aspeed_sgpio_g4_bank_reg(gpio, bank, reg_val);
+		iowrite32(temp, addr);
+	} else if (reg == reg_irq_status) {
+		if (val)
+			iowrite32(GPIO_BIT(offset), addr);
+	} else {
+		/* When setting other registers, we read from the register itself */
+		temp = ioread32(addr);
+		if (val)
+			temp |= GPIO_BIT(offset);
+		else
+			temp &= ~GPIO_BIT(offset);
+		iowrite32(temp, addr);
+	}
+}
+
+static bool aspeed_sgpio_g4_reg_bit_get(struct aspeed_sgpio *gpio, unsigned int offset,
+					const enum aspeed_sgpio_reg reg)
+{
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	void __iomem *addr = aspeed_sgpio_g4_bank_reg(gpio, bank, reg);
+
+	return !!(ioread32(addr) & GPIO_BIT(offset));
+}
+
+static int aspeed_sgpio_g4_reg_bank_get(struct aspeed_sgpio *gpio, unsigned int offset,
+					const enum aspeed_sgpio_reg reg)
+{
+	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	void __iomem *addr = aspeed_sgpio_g4_bank_reg(gpio, bank, reg);
+
+	if (reg == reg_irq_status)
+		return ioread32(addr);
+	else
+		return -EOPNOTSUPP;
+}
+
+static const struct aspeed_sgpio_llops aspeed_sgpio_g4_llops = {
+	.reg_bit_set = aspeed_sgpio_g4_reg_bit_set,
+	.reg_bit_get = aspeed_sgpio_g4_reg_bit_get,
+	.reg_bank_get = aspeed_sgpio_g4_reg_bank_get,
+};
+
 static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
 	.pin_mask = GENMASK(9, 6),
+	.llops = &aspeed_sgpio_g4_llops,
 };
 
 static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
 					unsigned int offset, bool enable)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(chip);
-	void __iomem *reg;
-	u32 val;
-
-	reg = bank_reg(gpio, to_bank(offset), reg_tolerance);
 
 	guard(raw_spinlock_irqsave)(&gpio->lock);
 
-	val = readl(reg);
-
-	if (enable)
-		val |= GPIO_BIT(offset);
-	else
-		val &= ~GPIO_BIT(offset);
-
-	writel(val, reg);
+	gpio->pdata->llops->reg_bit_set(gpio, offset, reg_tolerance, enable);
 
 	return 0;
 }
@@ -500,6 +484,7 @@ static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 static const struct aspeed_sgpio_pdata ast2600_sgpiom_pdata = {
 	.pin_mask = GENMASK(10, 6),
+	.llops = &aspeed_sgpio_g4_llops,
 };
 
 static const struct of_device_id aspeed_sgpio_of_table[] = {
@@ -514,7 +499,6 @@ MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
 static int aspeed_sgpio_probe(struct platform_device *pdev)
 {
 	u32 nr_gpios, sgpio_freq, sgpio_clk_div, gpio_cnt_regval, pin_mask;
-	const struct aspeed_sgpio_pdata *pdata;
 	struct aspeed_sgpio *gpio;
 	unsigned long apb_freq;
 	int rc;
@@ -529,12 +513,11 @@ static int aspeed_sgpio_probe(struct platform_device *pdev)
 
 	gpio->dev = &pdev->dev;
 
-	pdata = device_get_match_data(&pdev->dev);
-	if (!pdata)
+	gpio->pdata = device_get_match_data(&pdev->dev);
+	if (!gpio->pdata)
 		return -EINVAL;
 
-	pin_mask = pdata->pin_mask;
-
+	pin_mask = gpio->pdata->pin_mask;
 	rc = device_property_read_u32(&pdev->dev, "ngpios", &nr_gpios);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Could not read ngpios property\n");

-- 
2.34.1


