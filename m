Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A183C5A9C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 13:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237396AbhGLKHc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 06:07:32 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:18843 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbhGLKHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jul 2021 06:07:21 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 16C9lZES099595;
        Mon, 12 Jul 2021 17:47:35 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 18:03:29 +0800
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
Subject: [PATCH v6 6/9] gpio: gpio-aspeed-sgpio: Add set_config function
Date:   Mon, 12 Jul 2021 18:03:13 +0800
Message-ID: <20210712100317.23298-7-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16C9lZES099595
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

AST SoC supports *retain pin state* function when wdt reset.
The patch adds set_config function for handling sgpio reset tolerance
register.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 54 +++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 8f6bacd23e13..9b809c28f842 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -36,9 +36,10 @@ struct aspeed_sgpio {
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
 
@@ -54,24 +55,28 @@ static const struct aspeed_sgpio_bank aspeed_sgpio_banks[] = {
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
@@ -84,6 +89,7 @@ enum aspeed_sgpio_reg {
 	reg_irq_type1,
 	reg_irq_type2,
 	reg_irq_status,
+	reg_tolerance,
 };
 
 #define GPIO_VAL_VALUE      0x00
@@ -112,6 +118,8 @@ static void __iomem *bank_reg(struct aspeed_sgpio *gpio,
 		return gpio->base + bank->irq_regs + GPIO_IRQ_TYPE2;
 	case reg_irq_status:
 		return gpio->base + bank->irq_regs + GPIO_IRQ_STATUS;
+	case reg_tolerance:
+		return gpio->base + bank->tolerance_regs;
 	default:
 		/* acturally if code runs to here, it's an error case */
 		BUG();
@@ -453,6 +461,44 @@ static const struct aspeed_sgpio_pdata ast2400_sgpio_pdata = {
 	.pin_mask = GENMASK(9, 6),
 };
 
+static int aspeed_sgpio_reset_tolerance(struct gpio_chip *chip,
+					unsigned int offset, bool enable)
+{
+	struct aspeed_sgpio *gpio = gpiochip_get_data(chip);
+	unsigned long flags;
+	void __iomem *reg;
+	u32 val;
+
+	reg = bank_reg(gpio, to_bank(offset), reg_tolerance);
+
+	spin_lock_irqsave(&gpio->lock, flags);
+
+	val = readl(reg);
+
+	if (enable)
+		val |= GPIO_BIT(offset);
+	else
+		val &= ~GPIO_BIT(offset);
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
+
+	return -ENOTSUPP;
+}
+
 static const struct aspeed_sgpio_pdata ast2600_sgpiom_pdata = {
 	.pin_mask = GENMASK(10, 6),
 };
@@ -541,7 +587,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	gpio->chip.free = NULL;
 	gpio->chip.get = aspeed_sgpio_get;
 	gpio->chip.set = aspeed_sgpio_set;
-	gpio->chip.set_config = NULL;
+	gpio->chip.set_config = aspeed_sgpio_set_config;
 	gpio->chip.label = dev_name(&pdev->dev);
 	gpio->chip.base = -1;
 
-- 
2.17.1

