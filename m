Return-Path: <linux-gpio+bounces-10038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9C977A2F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 09:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F40A28629C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 07:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9011D61A6;
	Fri, 13 Sep 2024 07:43:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EB71D618E;
	Fri, 13 Sep 2024 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213430; cv=none; b=NY9uu8wnoCWMUpB0s6P9ZkhF9mrVOKojXk17jKzy+cqfpf7q5H3Vqd+/cXpAGBVi8LWzZrdeZ5CJnovHl2rHou4sKBWj0aSCJnNn70exTDuZBL2mbzUQCu8UXlwqHbvy7r2/xXSnFMUcPYPJLj6XMqBC58wI7dPof9z9bALZdKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213430; c=relaxed/simple;
	bh=qwzOy4pNaV7ZTbcDXvbLNFsQbzBtHg8g++pylcwEWes=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEQCic8xq3Tm0rca+R+qu+GEMJj3BlZ/pa2nNTu9aVwTpPwyBnKUU0wKoVDz3Y59y8UMS9lv8/PP/JLNNdBBBApisNxY8Kn1lSp25h5L3Bm12jurhTeukpX3v24aHsc/dzSFEQCUEmr5NGvXVFsQzIXpUP4uCCtMTT24lE7Ou6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 13 Sep
 2024 15:43:25 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 13 Sep 2024 15:43:25 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>, <Peter.Yin@quantatw.com>
