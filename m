Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34AD422A4B7
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jul 2020 03:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387632AbgGWBjN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 21:39:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32958 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387538AbgGWBjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 21:39:11 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 838EB8030816;
        Thu, 23 Jul 2020 01:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N3inIwfvfcUj; Thu, 23 Jul 2020 04:39:06 +0300 (MSK)
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
Subject: [PATCH 4/7] gpio: dwapb: Convert driver to using the GPIO-lib-based IRQ-chip
Date:   Thu, 23 Jul 2020 04:38:55 +0300
Message-ID: <20200723013858.10766-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
References: <20200723013858.10766-1-Sergey.Semin@baikalelectronics.ru>
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
an ordinary (not Generic) irq_chip descriptor is now utilized.
6) Discard the custom GPIO-to-IRQ mapping function since GPIO-lib defines
the standard method gpiochip_to_irq(), which will be used anyway no matter
whether the custom to_irq callback is specified or not.
7) Discard the acpi_gpiochip_{request,free}_interrupts()
invocations, since they will be called from
gpiochip_add_irqchip()/gpiochip_irqchip_remove() anyway.
8) Alter CONFIG_GPIO_DWAPB kernel config to select
CONFIG_GPIOLIB_IRQCHIP instead of CONFIG_GENERIC_IRQ_CHIP.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/Kconfig      |   2 +-
 drivers/gpio/gpio-dwapb.c | 191 +++++++++++++++++---------------------
 2 files changed, 85 insertions(+), 108 deletions(-)

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
index 3081213247d8..3f727ebe7f9a 100644
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
@@ -92,13 +91,15 @@ struct dwapb_gpio_port {
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
+	struct irq_chip		irqchip;
 	unsigned int		flags;
 	struct reset_control	*rst;
 	struct clk_bulk_data	clks[DWAPB_NR_CLOCKS];
@@ -147,14 +148,6 @@ static inline void dwapb_write(struct dwapb_gpio *gpio, unsigned int offset,
 	gc->write_reg(reg_base + gpio_reg_convert(gpio, offset), val);
 }
 
-static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	struct dwapb_gpio_port *port = gpiochip_get_data(gc);
-	struct dwapb_gpio *gpio = port->gpio;
-
-	return irq_find_mapping(gpio->domain, offset);
-}
-
 static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsigned int offs)
 {
 	struct dwapb_gpio_port *port;
@@ -193,12 +186,13 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
+	struct gpio_chip *gc = &gpio->ports[0].gc;
 	unsigned long irq_status;
 	irq_hw_number_t hwirq;
 
 	irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
 	for_each_set_bit(hwirq, &irq_status, 32) {
-		int gpio_irq = irq_find_mapping(gpio->domain, hwirq);
+		int gpio_irq = gc->to_irq(gc, hwirq);
 		u32 irq_type = irq_get_trigger_type(gpio_irq);
 
 		generic_handle_irq(gpio_irq);
@@ -225,11 +219,48 @@ static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
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
 
@@ -242,9 +273,8 @@ static void dwapb_irq_enable(struct irq_data *d)
 
 static void dwapb_irq_disable(struct irq_data *d)
 {
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	unsigned long flags;
 	u32 val;
 
@@ -257,11 +287,11 @@ static void dwapb_irq_disable(struct irq_data *d)
 
 static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 {
-	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
-	struct dwapb_gpio *gpio = igc->private;
-	struct gpio_chip *gc = &gpio->ports[0].gc;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t bit = irqd_to_hwirq(d);
 	unsigned long level, polarity, flags;
+	irq_flow_handler_t handler;
 
 	if (type & ~IRQ_TYPE_SENSE_MASK)
 		return -EINVAL;
@@ -274,26 +304,31 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	case IRQ_TYPE_EDGE_BOTH:
 		level |= BIT(bit);
 		dwapb_toggle_trigger(gpio, bit);
+		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_EDGE_RISING:
 		level |= BIT(bit);
 		polarity |= BIT(bit);
+		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
 		level |= BIT(bit);
 		polarity &= ~BIT(bit);
+		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 		level &= ~BIT(bit);
 		polarity |= BIT(bit);
+		handler = handle_level_irq;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		level &= ~BIT(bit);
 		polarity &= ~BIT(bit);
+		handler = handle_level_irq;
 		break;
 	}
 
-	irq_setup_alt_chip(d, type);
+	irq_set_handler_locked(d, handler);
 
 	dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
 	if (type != IRQ_TYPE_EDGE_BOTH)
@@ -359,73 +394,39 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
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
 
 	if (memchr_inv(pp->irq, 0, sizeof(pp->irq)) == NULL) {
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
+	gpio->irqchip.name = DWAPB_DRIVER_NAME;
+	gpio->irqchip.irq_ack = dwapb_irq_ack;
+	gpio->irqchip.irq_mask = dwapb_irq_mask;
+	gpio->irqchip.irq_unmask = dwapb_irq_unmask;
+	gpio->irqchip.irq_set_type = dwapb_irq_set_type;
+	gpio->irqchip.irq_enable = dwapb_irq_enable;
+	gpio->irqchip.irq_disable = dwapb_irq_disable;
 #ifdef CONFIG_PM_SLEEP
-		ct->chip.irq_set_wake = dwapb_irq_set_wake;
+	gpio->irqchip.irq_set_wake = dwapb_irq_set_wake;
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
+		/*
+		 * If more than one IRQ line is specified then try to
+		 * initialize the hierarchical interrupts. Otherwise it's
+		 * a simple cascaded case with a common IRQ signal.
+		 */
+		girq->num_parents = pp->irq[1] ? pp->ngpio : 1;
+		girq->parents = pp->irq;
+		girq->parent_handler_data = gpio;
+		girq->parent_handler = dwapb_irq_handler;
 	} else {
 		/*
 		 * Request a shared IRQ since where MFD would have devices
@@ -436,33 +437,15 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
 				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
 		if (err) {
 			dev_err(gpio->dev, "error requesting IRQ\n");
-			irq_domain_remove(gpio->domain);
-			gpio->domain = NULL;
 			return;
 		}
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parents = NULL;
+		girq->num_parents = 0;
+		girq->parent_handler = NULL;
 	}
 
-	for (hwirq = 0; hwirq < ngpio; hwirq++)
-		irq_create_mapping(gpio->domain, hwirq);
-
-	port->gc.to_irq = dwapb_gpio_to_irq;
-}
-
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
+	girq->chip = &gpio->irqchip;
 }
 
 static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
@@ -517,9 +500,6 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 		return err;
 	}
 
-	/* Add GPIO-signaled ACPI event support */
-	acpi_gpiochip_request_interrupts(&port->gc);
-
 	port->is_registered = true;
 
 	return 0;
@@ -535,7 +515,6 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
 		if (!port->is_registered)
 			continue;
 
-		acpi_gpiochip_free_interrupts(&port->gc);
 		gpiochip_remove(&port->gc);
 	}
 }
@@ -699,7 +678,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 
 out_unregister:
 	dwapb_gpio_unregister(gpio);
-	dwapb_irq_teardown(gpio);
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
 	return err;
@@ -710,7 +688,6 @@ static int dwapb_gpio_remove(struct platform_device *pdev)
 	struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
 
 	dwapb_gpio_unregister(gpio);
-	dwapb_irq_teardown(gpio);
 	reset_control_assert(gpio->rst);
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
 
-- 
2.26.2

