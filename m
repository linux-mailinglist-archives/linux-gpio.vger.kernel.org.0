Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC1D3471CA
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 07:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhCXGqx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 02:46:53 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:49996 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhCXGqT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 02:46:19 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 633B1D0E31;
        Wed, 24 Mar 2021 14:46:01 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P24306T139685112297216S1616568346904525_;
        Wed, 24 Mar 2021 14:46:01 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7a730bae88fd452394918af12ab06db5>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     huangtao@rock-chips.com, kever.yang@rock-chips.com,
        linus.walleij@linaro.org, heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH 3/7] gpio: separate gpio driver from pinctrl-rockchip driver
Date:   Wed, 24 Mar 2021 14:45:37 +0800
Message-Id: <20210324064541.949630-4-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324064541.949630-1-jay.xu@rock-chips.com>
References: <20210324064541.949630-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Separate the gpio driver from the pinctrl driver.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/gpio/Kconfig               |   8 +
 drivers/gpio/Makefile              |   1 +
 drivers/gpio/gpio-rockchip.c       | 657 +++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.c | 685 +----------------------------
 4 files changed, 684 insertions(+), 667 deletions(-)
 create mode 100644 drivers/gpio/gpio-rockchip.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..702fb6db3e46 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -508,6 +508,14 @@ config GPIO_REG
 	  A 32-bit single register GPIO fixed in/out implementation.  This
 	  can be used to represent any register as a set of GPIO signals.
 
+config GPIO_ROCKCHIP
+	tristate "Rockchip GPIO support"
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	default ARCH_ROCKCHIP
+	help
+	  Say yes here to support GPIO on Rockchip SoCs.
+
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
 	depends on MFD_SYSCON
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c58a90a3c3b1..1432694f3b3a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -125,6 +125,7 @@ obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
 obj-$(CONFIG_GPIO_RDA)			+= gpio-rda.o
 obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
+obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
new file mode 100644
index 000000000000..03a3d251faae
--- /dev/null
+++ b/drivers/gpio/gpio-rockchip.c
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2013 MundoReader S.L.
+ * Author: Heiko Stuebner <heiko@sntech.de>
+ *
+ * Copyright (c) 2021 Rockchip Electronics Co. Ltd.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+
+#include "../pinctrl/core.h"
+#include "../pinctrl/pinctrl-rockchip.h"
+
+/* GPIO control registers */
+#define GPIO_SWPORT_DR		0x00
+#define GPIO_SWPORT_DDR		0x04
+#define GPIO_INTEN		0x30
+#define GPIO_INTMASK		0x34
+#define GPIO_INTTYPE_LEVEL	0x38
+#define GPIO_INT_POLARITY	0x3c
+#define GPIO_INT_STATUS		0x40
+#define GPIO_INT_RAWSTATUS	0x44
+#define GPIO_DEBOUNCE		0x48
+#define GPIO_PORTS_EOI		0x4c
+#define GPIO_EXT_PORT		0x50
+#define GPIO_LS_SYNC		0x60
+
+static int rockchip_gpio_get_direction(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
+	u32 data;
+	int ret;
+
+	ret = clk_enable(bank->clk);
+	if (ret < 0) {
+		dev_err(bank->drvdata->dev,
+			"failed to enable clock for bank %s\n", bank->name);
+		return ret;
+	}
+	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	clk_disable(bank->clk);
+
+	if (data & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int rockchip_gpio_set_direction(struct gpio_chip *chip,
+				       unsigned int offset, bool input)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
+	unsigned long flags;
+	u32 data;
+
+	clk_enable(bank->clk);
+	raw_spin_lock_irqsave(&bank->slock, flags);
+
+	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	/* set bit to 1 for output, 0 for input */
+	if (!input)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
+
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+	clk_disable(bank->clk);
+
+	return 0;
+}
+
+static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			      int value)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg = bank->reg_base + GPIO_SWPORT_DR;
+	unsigned long flags;
+	u32 data;
+
+	clk_enable(bank->clk);
+	raw_spin_lock_irqsave(&bank->slock, flags);
+
+	data = readl(reg);
+	data &= ~BIT(offset);
+	if (value)
+		data |= BIT(offset);
+	writel(data, reg);
+
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+	clk_disable(bank->clk);
+}
+
+static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	u32 data;
+
+	clk_enable(bank->clk);
+	data = readl(bank->reg_base + GPIO_EXT_PORT);
+	clk_disable(bank->clk);
+	data >>= offset;
+	data &= 1;
+	return data;
+}
+
+static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
+				       unsigned int offset, bool enable)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	void __iomem *reg = bank->reg_base + GPIO_DEBOUNCE;
+	unsigned long flags;
+	u32 data;
+
+	clk_enable(bank->clk);
+	raw_spin_lock_irqsave(&bank->slock, flags);
+
+	data = readl(reg);
+	if (enable)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	writel(data, reg);
+
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+	clk_disable(bank->clk);
+}
+
+static int rockchip_gpio_direction_input(struct gpio_chip *gc,
+					 unsigned int offset)
+{
+	return rockchip_gpio_set_direction(gc, offset, true);
+}
+
+static int rockchip_gpio_direction_output(struct gpio_chip *gc,
+					  unsigned int offset, int value)
+{
+	rockchip_gpio_set(gc, offset, value);
+
+	return rockchip_gpio_set_direction(gc, offset, false);
+}
+
+/*
+ * gpiolib set_config callback function. The setting of the pin
+ * mux function as 'gpio output' will be handled by the pinctrl subsystem
+ * interface.
+ */
+static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				  unsigned long config)
+{
+	enum pin_config_param param = pinconf_to_config_param(config);
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		rockchip_gpio_set_debounce(gc, offset, true);
+		/*
+		 * Rockchip's gpio could only support up to one period
+		 * of the debounce clock(pclk), which is far away from
+		 * satisftying the requirement, as pclk is usually near
+		 * 100MHz shared by all peripherals. So the fact is it
+		 * has crippled debounce capability could only be useful
+		 * to prevent any spurious glitches from waking up the system
+		 * if the gpio is conguired as wakeup interrupt source. Let's
+		 * still return -ENOTSUPP as before, to make sure the caller
+		 * of gpiod_set_debounce won't change its behaviour.
+		 */
+		return -ENOTSUPP;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+/*
+ * gpiolib gpio_to_irq callback function. Creates a mapping between a GPIO pin
+ * and a virtual IRQ, if not already present.
+ */
+static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
+	unsigned int virq;
+
+	if (!bank->domain)
+		return -ENXIO;
+
+	clk_enable(bank->clk);
+	virq = irq_create_mapping(bank->domain, offset);
+	clk_disable(bank->clk);
+
+	return (virq) ? : -ENXIO;
+}
+
+static const struct gpio_chip rockchip_gpiolib_chip = {
+	.request = gpiochip_generic_request,
+	.free = gpiochip_generic_free,
+	.set = rockchip_gpio_set,
+	.get = rockchip_gpio_get,
+	.get_direction	= rockchip_gpio_get_direction,
+	.direction_input = rockchip_gpio_direction_input,
+	.direction_output = rockchip_gpio_direction_output,
+	.set_config = rockchip_gpio_set_config,
+	.to_irq = rockchip_gpio_to_irq,
+	.owner = THIS_MODULE,
+};
+
+static void rockchip_irq_demux(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct rockchip_pin_bank *bank = irq_desc_get_handler_data(desc);
+	u32 pend;
+
+	dev_dbg(bank->dev, "got irq for bank %s\n", bank->name);
+
+	chained_irq_enter(chip, desc);
+
+	pend = readl_relaxed(bank->reg_base + GPIO_INT_STATUS);
+
+	while (pend) {
+		unsigned int irq, virq;
+
+		irq = __ffs(pend);
+		pend &= ~BIT(irq);
+		virq = irq_find_mapping(bank->domain, irq);
+
+		if (!virq) {
+			dev_err(bank->dev, "unmapped irq %d\n", irq);
+			continue;
+		}
+
+		dev_dbg(bank->dev, "handling irq %d\n", irq);
+
+		/*
+		 * Triggering IRQ on both rising and falling edge
+		 * needs manual intervention.
+		 */
+		if (bank->toggle_edge_mode & BIT(irq)) {
+			u32 data, data_old, polarity;
+			unsigned long flags;
+
+			data = readl_relaxed(bank->reg_base + GPIO_EXT_PORT);
+			do {
+				raw_spin_lock_irqsave(&bank->slock, flags);
+
+				polarity = readl_relaxed(bank->reg_base +
+							 GPIO_INT_POLARITY);
+				if (data & BIT(irq))
+					polarity &= ~BIT(irq);
+				else
+					polarity |= BIT(irq);
+				writel(polarity,
+				       bank->reg_base + GPIO_INT_POLARITY);
+
+				raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+				data_old = data;
+				data = readl_relaxed(bank->reg_base +
+						     GPIO_EXT_PORT);
+			} while ((data & BIT(irq)) != (data_old & BIT(irq)));
+		}
+
+		generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct rockchip_pin_bank *bank = gc->private;
+	u32 mask = BIT(d->hwirq);
+	u32 polarity;
+	u32 level;
+	u32 data;
+	unsigned long flags;
+
+	clk_enable(bank->clk);
+	raw_spin_lock_irqsave(&bank->slock, flags);
+
+	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	data &= ~mask;
+	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
+
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
+	raw_spin_lock_irqsave(&bank->slock, flags);
+	irq_gc_lock(gc);
+
+	level = readl_relaxed(gc->reg_base + GPIO_INTTYPE_LEVEL);
+	polarity = readl_relaxed(gc->reg_base + GPIO_INT_POLARITY);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		bank->toggle_edge_mode |= mask;
+		level |= mask;
+
+		/*
+		 * Determine gpio state. If 1 next interrupt should be falling
+		 * otherwise rising.
+		 */
+		data = readl(bank->reg_base + GPIO_EXT_PORT);
+		if (data & mask)
+			polarity &= ~mask;
+		else
+			polarity |= mask;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		bank->toggle_edge_mode &= ~mask;
+		level |= mask;
+		polarity |= mask;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		bank->toggle_edge_mode &= ~mask;
+		level |= mask;
+		polarity &= ~mask;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		bank->toggle_edge_mode &= ~mask;
+		level &= ~mask;
+		polarity |= mask;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		bank->toggle_edge_mode &= ~mask;
+		level &= ~mask;
+		polarity &= ~mask;
+		break;
+	default:
+		irq_gc_unlock(gc);
+		raw_spin_unlock_irqrestore(&bank->slock, flags);
+		clk_disable(bank->clk);
+		return -EINVAL;
+	}
+
+	writel_relaxed(level, gc->reg_base + GPIO_INTTYPE_LEVEL);
+	writel_relaxed(polarity, gc->reg_base + GPIO_INT_POLARITY);
+
+	irq_gc_unlock(gc);
+	raw_spin_unlock_irqrestore(&bank->slock, flags);
+	clk_disable(bank->clk);
+
+	return 0;
+}
+
+static void rockchip_irq_suspend(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct rockchip_pin_bank *bank = gc->private;
+
+	clk_enable(bank->clk);
+	bank->saved_masks = irq_reg_readl(gc, GPIO_INTMASK);
+	irq_reg_writel(gc, ~gc->wake_active, GPIO_INTMASK);
+	clk_disable(bank->clk);
+}
+
+static void rockchip_irq_resume(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct rockchip_pin_bank *bank = gc->private;
+
+	clk_enable(bank->clk);
+	irq_reg_writel(gc, bank->saved_masks, GPIO_INTMASK);
+	clk_disable(bank->clk);
+}
+
+static void rockchip_irq_enable(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct rockchip_pin_bank *bank = gc->private;
+
+	clk_enable(bank->clk);
+	irq_gc_mask_clr_bit(d);
+}
+
+static void rockchip_irq_disable(struct irq_data *d)
+{
+	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
+	struct rockchip_pin_bank *bank = gc->private;
+
+	irq_gc_mask_set_bit(d);
+	clk_disable(bank->clk);
+}
+
+static int rockchip_interrupts_register(struct rockchip_pin_bank *bank)
+{
+	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
+	struct irq_chip_generic *gc;
+	int ret;
+
+	ret = clk_enable(bank->clk);
+	if (ret) {
+		dev_err(bank->dev, "failed to enable clock for bank %s\n",
+			bank->name);
+		return -EINVAL;
+	}
+
+	bank->domain = irq_domain_add_linear(bank->of_node, 32,
+					&irq_generic_chip_ops, NULL);
+	if (!bank->domain) {
+		dev_warn(bank->dev, "could not init irq domain for bank %s\n",
+			 bank->name);
+		clk_disable(bank->clk);
+		return -EINVAL;
+	}
+
+	ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
+					     "rockchip_gpio_irq",
+					     handle_level_irq,
+					     clr, 0, 0);
+	if (ret) {
+		dev_err(bank->dev, "could not alloc generic chips for bank %s\n",
+			bank->name);
+		irq_domain_remove(bank->domain);
+		clk_disable(bank->clk);
+		return -EINVAL;
+	}
+
+	gc = irq_get_domain_generic_chip(bank->domain, 0);
+	gc->reg_base = bank->reg_base;
+	gc->private = bank;
+	gc->chip_types[0].regs.mask = GPIO_INTMASK;
+	gc->chip_types[0].regs.ack = GPIO_PORTS_EOI;
+	gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
+	gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
+	gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
+	gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
+	gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
+	gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
+	gc->wake_enabled = IRQ_MSK(bank->nr_pins);
+
+	/*
+	 * Linux assumes that all interrupts start out disabled/masked.
+	 * Our driver only uses the concept of masked and always keeps
+	 * things enabled, so for us that's all masked and all enabled.
+	 */
+	writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
+	writel_relaxed(0xffffffff, bank->reg_base + GPIO_PORTS_EOI);
+	writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
+	gc->mask_cache = 0xffffffff;
+
+	irq_set_chained_handler_and_data(bank->irq,
+					 rockchip_irq_demux, bank);
+	clk_disable(bank->clk);
+
+	return 0;
+}
+
+static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
+{
+	struct gpio_chip *gc;
+	int ret;
+
+	bank->gpio_chip = rockchip_gpiolib_chip;
+
+	gc = &bank->gpio_chip;
+	gc->base = bank->pin_base;
+	gc->ngpio = bank->nr_pins;
+	gc->label = bank->name;
+	gc->parent = bank->dev;
+#ifdef CONFIG_OF_GPIO
+	gc->of_node = of_node_get(bank->of_node);
+#endif
+
+	ret = gpiochip_add_data(gc, bank);
+	if (ret) {
+		dev_err(bank->dev, "failed to add gpiochip %s, %d\n",
+			gc->label, ret);
+		return ret;
+	}
+
+	/*
+	 * For DeviceTree-supported systems, the gpio core checks the
+	 * pinctrl's device node for the "gpio-ranges" property.
+	 * If it is present, it takes care of adding the pin ranges
+	 * for the driver. In this case the driver can skip ahead.
+	 *
+	 * In order to remain compatible with older, existing DeviceTree
+	 * files which don't set the "gpio-ranges" property or systems that
+	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
+	 */
+	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
+		struct device_node *pctlnp = of_get_parent(bank->of_node);
+		struct pinctrl_dev *pctldev = NULL;
+
+		if (!pctlnp)
+			return -ENODATA;
+
+		pctldev = of_pinctrl_get(pctlnp);
+		if (!pctldev)
+			return -ENODEV;
+
+		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
+					     gc->base, gc->ngpio);
+		if (ret) {
+			dev_err(bank->dev, "Failed to add pin range\n");
+			goto fail;
+		}
+	}
+
+	ret = rockchip_interrupts_register(bank);
+	if (ret) {
+		dev_err(bank->dev, "failed to register interrupt, %d\n", ret);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	gpiochip_remove(&bank->gpio_chip);
+
+	return ret;
+}
+
+static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
+{
+	struct resource res;
+
+	if (of_address_to_resource(bank->of_node, 0, &res)) {
+		dev_err(bank->dev, "cannot find IO resource for bank\n");
+		return -ENOENT;
+	}
+
+	bank->reg_base = devm_ioremap_resource(bank->dev, &res);
+	if (IS_ERR(bank->reg_base))
+		return PTR_ERR(bank->reg_base);
+
+	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
+
+	bank->clk = of_clk_get(bank->of_node, 0);
+	if (!IS_ERR(bank->clk))
+		return clk_prepare(bank->clk);
+
+	bank->clk = NULL;
+	return 0;
+}
+
+static struct rockchip_pin_bank *
+rockchip_gpio_find_bank(struct pinctrl_dev *pctldev, const char *name)
+{
+	struct rockchip_pinctrl *info;
+	struct rockchip_pin_bank *bank;
+	int i, found = 0;
+
+	info = pinctrl_dev_get_drvdata(pctldev);
+	bank = info->ctrl->pin_banks;
+	for (i = 0; i < info->ctrl->nr_banks; i++, bank++) {
+		if (!strcmp(bank->name, name)) {
+			found = 1;
+			break;
+		}
+	}
+
+	return found ? bank : NULL;
+}
+
+static int rockchip_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *pctlnp = of_get_parent(np);
+	struct pinctrl_dev *pctldev = NULL;
+	struct rockchip_pin_bank *bank = NULL;
+	int ret;
+
+	if (!np || !pctlnp)
+		return -ENODEV;
+
+	pctldev = of_pinctrl_get(pctlnp);
+	if (!pctldev)
+		return -EPROBE_DEFER;
+
+	bank = rockchip_gpio_find_bank(pctldev, np->name);
+	if (!bank)
+		return -EINVAL;
+
+	bank->dev = dev;
+	bank->of_node = np;
+
+	raw_spin_lock_init(&bank->slock);
+
+	ret = rockchip_get_bank_data(bank);
+	if (ret)
+		return ret;
+
+	ret = rockchip_gpiolib_register(bank);
+	if (ret) {
+		clk_disable_unprepare(bank->clk);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, bank);
+	dev_info(dev, "probed %pOF\n", np);
+
+	return 0;
+}
+
+static int rockchip_gpio_remove(struct platform_device *pdev)
+{
+	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(bank->clk);
+	gpiochip_remove(&bank->gpio_chip);
+
+	return 0;
+}
+
+static const struct of_device_id rockchip_gpio_match[] = {
+	{ .compatible = "rockchip,gpio-bank", },
+	{ .compatible = "rockchip,rk3188-gpio-bank0" },
+	{ },
+};
+
+static struct platform_driver rockchip_gpio_driver = {
+	.probe		= rockchip_gpio_probe,
+	.remove		= rockchip_gpio_remove,
+	.driver		= {
+		.name	= "rockchip-gpio",
+		.of_match_table = rockchip_gpio_match,
+	},
+};
+
+static int __init rockchip_gpio_init(void)
+{
+	return platform_driver_register(&rockchip_gpio_driver);
+}
+postcore_initcall(rockchip_gpio_init);
+
+static void __exit rockchip_gpio_exit(void)
+{
+	platform_driver_unregister(&rockchip_gpio_driver);
+}
+module_exit(rockchip_gpio_exit);
+
+MODULE_DESCRIPTION("Rockchip gpio driver");
+MODULE_ALIAS("platform:rockchip-gpio");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, rockchip_gpio_match);
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 625ebc1cdfd5..543171edd929 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -20,9 +20,9 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/bitops.h>
-#include <linux/gpio/driver.h>
-#include <linux/of_device.h>
+#include <linux/gpio.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -39,20 +39,6 @@
 #include "pinconf.h"
 #include "pinctrl-rockchip.h"
 
