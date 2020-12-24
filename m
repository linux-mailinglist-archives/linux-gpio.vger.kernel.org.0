Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D54D2E2647
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Dec 2020 12:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgLXLXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Dec 2020 06:23:10 -0500
Received: from forward102p.mail.yandex.net ([77.88.28.102]:50934 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727114AbgLXLXJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 24 Dec 2020 06:23:09 -0500
Received: from sas1-f446987054ad.qloud-c.yandex.net (sas1-f446987054ad.qloud-c.yandex.net [IPv6:2a02:6b8:c08:bf8a:0:640:f446:9870])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 0E8971D4168C;
        Thu, 24 Dec 2020 14:22:16 +0300 (MSK)
Received: from sas2-1cbd504aaa99.qloud-c.yandex.net (sas2-1cbd504aaa99.qloud-c.yandex.net [2a02:6b8:c14:7101:0:640:1cbd:504a])
        by sas1-f446987054ad.qloud-c.yandex.net (mxback/Yandex) with ESMTP id U7rRdZfJLQ-MFDKH5hv;
        Thu, 24 Dec 2020 14:22:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1608808935;
        bh=N47H1bb7HbARVzSTJO6ohVn9knAo1XCgmB3a2R48XW0=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=TlyaUVwvihIbvVtp9pX3igMGD0Mv15XLoTzKvg6sFDKM2vsxxFZjqqCNHTLoHFnC5
         hLmcXlGA/+yer1B+qzSt1Ljh4KOIO2bnkorEE3FLuvptEEEMg+v4G4wM4dnZRrNBaA
         uSqu+ZhaBQmQ2VrtmcxkuAhL2xgd6OTeRdy9kfGA=
Authentication-Results: sas1-f446987054ad.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas2-1cbd504aaa99.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wXm6oVjgK4-MEJe5lSR;
        Thu, 24 Dec 2020 14:22:15 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] gpio: ep93xx: convert to multi irqchips
Date:   Thu, 24 Dec 2020 14:22:01 +0300
Message-Id: <20201224112203.7174-2-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224112203.7174-1-nikita.shubin@maquefel.me>
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since gpiolib requires having separate irqchips for each gpiochip, we
need to add some we definetly need a separate one for F port, and we
could combine gpiochip A and B into one - but this will break namespace
and logick.

So despite 3 irqchips is a bit beefy we need a separate irqchip for each
interrupt capable port.

