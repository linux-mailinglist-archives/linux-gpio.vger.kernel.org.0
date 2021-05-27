Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07C53923FD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 02:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbhE0A6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 20:58:36 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:59307 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbhE0A6f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 20:58:35 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 14R0g0So067386;
        Thu, 27 May 2021 08:42:00 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 08:55:02 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <steven_lee@aspeedtech.com>, <Hongweiz@ami.com>,
        <ryan_chen@aspeedtech.com>, <billy_tsai@aspeedtech.com>
Subject: [PATCH v2 4/4] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Date:   Thu, 27 May 2021 08:54:53 +0800
Message-ID: <20210527005455.25758-5-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527005455.25758-1-steven_lee@aspeedtech.com>
References: <20210527005455.25758-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14R0g0So067386
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
with 80 pins, and AST2500/AST2400 SoC has 1 SGPIO master interface that
supports up to 80 pins.
In the current driver design, the max number of sgpio pins is hardcoded
in macro MAX_NR_HW_SGPIO and the value is 80.
The patch makes the maximum gpio number *constraint of chip* comes from
the dts. The property name is max-ngpios.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 193 ++++++++++++++++++++-----------
 1 file changed, 125 insertions(+), 68 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 64e54f8c30d2..d01cdaeeada4 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -17,37 +17,28 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 
-/*
- * MAX_NR_HW_GPIO represents the number of actual hardware-supported GPIOs (ie,
- * slots within the clocked serial GPIO data). Since each HW GPIO is both an
- * input and an output, we provide MAX_NR_HW_GPIO * 2 lines on our gpiochip
- * device.
- *
- * We use SGPIO_OUTPUT_OFFSET to define the split between the inputs and
- * outputs; the inputs start at line 0, the outputs start at OUTPUT_OFFSET.
- */
-#define MAX_NR_HW_SGPIO			80
-#define SGPIO_OUTPUT_OFFSET		MAX_NR_HW_SGPIO
-
 #define ASPEED_SGPIO_CTRL		0x54
 
-#define ASPEED_SGPIO_PINS_MASK		GENMASK(9, 6)
+#define ASPEED_SGPIO_PINS_MASK		GENMASK(10, 6)
 #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
 #define ASPEED_SGPIO_ENABLE		BIT(0)
 
 struct aspeed_sgpio {
 	struct gpio_chip chip;
+	struct irq_chip intc;
 	struct clk *pclk;
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
+	int max_ngpios;
 	int n_sgpio;
 };
 
 struct aspeed_sgpio_bank {
-	uint16_t    val_regs;
-	uint16_t    rdata_reg;
-	uint16_t    irq_regs;
+	u16    val_regs;
+	u16    rdata_reg;
+	u16    irq_regs;
+	u16    tolerance_regs;
 	const char  names[4][3];
 };
 
@@ -63,19 +54,29 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
 		.val_regs = 0x0000,
 		.rdata_reg = 0x0070,
 		.irq_regs = 0x0004,
+		.tolerance_regs = 0x0018,
 		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x001C,
 		.rdata_reg = 0x0074,
 		.irq_regs = 0x0020,
+		.tolerance_regs = 0x0034,
 		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0038,
 		.rdata_reg = 0x0078,
 		.irq_regs = 0x003C,
-		.names = { "I", "J" },
+		.tolerance_regs = 0x0050,
+		.names = { "I", "J", "K", "L" },
+	},
+	{
+		.val_regs = 0x0090,
+		.rdata_reg = 0x007C,
+		.irq_regs = 0x0094,
+		.tolerance_regs = 0x00A8,
+		.names = { "M", "N", "O", "P" },
 	},
 };
 
@@ -87,14 +88,14 @@ enum aspeed_sgpio_reg {
 	reg_irq_type1,
 	reg_irq_type2,
 	reg_irq_status,
+	reg_tolerance,
 };
 