-/* GPIO control registers */
-#define GPIO_SWPORT_DR		0x00
-#define GPIO_SWPORT_DDR		0x04
-#define GPIO_INTEN		0x30
-#define GPIO_INTMASK		0x34
-#define GPIO_INTTYPE_LEVEL	0x38
-#define GPIO_INT_POLARITY	0x3c
-#define GPIO_INT_STATUS		0x40
-#define GPIO_INT_RAWSTATUS	0x44
-#define GPIO_DEBOUNCE		0x48
-#define GPIO_PORTS_EOI		0x4c
-#define GPIO_EXT_PORT		0x50
-#define GPIO_LS_SYNC		0x60
-
 /*
  * Encode variants of iomux registers into a type variable
  */
@@ -2317,86 +2303,11 @@ static int rockchip_pmx_set(struct pinctrl_dev *pctldev, unsigned selector,
 	return 0;
 }
 
-static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
-{
-	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
-	u32 data;
-	int ret;
-
-	ret = clk_enable(bank->clk);
-	if (ret < 0) {
-		dev_err(bank->drvdata->dev,
-			"failed to enable clock for bank %s\n", bank->name);
-		return ret;
-	}
-	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
-	clk_disable(bank->clk);
-
-	if (data & BIT(offset))
-		return GPIO_LINE_DIRECTION_OUT;
-
-	return GPIO_LINE_DIRECTION_IN;
-}
-
-/*
- * The calls to gpio_direction_output() and gpio_direction_input()
- * leads to this function call (via the pinctrl_gpio_direction_{input|output}()
- * function called from the gpiolib interface).
- */
-static int _rockchip_pmx_gpio_set_direction(struct gpio_chip *chip,
-					    int pin, bool input)
-{
-	struct rockchip_pin_bank *bank;
-	int ret;
-	unsigned long flags;
-	u32 data;
-
-	bank = gpiochip_get_data(chip);
-
-	ret = rockchip_set_mux(bank, pin, RK_FUNC_GPIO);
-	if (ret < 0)
-		return ret;
-
-	clk_enable(bank->clk);
-	raw_spin_lock_irqsave(&bank->slock, flags);
-
-	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
-	/* set bit to 1 for output, 0 for input */
-	if (!input)
-		data |= BIT(pin);
-	else
-		data &= ~BIT(pin);
-	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
-
-	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
-
-	return 0;
-}
-
-static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
-					      struct pinctrl_gpio_range *range,
-					      unsigned offset, bool input)
-{
-	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
-	struct gpio_chip *chip;
-	int pin;
-
-	chip = range->gc;
-	pin = offset - chip->base;
-	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
-		 offset, range->name, pin, input ? "input" : "output");
-
-	return _rockchip_pmx_gpio_set_direction(chip, offset - chip->base,
-						input);
-}
-
 static const struct pinmux_ops rockchip_pmx_ops = {
 	.get_functions_count	= rockchip_pmx_get_funcs_count,
 	.get_function_name	= rockchip_pmx_get_func_name,
 	.get_function_groups	= rockchip_pmx_get_groups,
 	.set_mux		= rockchip_pmx_set,
-	.gpio_set_direction	= rockchip_pmx_gpio_set_direction,
 };
 
 /*
@@ -2426,15 +2337,13 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 	return false;
 }
 
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value);
-static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset);
-
 /* set the pin config settings for a specified pin */
 static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				unsigned long *configs, unsigned num_configs)
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
+	struct gpio_chip *gpio = &bank->gpio_chip;
 	enum pin_config_param param;
 	u32 arg;
 	int i;
