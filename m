Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F44A3C5A9A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 13:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbhGLKH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 06:07:29 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:18827 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237396AbhGLKHO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jul 2021 06:07:14 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 16C9lXID099582;
        Mon, 12 Jul 2021 17:47:34 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 18:03:28 +0800
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
Subject: [PATCH v6 5/9] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
Date:   Mon, 12 Jul 2021 18:03:12 +0800
Message-ID: <20210712100317.23298-6-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16C9lXID099582
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The maximum number of gpio pins of SoC is hardcoded as 80 and the gpio pin
count mask for GPIO Configuration register is hardcode as GENMASK(9,6).
However, AST2600 has 2 sgpio master interfaces, one of them supports up
to 128 gpio pins and pin count mask of GPIO Configuration Register is 5
bits.

The patch adds ast2600 compatibles, removes MAX_NR_HW_SGPIO and
corresponding design to make the gpio input/output pin base are determined
by ngpios.
The patch also removed hardcoded pin mask and adds ast2400, ast2500,
ast2600 platform data that include gpio pin count mask for GPIO
Configuration Register.

The original pin order is as follows:
(suppose MAX_NR_HW_SGPIO is 80 and ngpios is 10 as well)
Input:
0 1 2 3 ... 9
Output:
80 81 82 ... 89

The new pin order is as follows:
Input:
0 2 4 6 ... 18
Output:
1 3 5 7 ... 19

SGPIO pin id and input/output pin mapping is as follows:
SGPIO0(0,1), SGPIO1(2,3), ..., SGPIO79(158,159)

For example:
Access SGPIO5(10,11)
Get SGPIO pin 5 (suppose sgpio chip id is 2)
gpioget 2 10

Set SGPIO pin 5 (suppose sgpio chip id is 2)
gpioset 2 11=1
gpioset 2 11=0

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 101 ++++++++++++++-----------------
 1 file changed, 47 insertions(+), 54 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 64e54f8c30d2..8f6bacd23e13 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -17,23 +17,15 @@
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
 #define ASPEED_SGPIO_CLK_DIV_MASK	GENMASK(31, 16)
 #define ASPEED_SGPIO_ENABLE		BIT(0)
+#define ASPEED_SGPIO_PINS_SHIFT		6
+
+struct aspeed_sgpio_pdata {
+	const u32 pin_mask;
+};
 
 struct aspeed_sgpio {
 	struct gpio_chip chip;
@@ -41,7 +33,6 @@ struct aspeed_sgpio {
 	spinlock_t lock;
 	void __iomem *base;
 	int irq;
-	int n_sgpio;
 };
 
 struct aspeed_sgpio_bank {
@@ -75,7 +66,13 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
 		.val_regs = 0x0038,
 		.rdata_reg = 0x0078,
 		.irq_regs = 0x003C,
-		.names = { "I", "J" },
+		.names = { "I", "J", "K", "L" },
+	},
+	{
+		.val_regs = 0x0090,
+		.rdata_reg = 0x007C,
+		.irq_regs = 0x0094,
+		.names = { "M", "N", "O", "P" },
 	},
 };
 
@@ -121,9 +118,9 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
 	}
 }
 
-#define GPIO_BANK(x)    ((x % SGPIO_OUTPUT_OFFSET) >> 5)
-#define GPIO_OFFSET(x)  ((x % SGPIO_OUTPUT_OFFSET) & 0x1f)
-#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x))
+#define GPIO_BANK(x)    ((x) >> 6)
+#define GPIO_OFFSET(x)  ((x) & GENMASK(5, 0))
+#define GPIO_BIT(x)     BIT(GPIO_OFFSET(x) >> 1)
 
 static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
 {
@@ -138,39 +135,25 @@ static const struct aspeed_sgpio_bank *to_bank(unsigned int offset)
 static int aspeed_sgpio_init_valid_mask(struct gpio_chip *gc,
 		unsigned long *valid_mask, unsigned int ngpios)
 {
-	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
-	int n = sgpio->n_sgpio;
-	int c = SGPIO_OUTPUT_OFFSET - n;
-
-	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
-
-	/* input GPIOs in the lower range */
-	bitmap_set(valid_mask, 0, n);
-	bitmap_clear(valid_mask, n, c);
-
-	/* output GPIOS above SGPIO_OUTPUT_OFFSET */
-	bitmap_set(valid_mask, SGPIO_OUTPUT_OFFSET, n);
-	bitmap_clear(valid_mask, SGPIO_OUTPUT_OFFSET + n, c);
-
+	bitmap_set(valid_mask, 0, ngpios);
 	return 0;
 }
 
 static void aspeed_sgpio_irq_init_valid_mask(struct gpio_chip *gc,
 		unsigned long *valid_mask, unsigned int ngpios)
 {
-	struct aspeed_sgpio *sgpio = gpiochip_get_data(gc);
-	int n = sgpio->n_sgpio;
+	unsigned int i;
 
-	WARN_ON(ngpios < MAX_NR_HW_SGPIO * 2);
-
-	/* input GPIOs in the lower range */
-	bitmap_set(valid_mask, 0, n);
-	bitmap_clear(valid_mask, n, ngpios - n);
+	/* input GPIOs are even bits */
+	for (i = 0; i < ngpios; i++) {
+		if (i % 2)
+			clear_bit(i, valid_mask);
+	}
 }
 
 static bool aspeed_sgpio_is_input(unsigned int offset)
 {
-	return offset < SGPIO_OUTPUT_OFFSET;
+	return !(offset % 2);
 }
 
 static int aspeed_sgpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -466,9 +449,18 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
 	return 0;
 }
 