-#define GPIO_VAL_VALUE      0x00
-#define GPIO_IRQ_ENABLE     0x00
-#define GPIO_IRQ_TYPE0      0x04
-#define GPIO_IRQ_TYPE1      0x08
-#define GPIO_IRQ_TYPE2      0x0C
-#define GPIO_IRQ_STATUS     0x10
+#define GPIO_IRQ_OFFSET_ENABLE     0x00
+#define GPIO_IRQ_OFFSET_TYPE0      0x04
+#define GPIO_IRQ_OFFSET_TYPE1      0x08
+#define GPIO_IRQ_OFFSET_TYPE2      0x0C
+#define GPIO_IRQ_OFFSET_STATUS     0x10
 
 static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
 				     const struct aspeed_sgpio_bank *bank,
@@ -102,34 +103,37 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
 {
 	switch (reg) {
 	case reg_val:
-		return gpio->base + bank->val_regs + GPIO_VAL_VALUE;
+		return gpio->base + bank->val_regs;
 	case reg_rdata:
 		return gpio->base + bank->rdata_reg;
 	case reg_irq_enable:
-		return gpio->base + bank->irq_regs + GPIO_IRQ_ENABLE;
+		return gpio->base + bank->irq_regs + GPIO_IRQ_OFFSET_ENABLE;
 	case reg_irq_type0:
-		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE0;
+		return gpio->base + bank->irq_regs + GPIO_IRQ_OFFSET_TYPE0;
 	case reg_irq_type1:
-		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE1;
+		return gpio->base + bank->irq_regs + GPIO_IRQ_OFFSET_TYPE1;
 	case reg_irq_type2:
-		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
+		return gpio->base + bank->irq_regs + GPIO_IRQ_OFFSET_TYPE2;
 	case reg_irq_status:
-		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
+		return gpio->base + bank->irq_regs + GPIO_IRQ_OFFSET_STATUS;
+	case reg_tolerance:
+		return gpio->base + bank->tolerance_regs;
 	default:
 		/* acturally if code runs to here, it's an error case */
 		BUG();
 	}
 }
 
-#define GPIO_BANK(x)    ((x % SGPIO_OUTPUT_OFFSET) >> 5)
-#define GPIO_OFFSET(x)  ((x % SGPIO_OUTPUT_OFFSET) & 0x1f)
+#define GPIO_BANK(x)    ((x) >> 5)
+/* modulo 32 */
+#define GPIO_OFFSET(x)  ((x) & 0x1f)
 #define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
 
-static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
+static const struct aspeed_sgpio_bank *to_bank(unsigned int offset, unsigned int max_ngpios)
 {
 	unsigned int bank;
 
-	bank = GPIO_BANK(offset);
+	bank = GPIO_BANK(offset % max_ngpios);
 
 	WARN_ON(bank >= ARRAY_SIZE(aspeed_sgpio_banks));
 	return &aspeed_sgpio_banks[bank];
@@ -139,18 +143,19 @@ static int aspeed_sgpio_init_valid_mask(struct gpio_chip *gc,
 		unsigned long *valid_mask, unsigned int ngpios)
 {
 	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
+	int max_ngpios = sgpio->max_ngpios;
 	int n = sgpio->n_sgpio;
-	int c = SGPIO_OUTPUT_OFFSET - n;
+	int c = max_ngpios - n;
 
-	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
+	WARN_ON(ngpios < max_ngpios * 2);
 
 	/* input GPIOs in the lower range */
 	bitmap_set(valid_mask, 0, n);
 	bitmap_clear(valid_mask, n, c);
 
-	/* output GPIOS above SGPIO_OUTPUT_OFFSET */
-	bitmap_set(valid_mask, SGPIO_OUTPUT_OFFSET, n);
-	bitmap_clear(valid_mask, SGPIO_OUTPUT_OFFSET + n, c);
+	/* output GPIOS above max_ngpios */
+	bitmap_set(valid_mask, max_ngpios, n);
+	bitmap_clear(valid_mask, max_ngpios + n, c);
 
 	return 0;
 }
@@ -161,30 +166,30 @@ static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
 	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
 	int n = sgpio->n_sgpio;
 
-	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
+	WARN_ON(ngpios < sgpio->max_ngpios * 2);
 
 	/* input GPIOs in the lower range */
 	bitmap_set(valid_mask, 0, n);
 	bitmap_clear(valid_mask, n, ngpios - n);
 }
 