@@ -2467,10 +2376,13 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return rc;
 			break;
 		case PIN_CONFIG_OUTPUT:
-			rockchip_gpio_set(&bank->gpio_chip,
-					  pin - bank->pin_base, arg);
-			rc = _rockchip_pmx_gpio_set_direction(&bank->gpio_chip,
-					  pin - bank->pin_base, false);
+			rc = rockchip_set_mux(bank, pin - bank->pin_base,
+					      RK_FUNC_GPIO);
+			if (rc != RK_FUNC_GPIO)
+				return -EINVAL;
+
+			rc = gpio->direction_output(gpio, pin - bank->pin_base,
+						    arg);
 			if (rc)
 				return rc;
 			break;
@@ -2508,6 +2420,7 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct rockchip_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct rockchip_pin_bank *bank = pin_to_bank(info, pin);
+	struct gpio_chip *gpio = &bank->gpio_chip;
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	u16 arg;
 	int rc;
@@ -2536,7 +2449,7 @@ static int rockchip_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (rc != RK_FUNC_GPIO)
 			return -EINVAL;
 
-		rc = rockchip_gpio_get(&bank->gpio_chip, pin - bank->pin_base);
+		rc = gpio->get(gpio, pin - bank->pin_base);
 		if (rc < 0)
 			return rc;
 