- added separate irqchip for each iterrupt capable gpiochip
- dropped ep93xx_gpio_port (it wasn't working correct for port F anyway)
- moved irq registers into separate struct ep93xx_irq_chip, togather
  with regs current state
- reworked irq handle for ab gpiochips (through bit not tottaly sure this
  is a correct thing to do)
- dropped has_irq and has_hierarchical_irq and added a simple index
  which we rely on when adding irq's to gpiochip's

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 407 +++++++++++++++++++++----------------
 1 file changed, 227 insertions(+), 180 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 226da8df6f10..d6db0ff16581 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/slab.h>
@@ -34,103 +35,83 @@
  */
 #define EP93XX_GPIO_F_IRQ_BASE 80
 
+struct ep93xx_irq_chip {
+	void __iomem	*int_type1;
+	void __iomem	*int_type2;
+	void __iomem	*eoi;
+	void __iomem	*en;
+	void __iomem	*debounce;
+	void __iomem	*status;
+	u8		gpio_int_unmasked;
+	u8		gpio_int_enabled;
+	u8		gpio_int_type1;
+	u8		gpio_int_type2;
+	u8		gpio_int_debounce;
+	struct	irq_chip chip;
+};
+
+#define to_ep93xx_irq_chip(x) container_of(x, struct ep93xx_irq_chip, chip)
+
 struct ep93xx_gpio {
-	void __iomem		*base;
-	struct gpio_chip	gc[8];
+	void __iomem			*base;
+	struct ep93xx_irq_chip		ic[3];
+	struct gpio_chip		gc[8];
 };
 
 /*************************************************************************
  * Interrupt handling for EP93xx on-chip GPIOs
  *************************************************************************/
-static unsigned char gpio_int_unmasked[3];
-static unsigned char gpio_int_enabled[3];
-static unsigned char gpio_int_type1[3];
-static unsigned char gpio_int_type2[3];
-static unsigned char gpio_int_debounce[3];
-
 /* Port ordering is: A B F */
+static const char *irq_chip_names[3]		= {"gpio-irq-a", 
+						"gpio-irq-b", 
+						"gpio-irq-f"};
 static const u8 int_type1_register_offset[3]	= { 0x90, 0xac, 0x4c };
 static const u8 int_type2_register_offset[3]	= { 0x94, 0xb0, 0x50 };
 static const u8 eoi_register_offset[3]		= { 0x98, 0xb4, 0x54 };
 static const u8 int_en_register_offset[3]	= { 0x9c, 0xb8, 0x58 };
 static const u8 int_debounce_register_offset[3]	= { 0xa8, 0xc4, 0x64 };
+static const u8 int_status_register_offset[3]	= { 0xa0, 0xbc, 0x5c };
 
-static void ep93xx_gpio_update_int_params(struct ep93xx_gpio *epg, unsigned port)
-{
-	BUG_ON(port > 2);
-
-	writeb_relaxed(0, epg->base + int_en_register_offset[port]);
-
-	writeb_relaxed(gpio_int_type2[port],
-		       epg->base + int_type2_register_offset[port]);
-
-	writeb_relaxed(gpio_int_type1[port],
-		       epg->base + int_type1_register_offset[port]);
-
-	writeb(gpio_int_unmasked[port] & gpio_int_enabled[port],
-	       epg->base + int_en_register_offset[port]);
-}
-
-static int ep93xx_gpio_port(struct gpio_chip *gc)
+static void ep93xx_gpio_update_int_params(struct ep93xx_irq_chip *eic)
 {
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = 0;
-
-	while (port < ARRAY_SIZE(epg->gc) && gc != &epg->gc[port])
-		port++;
-
-	/* This should not happen but is there as a last safeguard */
-	if (port == ARRAY_SIZE(epg->gc)) {
-		pr_crit("can't find the GPIO port\n");
-		return 0;
-	}
-
-	return port;
+	writeb_relaxed(0, eic->en); // disable port irqs
+	writeb_relaxed(eic->gpio_int_type2, eic->int_type2);
+	writeb_relaxed(eic->gpio_int_type1, eic->int_type1);
+	writeb(eic->gpio_int_unmasked, eic->en); // enable port irqs
 }
 
-static void ep93xx_gpio_int_debounce(struct gpio_chip *gc,
+static void ep93xx_gpio_int_debounce(struct ep93xx_irq_chip *eic,
 				     unsigned int offset, bool enable)
 {
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
 	int port_mask = BIT(offset);
 
 	if (enable)
-		gpio_int_debounce[port] |= port_mask;
+		eic->gpio_int_debounce |= port_mask;
 	else
-		gpio_int_debounce[port] &= ~port_mask;
+		eic->gpio_int_debounce &= ~port_mask;
 
-	writeb(gpio_int_debounce[port],
-	       epg->base + int_debounce_register_offset[port]);
+	writeb(eic->gpio_int_debounce, eic->debounce);
 }
 
-static void ep93xx_gpio_ab_irq_handler(struct irq_desc *desc)
+static u32 ep93xx_gpio_ab_irq_handler(struct gpio_chip *gc)
 {
-	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct irq_chip *ic = gc->irq.chip;
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
 	unsigned long stat;
 	int offset;
 
-	chained_irq_enter(irqchip, desc);
+	stat = readb(eic->status);
 
-	/*
-	 * Dispatch the IRQs to the irqdomain of each A and B
-	 * gpiochip irqdomains depending on what has fired.
-	 * The tricky part is that the IRQ line is shared
-	 * between bank A and B and each has their own gpiochip.
-	 */
-	stat = readb(epg->base + EP93XX_GPIO_A_INT_STATUS);
 	for_each_set_bit(offset, &stat, 8)
-		generic_handle_irq(irq_find_mapping(epg->gc[0].irq.domain,
+		generic_handle_irq(irq_find_mapping(gc->irq.domain,
 						    offset));
 
-	stat = readb(epg->base + EP93XX_GPIO_B_INT_STATUS);
-	for_each_set_bit(offset, &stat, 8)
-		generic_handle_irq(irq_find_mapping(epg->gc[1].irq.domain,
-						    offset));
+	return stat;
+}
 
-	chained_irq_exit(irqchip, desc);
+static irqreturn_t ep93xx_ab_irq_handler(int irq, void *dev_id)
+{
+	return IRQ_RETVAL(ep93xx_gpio_ab_irq_handler(dev_id));
 }
 
 static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
@@ -152,53 +133,50 @@ static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
 
 static void ep93xx_gpio_irq_ack(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
 	int port_mask = BIT(d->irq & 7);
 
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH) {
-		gpio_int_type2[port] ^= port_mask; /* switch edge direction */
-		ep93xx_gpio_update_int_params(epg, port);
+		eic->gpio_int_type2 ^= port_mask; /* switch edge direction */
+		ep93xx_gpio_update_int_params(eic);
 	}
 
-	writeb(port_mask, epg->base + eoi_register_offset[port]);
+	writeb(port_mask, eic->eoi);
 }
 
 static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
+
 	int port_mask = BIT(d->irq & 7);
 
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH)
-		gpio_int_type2[port] ^= port_mask; /* switch edge direction */
+		eic->gpio_int_type2 ^= port_mask; /* switch edge direction */
 
-	gpio_int_unmasked[port] &= ~port_mask;
-	ep93xx_gpio_update_int_params(epg, port);
+	eic->gpio_int_unmasked &= ~port_mask;
+	ep93xx_gpio_update_int_params(eic);
 
-	writeb(port_mask, epg->base + eoi_register_offset[port]);
+	writeb(port_mask, eic->eoi);
 }
 
 static void ep93xx_gpio_irq_mask(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
 
-	gpio_int_unmasked[port] &= ~BIT(d->irq & 7);
-	ep93xx_gpio_update_int_params(epg, port);
+	eic->gpio_int_unmasked &= ~BIT(d->irq & 7);
+	ep93xx_gpio_update_int_params(eic);
 }
 
 static void ep93xx_gpio_irq_unmask(struct irq_data *d)
 {
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
 
-	gpio_int_unmasked[port] |= BIT(d->irq & 7);
-	ep93xx_gpio_update_int_params(epg, port);
+	eic->gpio_int_unmasked |= BIT(d->irq & 7);
+	ep93xx_gpio_update_int_params(eic);
 }
 
 /*
@@ -209,8 +187,8 @@ static void ep93xx_gpio_irq_unmask(struct irq_data *d)
 static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct ep93xx_gpio *epg = gpiochip_get_data(gc);
-	int port = ep93xx_gpio_port(gc);
+	struct irq_chip *ic = irq_data_get_irq_chip(d);
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
 	int offset = d->irq & 7;
 	int port_mask = BIT(offset);
 	irq_flow_handler_t handler;
@@ -219,32 +197,32 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		gpio_int_type1[port] |= port_mask;
-		gpio_int_type2[port] |= port_mask;
+		eic->gpio_int_type1 |= port_mask;
+		eic->gpio_int_type2 |= port_mask;
 		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		gpio_int_type1[port] |= port_mask;
-		gpio_int_type2[port] &= ~port_mask;
+		eic->gpio_int_type1 |= port_mask;
+		eic->gpio_int_type2 &= ~port_mask;
 		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		gpio_int_type1[port] &= ~port_mask;
-		gpio_int_type2[port] |= port_mask;
+		eic->gpio_int_type1 &= ~port_mask;
+		eic->gpio_int_type2 |= port_mask;
 		handler = handle_level_irq;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		gpio_int_type1[port] &= ~port_mask;
-		gpio_int_type2[port] &= ~port_mask;
+		eic->gpio_int_type1 &= ~port_mask;
+		eic->gpio_int_type2 &= ~port_mask;
 		handler = handle_level_irq;
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		gpio_int_type1[port] |= port_mask;
+		eic->gpio_int_type1 |= port_mask;
 		/* set initial polarity based on current input level */
 		if (gc->get(gc, offset))
-			gpio_int_type2[port] &= ~port_mask; /* falling */
+			eic->gpio_int_type2 &= ~port_mask; /* falling */
 		else
-			gpio_int_type2[port] |= port_mask; /* rising */
+			eic->gpio_int_type2 |= port_mask; /* rising */
 		handler = handle_edge_irq;
 		break;
 	default:
@@ -253,70 +231,96 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 
 	irq_set_handler_locked(d, handler);
 
-	gpio_int_enabled[port] |= port_mask;
+	eic->gpio_int_enabled |= port_mask;
 
-	ep93xx_gpio_update_int_params(epg, port);
+	ep93xx_gpio_update_int_params(eic);
 
 	return 0;
 }
 