-static bool aspeed_sgpio_is_input(unsigned int offset)
+static bool aspeed_sgpio_is_input(unsigned int offset, unsigned int max_ngpios)
 {
-	return offset < SGPIO_OUTPUT_OFFSET;
+	return offset < max_ngpios;
 }
 
 static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio->max_ngpios);
 	unsigned long flags;
 	enum aspeed_sgpio_reg reg;
 	int rc = 0;
 
 	spin_lock_irqsave(&gpio->lock, flags);
 
-	reg = aspeed_sgpio_is_input(offset) ? reg_val : reg_rdata;
-	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset));
+	reg = aspeed_sgpio_is_input(offset, gpio->max_ngpios) ? reg_val : reg_rdata;
+	rc = !!(ioread32(bank_reg(gpio, bank, reg)) & GPIO_BIT(offset % gpio->max_ngpios));
 
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
@@ -194,11 +199,11 @@ static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
 static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 {
 	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
-	const struct aspeed_sgpio_bank *bank = to_bank(offset);
+	const struct aspeed_sgpio_bank *bank = to_bank(offset, gpio->max_ngpios);
 	void __iomem *addr_r, *addr_w;
 	u32 reg = 0;
 
-	if (aspeed_sgpio_is_input(offset))
+	if (aspeed_sgpio_is_input(offset, gpio->max_ngpios))
 		return -EINVAL;
 
 	/* Since this is an output, read the cached value from rdata, then
@@ -209,9 +214,9 @@ static int sgpio_set_value(struct gpio_chip *gc, unsigned int offset, int val)
 	reg = ioread32(addr_r);
 
 	if (val)
-		reg |= GPIO_BIT(offset);
+		reg |= GPIO_BIT(offset % gpio->max_ngpios);
 	else
-		reg &= ~GPIO_BIT(offset);
+		reg &= ~GPIO_BIT(offset % gpio->max_ngpios);
 
 	iowrite32(reg, addr_w);
 
@@ -232,7 +237,9 @@ static void aspeed_sgpio_set(struct gpio_chip *gc, unsigned int offset, int val)
 
 static int aspeed_sgpio_dir_in(struct gpio_chip *gc, unsigned int offset)
 {
-	return aspeed_sgpio_is_input(offset) ? 0 : -EINVAL;
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+
+	return aspeed_sgpio_is_input(offset, gpio->max_ngpios) ? 0 : -EINVAL;
 }
 
 static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
@@ -253,7 +260,9 @@ static int aspeed_sgpio_dir_out(struct gpio_chip *gc, unsigned int offset, int v
 
 static int aspeed_sgpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
-	return !!aspeed_sgpio_is_input(offset);
+	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);
+
+	return !!aspeed_sgpio_is_input(offset, gpio->max_ngpios);
 }
 
 static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
@@ -268,8 +277,8 @@ static void irqd_to_aspeed_sgpio_data(struct irq_data *d,
 	WARN_ON(!internal);
 
 	*gpio = internal;
-	*bank = to_bank(*offset);
-	*bit = GPIO_BIT(*offset);
+	*bank = to_bank(*offset, internal->max_ngpios);
+	*bit = GPIO_BIT(*offset % internal->max_ngpios);
 }
 
 static void aspeed_sgpio_irq_ack(struct irq_data *d)
@@ -412,14 +421,6 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(ic, desc);
 }
 
-static struct irq_chip aspeed_sgpio_irqchip = {
-	.name       = "aspeed-sgpio",
-	.irq_ack    = aspeed_sgpio_irq_ack,
-	.irq_mask   = aspeed_sgpio_irq_mask,
-	.irq_unmask = aspeed_sgpio_irq_unmask,
-	.irq_set_type   = aspeed_sgpio_set_type,
-};
-
 static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 				   struct platform_device *pdev)
 {
@@ -442,8 +443,14 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 		iowrite32(0xffffffff, bank_reg(gpio, bank, reg_irq_status));
 	}
 
+	gpio->intc.name = dev_name(&pdev->dev);
+	gpio->intc.irq_ack = aspeed_sgpio_irq_ack;
+	gpio->intc.irq_mask = aspeed_sgpio_irq_mask;
+	gpio->intc.irq_unmask = aspeed_sgpio_irq_unmask;
+	gpio->intc.irq_set_type = aspeed_sgpio_set_type;
+
 	irq = &gpio->chip.irq;
-	irq->chip = &aspeed_sgpio_irqchip;
+	irq->chip = &gpio->intc;
 	irq->init_valid_mask = aspeed_sgpio_irq_init_valid_mask;
 	irq->handler = handle_bad_irq;
 	irq->default_type = IRQ_TYPE_NONE;
@@ -466,9 +473,48 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	return 0;
 }
 
+static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
+					unsigned int offset, bool enable)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(chip);
+	unsigned long flags;
+	void __iomem *reg;
+	u32 val;
+
+	reg = bank_reg(gpio, to_bank(offset, gpio->max_ngpios), reg_tolerance);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	val = readl(reg);
+
+	if (enable)
+		val |= GPIO_BIT(offset % gpio->max_ngpios);
+	else
+		val &= ~GPIO_BIT(offset % gpio->max_ngpios);
+
+	writel(val, reg);
+
+	spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_sgpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
+{
+	unsigned long param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
+
+	if (param == PIN_CONFIG_PERSIST_STATE)
+		return aspeed_sgpio_reset_tolerance(chip, offset, arg);
+	else
+		return -EOPNOTSUPP;
+}
+
 static const struct of_device_id aspeed_sgpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-sgpio" },
-	{ .compatible = "aspeed,ast2500-sgpio" },
+	{ .compatible = "aspeed,ast2400-sgpiom" },
+	{ .compatible = "aspeed,ast2500-sgpiom" },
+	{ .compatible = "aspeed,ast2600-sgpiom" },
 	{}
 };
 
@@ -476,8 +522,8 @@ MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
 
 static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 {
+	u32 nr_gpios, sgpio_freq, sgpio_clk_div, max_ngpios;
 	struct aspeed_sgpio *gpio;
-	u32 nr_gpios, sgpio_freq, sgpio_clk_div;
 	int rc;
 	unsigned long apb_freq;
 
@@ -489,13 +535,24 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
+	rc = of_property_read_u32(pdev->dev.of_node, "max-ngpios", &max_ngpios);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read max-ngpios property\n");
+		return -EINVAL;
+	}
+	gpio->max_ngpios = max_ngpios;
+
 	rc = of_property_read_u32(pdev->dev.of_node, "ngpios", &nr_gpios);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Could not read ngpios property\n");
 		return -EINVAL;
-	} else if (nr_gpios > MAX_NR_HW_SGPIO) {
+	} else if (nr_gpios % 8) {
+		dev_err(&pdev->dev, "Number of GPIOs not multiple of 8: %d\n",
+			nr_gpios);
+		return -EINVAL;
+	} else if (nr_gpios > gpio->max_ngpios) {
 		dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: %d\n",
-			MAX_NR_HW_SGPIO, nr_gpios);
+			gpio->max_ngpios, nr_gpios);
 		return -EINVAL;
 	}
 	gpio->n_sgpio = nr_gpios;
@@ -539,7 +596,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	spin_lock_init(&gpio->lock);
 
 	gpio->chip.parent = &pdev->dev;
-	gpio->chip.ngpio = MAX_NR_HW_SGPIO * 2;
+	gpio->chip.ngpio = gpio->max_ngpios * 2;
 	gpio->chip.init_valid_mask = aspeed_sgpio_init_valid_mask;
 	gpio->chip.direction_input = aspeed_sgpio_dir_in;
 	gpio->chip.direction_output = aspeed_sgpio_dir_out;
@@ -548,7 +605,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.free = NULL;
 	gpio->chip.get = aspeed_sgpio_get;
 	gpio->chip.set = aspeed_sgpio_set;
-	gpio->chip.set_config = NULL;
+	gpio->chip.set_config = aspeed_sgpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
-- 
2.17.1

