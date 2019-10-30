Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782DAE95BA
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 05:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfJ3EYN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 00:24:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:3387 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbfJ3EYN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Oct 2019 00:24:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 21:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; 
   d="scan'208";a="203768512"
Received: from sgsxdev001.isng.intel.com (HELO localhost) ([10.226.88.11])
  by orsmga006.jf.intel.com with ESMTP; 29 Oct 2019 21:24:08 -0700
From:   Rahul Tanwar <rahul.tanwar@linux.intel.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>
Subject: [PATCH v2 1/2] pinctrl: Add pinmux & GPIO controller driver for a new SoC
Date:   Wed, 30 Oct 2019 12:23:59 +0800
Message-Id: <4bb885fe692d29f2635772dcd04839390f1f5671.1572409172.git.rahul.tanwar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
References: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
References: <cover.1572409172.git.rahul.tanwar@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP which
controls pin multiplexing & configuration including GPIO functions selection &
GPIO attributes configuration.

This IP is not based on & does not have anything in common with Chassis
specification. The pinctrl drivers under pinctrl/intel/* are all based upon
Chassis spec compliant pinctrl IPs. So this driver doesn't fit & can not use
pinctrl framework under pinctrl/intel/* and it requires a separate new driver.

Add a new GPIO & pin control framework based driver for this IP.

Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
---
 drivers/pinctrl/Kconfig               |  18 +
 drivers/pinctrl/Makefile              |   1 +
 drivers/pinctrl/pinctrl-equilibrium.c | 957 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-equilibrium.h | 150 ++++++
 4 files changed, 1126 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.c
 create mode 100644 drivers/pinctrl/pinctrl-equilibrium.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b372419d61f2..7809e33c7762 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -420,4 +420,22 @@ config PINCTRL_TB10X
 	depends on OF && ARC_PLAT_TB10X
 	select GPIOLIB
 
+config PINCTRL_EQUILIBRIUM
+	tristate "Generic pinctrl and GPIO driver for Intel Lightning Mountain SoC"
+	select PINMUX
+	select PINCONF
+	select GPIOLIB
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+
+	help
+	  Equilibrium pinctrl driver is a pinctrl & GPIO driver for Intel Lightning
+	  Mountain network processor SoC that supports both the linux GPIO and pin
+	  control frameworks. It provides interfaces to setup pinmux, assign desired
+	  pin functions, configure GPIO attributes for LGM SoC pins. Pinmux and
+	  pinconf settings are retrieved from device tree.
+
 endif
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index ac537fdbc998..879f312bfb75 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
 obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_OCELOT)	+= pinctrl-ocelot.o
+obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
 
 obj-y				+= actions/
 obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
new file mode 100644
index 000000000000..710615fa3897
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -0,0 +1,957 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2019 Intel Corporation */
+
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+
+#include "core.h"
+#include "pinconf.h"
+#include "pinmux.h"
+#include "pinctrl-equilibrium.h"
+
+#define PIN_NAME_FMT	"io-%d"
+#define PIN_NAME_LEN	10
+#define PAD_REG_OFF	0x100
+
+static inline void eqbr_set_val(void __iomem *addr, u32 offset,
+				u32 mask, u32 set, raw_spinlock_t *lock)
+{
+	u32 val;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(lock, flags);
+	val = readl(addr);
+	val = (val & ~(mask << offset)) | ((set & mask) << offset);
+	writel(val, addr);
+	raw_spin_unlock_irqrestore(lock, flags);
+}
+
+static void eqbr_gpio_disable_irq(struct irq_data *d)
+{
+	unsigned int offset = irqd_to_hwirq(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct eqbr_gpio_desc *desc = gpiochip_get_data(gc);
+
+	writel(BIT(offset), desc->membase + GPIO_IRNENCLR);
+}
+
+static void eqbr_gpio_enable_irq(struct irq_data *d)
+{
+	unsigned int offset = irqd_to_hwirq(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct eqbr_gpio_desc *desc = gpiochip_get_data(gc);
+
+	gc->direction_input(gc, offset);
+	writel(BIT(offset), desc->membase + GPIO_IRNRNSET);
+}
+
+static void eqbr_gpio_ack_irq(struct irq_data *d)
+{
+	unsigned int offset = irqd_to_hwirq(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct eqbr_gpio_desc *desc = gpiochip_get_data(gc);
+
+	writel(BIT(offset), desc->membase + GPIO_IRNCR);
+}
+
+static void eqbr_gpio_mask_ack_irq(struct irq_data *d)
+{
+	eqbr_gpio_disable_irq(d);
+	eqbr_gpio_ack_irq(d);
+}
+
+static inline void eqbr_cfg_bit(void __iomem *addr,
+				unsigned int offset, unsigned int set)
+{
+	if (!set)
+		writel(readl(addr) & ~BIT(offset), addr);
+	else
+		writel(readl(addr) | BIT(offset), addr);
+}
+
+static int eqbr_irq_type_cfg(struct gpio_irq_type *type,
+			     struct eqbr_gpio_desc *desc,
+			     unsigned int offset)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&desc->lock, flags);
+	eqbr_cfg_bit(desc->membase + GPIO_IRNCFG, offset, type->trig_type);
+	eqbr_cfg_bit(desc->membase + GPIO_EXINTCR1, offset, type->trig_type);
+	eqbr_cfg_bit(desc->membase + GPIO_EXINTCR0, offset, type->logic_type);
+	raw_spin_unlock_irqrestore(&desc->lock, flags);
+
+	return 0;
+}
+
+static int eqbr_gpio_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int offset = irqd_to_hwirq(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct eqbr_gpio_desc *desc = gpiochip_get_data(gc);
+	struct gpio_irq_type it;
+
+	memset(&it, 0, sizeof(it));
+
+	if ((type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_NONE)
+		return 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		it.trig_type = GPIO_EDGE_TRIG;
+		it.edge_type = GPIO_SINGLE_EDGE;
+		it.logic_type = GPIO_POSITIVE_TRIG;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		it.trig_type = GPIO_EDGE_TRIG;
+		it.edge_type = GPIO_SINGLE_EDGE;
+		it.logic_type = GPIO_NEGATIVE_TRIG;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		it.trig_type = GPIO_EDGE_TRIG;
+		it.edge_type = GPIO_BOTH_EDGE;
+		it.logic_type = GPIO_POSITIVE_TRIG;
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		it.trig_type = GPIO_LEVEL_TRIG;
+		it.edge_type = GPIO_SINGLE_EDGE;
+		it.logic_type = GPIO_POSITIVE_TRIG;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		it.trig_type = GPIO_LEVEL_TRIG;
+		it.edge_type = GPIO_SINGLE_EDGE;
+		it.logic_type = GPIO_NEGATIVE_TRIG;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	eqbr_irq_type_cfg(&it, desc, offset);
+	if (it.trig_type == GPIO_EDGE_TRIG)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
+	return 0;
+}
+
+static void eqbr_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct eqbr_gpio_desc *gpio_desc = gpiochip_get_data(gc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	u32 pins, offset;
+
+	chained_irq_enter(ic, desc);
+	pins = readl(gpio_desc->membase + GPIO_IRNCR);
+
+	for_each_set_bit(offset, (unsigned long *)&pins, gc->ngpio)
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
+
+	chained_irq_exit(ic, desc);
+}
+
+static int gpiochip_setup(struct device *dev, struct eqbr_gpio_desc *desc)
+{
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+
+	gc = &desc->chip;
+	gc->owner = THIS_MODULE;
+	gc->label = desc->name;
+	gc->of_node = desc->node;
+
+	if (!of_property_read_bool(desc->node, "interrupt-controller")) {
+		dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
+			 desc->name);
+		return 0;
+	}
+
+	desc->ic.name = "gpio_irq";
+	desc->ic.irq_mask = eqbr_gpio_disable_irq;
+	desc->ic.irq_unmask = eqbr_gpio_enable_irq;
+	desc->ic.irq_ack = eqbr_gpio_ack_irq;
+	desc->ic.irq_mask_ack = eqbr_gpio_mask_ack_irq;
+	desc->ic.irq_set_type = eqbr_gpio_set_irq_type;
+
+	girq = &desc->chip.irq;
+	girq->chip = &desc->ic;
+	girq->parent_handler = eqbr_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+	girq->parents[0] = desc->virq;
+
+	return 0;
+}
+
+static int gpiolib_reg(struct eqbr_pinctrl_drv_data *drvdata)
+{
+	struct device_node *np;
+	struct eqbr_gpio_desc *desc;
+	struct device *dev;
+	int i, ret;
+	struct resource res;
+
+	dev = drvdata->dev;
+	for (i = 0; i < drvdata->nr_gpio_descs; i++) {
+		desc = drvdata->gpio_desc + i;
+		np = desc->node;
+
+		desc->name = devm_kasprintf(dev, GFP_KERNEL, "gpiochip%d", i);
+		if (!desc->name)
+			return -ENOMEM;
+
+		if (of_address_to_resource(np, 0, &res)) {
+			dev_err(dev, "Failed to get GPIO register address\n");
+			return -ENXIO;
+		}
+
+		desc->membase = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(desc->membase)) {
+			dev_err(dev, "ioremap fail\n");
+			return PTR_ERR(desc->membase);
+		}
+
+		desc->virq = irq_of_parse_and_map(np, 0);
+		if (!desc->virq) {
+			dev_err(dev, "%s: failed to parse and map irq\n",
+				desc->name);
+			return -ENXIO;
+		}
+		raw_spin_lock_init(&desc->lock);
+
+		ret = bgpio_init(&desc->chip, dev, desc->bank->nr_pins/8,
+				 desc->membase + GPIO_IN,
+				 desc->membase + GPIO_OUTSET,
+				 desc->membase + GPIO_OUTCLR,
+				 desc->membase + GPIO_DIR,
+				 NULL,
+				 0);
+		if (ret) {
+			dev_err(dev, "unable to init generic GPIO\n");
+			return ret;
+		}
+
+		ret = gpiochip_setup(dev, desc);
+		if (ret)
+			return ret;
+
+		ret = devm_gpiochip_add_data(dev, &desc->chip, desc);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static inline struct eqbr_pin_bank
+*find_pinbank_via_pin(struct eqbr_pinctrl_drv_data *pctl, unsigned int pin)
+{
+	int i;
+	struct eqbr_pin_bank *bank;
+
+	for (i = 0; i < pctl->nr_banks; i++) {
+		bank = &pctl->pin_banks[i];
+		if (pin >= bank->pin_base &&
+		    (pin - bank->pin_base) < bank->nr_pins)
+			return bank;
+	}
+
+	return NULL;
+}
+
+static const struct pinctrl_ops eqbr_pctl_ops = {
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
+	.dt_node_to_map		= pinconf_generic_dt_node_to_map_all,
+	.dt_free_map		= pinconf_generic_dt_free_map,
+};
+
+static int eqbr_set_pin_mux(struct eqbr_pinctrl_drv_data *pctl,
+			    unsigned int pmx, unsigned int pin)
+{
+	void __iomem *mem;
+	struct eqbr_pin_bank *bank;
+	unsigned int offset;
+
+	bank = find_pinbank_via_pin(pctl, pin);
+	if (!bank) {
+		dev_err(pctl->dev, "Couldn't find pin bank for pin %u\n", pin);
+		return -ENODEV;
+	}
+	mem = bank->membase;
+	offset = pin - bank->pin_base;
+
+	if (!(bank->aval_pinmap & BIT(offset))) {
+		dev_err(pctl->dev,
+			"PIN: %u is not valid, pinbase: %u, bitmap: %u\n",
+			pin, bank->pin_base, bank->aval_pinmap);
+		return -ENODEV;
+	}
+
+	writel(pmx, mem + (offset << 2));
+	return 0;
+}
+
+static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
+			       unsigned int selector, unsigned int group)
+{
+	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
+	struct function_desc *func;
+	struct group_desc *grp;
+	unsigned int *pinmux;
+	int i;
+
+	func = pinmux_generic_get_function(pctldev, selector);
+	if (!func)
+		return -EINVAL;
+
+	grp = pinctrl_generic_get_group(pctldev, group);
+	if (!grp)
+		return -EINVAL;
+
+	pinmux = grp->data;
+	for (i = 0; i < grp->num_pins; i++)
+		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);
+
+	return 0;
+}
+
+static int eqbr_pinmux_gpio_request(struct pinctrl_dev *pctldev,
+				    struct pinctrl_gpio_range *range,
+				    unsigned int pin)
+{
+	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	/* 0 mux is reserved for GPIO */
+	return eqbr_set_pin_mux(pctl, 0, pin);
+}
+
+static const struct pinmux_ops eqbr_pinmux_ops = {
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name 	= pinmux_generic_get_function_name,
+	.get_function_groups 	= pinmux_generic_get_function_groups,
+	.set_mux		= eqbr_pinmux_set_mux,
+	.gpio_request_enable	= eqbr_pinmux_gpio_request,
+	.strict			= true,
+};
+
+static void set_drv_cur(void __iomem *mem, unsigned int offset,
+			unsigned int set, raw_spinlock_t *lock)
+{
+	unsigned int idx = offset / DRV_CUR_PINS; /* 16 pin per register*/
+	unsigned int reg;
+
+	offset %= DRV_CUR_PINS;
+	reg = REG_DRCC(idx);
+	eqbr_set_val(mem + REG_DRCC(idx), offset * 2, 0x3, set, lock);
+}
+
+static int get_drv_cur(void __iomem *mem, unsigned int offset)
+{
+	unsigned int idx = offset / DRV_CUR_PINS; /* 0-15, 16-31 per register*/
+	unsigned int val;
+
+	val = readl(mem + REG_DRCC(idx));
+	offset %= DRV_CUR_PINS;
+	val = PARSE_DRV_CURRENT(val, offset);
+
+	return val;
+}
+
+static struct eqbr_gpio_desc
+*get_gpio_desc_via_bank(struct eqbr_pinctrl_drv_data *pctl,
+			struct eqbr_pin_bank *bank)
+{
+	int i;
+
+	for (i = 0; i < pctl->nr_gpio_descs; i++) {
+		if (pctl->gpio_desc[i].bank == bank)
+			return &pctl->gpio_desc[i];
+	}
+
+	return NULL;
+}
+
+static int eqbr_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
+			    unsigned long *config)
+{
+	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param = pinconf_to_config_param(*config);
+	struct eqbr_pin_bank *bank;
+	unsigned int offset;
+	void __iomem *mem;
+	struct eqbr_gpio_desc *gpio;
+	u32 val;
+
+	bank = find_pinbank_via_pin(pctl, pin);
+	if (!bank) {
+		dev_err(pctl->dev, "Couldn't find pin bank for pin %u\n", pin);
+		return -ENODEV;
+	}
+	mem = bank->membase;
+	offset = pin - bank->pin_base;
+
+	if (!(bank->aval_pinmap & BIT(offset))) {
+		dev_err(pctl->dev,
+			"PIN: %u is not valid, pinbase: %u, bitmap: %u\n",
+			pin, bank->pin_base, bank->aval_pinmap);
+		return -ENODEV;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		val = !!(readl(mem + REG_PUEN) & BIT(offset));
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		val = !!(readl(mem + REG_PDEN) & BIT(offset));
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		val = !!(readl(mem + REG_OD) & BIT(offset));
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		val = get_drv_cur(mem, offset);
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		val = !!(readl(mem + REG_SRC) & BIT(offset));
+		break;
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		gpio = get_gpio_desc_via_bank(pctl, bank);
+		if (!gpio) {
+			dev_err(pctl->dev, "Failed to find gpio via bank pinbase: %u, pin: %u\n",
+				bank->pin_base, pin);
+			return -ENODEV;
+		}
+		val = !!(readl(gpio->membase + GPIO_DIR) & BIT(offset));
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, val);
+;
+	return 0;
+}
+
+static int eqbr_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+			    unsigned long *configs, unsigned int num_configs)
+{
+	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param;
+	unsigned int val, offset;
+	struct eqbr_pin_bank *bank;
+	struct eqbr_gpio_desc *gpio;
+	struct gpio_chip *gc;
+	void __iomem *mem;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		val = pinconf_to_config_argument(configs[i]);
+
+		bank = find_pinbank_via_pin(pctl, pin);
+		if (!bank) {
+			dev_err(pctl->dev,
+				"Couldn't find pin bank for pin %u\n", pin);
+			return -ENODEV;
+		}
+		mem = bank->membase;
+		offset = pin - bank->pin_base;
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			eqbr_set_val(mem + REG_PUEN, offset, 1, val, &pctl->lock);
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			eqbr_set_val(mem + REG_PDEN, offset, 1, val, &pctl->lock);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			eqbr_set_val(mem + REG_OD, offset, 1, val, &pctl->lock);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			set_drv_cur(mem, offset, val, &pctl->lock);
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			eqbr_set_val(mem + REG_SRC, offset, 1, val, &pctl->lock);
+			break;
+		case PIN_CONFIG_OUTPUT_ENABLE:
+			gpio = get_gpio_desc_via_bank(pctl, bank);
+			if (!gpio) {
+				dev_err(pctl->dev, "Failed to find gpio via bank pinbase: %u, pin: %u\n",
+					bank->pin_base, pin);
+				return -ENODEV;
+			}
+			gc = &gpio->chip;
+			gc->direction_output(gc, offset, 0);
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	return 0;
+}
+
+static int eqbr_pinconf_group_get(struct pinctrl_dev *pctldev,
+				  unsigned int group, unsigned long *config)
+{
+	const unsigned int *pins;
+	unsigned int i, npins, old = 0;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		if (eqbr_pinconf_get(pctldev, pins[i], config))
+			return -ENOTSUPP;
+
+		if (i && old != *config)
+			return -ENOTSUPP;
+
+		old = *config;
+	}
+	return 0;
+}
+
+static int eqbr_pinconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int group, unsigned long *configs,
+				  unsigned int num_configs)
+{
+	const unsigned int *pins;
+	unsigned int i, npins;
+	int ret;
+
+	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < npins; i++) {
+		ret = eqbr_pinconf_set(pctldev, pins[i], configs, num_configs);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static const struct pinconf_ops eqbr_pinconf_ops = {
+	.is_generic			= true,
+	.pin_config_get			= eqbr_pinconf_get,
+	.pin_config_set			= eqbr_pinconf_set,
+	.pin_config_group_get		= eqbr_pinconf_group_get,
+	.pin_config_group_set		= eqbr_pinconf_group_set,
+	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
+};
+
+static int is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
+			 unsigned int nr_funcs, unsigned int *idx)
+{
+	int i;
+
+	if (!funcs || !nr_funcs)
+		return 0;
+
+	for (i = 0; i < nr_funcs; i++) {
+
+		if (funcs[i].name && (strcmp(funcs[i].name, name) == 0) ) {
+			*idx = i;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
+		       unsigned int *nr_funcs, funcs_util_ops op)
+{
+	struct device_node *node = dev->of_node;
+	struct device_node *np;
+	struct property *prop;
+	unsigned int fid;
+	const char *fn_name;
+	int i, j;
+
+	i = 0;
+	for_each_child_of_node(node, np) {
+		prop = of_find_property(np, "groups", NULL);
+		if (prop) {
+			if (of_property_read_string(np, "function",
+						    &fn_name)) {
+				/* some groups may not have function, it's OK */
+				dev_dbg(dev, "Group %s: not function binded!\n",
+					(char *)prop->value);
+				continue;
+			}
+
+			switch (op) {
+				case OP_COUNT_NR_FUNCS:
+					if (!is_func_exist(funcs, fn_name,
+							   *nr_funcs, &fid))
+						*nr_funcs = *nr_funcs + 1;
+					break;
+
+				case OP_ADD_FUNCS:
+					if (!is_func_exist(funcs, fn_name,
+							   *nr_funcs, &fid))
+						funcs[i].name = fn_name;
+					break;
+
+				case OP_COUNT_NR_FUNC_GRPS:
+					if (is_func_exist(funcs, fn_name,
+							  *nr_funcs, &fid))
+						funcs[fid].nr_groups++;
+					break;
+
+				case OP_ADD_FUNC_GRPS:
+					if (is_func_exist(funcs, fn_name,
+							  *nr_funcs, &fid)) {
+						for(j=0;
+						    j < funcs[fid].nr_groups;
+						    j++) {
+							if (!funcs[fid].groups[j])
+								break;
+						}
+						funcs[fid].groups[j] = prop->value;
+					}
+					break;
+
+				default:
+					return -EINVAL;
+
+			}
+			i++;
+		}
+	}
+
+	return 0;
+}
+
+static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
+{
+	struct device *dev = drvdata->dev;
+	unsigned int nr_funcs = 0;
+	struct eqbr_pmx_func *funcs = NULL;
+	int i, ret;
+
+	ret = funcs_utils(dev, funcs, &nr_funcs, OP_COUNT_NR_FUNCS);
+	if (ret)
+		return ret;
+
+	funcs = devm_kcalloc(dev, nr_funcs, sizeof(*funcs), GFP_KERNEL);
+	if (!funcs)
+		return -ENOMEM;
+
+	ret = funcs_utils(dev, funcs, &nr_funcs, OP_ADD_FUNCS);
+	if (ret)
+		return ret;
+
+	ret = funcs_utils(dev, funcs, &nr_funcs, OP_COUNT_NR_FUNC_GRPS);
+	if (ret)
+		return ret;
+
+	for (i=0; i < nr_funcs; i++) {
+		if (funcs[i].nr_groups) {
+			funcs[i].groups = devm_kcalloc(dev, funcs[i].nr_groups,
+						       sizeof(*(funcs[i].groups)),
+						       GFP_KERNEL);
+			if (!funcs[i].groups)
+				return -ENOMEM;
+		}
+	}
+
+	ret = funcs_utils(dev, funcs, &nr_funcs, OP_ADD_FUNC_GRPS);
+	if (ret)
+		return ret;
+
+	for (i=0; i < nr_funcs; i++) {
+		ret = pinmux_generic_add_function(drvdata->pctl_dev,
+						  funcs[i].name,
+						  funcs[i].groups,
+						  funcs[i].nr_groups,
+						  drvdata);
+		if (ret < 0) {
+			dev_err(dev, "Failed to register function %s\n",
+				funcs[i].name);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
+{
+	struct device *dev = drvdata->dev;
+	struct device_node *node = dev->of_node;
+	struct device_node *np;
+	struct property *prop;
+	int j, err;
+	unsigned int *pinmux, pin_id, pinmux_id;
+	struct group_desc group;
+
+	for_each_child_of_node(node, np) {
+		prop = of_find_property(np, "groups", NULL);
+		if (prop) {
+			group.num_pins = of_property_count_u32_elems(np, "pins");
+			if (group.num_pins < 0) {
+				dev_err(dev, "No pins in the group: %s\n",
+					prop->name);
+				return -EINVAL;
+			}
+			group.name = prop->value;
+			group.pins = devm_kcalloc(dev, group.num_pins,
+						  sizeof(*(group.pins)),
+						  GFP_KERNEL);
+			pinmux = devm_kcalloc(dev, group.num_pins,
+					      sizeof(*pinmux), GFP_KERNEL);
+
+			if (!group.pins || !pinmux)
+				return -ENOMEM;
+			for (j = 0; j < group.num_pins; j++) {
+				if (of_property_read_u32_index(np, "pins",
+							       j, &pin_id)) {
+					dev_err(dev, "Group %s: Read intel pins id failed\n",
+						group.name);
+					return -EINVAL;
+				}
+				if (pin_id >= drvdata->pctl_desc.npins) {
+					dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
+						group.name, j, pin_id);
+					return -EINVAL;
+				}
+				group.pins[j] = pin_id;
+				if (of_property_read_u32_index(np, "pinmux",
+							       j, &pinmux_id)) {
+					dev_err(dev, "Group %s: Read intel pinmux id failed\n",
+						group.name);
+					return -EINVAL;
+				}
+				pinmux[j] = pinmux_id;
+			}
+
+			err = pinctrl_generic_add_group(drvdata->pctl_dev,
+							group.name, group.pins,
+							group.num_pins,
+							pinmux);
+			if (err < 0) {
+				dev_err(dev, "Failed to register group %s\n",
+					group.name);
+				return err;
+			}
+		}
+		memset(&group, 0, sizeof(group));
+		pinmux = NULL;
+	}
+
+	return 0;
+}
+
+static int pinctrl_reg(struct eqbr_pinctrl_drv_data *drvdata)
+{
+	struct pinctrl_desc *pctl_desc;
+	struct pinctrl_pin_desc *pdesc;
+	struct device *dev;
+	unsigned int nr_pins;
+	char *pin_names;
+	int i, ret;
+
+	dev = drvdata->dev;
+	pctl_desc = &drvdata->pctl_desc;
+	pctl_desc->name = "eqbr-pinctrl";
+	pctl_desc->owner = THIS_MODULE;
+	pctl_desc->pctlops = &eqbr_pctl_ops;
+	pctl_desc->pmxops = &eqbr_pinmux_ops;
+	pctl_desc->confops = &eqbr_pinconf_ops;
+	raw_spin_lock_init(&drvdata->lock);
+
+	for (i = 0, nr_pins = 0; i < drvdata->nr_banks; i++)
+		nr_pins += drvdata->pin_banks[i].nr_pins;
+
+	pdesc = devm_kcalloc(dev, nr_pins, sizeof(*pdesc), GFP_KERNEL);
+	if (!pdesc)
+		return -ENOMEM;
+	pin_names = devm_kcalloc(dev, nr_pins, PIN_NAME_LEN, GFP_KERNEL);
+	if (!pin_names)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_pins; i++) {
+		sprintf(pin_names, PIN_NAME_FMT, i);
+		pdesc[i].number = i;
+		pdesc[i].name = pin_names;
+		pin_names += PIN_NAME_LEN;
+	}
+	pctl_desc->pins = pdesc;
+	pctl_desc->npins = nr_pins;
+	dev_dbg(dev, "pinctrl total pin number: %u\n", nr_pins);
+
+	ret = devm_pinctrl_register_and_init(dev, pctl_desc, drvdata,
+					     &drvdata->pctl_dev);
+	if (ret)
+		return ret;
+
+	ret = eqbr_build_groups(drvdata);
+	if (ret) {
+		dev_err(dev, "Failed to build groups\n");
+		return ret;
+	}
+
+	ret = eqbr_build_functions(drvdata);
+	if (ret) {
+		dev_err(dev, "Failed to build groups\n");
+		return ret;
+	}
+
+	return pinctrl_enable(drvdata->pctl_dev);
+}
+
+static int pinbank_init(struct device_node *np,
+			struct eqbr_pinctrl_drv_data *drvdata,
+			struct eqbr_pin_bank *bank, unsigned int id)
+{
+	struct device *dev = drvdata->dev;
+	struct of_phandle_args spec;
+
+	bank->membase = drvdata->membase + id * PAD_REG_OFF;
+
+	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &spec)) {
+		dev_err(dev, "gpio-range not available!\n");
+		return -EFAULT;
+	}
+
+	bank->pin_base = spec.args[1];
+	bank->nr_pins = spec.args[2];
+
+	bank->aval_pinmap = readl(bank->membase + REG_AVAIL);
+	bank->id = id;
+
+	dev_dbg(dev, "pinbank id: %d, reg: %px, pinbase: %u, pin number: %u, pinmap: 0x%x\n",
+		id, bank->membase, bank->pin_base,
+		bank->nr_pins, bank->aval_pinmap);
+
+	return 0;
+}
+
+static int pinbank_probe(struct eqbr_pinctrl_drv_data *drvdata)
+{
+	struct device_node *node, *np_gpio;
+	struct eqbr_pin_bank *banks;
+	struct eqbr_gpio_desc *gpio_desc;
+	struct device *dev;
+	int i=0, nr_gpio=0;
+
+	dev = drvdata->dev;
+	node = dev->of_node;
+
+	/* Count gpio bank number */
+	for_each_node_by_name(np_gpio, "gpio") {
+		if (of_device_is_available(np_gpio))
+			nr_gpio++;
+	}
+
+	if (!nr_gpio) {
+		dev_err(dev, "NO pin bank available!\n");
+		return -ENODEV;
+	}
+
+	/* Count pin bank number and gpio controller number */
+	banks = devm_kcalloc(dev, nr_gpio, sizeof(*banks), GFP_KERNEL);
+	if (!banks)
+		return -ENOMEM;
+
+	gpio_desc = devm_kcalloc(dev, nr_gpio, sizeof(*gpio_desc), GFP_KERNEL);
+	if (!gpio_desc)
+		return -ENOMEM;
+
+	dev_dbg(dev, "found %d gpio controller!\n", nr_gpio);
+
+	/* Initialize Pin bank */
+	for_each_node_by_name(np_gpio, "gpio") {
+		if (!of_device_is_available(np_gpio))
+			continue;
+
+		pinbank_init(np_gpio, drvdata, banks + i, i);
+
+		gpio_desc[i].node = np_gpio;
+		gpio_desc[i].bank = banks + i;
+		i++;
+	}
+
+	drvdata->pin_banks = banks;
+	drvdata->nr_banks = nr_gpio;
+	drvdata->gpio_desc = gpio_desc;
+	drvdata->nr_gpio_descs = nr_gpio;
+
+	return 0;
+}
+
+static int eqbr_pinctrl_probe(struct platform_device *pdev)
+{
+	struct eqbr_pinctrl_drv_data *drvdata;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = dev;
+	platform_set_drvdata(pdev, drvdata);
+
+	drvdata->membase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drvdata->membase))
+		return PTR_ERR(drvdata->membase);
+
+	ret = pinbank_probe(drvdata);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_reg(drvdata);
+	if (ret)
+		return ret;
+
+	ret = gpiolib_reg(drvdata);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id eqbr_pinctrl_dt_match[] = {
+	{ .compatible = "intel,lgm-pinctrl" },
+	{}
+};
+
+static struct platform_driver eqbr_pinctrl_driver = {
+	.probe	= eqbr_pinctrl_probe,
+	.driver = {
+		.name = "eqbr-pinctrl",
+		.of_match_table = eqbr_pinctrl_dt_match,
+	},
+};
+
+module_platform_driver(eqbr_pinctrl_driver);
+
+MODULE_AUTHOR("Zhu Yixin <yixin.zhu@intel.com>, Rahul Tanwar <rahul.tanwar@intel.com>");
+MODULE_DESCRIPTION("Pinctrl Driver for LGM SoC (Equilibrium)");
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
new file mode 100644
index 000000000000..195d899a289a
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright(c) 2019 Intel Corporation.
+ */
+#ifndef __PINCTRL_EQUILIBRIUM_H
+#define __PINCTRL_EQUILIBRIUM_H
+
+/* PINPAD register offset */
+#define REG_PMX_BASE	0x0	/* Port Multiplexer Control Register */
+#define REG_PUEN	0x80	/* PULL UP Enable Register */
+#define REG_PDEN	0x84	/* PULL DOWN Enable Register */
+#define REG_SRC		0x88	/* Slew Rate Control Register */
+#define REG_DCC0	0x8C	/* Drive Current Control Register 0 */
+#define REG_DCC1	0x90	/* Drive Current Control Register 1 */
+#define REG_OD		0x94	/* Open Drain Enable Register */
+#define REG_AVAIL	0x98	/* Pad Control Availability Register */
+#define DRV_CUR_PINS	16	/* Drive Current pin number per register */
+#define REG_DRCC(x)	(REG_DCC0 + (x) * 4) /* Driver current macro */
+
+/* GPIO register offset */
+#define GPIO_OUT	0x0	/* Data Output Register */
+#define GPIO_IN		0x4	/* Data Input Register */
+#define GPIO_DIR	0x8	/* Direction Register */
+#define GPIO_EXINTCR0	0x18	/* External Interrupt Control Register 0 */
+#define GPIO_EXINTCR1	0x1C	/* External Interrupt Control Register 1 */
+#define GPIO_IRNCR	0x20	/* IRN Capture Register */
+#define GPIO_IRNICR	0x24	/* IRN Interrupt Control Register */
+#define GPIO_IRNEN	0x28	/* IRN Interrupt Enable Register */
+#define GPIO_IRNCFG	0x2C	/* IRN Interrupt Configuration Register */
+#define GPIO_IRNRNSET	0x30	/* IRN Interrupt Enable Set Register */
+#define GPIO_IRNENCLR	0x34	/* IRN Interrupt Enable Clear Register */
+#define GPIO_OUTSET	0x40	/* Output Set Register */
+#define GPIO_OUTCLR	0x44	/* Output Clear Register */
+#define GPIO_DIRSET	0x48	/* Direction Set Register */
+#define GPIO_DIRCLR	0x4C	/* Direction Clear Register */
+
+/* parse given pin's driver current value */
+#define PARSE_DRV_CURRENT(val, pin) (((val) >> ((pin) << 1)) & 0x3)
+
+enum {
+	GPIO_DIR_IN = 0,
+	GPIO_DIR_OUT,
+};
+
+#define GPIO_EDGE_TRIG		0
+#define GPIO_LEVEL_TRIG		1
+#define GPIO_SINGLE_EDGE	0
+#define GPIO_BOTH_EDGE		1
+#define GPIO_POSITIVE_TRIG	0
+#define GPIO_NEGATIVE_TRIG	1
+
+typedef enum {
+	OP_COUNT_NR_FUNCS,
+	OP_ADD_FUNCS,
+	OP_COUNT_NR_FUNC_GRPS,
+	OP_ADD_FUNC_GRPS,
+	OP_NONE,
+} funcs_util_ops;
+
+/**
+ * struct gpio_irq_type: gpio irq configuration
+ * @trig_type: level trigger or edge trigger
+ * @edge_type: sigle edge or both edge
+ * @logic_type: positive trigger or negative trigger
+ */
+struct gpio_irq_type {
+	unsigned int trig_type;
+	unsigned int edge_type;
+	unsigned int logic_type;
+};
+
+/**
+ * struct eqbr_pmx_func: represent a pin function.
+ * @name: name of the pin function, used to lookup the function.
+ * @groups: one or more names of pin groups that provide this function.
+ * @nr_groups: number of groups included in @groups.
+ */
+struct eqbr_pmx_func {
+	const char		*name;
+	const char		**groups;
+	unsigned int		nr_groups;
+};
+
+/**
+ * struct eqbr_pin_bank: represent a pin bank.
+ * @membase: base address of the pin bank register.
+ * @id: bank id, to idenify the unique bank.
+ * @pin_base: starting pin number of the pin bank.
+ * @nr_pins: number of the pins of the pin bank.
+ * @aval_pinmap: available pin bitmap of the pin bank.
+ */
+struct eqbr_pin_bank {
+	void __iomem		*membase;
+	unsigned int		id;
+	unsigned int		pin_base;
+	unsigned int		nr_pins;
+	u32			aval_pinmap;
+};
+
+/**
+ * struct eqbr_gpio_desc: represent a gpio controller.
+ * @node: device node of gpio controller.
+ * @bank: pointer to corresponding pin bank.
+ * @membase: base address of the gpio controller.
+ * @chip: gpio chip.
+ * @ic:   irq chip.
+ * @name: gpio chip name.
+ * @virq: irq number of the gpio chip to parent's irq domain.
+ * @lock: spin lock to protect gpio register write.
+ */
+struct eqbr_gpio_desc {
+	struct device_node	*node;
+	struct eqbr_pin_bank	*bank;
+	void __iomem		*membase;
+	struct gpio_chip	chip;
+	struct irq_chip		ic;
+	const char		*name;
+	unsigned int		virq;
+	raw_spinlock_t		lock; /* protect gpio register */
+};
+
+/**
+ * struct eqbr_pinctrl_drv_data:
+ * @dev: device instance representing the controller.
+ * @pctl_desc: pin controller descriptor.
+ * @pctl_dev: pin control class device
+ * @membase: base address of pin controller
+ * @pin_grps: list of pin groups of the driver.
+ * @nr_grps: number of pin groups.
+ * @pmx_funcs: list of pin functions of the driver.
+ * @nr_funcs: number of pin functions.
+ * @pin_banks: list of pin banks of the driver.
+ * @nr_banks: number of pin banks.
+ * @gpio_desc: list of gpio controller descriptor.
+ * @nr_gpio_descs: number of gpio descriptors.
+ * @lock: protect pinctrl register write
+ */
+struct eqbr_pinctrl_drv_data {
+	struct device			*dev;
+	struct pinctrl_desc		pctl_desc;
+	struct pinctrl_dev		*pctl_dev;
+	void __iomem			*membase;
+	struct eqbr_pin_bank		*pin_banks;
+	unsigned int			nr_banks;
+	struct eqbr_gpio_desc		*gpio_desc;
+	unsigned int			nr_gpio_descs;
+	raw_spinlock_t			lock; /* protect pinpad register */
+};
+
+#endif /* __PINCTRL_EQUILIBRIUM_H */
-- 
2.11.0