@@ -2774,7 +2687,7 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 	ctrldesc->npins = info->ctrl->nr_pins;
 
 	pdesc = pindesc;
-	for (bank = 0 , k = 0; bank < info->ctrl->nr_banks; bank++) {
+	for (bank = 0, k = 0; bank < info->ctrl->nr_banks; bank++) {
 		pin_bank = &info->ctrl->pin_banks[bank];
 		for (pin = 0; pin < pin_bank->nr_pins; pin++, k++) {
 			pdesc->number = k;
@@ -2794,553 +2707,9 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 		return PTR_ERR(info->pctl_dev);
 	}
 
-	for (bank = 0; bank < info->ctrl->nr_banks; ++bank) {
-		pin_bank = &info->ctrl->pin_banks[bank];
-		pin_bank->grange.name = pin_bank->name;
-		pin_bank->grange.id = bank;
-		pin_bank->grange.pin_base = pin_bank->pin_base;
-		pin_bank->grange.base = pin_bank->gpio_chip.base;
-		pin_bank->grange.npins = pin_bank->gpio_chip.ngpio;
-		pin_bank->grange.gc = &pin_bank->gpio_chip;
-		pinctrl_add_gpio_range(info->pctl_dev, &pin_bank->grange);
-	}
-
 	return 0;
 }
 
-/*
- * GPIO handling
- */
-
-static void rockchip_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
-{
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	void __iomem *reg = bank->reg_base + GPIO_SWPORT_DR;
-	unsigned long flags;
-	u32 data;
-
-	clk_enable(bank->clk);
-	raw_spin_lock_irqsave(&bank->slock, flags);
-
-	data = readl(reg);
-	data &= ~BIT(offset);
-	if (value)
-		data |= BIT(offset);
-	writel(data, reg);
-
-	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
-}
-
-/*
- * Returns the level of the pin for input direction and setting of the DR
- * register for output gpios.
- */
-static int rockchip_gpio_get(struct gpio_chip *gc, unsigned offset)
-{
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	u32 data;
-
-	clk_enable(bank->clk);
-	data = readl(bank->reg_base + GPIO_EXT_PORT);
-	clk_disable(bank->clk);
-	data >>= offset;
-	data &= 1;
-	return data;
-}
-
-/*
- * gpiolib gpio_direction_input callback function. The setting of the pin
- * mux function as 'gpio input' will be handled by the pinctrl subsystem
- * interface.
- */
-static int rockchip_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
-{
-	return pinctrl_gpio_direction_input(gc->base + offset);
-}
-
-/*
- * gpiolib gpio_direction_output callback function. The setting of the pin
- * mux function as 'gpio output' will be handled by the pinctrl subsystem
- * interface.
- */
-static int rockchip_gpio_direction_output(struct gpio_chip *gc,
-					  unsigned offset, int value)
-{
-	rockchip_gpio_set(gc, offset, value);
-	return pinctrl_gpio_direction_output(gc->base + offset);
-}
-
-static void rockchip_gpio_set_debounce(struct gpio_chip *gc,
-				       unsigned int offset, bool enable)
-{
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	void __iomem *reg = bank->reg_base + GPIO_DEBOUNCE;
-	unsigned long flags;
-	u32 data;
-
-	clk_enable(bank->clk);
-	raw_spin_lock_irqsave(&bank->slock, flags);
-
-	data = readl(reg);
-	if (enable)
-		data |= BIT(offset);
-	else
-		data &= ~BIT(offset);
-	writel(data, reg);
-
-	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
-}
-
-/*
- * gpiolib set_config callback function. The setting of the pin
- * mux function as 'gpio output' will be handled by the pinctrl subsystem
- * interface.
- */
-static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
-				  unsigned long config)
-{
-	enum pin_config_param param = pinconf_to_config_param(config);
-
-	switch (param) {
-	case PIN_CONFIG_INPUT_DEBOUNCE:
-		rockchip_gpio_set_debounce(gc, offset, true);
-		/*
-		 * Rockchip's gpio could only support up to one period
-		 * of the debounce clock(pclk), which is far away from
-		 * satisftying the requirement, as pclk is usually near
-		 * 100MHz shared by all peripherals. So the fact is it
-		 * has crippled debounce capability could only be useful
-		 * to prevent any spurious glitches from waking up the system
-		 * if the gpio is conguired as wakeup interrupt source. Let's
-		 * still return -ENOTSUPP as before, to make sure the caller
-		 * of gpiod_set_debounce won't change its behaviour.
-		 */
-		return -ENOTSUPP;
-	default:
-		return -ENOTSUPP;
-	}
-}
-
-/*
- * gpiolib gpio_to_irq callback function. Creates a mapping between a GPIO pin
- * and a virtual IRQ, if not already present.
- */
-static int rockchip_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
-{
-	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
-	unsigned int virq;
-
-	if (!bank->domain)
-		return -ENXIO;
-
-	clk_enable(bank->clk);
-	virq = irq_create_mapping(bank->domain, offset);
-	clk_disable(bank->clk);
-
-	return (virq) ? : -ENXIO;
-}
-
-static const struct gpio_chip rockchip_gpiolib_chip = {
-	.request = gpiochip_generic_request,
-	.free = gpiochip_generic_free,
-	.set = rockchip_gpio_set,
-	.get = rockchip_gpio_get,
-	.get_direction	= rockchip_gpio_get_direction,
-	.direction_input = rockchip_gpio_direction_input,
-	.direction_output = rockchip_gpio_direction_output,
-	.set_config = rockchip_gpio_set_config,
-	.to_irq = rockchip_gpio_to_irq,
-	.owner = THIS_MODULE,
-};
-
-/*
- * Interrupt handling
- */
-
-static void rockchip_irq_demux(struct irq_desc *desc)
-{
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	struct rockchip_pin_bank *bank = irq_desc_get_handler_data(desc);
-	u32 pend;
-
-	dev_dbg(bank->drvdata->dev, "got irq for bank %s\n", bank->name);
-
-	chained_irq_enter(chip, desc);
-
-	pend = readl_relaxed(bank->reg_base + GPIO_INT_STATUS);
-
-	while (pend) {
-		unsigned int irq, virq;
-
-		irq = __ffs(pend);
-		pend &= ~BIT(irq);
-		virq = irq_find_mapping(bank->domain, irq);
-
-		if (!virq) {
-			dev_err(bank->drvdata->dev, "unmapped irq %d\n", irq);
-			continue;
-		}
-
-		dev_dbg(bank->drvdata->dev, "handling irq %d\n", irq);
-
-		/*
-		 * Triggering IRQ on both rising and falling edge
-		 * needs manual intervention.
-		 */
-		if (bank->toggle_edge_mode & BIT(irq)) {
-			u32 data, data_old, polarity;
-			unsigned long flags;
-
-			data = readl_relaxed(bank->reg_base + GPIO_EXT_PORT);
-			do {
-				raw_spin_lock_irqsave(&bank->slock, flags);
-
-				polarity = readl_relaxed(bank->reg_base +
-							 GPIO_INT_POLARITY);
-				if (data & BIT(irq))
-					polarity &= ~BIT(irq);
-				else
-					polarity |= BIT(irq);
-				writel(polarity,
-				       bank->reg_base + GPIO_INT_POLARITY);
-
-				raw_spin_unlock_irqrestore(&bank->slock, flags);
-
-				data_old = data;
-				data = readl_relaxed(bank->reg_base +
-						     GPIO_EXT_PORT);
-			} while ((data & BIT(irq)) != (data_old & BIT(irq)));
-		}
-
-		generic_handle_irq(virq);
-	}
-
-	chained_irq_exit(chip, desc);
-}
-
-static int rockchip_irq_set_type(struct irq_data *d, unsigned int type)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-	u32 mask = BIT(d->hwirq);
-	u32 polarity;
-	u32 level;
-	u32 data;
-	unsigned long flags;
-	int ret;
-
-	/* make sure the pin is configured as gpio input */
-	ret = rockchip_set_mux(bank, d->hwirq, RK_FUNC_GPIO);
-	if (ret < 0)
-		return ret;
-
-	clk_enable(bank->clk);
-	raw_spin_lock_irqsave(&bank->slock, flags);
-
-	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
-	data &= ~mask;
-	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
-
-	raw_spin_unlock_irqrestore(&bank->slock, flags);
-
-	if (type & IRQ_TYPE_EDGE_BOTH)
-		irq_set_handler_locked(d, handle_edge_irq);
-	else
-		irq_set_handler_locked(d, handle_level_irq);
-
-	raw_spin_lock_irqsave(&bank->slock, flags);
-	irq_gc_lock(gc);
-
-	level = readl_relaxed(gc->reg_base + GPIO_INTTYPE_LEVEL);
-	polarity = readl_relaxed(gc->reg_base + GPIO_INT_POLARITY);
-
-	switch (type) {
-	case IRQ_TYPE_EDGE_BOTH:
-		bank->toggle_edge_mode |= mask;
-		level |= mask;
-
-		/*
-		 * Determine gpio state. If 1 next interrupt should be falling
-		 * otherwise rising.
-		 */
-		data = readl(bank->reg_base + GPIO_EXT_PORT);
-		if (data & mask)
-			polarity &= ~mask;
-		else
-			polarity |= mask;
-		break;
-	case IRQ_TYPE_EDGE_RISING:
-		bank->toggle_edge_mode &= ~mask;
-		level |= mask;
-		polarity |= mask;
-		break;
-	case IRQ_TYPE_EDGE_FALLING:
-		bank->toggle_edge_mode &= ~mask;
-		level |= mask;
-		polarity &= ~mask;
-		break;
-	case IRQ_TYPE_LEVEL_HIGH:
-		bank->toggle_edge_mode &= ~mask;
-		level &= ~mask;
-		polarity |= mask;
-		break;
-	case IRQ_TYPE_LEVEL_LOW:
-		bank->toggle_edge_mode &= ~mask;
-		level &= ~mask;
-		polarity &= ~mask;
-		break;
-	default:
-		irq_gc_unlock(gc);
-		raw_spin_unlock_irqrestore(&bank->slock, flags);
-		clk_disable(bank->clk);
-		return -EINVAL;
-	}
-
-	writel_relaxed(level, gc->reg_base + GPIO_INTTYPE_LEVEL);
-	writel_relaxed(polarity, gc->reg_base + GPIO_INT_POLARITY);
-
-	irq_gc_unlock(gc);
-	raw_spin_unlock_irqrestore(&bank->slock, flags);
-	clk_disable(bank->clk);
-
-	return 0;
-}
-
-static void rockchip_irq_suspend(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-
-	clk_enable(bank->clk);
-	bank->saved_masks = irq_reg_readl(gc, GPIO_INTMASK);
-	irq_reg_writel(gc, ~gc->wake_active, GPIO_INTMASK);
-	clk_disable(bank->clk);
-}
-
-static void rockchip_irq_resume(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-
-	clk_enable(bank->clk);
-	irq_reg_writel(gc, bank->saved_masks, GPIO_INTMASK);
-	clk_disable(bank->clk);
-}
-
-static void rockchip_irq_enable(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-
-	clk_enable(bank->clk);
-	irq_gc_mask_clr_bit(d);
-}
-
-static void rockchip_irq_disable(struct irq_data *d)
-{
-	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
-	struct rockchip_pin_bank *bank = gc->private;
-
-	irq_gc_mask_set_bit(d);
-	clk_disable(bank->clk);
-}
-
-static int rockchip_interrupts_register(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
-{
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
-	unsigned int clr = IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_NOAUTOEN;
-	struct irq_chip_generic *gc;
-	int ret;
-	int i;
-
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid) {
-			dev_warn(&pdev->dev, "bank %s is not valid\n",
-				 bank->name);
-			continue;
-		}
-
-		ret = clk_enable(bank->clk);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to enable clock for bank %s\n",
-				bank->name);
-			continue;
-		}
-
-		bank->domain = irq_domain_add_linear(bank->of_node, 32,
-						&irq_generic_chip_ops, NULL);
-		if (!bank->domain) {
-			dev_warn(&pdev->dev, "could not initialize irq domain for bank %s\n",
-				 bank->name);
-			clk_disable(bank->clk);
-			continue;
-		}
-
-		ret = irq_alloc_domain_generic_chips(bank->domain, 32, 1,
-					 "rockchip_gpio_irq", handle_level_irq,
-					 clr, 0, 0);
-		if (ret) {
-			dev_err(&pdev->dev, "could not alloc generic chips for bank %s\n",
-				bank->name);
-			irq_domain_remove(bank->domain);
-			clk_disable(bank->clk);
-			continue;
-		}
-
-		gc = irq_get_domain_generic_chip(bank->domain, 0);
-		gc->reg_base = bank->reg_base;
-		gc->private = bank;
-		gc->chip_types[0].regs.mask = GPIO_INTMASK;
-		gc->chip_types[0].regs.ack = GPIO_PORTS_EOI;
-		gc->chip_types[0].chip.irq_ack = irq_gc_ack_set_bit;
-		gc->chip_types[0].chip.irq_mask = irq_gc_mask_set_bit;
-		gc->chip_types[0].chip.irq_unmask = irq_gc_mask_clr_bit;
-		gc->chip_types[0].chip.irq_enable = rockchip_irq_enable;
-		gc->chip_types[0].chip.irq_disable = rockchip_irq_disable;
-		gc->chip_types[0].chip.irq_set_wake = irq_gc_set_wake;
-		gc->chip_types[0].chip.irq_suspend = rockchip_irq_suspend;
-		gc->chip_types[0].chip.irq_resume = rockchip_irq_resume;
-		gc->chip_types[0].chip.irq_set_type = rockchip_irq_set_type;
-		gc->wake_enabled = IRQ_MSK(bank->nr_pins);
-
-		/*
-		 * Linux assumes that all interrupts start out disabled/masked.
-		 * Our driver only uses the concept of masked and always keeps
-		 * things enabled, so for us that's all masked and all enabled.
-		 */
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTMASK);
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_PORTS_EOI);
-		writel_relaxed(0xffffffff, bank->reg_base + GPIO_INTEN);
-		gc->mask_cache = 0xffffffff;
-
-		irq_set_chained_handler_and_data(bank->irq,
-						 rockchip_irq_demux, bank);
-		clk_disable(bank->clk);
-	}
-
-	return 0;
-}
-
-static int rockchip_gpiolib_register(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
-{
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
-	struct gpio_chip *gc;
-	int ret;
-	int i;
-
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid) {
-			dev_warn(&pdev->dev, "bank %s is not valid\n",
-				 bank->name);
-			continue;
-		}
-
-		bank->gpio_chip = rockchip_gpiolib_chip;
-
-		gc = &bank->gpio_chip;
-		gc->base = bank->pin_base;
-		gc->ngpio = bank->nr_pins;
-		gc->parent = &pdev->dev;
-		gc->of_node = bank->of_node;
-		gc->label = bank->name;
-
-		ret = gpiochip_add_data(gc, bank);
-		if (ret) {
-			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
-							gc->label, ret);
-			goto fail;
-		}
-	}
-
-	rockchip_interrupts_register(pdev, info);
-
-	return 0;
-
-fail:
-	for (--i, --bank; i >= 0; --i, --bank) {
-		if (!bank->valid)
-			continue;
-		gpiochip_remove(&bank->gpio_chip);
-	}
-	return ret;
-}
-
-static int rockchip_gpiolib_unregister(struct platform_device *pdev,
-						struct rockchip_pinctrl *info)
-{
-	struct rockchip_pin_ctrl *ctrl = info->ctrl;
-	struct rockchip_pin_bank *bank = ctrl->pin_banks;
-	int i;
-
-	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-		if (!bank->valid)
-			continue;
-		gpiochip_remove(&bank->gpio_chip);
-	}
-
-	return 0;
-}
-
-static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
-				  struct rockchip_pinctrl *info)
-{
-	struct resource res;
-	void __iomem *base;
-
-	if (of_address_to_resource(bank->of_node, 0, &res)) {
-		dev_err(info->dev, "cannot find IO resource for bank\n");
-		return -ENOENT;
-	}
-
-	bank->reg_base = devm_ioremap_resource(info->dev, &res);
-	if (IS_ERR(bank->reg_base))
-		return PTR_ERR(bank->reg_base);
-
-	/*
-	 * special case, where parts of the pull setting-registers are
-	 * part of the PMU register space
-	 */
-	if (of_device_is_compatible(bank->of_node,
-				    "rockchip,rk3188-gpio-bank0")) {
-		struct device_node *node;
-
-		node = of_parse_phandle(bank->of_node->parent,
-					"rockchip,pmu", 0);
-		if (!node) {
-			if (of_address_to_resource(bank->of_node, 1, &res)) {
-				dev_err(info->dev, "cannot find IO resource for bank\n");
-				return -ENOENT;
-			}
-
-			base = devm_ioremap_resource(info->dev, &res);
-			if (IS_ERR(base))
-				return PTR_ERR(base);
-			rockchip_regmap_config.max_register =
-						    resource_size(&res) - 4;
-			rockchip_regmap_config.name =
-					    "rockchip,rk3188-gpio-bank0-pull";
-			bank->regmap_pull = devm_regmap_init_mmio(info->dev,
-						    base,
-						    &rockchip_regmap_config);
-		}
-		of_node_put(node);
-	}
-
-	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
-
-	bank->clk = of_clk_get(bank->of_node, 0);
-	if (IS_ERR(bank->clk))
-		return PTR_ERR(bank->clk);
-
-	return clk_prepare(bank->clk);
-}
-
 static const struct of_device_id rockchip_pinctrl_dt_match[];
 
 /* retrieve the soc specific data */
