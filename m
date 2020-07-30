Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC4523337F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 15:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgG3Nzx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 09:55:53 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:56562 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbgG3Nzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 09:55:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 0F8E5803202D;
        Thu, 30 Jul 2020 13:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bKfsCLdsMbUf; Thu, 30 Jul 2020 16:55:44 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Serge Semin <fancer.lancer@gmail.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 05/10] gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip
Date:   Thu, 30 Jul 2020 16:55:31 +0300
Message-ID: <20200730135536.19747-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
References: <20200730135536.19747-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO-lib provides a ready-to-use interface to initialize an IRQ-chip on
top of a GPIO chip. It's better from maintainability and readability
point of view to use one instead of supporting a hand-written Generic
IRQ-chip-based implementation. Moreover the new implementation won't
cause much functional overhead but will provide a cleaner driver code.
All of that makes the DW APB GPIO driver conversion pretty much justified
especially seeing a tendency of the other GPIO drivers getting converted
too.

Here is what we do in the framework of this commit to convert the driver
to using the GPIO-lib-based IRQ-chip interface:
1) IRQ ack, mask and unmask callbacks are locally defined instead of
using the Generic IRQ-chip ones.
2) An irq_chip structure instance is embedded into the dwapb_gpio
private data. Note we can't have a static instance of that structure since
GPIO-lib will add some hooks into it by calling gpiochip_set_irq_hooks().
A warning about that would have been printed by the GPIO-lib code if we
used a single irq_chip structure instance for multiple DW APB GPIO
controllers.
3) Initialize the gpio_irq_chip structure embedded into the gpio_chip
descriptor. By default there is no IRQ enabled so any event raised will be
handled by the handle_bad_irq() IRQ flow handler. If DW APB GPIO IP-core
is synthesized to have non-shared reference IRQ-lines, then as before the
hierarchical and cascaded cases are distinguished by checking how many
parental IRQs are defined. (Note irq_set_chained_handler_and_data() won't
initialize IRQs, which descriptors couldn't be found.) If DW APB GPIO IP
is used on a platform with shared IRQ line, then we simply won't let the
GPIO-lib to initialize the parental IRQs, but will handle them locally in
the driver.
4) Discard linear IRQ-domain and Generic IRQ-chip initialization, since
GPIO-lib IRQ-chip interface will create a new domain and accept a standard
IRQ-chip structure pointer based on the setting we provided in the
gpio_irq_chip structure.
5) Manually select a proper IRQ flow handler directly in the
irq_set_type() callback by calling irq_set_handler_locked() method, since
an ordinary (not Generic) irq_chip descriptor is now utilized. Note this
shalln't give any regression
6) Alter CONFIG_GPIO_DWAPB kernel config to select
CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.

Note neither 4) nor 5) shall cause a regression of commit 6a2f4b7dadd5
("gpio: dwapb: use a second irq chip"), since the later isn't properly
used here anyway.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Note in this patch we omit the next GPIO-lib IRQ-chip settings
initialization:
gc->irq.map
gc->irq.init_valid_mask

That's intentionally done in order to keep the driver functionality at the
same level as before the conversion: each GPIO line will be registered as
the source of IRQs, no matter whether DW APB GPIO IP is configured to
generate combined or multiple IRQ signals.

If more thorough mapping is needed, the driver should be altered to detect
the IRQ signaling mode (for instance by checking a dedicated DT-property).
Then based on that it will be able to create a proper hardware GPIO-IRQ
to/from parental IRQs mapping and valid hardware GPIO-IRQs mask.

Changelog v2:
- Replace gc->to_irq() with irq_find_mapping() method.
- Refactor dwapb_irq_set_type() method to directly set IRQ flow handler
  instead of using a temporary variable.
- Initialize GPIOlib IRQ-chip settings before calling request_irq()
  method.