-static struct irq_chip ep93xx_gpio_irq_chip = {
-	.name		= "GPIO",
-	.irq_ack	= ep93xx_gpio_irq_ack,
-	.irq_mask_ack	= ep93xx_gpio_irq_mask_ack,
-	.irq_mask	= ep93xx_gpio_irq_mask,
-	.irq_unmask	= ep93xx_gpio_irq_unmask,
-	.irq_set_type	= ep93xx_gpio_irq_type,
-};
+static void ep93xx_init_irq_chips(struct ep93xx_gpio *egp)
+{
+	int i;
+	struct ep93xx_irq_chip *eic;
+	struct irq_chip *ic;
+
+	for (i = 0; i < ARRAY_SIZE(egp->ic); i++) {
+		eic = &egp->ic[i];
+		ic = &eic->chip;
+
+		eic->int_type1 = egp->base + int_type1_register_offset[i];
+		eic->int_type2 = egp->base + int_type2_register_offset[i];
+		eic->eoi = egp->base + eoi_register_offset[i];
+		eic->en = egp->base + int_en_register_offset[i];
+		eic->debounce = egp->base + int_debounce_register_offset[i];
+		eic->status = egp->base + int_status_register_offset[i];
+
+		/* maybe read from regs ?  */
+		eic->gpio_int_unmasked = 0;
+		eic->gpio_int_enabled = 0;
+		eic->gpio_int_type1 = 0;
+		eic->gpio_int_type2 = 0;
+		eic->gpio_int_debounce = 0;
+
+		ic->name = irq_chip_names[i];
+		ic->irq_ack	= ep93xx_gpio_irq_ack;
+		ic->irq_mask_ack	= ep93xx_gpio_irq_mask_ack;
+		ic->irq_mask	= ep93xx_gpio_irq_mask;
+		ic->irq_unmask	= ep93xx_gpio_irq_unmask;
+		ic->irq_set_type	= ep93xx_gpio_irq_type;
+	}
+}
 
 /*************************************************************************
  * gpiolib interface for EP93xx on-chip GPIOs
  *************************************************************************/
