Return-Path: <linux-gpio+bounces-30969-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MNNMfs+c2mWtwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30969-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0173491
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1FBD30098B0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C053363C78;
	Fri, 23 Jan 2026 09:27:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9B534A78F;
	Fri, 23 Jan 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160419; cv=none; b=Y4zQ+r2b62mHSgUm3UFjY2nFCeuVFy1wi/daHsftzjrFvWnM/YJJeerOu7iibyXUxMt97OwS6srdgOCsN1wUk7WN2ZpAzYY1pRLXenV7mLwdbtjOFmsR55K8GQSNiN2hVANn7y5p+KTQC9XRVkHxfHVsyEwXNjeqETr9T0aZymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160419; c=relaxed/simple;
	bh=TIUq6Bl35VgW6ICCGoaNyUDXHZLqPismF+NB5DqxhLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B3C/p0+roBfDMTs7jL2qKImYeVaXZvpyDA91DPvtJKBW+/+rWxoGSFMYoK9MlmPkFaiA6L0Snl64lIipAg8oawJwdg6Qv0bXj8y8fTGJ9eF4tIicQtg3e1a16GfXJzRx997QlBk7ax8wSTQo+5mwrJswXIco57z3jFU9yNOBU+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 17:26:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 17:26:26 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 17:26:28 +0800
Subject: [PATCH v2 3/6] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_sgpio-v2-3-69cfd1631400@aspeedtech.com>
References: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
In-Reply-To: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Jeffery" <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<bmc-sw@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160386; l=13135;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=TIUq6Bl35VgW6ICCGoaNyUDXHZLqPismF+NB5DqxhLo=;
 b=obMqessuTmX60BRWTJ7mRRxobx/F49iFV4cGbeaMYmAwEI9AZWiDs2byiKKxuw+uWGINs7kbJ
 KKwJviwmP88CuezioottWLHWXWDIlutEZUifrE4vhmfKA3wT+Gsw/vB
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30969-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,aspeedtech.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: A6C0173491
X-Rspamd-Action: no action

Add low-level operations (llops) to abstract the register access for SGPIO
registers. With this abstraction layer, the driver can separate the
hardware and software logic, making it easier to extend the driver to
support different hardware register layouts.
The llops abstraction changes the programming semantics from bitmask-based
writes to a value-based interface.

Instead of passing a pre-shifted bitmask to the caller, the driver now
passes:
- the GPIO offset, and
- the value to be set (0 or 1),

and the llops helpers are responsible for deriving the correct register
and bit position internally.

As a result, assignments such as:
  type0 = 1;
  type1 = 1;
  type2 = 1;
do not represent a behavioral change. They indicate that the bit
corresponding to the given GPIO offset should be set, with the actual
bit manipulation handled by llops.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 222 ++++++++++++++++++---------------------
 1 file changed, 104 insertions(+), 118 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index a96ed6d8a55d..33a830ea7d28 100644
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
@@ -381,9 +325,7 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_enter(ic, desc);
 
 	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		const struct aspeed_sgpio_bank *bank = &aspeed_sgpio_banks[i];
-
-		reg = ioread32(bank_reg(data, bank, reg_irq_status));
+		reg = data->pdata->llops->reg_bank_get(data, i << 6, reg_irq_status);
 
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
 
@@ -447,7 +385,7 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 
 	/* Apply default IRQ settings */
 	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
-		bank = &aspeed_sgpio_banks[i];
+		bank =  &aspeed_sgpio_banks[i];
 		/* set falling or level-low irq */
 		iowrite32(0x00000000, bank_reg(gpio, bank, reg_irq_type0));
 		/* trigger type is edge */
@@ -459,29 +397,78 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
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
@@ -500,6 +487,7 @@ static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 static const struct aspeed_sgpio_pdata ast2600_sgpiom_pdata = {
 	.pin_mask = GENMASK(10, 6),
+	.llops = &aspeed_sgpio_g4_llops,
 };
 
 static const struct of_device_id aspeed_sgpio_of_table[] = {
@@ -514,7 +502,6 @@ MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
 static int aspeed_sgpio_probe(struct platform_device *pdev)
 {
 	u32 nr_gpios, sgpio_freq, sgpio_clk_div, gpio_cnt_regval, pin_mask;
-	const struct aspeed_sgpio_pdata *pdata;
 	struct aspeed_sgpio *gpio;
 	unsigned long apb_freq;
 	int rc;
@@ -529,12 +516,11 @@ static int aspeed_sgpio_probe(struct platform_device *pdev)
 
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


