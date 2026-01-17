Return-Path: <linux-gpio+bounces-30687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B0D38E1F
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 12:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6600930203B3
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 11:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D521A33509B;
	Sat, 17 Jan 2026 11:17:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CAD335573;
	Sat, 17 Jan 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648666; cv=none; b=oUSvj5GdjsthHvFUlcSFaPne7Tn8tnxM1vZTnL0AYnjAt8LWZeboqnQ/vFLVmCbdNk0Up3P1xU6/qnF+PjVfTK/41UEgRk4UilzqVv0fUuQXobV9HtEI1X7owV5HzoPBvKnYzuTIuumE3B/DFMRAkk72ymoad0nqUZF/s0NuLrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648666; c=relaxed/simple;
	bh=7Fu2o997lanr8Aykv8Nr8m2+OkvdinLwokWjAcgDTaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EtmwPO5IPopqXs+qzk3sC25VZceXNQjY8oKlunmCdJl+bHwaXqFJQP/qpITDa6Vh9NxoZ9N4z40JG4Tyy7u2rPMVPzx/JB27E4RnPBcB/MOqEl3/su2UYLyPXA1KY0CvfpyGA3Gcto52B5zOmqHlHZHzlexzUO+5O18grybYaw0=
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
Date: Sat, 17 Jan 2026 19:17:12 +0800
Subject: [PATCH 5/5] gpio: aspeed-sgpio: Support G7 Aspeed sgpiom
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260117-upstream_sgpio-v1-5-850ef3ffb680@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768648637; l=6430;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=7Fu2o997lanr8Aykv8Nr8m2+OkvdinLwokWjAcgDTaQ=;
 b=gMBbmy9iHd2sG7jfiVUJa54edrL9tfbnS070gbokV3OCF06CNh2XPTWutGMCgFTG5PSZ5UTUD
 M8fNNAbsTKNDPQEj2lwbnlOGwFOM2ADZR1zjAymioUfKmJDTRo+YxZl
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=

In the 7th generation of the SoC from Aspeed, the control logic of the
SGPIO controller has been updated to support per-pin control. Each pin now
has its own 32-bit register, allowing for individual control of the pin's
value, interrupt type, and other settings.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 115 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 111 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index a2401f4e8e37..840a2486e3de 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -19,7 +19,31 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
-#define ASPEED_SGPIO_CTRL		0x54
+#define SGPIO_G7_IRQ_STS_BASE 0x40
+#define SGPIO_G7_IRQ_STS_OFFSET(x) (SGPIO_G7_IRQ_STS_BASE + (x) * 0x4)
+#define SGPIO_G7_CTRL_REG_BASE 0x80
+#define SGPIO_G7_CTRL_REG_OFFSET(x) (SGPIO_G7_CTRL_REG_BASE + (x) * 0x4)
+#define SGPIO_G7_OUT_DATA BIT(0)
+#define SGPIO_G7_PARALLEL_OUT_DATA BIT(1)
+#define SGPIO_G7_IRQ_EN BIT(2)
+#define SGPIO_G7_IRQ_TYPE0 BIT(3)
+#define SGPIO_G7_IRQ_TYPE1 BIT(4)
+#define SGPIO_G7_IRQ_TYPE2 BIT(5)
+#define SGPIO_G7_RST_TOLERANCE BIT(6)
+#define SGPIO_G7_INPUT_MASK BIT(9)
+#define SGPIO_G7_HW_BYPASS_EN BIT(10)
+#define SGPIO_G7_HW_IN_SEL BIT(11)
+#define SGPIO_G7_IRQ_STS BIT(12)
+#define SGPIO_G7_IN_DATA BIT(13)
+#define SGPIO_G7_PARALLEL_IN_DATA BIT(14)
+#define SGPIO_G7_SERIAL_OUT_SEL GENMASK(17, 16)
+#define SGPIO_G7_PARALLEL_OUT_SEL GENMASK(19, 18)
+#define SELECT_FROM_CSR 0
+#define SELECT_FROM_PARALLEL_IN 1
+#define SELECT_FROM_SERIAL_IN 2
+
+#define ASPEED_SGPIO_G4_CFG_OFFSET 0x54
+#define ASPEED_SGPIO_G7_CFG_OFFSET 0x0
 
 #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
 #define ASPEED_SGPIO_ENABLE		BIT(0)
@@ -28,6 +52,7 @@
 struct aspeed_sgpio_pdata {
 	const u32 pin_mask;
 	const struct aspeed_sgpio_llops *llops;
+	const u32 cfg_offset;
 };
 
 struct aspeed_sgpio {
@@ -135,6 +160,30 @@ static void __iomem *aspeed_sgpio_g4_bank_reg(struct aspeed_sgpio *gpio,
 	}
 }
 