+
+
 struct ep93xx_gpio_bank {
+	u8		idx;
 	const char	*label;
 	int		data;
 	int		dir;
 	int		base;
-	bool		has_irq;
-	bool		has_hierarchical_irq;
 	unsigned int	irq_base;
 };
 
-#define EP93XX_GPIO_BANK(_label, _data, _dir, _base, _has_irq, _has_hier, _irq_base) \
-	{							\
-		.label		= _label,			\
-		.data		= _data,			\
-		.dir		= _dir,				\
-		.base		= _base,			\
-		.has_irq	= _has_irq,			\
-		.has_hierarchical_irq = _has_hier,		\
-		.irq_base	= _irq_base,			\
+#define EP93XX_GPIO_BANK(_idx, _label, _data, _dir, _base, _irq_base)	\
+	{								\
+		.idx		= _idx,					\
+		.label		= _label,				\
+		.data		= _data,				\
+		.dir		= _dir,					\
+		.base		= _base,				\
+		.irq_base	= _irq_base,				\
 	}
 
 static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	/* Bank A has 8 IRQs */
-	EP93XX_GPIO_BANK("A", 0x00, 0x10, 0, true, false, 64),
+	EP93XX_GPIO_BANK(0, "A", 0x00, 0x10, 0, 64),
 	/* Bank B has 8 IRQs */
-	EP93XX_GPIO_BANK("B", 0x04, 0x14, 8, true, false, 72),
-	EP93XX_GPIO_BANK("C", 0x08, 0x18, 40, false, false, 0),
-	EP93XX_GPIO_BANK("D", 0x0c, 0x1c, 24, false, false, 0),
-	EP93XX_GPIO_BANK("E", 0x20, 0x24, 32, false, false, 0),
+	EP93XX_GPIO_BANK(1, "B", 0x04, 0x14, 8, 72),
+	EP93XX_GPIO_BANK(2, "C", 0x08, 0x18, 40, 0),
+	EP93XX_GPIO_BANK(3, "D", 0x0c, 0x1c, 24, 0),
+	EP93XX_GPIO_BANK(4, "E", 0x20, 0x24, 32, 0),
 	/* Bank F has 8 IRQs */
-	EP93XX_GPIO_BANK("F", 0x30, 0x34, 16, false, true, 0),
-	EP93XX_GPIO_BANK("G", 0x38, 0x3c, 48, false, false, 0),
-	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false, false, 0),
+	EP93XX_GPIO_BANK(5, "F", 0x30, 0x34, 16, 0),
+	EP93XX_GPIO_BANK(6, "G", 0x38, 0x3c, 48, 0),
+	EP93XX_GPIO_BANK(7, "H", 0x40, 0x44, 56, 0),
 };
 
 static int ep93xx_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 				  unsigned long config)
 {
+	struct irq_chip *ic = gc->irq.chip;
+	struct ep93xx_irq_chip *eic = to_ep93xx_irq_chip(ic);
 	u32 debounce;
 
 	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
 		return -ENOTSUPP;
 
 	debounce = pinconf_to_config_argument(config);
-	ep93xx_gpio_int_debounce(gc, offset, debounce ? true : false);
+	ep93xx_gpio_int_debounce(eic, offset, debounce ? true : false);
 
 	return 0;
 }
