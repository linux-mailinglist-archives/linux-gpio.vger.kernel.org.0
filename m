Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F533399ED1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 12:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhFCKVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 06:21:01 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:60155 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhFCKVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 06:21:01 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 153A5CxE045512;
        Thu, 3 Jun 2021 18:05:12 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 18:18:39 +0800
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
Subject: [PATCH v3 4/5] gpio: gpio-aspeed-sgpio: Add set_config function
Date:   Thu, 3 Jun 2021 18:18:20 +0800
Message-ID: <20210603101822.9645-5-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603101822.9645-1-steven_lee@aspeedtech.com>
References: <20210603101822.9645-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 153A5CxE045512
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AST SoC supports *retain pin state* function when wdt reset.
The patch adds set_config function for handling sgpio reset tolerance
register.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 54 +++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index aa894c92143e..8003308811f7 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -52,9 +52,10 @@ struct aspeed_sgpio {
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
 
@@ -70,24 +71,28 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
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
+		.tolerance_regs = 0x0050,
 		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0090,
 		.rdata_reg = 0x007C,
 		.irq_regs = 0x0094,
+		.tolerance_regs = 0x00A8,
 		.names = { "M", "N", "O", "P" },
 	},
 };
@@ -100,6 +105,7 @@ enum aspeed_sgpio_reg {
 	reg_irq_type1,
 	reg_irq_type2,
 	reg_irq_status,
+	reg_tolerance,
 };
 
 #define GPIO_VAL_VALUE      0x00
@@ -128,6 +134,8 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
 		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
 	case reg_irq_status:
 		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
+	case reg_tolerance:
+		return gpio->base + bank->tolerance_regs;
 	default:
 		/* acturally if code runs to here, it's an error case */
 		BUG();
@@ -484,6 +492,44 @@ static int aspeed_sgpio_setup_irqs(struct aspeed_sgpio *gpio,
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
+	reg = bank_reg(gpio, to_bank(offset, gpio), reg_tolerance);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	val = readl(reg);
+
+	if (enable)
+		val |= GPIO_BIT(offset, gpio);
+	else
+		val &= ~GPIO_BIT(offset, gpio);
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
 static const struct aspeed_sgpio_pdata ast2600_sgpiom1_pdata = {
 	.max_ngpios = 128,
 	.pin_mask = GENMASK(10, 6),
@@ -591,7 +637,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.free = NULL;
 	gpio->chip.get = aspeed_sgpio_get;
 	gpio->chip.set = aspeed_sgpio_set;
-	gpio->chip.set_config = NULL;
+	gpio->chip.set_config = aspeed_sgpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
-- 
2.17.1