+static u32 aspeed_sgpio_g7_reg_mask(const enum aspeed_sgpio_reg reg)
+{
+	switch (reg) {
+	case reg_val:
+	case reg_rdata:
+		return SGPIO_G7_OUT_DATA;
+	case reg_irq_enable:
+		return SGPIO_G7_IRQ_EN;
+	case reg_irq_type0:
+		return SGPIO_G7_IRQ_TYPE0;
+	case reg_irq_type1:
+		return SGPIO_G7_IRQ_TYPE1;
+	case reg_irq_type2:
+		return SGPIO_G7_IRQ_TYPE2;
+	case reg_irq_status:
+		return SGPIO_G7_IRQ_STS;
+	case reg_tolerance:
+		return SGPIO_G7_RST_TOLERANCE;
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+}
+
 #define GPIO_BANK(x)    ((x) >> 6)
 #define GPIO_OFFSET(x)  ((x) & GENMASK(5, 0))
 #define GPIO_BIT(x)     BIT(GPIO_OFFSET(x) >> 1)
@@ -319,12 +368,13 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	unsigned int i, p;
+	unsigned int i, p, banks;
 	unsigned long reg;
 
 	chained_irq_enter(ic, desc);
 
-	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
+	banks = DIV_ROUND_UP(gpio->chip.ngpio, 64);
+	for (i = 0; i < banks; i++) {
 		reg = gpio->pdata->llops->reg_bank_get(gpio, i << 6, reg_irq_status);
 
 		for_each_set_bit(p, &reg, 32)
@@ -456,6 +506,7 @@ static const struct aspeed_sgpio_llops aspeed_sgpio_g4_llops = {
 static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
 	.pin_mask = GENMASK(9, 6),
 	.llops = &aspeed_sgpio_g4_llops,
+	.cfg_offset = ASPEED_SGPIO_G4_CFG_OFFSET,
 };
 
 static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
@@ -485,12 +536,68 @@ static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
 static const struct aspeed_sgpio_pdata ast2600_sgpiom_pdata = {
 	.pin_mask = GENMASK(10, 6),
 	.llops = &aspeed_sgpio_g4_llops,
+	.cfg_offset = ASPEED_SGPIO_G4_CFG_OFFSET,
+};
+
+static void aspeed_sgpio_g7_reg_bit_set(struct aspeed_sgpio *gpio, unsigned int offset,
+					const enum aspeed_sgpio_reg reg, bool val)
+{
+	u32 mask = aspeed_sgpio_g7_reg_mask(reg);
+	void __iomem *addr = gpio->base + SGPIO_G7_CTRL_REG_OFFSET(offset >> 1);
+	u32 write_val;
+
+	if (mask) {
+		write_val = (ioread32(addr) & ~(mask)) | field_prep(mask, val);
+		iowrite32(write_val, addr);
+	}
+}
+
+static bool aspeed_sgpio_g7_reg_bit_get(struct aspeed_sgpio *gpio, unsigned int offset,
+					const enum aspeed_sgpio_reg reg)
+{
+	u32 mask = aspeed_sgpio_g7_reg_mask(reg);
+	void __iomem *addr;
+
+	addr = gpio->base + SGPIO_G7_CTRL_REG_OFFSET(offset >> 1);
+	if (reg == reg_val)
+		mask = SGPIO_G7_IN_DATA;
+
+	if (mask)
+		return field_get(mask, ioread32(addr));
+	else
+		return 0;
+}
+
+static int aspeed_sgpio_g7_reg_bank_get(struct aspeed_sgpio *gpio, unsigned int offset,
+					const enum aspeed_sgpio_reg reg)
+{
+	void __iomem *addr;
+
+	if (reg == reg_irq_status) {
+		addr = gpio->base + SGPIO_G7_IRQ_STS_OFFSET(offset >> 6);
+		return ioread32(addr);
+	} else {
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct aspeed_sgpio_llops aspeed_sgpio_g7_llops = {
+	.reg_bit_set = aspeed_sgpio_g7_reg_bit_set,
+	.reg_bit_get = aspeed_sgpio_g7_reg_bit_get,
+	.reg_bank_get = aspeed_sgpio_g7_reg_bank_get,
+};
+
+static const struct aspeed_sgpio_pdata ast2700_sgpiom_pdata = {
+	.pin_mask = GENMASK(11, 6),
+	.llops = &aspeed_sgpio_g7_llops,
+	.cfg_offset = ASPEED_SGPIO_G7_CFG_OFFSET,
 };
 
 static const struct of_device_id aspeed_sgpio_of_table[] = {
 	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata, },
 	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata, },
 	{ .compatible = "aspeed,ast2600-sgpiom", .data = &ast2600_sgpiom_pdata, },
+	{ .compatible = "aspeed,ast2700-sgpiom", .data = &ast2700_sgpiom_pdata, },
 	{}
 };
 
@@ -561,7 +668,7 @@ static int aspeed_sgpio_probe(struct platform_device *pdev)
 
 	gpio_cnt_regval = ((nr_gpios / 8) << ASPEED_SGPIO_PINS_SHIFT) & pin_mask;
 	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) | gpio_cnt_regval |
-		  ASPEED_SGPIO_ENABLE, gpio->base + ASPEED_SGPIO_CTRL);
+		  ASPEED_SGPIO_ENABLE, gpio->base + gpio->pdata->cfg_offset);
 
 	raw_spin_lock_init(&gpio->lock);
 

-- 
2.34.1