@@ -326,6 +330,88 @@ static int ep93xx_gpio_f_to_irq(struct gpio_chip *gc, unsigned offset)
 	return EP93XX_GPIO_F_IRQ_BASE + offset;
 }
 
+static int ep93xx_gpio_add_ab_irq_chip(struct gpio_chip *gc,
+					struct platform_device *pdev,
+					struct ep93xx_irq_chip *eic,
+					unsigned int irq_base)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq = &gc->irq;
+	int ab_parent_irq;
+	int err;
+
+	gc->set_config = ep93xx_gpio_set_config;
+	girq->chip = &eic->chip;
+
+	ab_parent_irq = platform_get_irq(pdev, 0);
+
+	err = devm_request_irq(dev, ab_parent_irq,
+			ep93xx_ab_irq_handler,
+			IRQF_SHARED, eic->chip.name, gc);
+
+	if (err) {
+		dev_err(dev, "error requesting IRQ : %d\n", ab_parent_irq);
+		return err;
+	}
+
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1,
+				sizeof(*girq->parents),
+				GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->parents[0] = ab_parent_irq;
+	girq->first = irq_base;
+
+	return 0;
+}
+
+static int ep93xx_gpio_add_f_irq_chip(struct gpio_chip *gc,
+				      struct platform_device *pdev,
+				      struct ep93xx_irq_chip *eic)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq = &gc->irq;
+	int gpio_irq;
+	int i;
+
+	gc->set_config = ep93xx_gpio_set_config;
+	girq->chip = &eic->chip;
+
+	/*
+	 * FIXME: convert this to use hierarchical IRQ support!
+	 * this requires fixing the root irqchip to be hierarchial.
+	 */
+	girq->parent_handler = ep93xx_gpio_f_irq_handler;
+	girq->num_parents = 8;
+	girq->parents = devm_kcalloc(dev, 8,
+				     sizeof(*girq->parents),
+				     GFP_KERNEL);
+
+	if (!girq->parents)
+		return -ENOMEM;
+
+	/* Pick resources 1..8 for these IRQs */
+	for (i = 1; i <= 8; i++)
+		girq->parents[i - 1] = platform_get_irq(pdev, i);
+	for (i = 0; i < 8; i++) {
+		gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
+		irq_set_chip_data(gpio_irq, gc);
+		irq_set_chip_and_handler(gpio_irq,
+					girq->chip,
+					handle_level_irq);
+		irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
+	}
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	gc->to_irq = ep93xx_gpio_f_to_irq;
+
+	return 0;
+}
+
 static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 				struct platform_device *pdev,
 				struct ep93xx_gpio *epg,