Subject: [PATCH v3 3/6] gpio: aspeed: Create llops to handle hardware access
Date: Fri, 13 Sep 2024 15:43:22 +0800
Message-ID: <20240913074325.239390-4-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add low-level operations (llops) to abstract the register access for GPIO
registers and the coprocessor request/release. With this abstraction
layer, the driver can separate the hardware and software logic, making it
easier to extend the driver to support different hardware register
layouts.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 366 ++++++++++++++++++-------------------
 1 file changed, 178 insertions(+), 188 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index d20e15b2079d..40ca308054c6 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -39,6 +39,10 @@ struct aspeed_bank_props {
 struct aspeed_gpio_config {
 	unsigned int nr_gpios;
 	const struct aspeed_bank_props *props;
+	const struct aspeed_gpio_llops *llops;
+	const int *debounce_timers_array;
+	int debounce_timers_num;
+	bool cmd_source_supoort;
 };
 
 /*
@@ -178,6 +182,15 @@ enum aspeed_gpio_reg {
 	reg_cmdsrc1,
 };
 
+struct aspeed_gpio_llops {
+	bool (*copro_request)(struct aspeed_gpio *gpio, unsigned int offset);
+	void (*copro_release)(struct aspeed_gpio *gpio, unsigned int offset);
+	void (*reg_bits_set)(struct aspeed_gpio *gpio, unsigned int offset,
+			     const enum aspeed_gpio_reg reg, u32 val);
+	u32 (*reg_bits_read)(struct aspeed_gpio *gpio, unsigned int offset,
+			     const enum aspeed_gpio_reg reg);
+};
+
 #define GPIO_VAL_VALUE	0x00
 #define GPIO_VAL_DIR	0x04
 
@@ -237,10 +250,6 @@ static inline void __iomem *bank_reg(struct aspeed_gpio *gpio,
 #define GPIO_OFFSET(x)	((x) & 0x1f)
 #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
 
-#define _GPIO_SET_DEBOUNCE(t, o, i) ((!!((t) & BIT(i))) << GPIO_OFFSET(o))
-#define GPIO_SET_DEBOUNCE1(t, o) _GPIO_SET_DEBOUNCE(t, o, 1)
-#define GPIO_SET_DEBOUNCE2(t, o) _GPIO_SET_DEBOUNCE(t, o, 0)
-
 static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
 {
 	unsigned int bank = GPIO_BANK(offset);
@@ -296,107 +305,56 @@ static inline bool have_output(struct aspeed_gpio *gpio, unsigned int offset)
 }
 
 static void aspeed_gpio_change_cmd_source(struct aspeed_gpio *gpio,
-					  const struct aspeed_gpio_bank *bank,
-					  int bindex, int cmdsrc)
+					  unsigned int offset,
+					  int cmdsrc)
 {
-	void __iomem *c0 = bank_reg(gpio, bank, reg_cmdsrc0);
-	void __iomem *c1 = bank_reg(gpio, bank, reg_cmdsrc1);
-	u32 bit, reg;
-
 	/*
-	 * Each register controls 4 banks, so take the bottom 2
-	 * bits of the bank index, and use them to select the
-	 * right control bit (0, 8, 16 or 24).
+	 * The command source register is only valid in bits 0, 8, 16, and 24, so we use
+	 * (offset & ~(0x7)) to ensure that reg_bits_set always targets a valid bit.
 	 */
-	bit = BIT((bindex & 3) << 3);
-
 	/* Source 1 first to avoid illegal 11 combination */
-	reg = ioread32(c1);
-	if (cmdsrc & 2)
-		reg |= bit;
-	else
-		reg &= ~bit;
-	iowrite32(reg, c1);
-
+	gpio->config->llops->reg_bits_set(gpio, offset & ~(0x7), reg_cmdsrc1, !!(cmdsrc & BIT(1)));
 	/* Then Source 0 */
-	reg = ioread32(c0);
-	if (cmdsrc & 1)
-		reg |= bit;
-	else
-		reg &= ~bit;
-	iowrite32(reg, c0);
+	gpio->config->llops->reg_bits_set(gpio, offset & ~(0x7), reg_cmdsrc0, !!(cmdsrc & BIT(0)));
 }
 
 static bool aspeed_gpio_copro_request(struct aspeed_gpio *gpio,
 				      unsigned int offset)
 {
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-
-	if (!copro_ops || !gpio->cf_copro_bankmap)
-		return false;
-	if (!gpio->cf_copro_bankmap[offset >> 3])
-		return false;
-	if (!copro_ops->request_access)
-		return false;
+	if (gpio->config->llops->copro_request)
+		return gpio->config->llops->copro_request(gpio, offset);
 
-	/* Pause the coprocessor */
-	copro_ops->request_access(copro_data);
-
-	/* Change command source back to ARM */
-	aspeed_gpio_change_cmd_source(gpio, bank, offset >> 3, GPIO_CMDSRC_ARM);
-
-	/* Update cache */
-	gpio->dcache[GPIO_BANK(offset)] = ioread32(bank_reg(gpio, bank, reg_rdata));
-
-	return true;
+	return false;
 }
 
 static void aspeed_gpio_copro_release(struct aspeed_gpio *gpio,
 				      unsigned int offset)
 {
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-
-	if (!copro_ops || !gpio->cf_copro_bankmap)
-		return;
-	if (!gpio->cf_copro_bankmap[offset >> 3])
-		return;
-	if (!copro_ops->release_access)
-		return;
-
-	/* Change command source back to ColdFire */
-	aspeed_gpio_change_cmd_source(gpio, bank, offset >> 3,
-				      GPIO_CMDSRC_COLDFIRE);
-
-	/* Restart the coprocessor */
-	copro_ops->release_access(copro_data);
+	if (gpio->config->llops->copro_release)
+		gpio->config->llops->copro_release(gpio, offset);
 }
 
 static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
 
-	return !!(ioread32(bank_reg(gpio, bank, reg_val)) & GPIO_BIT(offset));
+	return gpio->config->llops->reg_bits_read(gpio, offset, reg_val);
 }
 
 static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 			      int val)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	void __iomem *addr;
 	u32 reg;
 
-	addr = bank_reg(gpio, bank, reg_val);
 	reg = gpio->dcache[GPIO_BANK(offset)];
-
 	if (val)
 		reg |= GPIO_BIT(offset);
 	else
 		reg &= ~GPIO_BIT(offset);
 	gpio->dcache[GPIO_BANK(offset)] = reg;
 
-	iowrite32(reg, addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_val, val);
 }
 
 static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
@@ -404,7 +362,7 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
 	unsigned long flags;
-	bool copro;
+	bool copro = 0;
 
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
@@ -419,22 +377,16 @@ static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
 static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	void __iomem *addr = bank_reg(gpio, bank, reg_dir);
 	unsigned long flags;
