Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192642D445C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 15:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730495AbgLIO3j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 09:29:39 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:17849 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730084AbgLIO3c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 09:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1607524172; x=1639060172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t2QQJkqtEBrZVqRgPD7bEVXg66hRTmpC3YZGAp7TLEA=;
  b=gq76OkPmwgAehdOX3kaxGBGofSTNPxOJRrcbgcYmYU8Twg1TFokvnqH5
   TG2KHqDcgaCI3/tgca8UzAI9sW6Ww42/mdB3kYCfIJQoHipxIflRb43Af
   001ZuKIl7zTCKD+y7kRmuTy6H1bBnpqfzDtJnPY8m9XHIvmIEcTVpryvF
   FGqrqlf5j9yA6N4ZqeCy92cuEmBRkmX2LU/e1SmVCE0YiKjAtoU9Cx5Up
   k6b/p6TesdluWoAV6kpjOHVK1aHO1br6bmzQabmuEXA8VRQiRB6ysun8W
   Ha3JgnmzcgZpkBnZo8rMoO8j5XeXuc4JYRdroFkUG4yFk8b5jMQ9iH1+z
   A==;
IronPort-SDR: wOi8wMvXTCYnP2OFO+YGfFCUjMGRoimUsjUP8BpA8FDuVEP6BiRgjqyGYIW0YxEvY+URxsc2OY
 wvq3liqh3Q0FRJ7f6hjJKK05aREGgQZqmpet+8j2YfIKKqIWDmetflg8vyg86+NxFqysbXFaBf
 blvnEegJWumTBveOPV/LkAoj52dGORtPUdjrJG8qgNCfPXossmOGSiELLla/qnsRU/0aL+s489
 +ECfXe+KUsnhhWX5423ip/ihR0o3hao4gV3xoLWyfrjz9r2h/EiRz10Cyhk4+WuDF4uEZkZ2Fh
 FMo=
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
   d="scan'208";a="106872098"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Dec 2020 07:28:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 9 Dec 2020 07:28:16 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 9 Dec 2020 07:28:14 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH -next 1/3] pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)
Date:   Wed, 9 Dec 2020 15:27:51 +0100
Message-ID: <20201209142753.683208-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201209142753.683208-1-lars.povlsen@microchip.com>
References: <20201209142753.683208-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds 'interrupt-controller' features for the signals available on
the Microchip SGPIO controller, however only for controller versions
on the Sparx5 platform (or later).

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 187 +++++++++++++++++++++-
 1 file changed, 185 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index e1824197318e..f35edb0eac40 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -31,6 +31,11 @@ enum {
 	REG_PORT_ENABLE,
 	REG_SIO_CONFIG,
 	REG_SIO_CLOCK,
+	REG_INT_POLARITY,
+	REG_INT_TRIGGER,
+	REG_INT_ACK,
+	REG_INT_ENABLE,
+	REG_INT_IDENT,
 	MAXREG
 };
 
@@ -40,8 +45,13 @@ enum {
 	SGPIO_ARCH_SPARX5,
 };
 
+enum {
+	SGPIO_FLAGS_HAS_IRQ	= BIT(0),
+};
+
 struct sgpio_properties {
 	int arch;
+	int flags;
 	u8 regoff[MAXREG];
 };
 