@@ -3350,7 +2719,6 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 {
 	const struct of_device_id *match;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *np;
 	struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
 	int grf_offs, pmu_offs, drv_grf_offs, drv_pmu_offs, i, j;
@@ -3358,23 +2726,6 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	match = of_match_node(rockchip_pinctrl_dt_match, node);
 	ctrl = (struct rockchip_pin_ctrl *)match->data;
 
-	for_each_child_of_node(node, np) {
-		if (!of_find_property(np, "gpio-controller", NULL))
-			continue;
-
-		bank = ctrl->pin_banks;
-		for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
-			if (!strcmp(bank->name, np->name)) {
-				bank->of_node = np;
-
-				if (!rockchip_get_bank_data(bank, d))
-					bank->valid = true;
-
-				break;
-			}
-		}
-	}
-
 	grf_offs = ctrl->grf_mux_offset;
 	pmu_offs = ctrl->pmu_mux_offset;
 	drv_pmu_offs = ctrl->pmu_drv_offset;
@@ -3595,18 +2946,18 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 			return PTR_ERR(info->regmap_pmu);
 	}
 
-	ret = rockchip_gpiolib_register(pdev, info);
+	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
 
-	ret = rockchip_pinctrl_register(pdev, info);
+	platform_set_drvdata(pdev, info);
+
+	ret = of_platform_populate(np, rockchip_bank_match, NULL, NULL);
 	if (ret) {
-		rockchip_gpiolib_unregister(pdev, info);
+		dev_err(&pdev->dev, "failed to register gpio device\n");
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, info);
-
 	return 0;
 }
 
-- 
2.25.1