-	bool copro;
-	u32 reg;
+	bool copro = 0;
 
 	if (!have_input(gpio, offset))
 		return -ENOTSUPP;
 
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = ioread32(addr);
-	reg &= ~GPIO_BIT(offset);
-
 	copro = aspeed_gpio_copro_request(gpio, offset);
-	iowrite32(reg, addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_dir, 0);
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
 
@@ -447,23 +399,17 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 			       unsigned int offset, int val)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	void __iomem *addr = bank_reg(gpio, bank, reg_dir);
 	unsigned long flags;
-	bool copro;
-	u32 reg;
+	bool copro = 0;
 
 	if (!have_output(gpio, offset))
 		return -ENOTSUPP;
 
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = ioread32(addr);
-	reg |= GPIO_BIT(offset);
-
 	copro = aspeed_gpio_copro_request(gpio, offset);
 	__aspeed_gpio_set(gc, offset, val);
-	iowrite32(reg, addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_dir, 1);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
@@ -475,7 +421,6 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
 static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 	u32 val;
 
@@ -487,7 +432,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 
-	val = ioread32(bank_reg(gpio, bank, reg_dir)) & GPIO_BIT(offset);
+	val = gpio->config->llops->reg_bits_read(gpio, offset, reg_dir);
 
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
 
@@ -496,8 +441,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 
 static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
 					   struct aspeed_gpio **gpio,
-					   const struct aspeed_gpio_bank **bank,
-					   u32 *bit, int *offset)
+					   int *offset)
 {
 	struct aspeed_gpio *internal;
 
@@ -510,32 +454,25 @@ static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
 		return -ENOTSUPP;
 
 	*gpio = internal;
-	*bank = to_bank(*offset);
-	*bit = GPIO_BIT(*offset);
 
 	return 0;
 }
 
 static void aspeed_gpio_irq_ack(struct irq_data *d)
 {
-	const struct aspeed_gpio_bank *bank;
 	struct aspeed_gpio *gpio;
 	unsigned long flags;
-	void __iomem *status_addr;
 	int rc, offset;
-	bool copro;
-	u32 bit;
+	bool copro = 0;
 
-	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
 	if (rc)
 		return;
 
-	status_addr = bank_reg(gpio, bank, reg_irq_status);
-
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
-	iowrite32(bit, status_addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_status, 1);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
@@ -544,20 +481,15 @@ static void aspeed_gpio_irq_ack(struct irq_data *d)
 
 static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 {
-	const struct aspeed_gpio_bank *bank;
 	struct aspeed_gpio *gpio;
 	unsigned long flags;
-	u32 reg, bit;
-	void __iomem *addr;
 	int rc, offset;
-	bool copro;
+	bool copro = 0;
 
-	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
 	if (rc)
 		return;
 
-	addr = bank_reg(gpio, bank, reg_irq_enable);
-
 	/* Unmasking the IRQ */
 	if (set)
 		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
@@ -565,12 +497,7 @@ static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
-	reg = ioread32(addr);
-	if (set)
-		reg |= bit;
-	else
-		reg &= ~bit;
-	iowrite32(reg, addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_enable, set);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
@@ -596,34 +523,31 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 	u32 type0 = 0;
 	u32 type1 = 0;
 	u32 type2 = 0;
-	u32 bit, reg;
-	const struct aspeed_gpio_bank *bank;
 	irq_flow_handler_t handler;
 	struct aspeed_gpio *gpio;
 	unsigned long flags;
-	void __iomem *addr;
 	int rc, offset;
-	bool copro;
+	bool copro = 0;
 
-	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
 	if (rc)
 		return -EINVAL;
 
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
@@ -633,20 +557,9 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
-	addr = bank_reg(gpio, bank, reg_irq_type0);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type0;
-	iowrite32(reg, addr);
-
-	addr = bank_reg(gpio, bank, reg_irq_type1);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type1;
-	iowrite32(reg, addr);
-
-	addr = bank_reg(gpio, bank, reg_irq_type2);
-	reg = ioread32(addr);
-	reg = (reg & ~bit) | type2;
-	iowrite32(reg, addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_type0, type0);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_type1, type1);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_type2, type2);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
@@ -661,7 +574,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
-	struct aspeed_gpio *data = gpiochip_get_data(gc);
 	unsigned int i, p, banks;
 	unsigned long reg;
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
@@ -670,9 +582,7 @@ static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 
 	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
 	for (i = 0; i < banks; i++) {
-		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
-
-		reg = ioread32(bank_reg(data, bank, reg_irq_status));
+		reg = gpio->config->llops->reg_bits_read(gpio, i, reg_irq_status);
 
 		for_each_set_bit(p, &reg, 32)
 			generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
@@ -711,23 +621,12 @@ static int aspeed_gpio_reset_tolerance(struct gpio_chip *chip,
 {
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
 	unsigned long flags;
-	void __iomem *treg;
-	bool copro;
-	u32 val;
-
-	treg = bank_reg(gpio, to_bank(offset), reg_tolerance);
+	bool copro = 0;
 
 	raw_spin_lock_irqsave(&gpio->lock, flags);
 	copro = aspeed_gpio_copro_request(gpio, offset);
 
-	val = readl(treg);
-
-	if (enable)
-		val |= GPIO_BIT(offset);
-	else
-		val &= ~GPIO_BIT(offset);
-
-	writel(val, treg);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_tolerance, enable);
 
 	if (copro)
 		aspeed_gpio_copro_release(gpio, offset);
@@ -821,21 +720,11 @@ static inline bool timer_allocation_registered(struct aspeed_gpio *gpio,
 static void configure_timer(struct aspeed_gpio *gpio, unsigned int offset,
 		unsigned int timer)
 {
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
-	const u32 mask = GPIO_BIT(offset);
-	void __iomem *addr;
-	u32 val;
-
 	/* Note: Debounce timer isn't under control of the command
 	 * source registers, so no need to sync with the coprocessor
 	 */
-	addr = bank_reg(gpio, bank, reg_debounce_sel1);
-	val = ioread32(addr);
-	iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE1(timer, offset), addr);
-
-	addr = bank_reg(gpio, bank, reg_debounce_sel2);
-	val = ioread32(addr);
-	iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE2(timer, offset), addr);
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_debounce_sel1, !!(timer & BIT(1)));
+	gpio->config->llops->reg_bits_set(gpio, offset, reg_debounce_sel2, !!(timer & BIT(0)));
 }
 
 static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