@@ -334,7 +420,6 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 	void __iomem *data = epg->base + bank->data;
 	void __iomem *dir = epg->base + bank->dir;
 	struct device *dev = &pdev->dev;
-	struct gpio_irq_chip *girq;
 	int err;
 
 	err = bgpio_init(gc, dev, 1, data, NULL, NULL, dir, NULL, 0);
@@ -344,58 +429,17 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 	gc->label = bank->label;
 	gc->base = bank->base;
 
-	girq = &gc->irq;
-	if (bank->has_irq || bank->has_hierarchical_irq) {
-		gc->set_config = ep93xx_gpio_set_config;
-		girq->chip = &ep93xx_gpio_irq_chip;
-	}
-
-	if (bank->has_irq) {
-		int ab_parent_irq = platform_get_irq(pdev, 0);
-
-		girq->parent_handler = ep93xx_gpio_ab_irq_handler;
-		girq->num_parents = 1;
-		girq->parents = devm_kcalloc(dev, 1,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents)
-			return -ENOMEM;
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_level_irq;
-		girq->parents[0] = ab_parent_irq;
-		girq->first = bank->irq_base;
+	if (bank->idx == 0 || bank->idx == 1) {
+		err = ep93xx_gpio_add_ab_irq_chip(gc, pdev, &epg->ic[bank->idx], bank->irq_base);
+		if (err)
+			return err;
 	}
 
-	/* Only bank F has especially funky IRQ handling */
-	if (bank->has_hierarchical_irq) {
-		int gpio_irq;
-		int i;
-
-		/*
-		 * FIXME: convert this to use hierarchical IRQ support!
-		 * this requires fixing the root irqchip to be hierarchial.
-		 */
-		girq->parent_handler = ep93xx_gpio_f_irq_handler;
-		girq->num_parents = 8;
-		girq->parents = devm_kcalloc(dev, 8,
-					     sizeof(*girq->parents),
-					     GFP_KERNEL);
-		if (!girq->parents)
-			return -ENOMEM;
-		/* Pick resources 1..8 for these IRQs */
-		for (i = 1; i <= 8; i++)
-			girq->parents[i - 1] = platform_get_irq(pdev, i);
-		for (i = 0; i < 8; i++) {
-			gpio_irq = EP93XX_GPIO_F_IRQ_BASE + i;
-			irq_set_chip_data(gpio_irq, &epg->gc[5]);
-			irq_set_chip_and_handler(gpio_irq,
-						 &ep93xx_gpio_irq_chip,
-						 handle_level_irq);
-			irq_clear_status_flags(gpio_irq, IRQ_NOREQUEST);
-		}
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_level_irq;
-		gc->to_irq = ep93xx_gpio_f_to_irq;
+	if (bank->idx == 5) {
+		/* Only bank F has especially funky IRQ handling */
+		err = ep93xx_gpio_add_f_irq_chip(gc, pdev, &epg->ic[2]);
+		if (err)
+			return err;
 	}
 
 	return devm_gpiochip_add_data(dev, gc, epg);
@@ -414,6 +458,9 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(epg->base))
 		return PTR_ERR(epg->base);
 
+	/* init irq chips */
+	ep93xx_init_irq_chips(epg);
+
 	for (i = 0; i < ARRAY_SIZE(ep93xx_gpio_banks); i++) {
 		struct gpio_chip *gc = &epg->gc[i];
 		struct ep93xx_gpio_bank *bank = &ep93xx_gpio_banks[i];
-- 
2.26.2