@@ -60,6 +70,16 @@ struct sgpio_properties {
 #define SGPIO_SPARX5_CLK_FREQ    GENMASK(19, 8)
 #define SGPIO_SPARX5_BIT_SOURCE  GENMASK(23, 12)
 
+#define SGPIO_MASTER_INTR_ENA    BIT(0)
+
+#define SGPIO_INT_TRG_LEVEL	0
+#define SGPIO_INT_TRG_EDGE	1
+#define SGPIO_INT_TRG_EDGE_FALL	2
+#define SGPIO_INT_TRG_EDGE_RISE	3
+
+#define SGPIO_TRG_LEVEL_HIGH	0
+#define SGPIO_TRG_LEVEL_LOW	1
+
 static const struct sgpio_properties properties_luton = {
 	.arch   = SGPIO_ARCH_LUTON,
 	.regoff = { 0x00, 0x09, 0x29, 0x2a, 0x2b },
@@ -72,7 +92,8 @@ static const struct sgpio_properties properties_ocelot = {
 
 static const struct sgpio_properties properties_sparx5 = {
 	.arch   = SGPIO_ARCH_SPARX5,
-	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05 },
+	.flags  = SGPIO_FLAGS_HAS_IRQ,
+	.regoff = { 0x00, 0x06, 0x26, 0x04, 0x05, 0x2a, 0x32, 0x3a, 0x3e, 0x42 },
 };
 
 static const char * const functions[] = { "gpio" };
@@ -107,6 +128,11 @@ static inline void sgpio_pin_to_addr(struct sgpio_priv *priv, int pin,
 	addr->bit = pin % priv->bitcount;
 }
 
+static inline int sgpio_addr_to_pin(struct sgpio_priv *priv, int port, int bit)
+{
+	return bit + port * priv->bitcount;
+}
+
 static inline u32 sgpio_readl(struct sgpio_priv *priv, u32 rno, u32 off)
 {
 	u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];
@@ -478,7 +504,7 @@ static int microchip_sgpio_of_xlate(struct gpio_chip *gc,
 	    gpiospec->args[1] > priv->bitcount)
 		return -EINVAL;
 
-	pin = gpiospec->args[1] + gpiospec->args[0] * priv->bitcount;
+	pin = sgpio_addr_to_pin(priv, gpiospec->args[0], gpiospec->args[1]);
 
 	if (pin > gc->ngpio)
 		return -EINVAL;
@@ -527,6 +553,133 @@ static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
 	return 0;
 }
 
+static void microchip_sgpio_irq_settype(struct irq_data *data,
+					int type,
+					int polarity)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct sgpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct sgpio_port_addr addr;
+	u32 ena;
+
+	sgpio_pin_to_addr(bank->priv, gpio, &addr);
+
+	/* Disable interrupt while changing type */
+	ena = sgpio_readl(bank->priv, REG_INT_ENABLE, addr.bit);
+	sgpio_writel(bank->priv, ena & ~BIT(addr.port), REG_INT_ENABLE, addr.bit);
+
+	/* Type value spread over 2 registers sets: low, high bit */
+	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER, addr.bit,
+			 BIT(addr.port), (!!(type & 0x1)) << addr.port);
+	sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER + SGPIO_MAX_BITS, addr.bit,
+			 BIT(addr.port), (!!(type & 0x2)) << addr.port);
+
+	if (type == SGPIO_INT_TRG_LEVEL)
+		sgpio_clrsetbits(bank->priv, REG_INT_POLARITY, addr.bit,
+				 BIT(addr.port), polarity << addr.port);
+
+	/* Possibly re-enable interrupts */
+	sgpio_writel(bank->priv, ena, REG_INT_ENABLE, addr.bit);
+}
+
+static void microchip_sgpio_irq_setreg(struct irq_data *data,
+				       int reg,
+				       bool clear)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct sgpio_bank *bank = gpiochip_get_data(chip);
+	unsigned int gpio = irqd_to_hwirq(data);
+	struct sgpio_port_addr addr;
+
+	sgpio_pin_to_addr(bank->priv, gpio, &addr);
+
+	if (clear)
+		sgpio_clrsetbits(bank->priv, reg, addr.bit, BIT(addr.port), 0);
+	else
+		sgpio_clrsetbits(bank->priv, reg, addr.bit, 0, BIT(addr.port));
+}
+
+static void microchip_sgpio_irq_mask(struct irq_data *data)
+{
+	microchip_sgpio_irq_setreg(data, REG_INT_ENABLE, true);
+}
+
+static void microchip_sgpio_irq_unmask(struct irq_data *data)
+{
+	microchip_sgpio_irq_setreg(data, REG_INT_ENABLE, false);
+}
+
+static void microchip_sgpio_irq_ack(struct irq_data *data)
+{
+	microchip_sgpio_irq_setreg(data, REG_INT_ACK, false);
+}
+
+static int microchip_sgpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	type &= IRQ_TYPE_SENSE_MASK;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_set_handler_locked(data, handle_edge_irq);
+		microchip_sgpio_irq_settype(data, SGPIO_INT_TRG_EDGE, 0);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		irq_set_handler_locked(data, handle_edge_irq);
+		microchip_sgpio_irq_settype(data, SGPIO_INT_TRG_EDGE_RISE, 0);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_set_handler_locked(data, handle_edge_irq);
+		microchip_sgpio_irq_settype(data, SGPIO_INT_TRG_EDGE_FALL, 0);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_set_handler_locked(data, handle_level_irq);
+		microchip_sgpio_irq_settype(data, SGPIO_INT_TRG_LEVEL, SGPIO_TRG_LEVEL_HIGH);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_set_handler_locked(data, handle_level_irq);
+		microchip_sgpio_irq_settype(data, SGPIO_INT_TRG_LEVEL, SGPIO_TRG_LEVEL_LOW);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct irq_chip microchip_sgpio_irqchip = {
+	.name		= "gpio",
+	.irq_mask	= microchip_sgpio_irq_mask,
+	.irq_ack	= microchip_sgpio_irq_ack,
+	.irq_unmask	= microchip_sgpio_irq_unmask,
+	.irq_set_type	= microchip_sgpio_irq_set_type,
+};
+
+static void sgpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
+	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
+	struct sgpio_bank *bank = gpiochip_get_data(chip);
+	struct sgpio_priv *priv = bank->priv;
+	int bit, port, gpio;
+	long val;
+
+	for (bit = 0; bit < priv->bitcount; bit++) {
+		val = sgpio_readl(priv, REG_INT_IDENT, bit);
+		if (!val)
+			continue;
+
+		chained_irq_enter(parent_chip, desc);
+
+		for_each_set_bit(port, &val, SGPIO_BITS_PER_WORD) {
+			gpio = sgpio_addr_to_pin(priv, port, bit);
+			generic_handle_irq(irq_linear_revmap(chip->irq.domain, gpio));
+		}
+
+		chained_irq_exit(parent_chip, desc);
+	}
+}
+
 static int microchip_sgpio_register_bank(struct device *dev,
 					 struct sgpio_priv *priv,
 					 struct fwnode_handle *fwnode,
@@ -608,6 +761,36 @@ static int microchip_sgpio_register_bank(struct device *dev,
 	gc->base		= -1;
 	gc->ngpio		= ngpios;
 
+	if (bank->is_input && priv->properties->flags & SGPIO_FLAGS_HAS_IRQ) {
+		int irq = fwnode_irq_get(fwnode, 0);
+
+		if (irq) {
+			struct gpio_irq_chip *girq = &gc->irq;
+
+			girq->chip = devm_kmemdup(dev, &microchip_sgpio_irqchip,
+						  sizeof(microchip_sgpio_irqchip),
+						  GFP_KERNEL);
+			if (!girq->chip)
+				return -ENOMEM;
+			girq->parent_handler = sgpio_irq_handler;
+			girq->num_parents = 1;
+			girq->parents = devm_kcalloc(dev, 1,
+						     sizeof(*girq->parents),
+						     GFP_KERNEL);
+			if (!girq->parents)
+				return -ENOMEM;
+			girq->parents[0] = irq;
+			girq->default_type = IRQ_TYPE_NONE;
+			girq->handler = handle_bad_irq;
+
+			/* Disable all individual pins */
+			for (i = 0; i < SGPIO_MAX_BITS; i++)
+				sgpio_writel(priv, 0, REG_INT_ENABLE, i);
+			/* Master enable */
+			sgpio_clrsetbits(priv, REG_SIO_CONFIG, 0, 0, SGPIO_MASTER_INTR_ENA);
+		}
+	}
+
 	ret = devm_gpiochip_add_data(dev, gc, bank);
 	if (ret)
 		dev_err(dev, "Failed to register: ret %d\n", ret);
-- 
2.25.1