- Add a notice regarding regression of commit 6a2f4b7dadd5 ("gpio:
dwapb: use a second irq chip").
- Move the acpi_gpiochip_{request,free}_interrupts() methods invocation
  removal to a dedicated commit.
- Move GPIO-chip to_irq callback removal to a dedicated commit.
- Introduce dwapb_convert_irqs() method to convert the sparse parental
  IRQs array into an array of linearly distributed IRQs correctly
  perceived by GPIO-lib.
---
 drivers/gpio/Kconfig      |   2 +-
 drivers/gpio/gpio-dwapb.c | 191 +++++++++++++++++++-------------------
 2 files changed, 98 insertions(+), 95 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c6b5c65c8405..bcd3e541a52b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -202,7 +202,7 @@ config GPIO_DAVINCI
 config GPIO_DWAPB
 	tristate "Synopsys DesignWare APB GPIO driver"
 	select GPIO_GENERIC
-	select GENERIC_IRQ_CHIP
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y or M here to build support for the Synopsys DesignWare APB
 	  GPIO block.
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index f34001152850..327333fbc750 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -13,7 +13,6 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -85,6 +84,9 @@ struct dwapb_context {
 
 struct dwapb_gpio_port {
 	struct gpio_chip	gc;
+	unsigned int		nr_irqs;
+	unsigned int		irq[DWAPB_MAX_GPIOS];
+	struct irq_chip		irqchip;
 	bool			is_registered;
 	struct dwapb_gpio	*gpio;
 #ifdef CONFIG_PM_SLEEP
@@ -92,13 +94,14 @@ struct dwapb_gpio_port {
 #endif
 	unsigned int		idx;
 };
+#define to_dwapb_gpio(_gc) \
+	(container_of(_gc, struct dwapb_gpio_port, gc)->gpio)
 
 struct dwapb_gpio {
 	struct	device		*dev;
 	void __iomem		*regs;
 	struct dwapb_gpio_port	*ports;
 	unsigned int		nr_ports;
-	struct irq_domain	*domain;
 	unsigned int		flags;
 	struct reset_control	*rst;
 	struct clk_bulk_data	clks[DWAPB_NR_CLOCKS];
@@ -193,12 +196,13 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
+	struct gpio_chip *gc = &gpio->ports[0].gc;
 	unsigned long irq_status;
 	irq_hw_number_t hwirq;
 
 	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
 	for_each_set_bit(hwirq, &irq_status, DWAPB_MAX_GPIOS) {
-		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
+		int gpio_irq = irq_find_mapping(gc->irq.domain, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
 		generic_handle_irq(gpio_irq);
@@ -225,11 +229,48 @@ static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 	return IRQ_RETVAL(dwapb_do_irq(dev_id));
 }
 
+static void dwapb_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	u32 val = BIT(irqd_to_hwirq(d));
+	unsigned long flags;
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	dwapb_write(gpio, GPIO_PORTA_EOI, val);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+}
+
+static void dwapb_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
+	dwapb_write(gpio, GPIO_INTMASK, val);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+}
+
+static void dwapb_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
+	dwapb_write(gpio, GPIO_INTMASK, val);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+}
+
 static void dwapb_irq_enable(struct irq_data *d)
 {
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	unsigned long flags;
 	u32 val;
 
@@ -242,9 +283,8 @@ static void dwapb_irq_enable(struct irq_data *d)
 
 static void dwapb_irq_disable(struct irq_data *d)
 {
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	unsigned long flags;
 	u32 val;
 
@@ -257,9 +297,8 @@ static void dwapb_irq_disable(struct irq_data *d)
 
 static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 {
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 	unsigned long level, polarity, flags;
 
@@ -293,7 +332,10 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 		break;
 	}
 
-	irq_setup_alt_chip(d, type);
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+	else if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
 
 	dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
 	if (type != IRQ_TYPE_EDGE_BOTH)
@@ -354,79 +396,62 @@ static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
 	return dwapb_gpio_set_debounce(gc, offset, debounce);
 }
 
+static int dwapb_convert_irqs(struct dwapb_gpio *gpio,
+			      struct dwapb_gpio_port *port,
+			      struct dwapb_port_property *pp)
+{
+	int i;
+
+	/* Group all available IRQs into an array of parental IRQs. */
+	for (i = 0; i < pp->ngpio; ++i) {
+		if (!pp->irq[i])
+			continue;
+
+		port->irq[port->nr_irqs++] = pp->irq[i];
+	}
+
+	return port->nr_irqs ? 0 : -ENOENT;
+}
+
 static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 				 struct dwapb_gpio_port *port,
 				 struct dwapb_port_property *pp)
 {
 	struct gpio_chip *gc = &port->gc;
-	struct fwnode_handle  *fwnode = pp->fwnode;
-	struct irq_chip_generic	*irq_gc = NULL;
-	unsigned int ngpio = gc->ngpio;
-	struct irq_chip_type *ct;
-	irq_hw_number_t hwirq;
-	int err, i;
+	struct gpio_irq_chip *girq;
+	int err;
 
-	if (memchr_inv(pp->irq, 0, sizeof(pp->irq)) == NULL) {
+	if (dwapb_convert_irqs(gpio, port, pp)) {
 		dev_warn(gpio->dev, "no IRQ for port%d\n", pp->idx);
 		return;
 	}
 
-	gpio->domain = irq_domain_create_linear(fwnode, ngpio,
-						 &irq_generic_chip_ops, gpio);
-	if (!gpio->domain)
-		return;
-
-	err = irq_alloc_domain_generic_chips(gpio->domain, ngpio, 2,
-					     DWAPB_DRIVER_NAME, handle_bad_irq,
-					     IRQ_NOREQUEST, 0,
-					     IRQ_GC_INIT_NESTED_LOCK);
-	if (err) {
-		dev_info(gpio->dev, "irq_alloc_domain_generic_chips failed\n");
-		irq_domain_remove(gpio->domain);
-		gpio->domain = NULL;
-		return;
-	}
-
-	irq_gc = irq_get_domain_generic_chip(gpio->domain, 0);
-	if (!irq_gc) {
-		irq_domain_remove(gpio->domain);
-		gpio->domain = NULL;
-		return;
-	}
-
-	irq_gc->reg_base = gpio->regs;
-	irq_gc->private = gpio;
-
-	for (i = 0; i < 2; i++) {
-		ct = &irq_gc->chip_types[i];
-		ct->chip.irq_ack = irq_gc_ack_set_bit;
-		ct->chip.irq_mask = irq_gc_mask_set_bit;
-		ct->chip.irq_unmask = irq_gc_mask_clr_bit;
-		ct->chip.irq_set_type = dwapb_irq_set_type;
-		ct->chip.irq_enable = dwapb_irq_enable;
-		ct->chip.irq_disable = dwapb_irq_disable;
+	girq = &gc->irq;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
+	port->irqchip.name = DWAPB_DRIVER_NAME;
+	port->irqchip.irq_ack = dwapb_irq_ack;
+	port->irqchip.irq_mask = dwapb_irq_mask;
+	port->irqchip.irq_unmask = dwapb_irq_unmask;
+	port->irqchip.irq_set_type = dwapb_irq_set_type;
+	port->irqchip.irq_enable = dwapb_irq_enable;
+	port->irqchip.irq_disable = dwapb_irq_disable;
 #ifdef CONFIG_PM_SLEEP
-		ct->chip.irq_set_wake = dwapb_irq_set_wake;
+	port->irqchip.irq_set_wake = dwapb_irq_set_wake;
 #endif
-		ct->regs.ack = gpio_reg_convert(gpio, GPIO_PORTA_EOI);
-		ct->regs.mask = gpio_reg_convert(gpio, GPIO_INTMASK);
-		ct->type = IRQ_TYPE_LEVEL_MASK;
-	}
-
-	irq_gc->chip_types[0].type = IRQ_TYPE_LEVEL_MASK;
-	irq_gc->chip_types[0].handler = handle_level_irq;
-	irq_gc->chip_types[1].type = IRQ_TYPE_EDGE_BOTH;
-	irq_gc->chip_types[1].handler = handle_edge_irq;
 
 	if (!pp->irq_shared) {
-		int i;
-
-		for (i = 0; i < pp->ngpio; i++) {
-			if (pp->irq[i])
-				irq_set_chained_handler_and_data(pp->irq[i],
-						dwapb_irq_handler, gpio);
-		}
+		girq->num_parents = port->nr_irqs;
+		girq->parents = port->irq;
+		girq->parent_handler_data = gpio;
+		girq->parent_handler = dwapb_irq_handler;
 	} else {
+		/* This will let us handle the parent IRQ in the driver */
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->parent_handler = NULL;
+
 		/*
 		 * Request a shared IRQ since where MFD would have devices
 		 * using the same irq pin
@@ -436,35 +461,15 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
 		if (err) {
 			dev_err(gpio->dev, "error requesting IRQ\n");
-			irq_domain_remove(gpio->domain);
-			gpio->domain = NULL;
 			return;
 		}
 	}
 
-	for (hwirq = 0; hwirq < ngpio; hwirq++)
-		irq_create_mapping(gpio->domain, hwirq);
+	girq->chip = &port->irqchip;
 
 	port->gc.to_irq = dwapb_gpio_to_irq;
 }
 
-static void dwapb_irq_teardown(struct dwapb_gpio *gpio)
-{
-	struct dwapb_gpio_port *port = &gpio->ports[0];
-	struct gpio_chip *gc = &port->gc;
-	unsigned int ngpio = gc->ngpio;
-	irq_hw_number_t hwirq;
-
-	if (!gpio->domain)
-		return;
-
-	for (hwirq = 0; hwirq < ngpio; hwirq++)
-		irq_dispose_mapping(irq_find_mapping(gpio->domain, hwirq));
-
-	irq_domain_remove(gpio->domain);
-	gpio->domain = NULL;
-}
-
 static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 			       struct dwapb_port_property *pp,
 			       unsigned int offs)
@@ -699,7 +704,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 
 out_unregister:
 	dwapb_gpio_unregister(gpio);
-	dwapb_irq_teardown(gpio);
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return err;
@@ -710,7 +714,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
 
 	dwapb_gpio_unregister(gpio);
-	dwapb_irq_teardown(gpio);
 	reset_control_assert(gpio->rst);
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
-- 
2.27.0