@@ -866,15 +755,15 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 	}
 
 	/* Try to find a timer already configured for the debounce period */
-	for (i = 1; i < ARRAY_SIZE(debounce_timers); i++) {
+	for (i = 1; i < gpio->config->debounce_timers_num; i++) {
 		u32 cycles;
 
-		cycles = ioread32(gpio->base + debounce_timers[i]);
+		cycles = ioread32(gpio->base + gpio->config->debounce_timers_array[i]);
 		if (requested_cycles == cycles)
 			break;
 	}
 
-	if (i == ARRAY_SIZE(debounce_timers)) {
+	if (i == gpio->config->debounce_timers_num) {
 		int j;
 
 		/*
@@ -888,8 +777,8 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 
 		if (j == ARRAY_SIZE(gpio->timer_users)) {
 			dev_warn(chip->parent,
-					"Debounce timers exhausted, cannot debounce for period %luus\n",
-					usecs);
+				 "Debounce timers exhausted, cannot debounce for period %luus\n",
+				 usecs);
 
 			rc = -EPERM;
 
@@ -905,7 +794,7 @@ static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
 
 		i = j;
 
-		iowrite32(requested_cycles, gpio->base + debounce_timers[i]);
+		iowrite32(requested_cycles, gpio->base + gpio->config->debounce_timers_array[i]);
 	}
 
 	if (WARN(i == 0, "Cannot register index of disabled timer\n")) {
@@ -1008,6 +897,9 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 
+	if (!gpio->config->cmd_source_supoort)
+		return -EOPNOTSUPP;
+
 	if (!gpio->cf_copro_bankmap)
 		gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
 	if (!gpio->cf_copro_bankmap)
@@ -1027,7 +919,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 
 	/* Switch command source */
 	if (gpio->cf_copro_bankmap[bindex] == 1)
-		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
+		aspeed_gpio_change_cmd_source(gpio, offset,
 					      GPIO_CMDSRC_COLDFIRE);
 
 	if (vreg_offset)
@@ -1051,9 +943,11 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 	struct gpio_chip *chip = gpiod_to_chip(desc);
 	struct aspeed_gpio *gpio = gpiochip_get_data(chip);
 	int rc = 0, bindex, offset = gpio_chip_hwgpio(desc);
-	const struct aspeed_gpio_bank *bank = to_bank(offset);
 	unsigned long flags;
 
+	if (!gpio->config->cmd_source_supoort)
+		return -EOPNOTSUPP;
+
 	if (!gpio->cf_copro_bankmap)
 		return -ENXIO;
 
@@ -1072,7 +966,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc *desc)
 
 	/* Switch command source */
 	if (gpio->cf_copro_bankmap[bindex] == 0)
-		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
+		aspeed_gpio_change_cmd_source(gpio, offset,
 					      GPIO_CMDSRC_ARM);
  bail:
 	raw_spin_unlock_irqrestore(&gpio->lock, flags);
@@ -1082,12 +976,10 @@ EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
 
 static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_file *p)
 {
-	const struct aspeed_gpio_bank *bank;
 	struct aspeed_gpio *gpio;
-	u32 bit;
 	int rc, offset;
 
-	rc = irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
+	rc = irqd_to_aspeed_gpio_data(d, &gpio, &offset);
 	if (rc)
 		return;
 
@@ -1104,6 +996,78 @@ static const struct irq_chip aspeed_gpio_irq_chip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static void aspeed_g4_reg_bits_set(struct aspeed_gpio *gpio, unsigned int offset,
+				   const enum aspeed_gpio_reg reg, u32 val)
+{
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	void __iomem *addr = bank_reg(gpio, bank, reg);
+	u32 temp;
+
+	temp = ioread32(addr);
+	if (val)
+		temp |= GPIO_BIT(offset);
+	else
+		temp &= ~GPIO_BIT(offset);
+
+	iowrite32(temp, addr);
+}
+
+static u32 aspeed_g4_reg_bits_read(struct aspeed_gpio *gpio, unsigned int offset,
+				   const enum aspeed_gpio_reg reg)
+{
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+	void __iomem *addr = bank_reg(gpio, bank, reg);
+
+	if (reg == reg_rdata)
+		return ioread32(addr);
+	return !!(ioread32(addr) & GPIO_BIT(offset));
+}
+
+static bool aspeed_g4_copro_request(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	const struct aspeed_gpio_bank *bank = to_bank(offset);
+
+	if (!copro_ops || !gpio->cf_copro_bankmap)
+		return false;
+	if (!gpio->cf_copro_bankmap[offset >> 3])
+		return false;
+	if (!copro_ops->request_access)
+		return false;
+
+	/* Pause the coprocessor */
+	copro_ops->request_access(copro_data);
+
+	/* Change command source back to ARM */
+	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_ARM);
+
+	/* Update cache */
+	gpio->dcache[GPIO_BANK(offset)] = ioread32(bank_reg(gpio, bank, reg_rdata));
+
+	return true;
+}
+
+static void aspeed_g4_copro_release(struct aspeed_gpio *gpio, unsigned int offset)
+{
+	if (!copro_ops || !gpio->cf_copro_bankmap)
+		return;
+	if (!gpio->cf_copro_bankmap[offset >> 3])
+		return;
+	if (!copro_ops->release_access)
+		return;
+
+	/* Change command source back to ColdFire */
+	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_COLDFIRE);
+
+	/* Restart the coprocessor */
+	copro_ops->release_access(copro_data);
+}
+
+static const struct aspeed_gpio_llops aspeed_g4_llops = {
+	.copro_request = aspeed_g4_copro_request,
+	.copro_release = aspeed_g4_copro_release,
+	.reg_bits_set = aspeed_g4_reg_bits_set,
+	.reg_bits_read = aspeed_g4_reg_bits_read,
+};
 /*
  * Any banks not specified in a struct aspeed_bank_props array are assumed to
  * have the properties:
@@ -1120,7 +1084,14 @@ static const struct aspeed_bank_props ast2400_bank_props[] = {
 
 static const struct aspeed_gpio_config ast2400_config =
 	/* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
-	{ .nr_gpios = 220, .props = ast2400_bank_props, };
+	{
+		.nr_gpios = 220,
+		.props = ast2400_bank_props,
+		.llops = &aspeed_g4_llops,
+		.debounce_timers_array = debounce_timers,
+		.debounce_timers_num = ARRAY_SIZE(debounce_timers),
+		.cmd_source_supoort = true,
+	};
 
 static const struct aspeed_bank_props ast2500_bank_props[] = {
 	/*     input	  output   */