+static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
+	.pin_mask = GENMASK(9, 6),
+};
+
+static const struct aspeed_sgpio_pdata ast2600_sgpiom_pdata = {
+	.pin_mask = GENMASK(10, 6),
+};
+
 static const struct of_device_id aspeed_sgpio_of_table[] = {
-	{ .compatible = "aspeed,ast2400-sgpio" },
-	{ .compatible = "aspeed,ast2500-sgpio" },
+	{ .compatible = "aspeed,ast2400-sgpio", .data = &ast2400_sgpio_pdata, },
+	{ .compatible = "aspeed,ast2500-sgpio", .data = &ast2400_sgpio_pdata, },
+	{ .compatible = "aspeed,ast2600-sgpiom", .data = &ast2600_sgpiom_pdata, },
 	{}
 };
 
@@ -476,10 +468,11 @@ MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
 
 static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 {
+	u32 nr_gpios, sgpio_freq, sgpio_clk_div, gpio_cnt_regval, pin_mask;
+	const struct aspeed_sgpio_pdata *pdata;
 	struct aspeed_sgpio *gpio;
-	u32 nr_gpios, sgpio_freq, sgpio_clk_div;
-	int rc;
 	unsigned long apb_freq;
+	int rc;
 
 	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
 	if (!gpio)
@@ -489,16 +482,17 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
+	pdata = device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return -EINVAL;
+
+	pin_mask = pdata->pin_mask;
+
 	rc = of_property_read_u32(pdev->dev.of_node, "ngpios", &nr_gpios);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Could not read ngpios property\n");
 		return -EINVAL;
-	} else if (nr_gpios > MAX_NR_HW_SGPIO) {
-		dev_err(&pdev->dev, "Number of GPIOs exceeds the maximum of %d: %d\n",
-			MAX_NR_HW_SGPIO, nr_gpios);
-		return -EINVAL;
 	}
-	gpio->n_sgpio = nr_gpios;
 
 	rc = of_property_read_u32(pdev->dev.of_node, "bus-frequency", &sgpio_freq);
 	if (rc < 0) {
@@ -531,15 +525,14 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (sgpio_clk_div > (1 << 16) - 1)
 		return -EINVAL;
 
-	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) |
-		  FIELD_PREP(ASPEED_SGPIO_PINS_MASK, (nr_gpios / 8)) |
-		  ASPEED_SGPIO_ENABLE,
-		  gpio->base + ASPEED_SGPIO_CTRL);
+	gpio_cnt_regval = ((nr_gpios / 8) << ASPEED_SGPIO_PINS_SHIFT) & pin_mask;
+	iowrite32(FIELD_PREP(ASPEED_SGPIO_CLK_DIV_MASK, sgpio_clk_div) | gpio_cnt_regval |
+		  ASPEED_SGPIO_ENABLE, gpio->base + ASPEED_SGPIO_CTRL);
 
 	spin_lock_init(&gpio->lock);
 
 	gpio->chip.parent = &pdev->dev;
-	gpio->chip.ngpio = MAX_NR_HW_SGPIO * 2;
+	gpio->chip.ngpio = nr_gpios * 2;
 	gpio->chip.init_valid_mask = aspeed_sgpio_init_valid_mask;
 	gpio->chip.direction_input = aspeed_sgpio_dir_in;
 	gpio->chip.direction_output = aspeed_sgpio_dir_out;
-- 
2.17.1