@@ -1132,7 +1103,14 @@ static const struct aspeed_bank_props ast2500_bank_props[] = {
 
 static const struct aspeed_gpio_config ast2500_config =
 	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
-	{ .nr_gpios = 232, .props = ast2500_bank_props, };
+	{
+		.nr_gpios = 232,
+		.props = ast2500_bank_props,
+		.llops = &aspeed_g4_llops,
+		.debounce_timers_array = debounce_timers,
+		.debounce_timers_num = ARRAY_SIZE(debounce_timers),
+		.cmd_source_supoort = true,
+	};
 
 static const struct aspeed_bank_props ast2600_bank_props[] = {
 	/*     input	  output   */
@@ -1148,7 +1126,14 @@ static const struct aspeed_gpio_config ast2600_config =
 	 * We expect ngpio being set in the device tree and this is a fallback
 	 * option.
 	 */
-	{ .nr_gpios = 208, .props = ast2600_bank_props, };
+	{
+		.nr_gpios = 208,
+		.props = ast2600_bank_props,
+		.llops = &aspeed_g4_llops,
+		.debounce_timers_array = debounce_timers,
+		.debounce_timers_num = ARRAY_SIZE(debounce_timers),
+		.cmd_source_supoort = true,
+	};
 
 static const struct of_device_id aspeed_gpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-gpio", .data = &ast2400_config, },
@@ -1191,6 +1176,9 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 	gpio->config = gpio_id->data;
 
+	if (!gpio->config->llops->reg_bits_set || !gpio->config->llops->reg_bits_read)
+		return -EOPNOTSUPP;
+
 	gpio->chip.parent = &pdev->dev;
 	err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
 	gpio->chip.ngpio = (u16) ngpio;
@@ -1218,15 +1206,17 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	 * Populate it with initial values read from the HW and switch
 	 * all command sources to the ARM by default
 	 */
-	for (i = 0; i < banks; i++) {
-		const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
-		void __iomem *addr = bank_reg(gpio, bank, reg_rdata);
-		gpio->dcache[i] = ioread32(addr);
-		aspeed_gpio_change_cmd_source(gpio, bank, 0, GPIO_CMDSRC_ARM);
-		aspeed_gpio_change_cmd_source(gpio, bank, 1, GPIO_CMDSRC_ARM);
-		aspeed_gpio_change_cmd_source(gpio, bank, 2, GPIO_CMDSRC_ARM);
-		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
-	}
+	if (gpio->config->cmd_source_supoort)
+		for (i = 0; i < banks; i++) {
+			const struct aspeed_gpio_bank *bank = &aspeed_gpio_banks[i];
+			void __iomem *addr = bank_reg(gpio, bank, reg_rdata);
+
+			gpio->dcache[i] = ioread32(addr);
+			aspeed_gpio_change_cmd_source(gpio, i * 8 + 0, GPIO_CMDSRC_ARM);
+			aspeed_gpio_change_cmd_source(gpio, i * 8 + 8, GPIO_CMDSRC_ARM);
+			aspeed_gpio_change_cmd_source(gpio, i * 8 + 16, GPIO_CMDSRC_ARM);
+			aspeed_gpio_change_cmd_source(gpio, i * 8 + 24, GPIO_CMDSRC_ARM);
+		}
 
 	/* Set up an irqchip */
 	irq = platform_get_irq(pdev, 0);
-- 
2.25.1


