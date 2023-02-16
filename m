Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A39D6995B1
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 14:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjBPNZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 08:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbjBPNZQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 08:25:16 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A625456B;
        Thu, 16 Feb 2023 05:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676553914; x=1708089914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=exkUBYfDlKiFbWEf4ZXH6U0C9Ft4nl3TOo39Vx5rZDk=;
  b=Xpb0LVm/9SOhnwLOxiMRnu/5qMQM7Fv7hBvdDXiQKP/Qzkd+iHBq7CMm
   Tt4Aepynihwv9SAjplzzUyAGD6cfJ2l9fAVw8OCl+dkBoYiIFWvwqgZup
   ZORUD6vixI5s10T5Ql2mM0ZNOoAvtqBmDh8Z0s7Fxv6X4fF4/BZ6SJaKo
   pQnYyYcP6EDVMBHmzsd03JcFamMyEciVzS79wSX3nuE+cqOVaFLvhla2R
   +TGNsSTh2a+6yCVHjvqXWSCsBj+A9OQPtNTUSRH7KFUhYb7LEOoo/jDGW
   N+N8/qPpFoFaGm1KllN1TKq0mdOnUM1IIOxoqJxYhCkDh3tRJFLmoPIF1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331711615"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331711615"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 05:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999033090"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="999033090"
Received: from inesxmail01.iind.intel.com ([10.223.154.20])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2023 05:25:08 -0800
Received: from inlubt0316.iind.intel.com (inlubt0316.iind.intel.com [10.191.20.213])
        by inesxmail01.iind.intel.com (Postfix) with ESMTP id 044E915B6C;
        Thu, 16 Feb 2023 18:55:08 +0530 (IST)
Received: by inlubt0316.iind.intel.com (Postfix, from userid 12101951)
        id F1E48189; Thu, 16 Feb 2023 18:55:07 +0530 (IST)
From:   Raag Jadav <raag.jadav@intel.com>
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        andriy.shevchenko@linux.intel.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        mallikarjunappa.sangannavar@intel.com, pandith.n@intel.com,
        Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/3] gpio: tangier: Introduce tangier gpio driver
Date:   Thu, 16 Feb 2023 18:53:54 +0530
Message-Id: <20230216132356.29922-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230216132356.29922-1-raag.jadav@intel.com>
References: <20230216132356.29922-1-raag.jadav@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Pandith N <pandith.n@intel.com>

Intel Elkhart Lake and Merrifield platforms have same GPIO IP.
Intel Tangier implements the common GPIO functionalities for both
Elkhart Lake and Merrifield platforms.

Signed-off-by: Pandith N <pandith.n@intel.com>
Co-developed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 MAINTAINERS                 |   1 +
 drivers/gpio/Kconfig        |   8 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-tangier.c | 505 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpio-tangier.h | 110 ++++++++
 5 files changed, 625 insertions(+)
 create mode 100644 drivers/gpio/gpio-tangier.c
 create mode 100644 drivers/gpio/gpio-tangier.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f86d02cb427..3e9d42b2747d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10395,6 +10395,7 @@ F:	drivers/gpio/gpio-ml-ioh.c
 F:	drivers/gpio/gpio-pch.c
 F:	drivers/gpio/gpio-sch.c
 F:	drivers/gpio/gpio-sodaville.c
+F:	drivers/gpio/gpio-tangier.c
 
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 M:	Zhenyu Wang <zhenyuw@linux.intel.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ec7cfd4f52b1..952afd4e28b6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -626,6 +626,14 @@ config GPIO_SYSCON
 	help
 	  Say yes here to support GPIO functionality though SYSCON driver.
 
+config GPIO_TANGIER
+	tristate
+	select GPIOLIB_IRQCHIP
+	help
+	  GPIO support for Intel Tangier and compatible platforms.
+
+	  If built as a module its name will be gpio-tangier.
+
 config GPIO_TB10X
 	bool
 	select GPIO_GENERIC
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 010587025fc8..a6cea9d2c973 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
 obj-$(CONFIG_GPIO_STP_XWAY)		+= gpio-stp-xway.o
 obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
+obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
new file mode 100644
index 000000000000..a3d91a0ca7be
--- /dev/null
+++ b/drivers/gpio/gpio-tangier.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Tangier GPIO driver
+ *
+ * Copyright (c) 2016, 2021, 2023 Intel Corporation.
+ *
+ * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *          Pandith N <pandith.n@intel.com>
+ *          Raag Jadav <raag.jadav@intel.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/spinlock.h>
+#include <linux/string_helpers.h>
+#include <linux/types.h>
+
+#include <linux/gpio/driver.h>
+
+#include "gpio-tangier.h"
+
+#define GCCR		0x000	/* Controller configuration */
+#define GPLR		0x004	/* Pin level r/o */
+#define GPDR		0x01c	/* Pin direction */
+#define GPSR		0x034	/* Pin set w/o */
+#define GPCR		0x04c	/* Pin clear w/o */
+#define GRER		0x064	/* Rising edge detect */
+#define GFER		0x07c	/* Falling edge detect */
+#define GFBR		0x094	/* Glitch filter bypass */
+#define GIMR		0x0ac	/* Interrupt mask */
+#define GISR		0x0c4	/* Interrupt source */
+#define GITR		0x300	/* Input type */
+#define GLPR		0x318	/* Level input polarity */
+
+static inline u32 tng_gpio_readl(void __iomem *base, u32 offset)
+{
+	return readl(base + offset);
+}
+
+static inline void tng_gpio_writel(void __iomem *base, u32 offset, u32 value)
+{
+	writel(value, base + offset);
+}
+
+static void __iomem *gpio_reg(struct gpio_chip *chip, unsigned int offset,
+			      unsigned int reg)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	u8 reg_offset = offset / 32;
+
+	return priv->reg_base + reg + reg_offset * 4;
+}
+
+static void __iomem *gpio_reg_and_bit(struct gpio_chip *chip, unsigned int offset,
+				      unsigned int reg, u8 *bit)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	u8 reg_offset = offset / 32;
+	u8 shift = offset % 32;
+
+	*bit = shift;
+	return priv->reg_base + reg + reg_offset * 4;
+}
+
+static int tng_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	void __iomem *gplr;
+	u8 shift;
+
+	gplr = gpio_reg_and_bit(chip, offset, GPLR, &shift);
+
+	return !!(readl(gplr) & BIT(shift));
+}
+
+static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	u32 reg = value ? GPSR : GPCR;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	tng_gpio_writel(priv->reg_base, reg, BIT(offset));
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static int tng_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	unsigned long flags;
+	void __iomem *gpdr;
+	u32 value;
+	u8 shift;
+
+	gpdr = gpio_reg_and_bit(chip, offset, GPDR, &shift);
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	value = readl(gpdr);
+	value &= ~BIT(shift);
+	writel(value, gpdr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int tng_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
+				     int value)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	unsigned long flags;
+	void __iomem *gpdr;
+	u8 shift;
+
+	gpdr = gpio_reg_and_bit(chip, offset, GPDR, &shift);
+	tng_gpio_set(chip, offset, value);
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	value = readl(gpdr);
+	value |= BIT(shift);
+	writel(value, gpdr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int tng_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+
+	if (tng_gpio_readl(priv->reg_base, GPDR) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int tng_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
+				 unsigned int debounce)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	unsigned long flags;
+	void __iomem *gfbr;
+	u32 value;
+	u8 shift;
+
+	gfbr = gpio_reg_and_bit(chip, offset, GFBR, &shift);
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	value = readl(gfbr);
+	if (debounce)
+		value &= ~BIT(shift);
+	else
+		value |= BIT(shift);
+	writel(value, gfbr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int tng_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+			       unsigned long config)
+{
+	u32 debounce;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		return gpiochip_generic_config(chip, offset, config);
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		debounce = pinconf_to_config_argument(config);
+		return tng_gpio_set_debounce(chip, offset, debounce);
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static void tng_irq_ack(struct irq_data *d)
+{
+	struct tng_gpio *priv = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *gisr;
+	u8 shift;
+
+	gisr = gpio_reg_and_bit(&priv->chip, gpio, GISR, &shift);
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+	writel(BIT(shift), gisr);
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void tng_irq_unmask_mask(struct tng_gpio *priv, u32 gpio, bool unmask)
+{
+	unsigned long flags;
+	void __iomem *gimr;
+	u32 value;
+	u8 shift;
+
+	gimr = gpio_reg_and_bit(&priv->chip, gpio, GIMR, &shift);
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	value = readl(gimr);
+	if (unmask)
+		value |= BIT(shift);
+	else
+		value &= ~BIT(shift);
+	writel(value, gimr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+}
+
+static void tng_irq_mask(struct irq_data *d)
+{
+	struct tng_gpio *priv = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+
+	tng_irq_unmask_mask(priv, gpio, false);
+	gpiochip_disable_irq(&priv->chip, gpio);
+}
+
+static void tng_irq_unmask(struct irq_data *d)
+{
+	struct tng_gpio *priv = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(&priv->chip, gpio);
+	tng_irq_unmask_mask(priv, gpio, true);
+}
+
+static int tng_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct tng_gpio *priv = gpiochip_get_data(gc);
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *grer = gpio_reg(&priv->chip, gpio, GRER);
+	void __iomem *gfer = gpio_reg(&priv->chip, gpio, GFER);
+	void __iomem *gitr = gpio_reg(&priv->chip, gpio, GITR);
+	void __iomem *glpr = gpio_reg(&priv->chip, gpio, GLPR);
+	u8 shift = gpio % 32;
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	value = readl(grer);
+	if (type & IRQ_TYPE_EDGE_RISING)
+		value |= BIT(shift);
+	else
+		value &= ~BIT(shift);
+	writel(value, grer);
+
+	value = readl(gfer);
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		value |= BIT(shift);
+	else
+		value &= ~BIT(shift);
+	writel(value, gfer);
+
+	/*
+	 * To prevent glitches from triggering an unintended level interrupt,
+	 * configure GLPR register first and then configure GITR.
+	 */
+	value = readl(glpr);
+	if (type & IRQ_TYPE_LEVEL_LOW)
+		value |= BIT(shift);
+	else
+		value &= ~BIT(shift);
+	writel(value, glpr);
+
+	if (type & IRQ_TYPE_LEVEL_MASK) {
+		value = readl(gitr);
+		value |= BIT(shift);
+		writel(value, gitr);
+
+		irq_set_handler_locked(d, handle_level_irq);
+	} else if (type & IRQ_TYPE_EDGE_BOTH) {
+		value = readl(gitr);
+		value &= ~BIT(shift);
+		writel(value, gitr);
+
+		irq_set_handler_locked(d, handle_edge_irq);
+	}
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int tng_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct tng_gpio *priv = gpiochip_get_data(gc);
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	void __iomem *gwmr = gpio_reg(&priv->chip, gpio, priv->reg.gwmr);
+	void __iomem *gwsr = gpio_reg(&priv->chip, gpio, priv->reg.gwsr);
+	u8 shift = gpio % 32;
+	unsigned long flags;
+	u32 value;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	/* Clear the existing wake status */
+	writel(BIT(shift), gwsr);
+
+	value = readl(gwmr);
+	if (on)
+		value |= BIT(shift);
+	else
+		value &= ~BIT(shift);
+	writel(value, gwmr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	dev_dbg(priv->dev, "%s wake for gpio %lu\n", str_enable_disable(on), gpio);
+	return 0;
+}
+
+static const struct irq_chip tng_irqchip = {
+	.name		= "gpio-tangier",
+	.irq_ack	= tng_irq_ack,
+	.irq_mask	= tng_irq_mask,
+	.irq_unmask	= tng_irq_unmask,
+	.irq_set_type	= tng_irq_set_type,
+	.irq_set_wake	= tng_irq_set_wake,
+	.flags          = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void tng_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct tng_gpio *priv = gpiochip_get_data(gc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	unsigned long base, gpio;
+
+	chained_irq_enter(irqchip, desc);
+
+	/* Check GPIO controller to check which pin triggered the interrupt */
+	for (base = 0; base < priv->chip.ngpio; base += 32) {
+		void __iomem *gisr = gpio_reg(&priv->chip, base, GISR);
+		void __iomem *gimr = gpio_reg(&priv->chip, base, GIMR);
+		unsigned long pending, enabled;
+
+		pending = readl(gisr);
+		enabled = readl(gimr);
+
+		/* Only interrupts that are enabled */
+		pending &= enabled;
+
+		for_each_set_bit(gpio, &pending, 32)
+			generic_handle_domain_irq(gc->irq.domain, base + gpio);
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static int tng_irq_init_hw(struct gpio_chip *chip)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	void __iomem *reg;
+	unsigned int base;
+
+	for (base = 0; base < priv->chip.ngpio; base += 32) {
+		/* Clear the rising-edge detect register */
+		reg = gpio_reg(&priv->chip, base, GRER);
+		writel(0, reg);
+
+		/* Clear the falling-edge detect register */
+		reg = gpio_reg(&priv->chip, base, GFER);
+		writel(0, reg);
+	}
+
+	return 0;
+}
+
+static int tng_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+	struct tng_gpio *priv = gpiochip_get_data(chip);
+	const struct tng_gpio_pinrange *range;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < priv->pin_info.nranges; i++) {
+		range = &priv->pin_info.pin_ranges[i];
+		ret = gpiochip_add_pin_range(&priv->chip,
+					     priv->pin_info.name,
+					     range->gpio_base,
+					     range->pin_base,
+					     range->npins);
+		if (ret) {
+			dev_err(priv->dev, "failed to add GPIO pin range\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int tng_gpio_probe(struct tng_gpio *gpio)
+{
+	struct device *dev = gpio->dev;
+	struct gpio_irq_chip *girq;
+	int ret;
+
+	gpio->chip.label = dev_name(dev);
+	gpio->chip.parent = dev;
+	gpio->chip.request = gpiochip_generic_request;
+	gpio->chip.free = gpiochip_generic_free;
+	gpio->chip.direction_input = tng_gpio_direction_input;
+	gpio->chip.direction_output = tng_gpio_direction_output;
+	gpio->chip.get = tng_gpio_get;
+	gpio->chip.set = tng_gpio_set;
+	gpio->chip.get_direction = tng_gpio_get_direction;
+	gpio->chip.set_config = tng_gpio_set_config;
+	gpio->chip.add_pin_ranges = tng_gpio_add_pin_ranges;
+
+	raw_spin_lock_init(&gpio->lock);
+
+	girq = &gpio->chip.irq;
+	gpio_irq_chip_set_chip(girq, &tng_irqchip);
+	girq->init_hw = tng_irq_init_hw;
+	girq->parent_handler = tng_irq_handler;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, girq->num_parents,
+				     sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+
+	girq->parents[0] = gpio->irq;
+	girq->first = gpio->irq_base;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	ret = devm_gpiochip_add_data(dev, &gpio->chip, gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "gpiochip_add error %d\n", ret);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tng_gpio_probe, GPIO_TANGIER);
+
+int tng_gpio_suspend(struct device *dev)
+{
+	struct tng_gpio *priv = dev_get_drvdata(dev);
+	struct tng_gpio_context *ctx = priv->ctx;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	ctx->gplr = tng_gpio_readl(priv->reg_base, GPLR);
+	ctx->gpdr = tng_gpio_readl(priv->reg_base, GPDR);
+	ctx->grer = tng_gpio_readl(priv->reg_base, GRER);
+	ctx->gfer = tng_gpio_readl(priv->reg_base, GFER);
+	ctx->gimr = tng_gpio_readl(priv->reg_base, GIMR);
+	ctx->gwmr = tng_gpio_readl(priv->reg_base, priv->reg.gwmr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tng_gpio_suspend, GPIO_TANGIER);
+
+int tng_gpio_resume(struct device *dev)
+{
+	struct tng_gpio *priv = dev_get_drvdata(dev);
+	struct tng_gpio_context *ctx = priv->ctx;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&priv->lock, flags);
+
+	/* GPLR is RO, values read will restore using GPSR */
+	tng_gpio_writel(priv->reg_base, GPSR, ctx->gplr);
+	tng_gpio_writel(priv->reg_base, GPDR, ctx->gpdr);
+	tng_gpio_writel(priv->reg_base, GRER, ctx->grer);
+	tng_gpio_writel(priv->reg_base, GFER, ctx->gfer);
+	tng_gpio_writel(priv->reg_base, GIMR, ctx->gimr);
+	tng_gpio_writel(priv->reg_base, priv->reg.gwmr, ctx->gwmr);
+
+	raw_spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(tng_gpio_resume, GPIO_TANGIER);
+
+MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
+MODULE_AUTHOR("Pandith N <pandith.n@intel.com>");
+MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
+MODULE_DESCRIPTION("Intel Tangier GPIO driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpio/gpio-tangier.h b/drivers/gpio/gpio-tangier.h
new file mode 100644
index 000000000000..4850af012f17
--- /dev/null
+++ b/drivers/gpio/gpio-tangier.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Tangier GPIO functions
+ *
+ * Copyright (c) 2016, 2021, 2023 Intel Corporation.
+ *
+ * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *          Pandith N <pandith.n@intel.com>
+ *          Raag Jadav <raag.jadav@intel.com>
+ */
+
+#ifndef _GPIO_TANGIER_H_
+#define _GPIO_TANGIER_H_
+
+#include <linux/gpio/driver.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
+
+struct device;
+
+#define GPIO_PINRANGE(gstart, gend, pstart)		\
+	{						\
+		.gpio_base = (gstart),			\
+		.pin_base = (pstart),			\
+		.npins = (gend) - (gstart) + 1,		\
+	}
+
+/**
+ * struct tng_gpio_context - Context to be saved during suspend-resume
+ * @gplr: Pin level
+ * @gpdr: Pin direction
+ * @grer: Rising edge detect enable
+ * @gfer: Falling edge detect enable
+ * @gimr: Interrupt mask
+ * @gwmr: Wake mask
+ */
+struct tng_gpio_context {
+	u32 gplr;
+	u32 gpdr;
+	u32 grer;
+	u32 gfer;
+	u32 gimr;
+	u32 gwmr;
+};
+
+/**
+ * struct tng_wake_regs - Platform specific wake registers
+ * @gwmr: Wake mask
+ * @gwsr: Wake source
+ * @gsir: Secure input
+ */
+struct tng_wake_regs {
+	u32 gwmr;
+	u32 gwsr;
+	u32 gsir;
+};
+
+/**
+ * struct tng_gpio_pinrange - Map pin numbers to gpio numbers
+ * @gpio_base: Starting gpio number of this range
+ * @pin_base: Starting pin number of this range
+ * @npins: Number of pins in this range
+ */
+struct tng_gpio_pinrange {
+	unsigned int gpio_base;
+	unsigned int pin_base;
+	unsigned int npins;
+};
+
+/**
+ * struct tng_gpio_pin_info - Platform specific pinout information
+ * @pin_ranges: Pin to gpio mapping
+ * @nranges: Number of pin ranges
+ * @name: Respective pinctrl device name
+ */
+struct tng_gpio_pin_info {
+	const struct tng_gpio_pinrange *pin_ranges;
+	unsigned int nranges;
+	const char *name;
+};
+
+/**
+ * struct tng_gpio - Platform specific private data
+ * @chip: Instance of the gpio_chip
+ * @reg_base: Base address of MMIO registers
+ * @lock: Synchronization lock to prevent I/O race conditions
+ * @dev: The gpio device
+ * @ctx: Context to be saved during suspend-resum
+ * @reg: Platform specific wake registers
+ * @pin_info: Platform specific pinout information
+ * @irq: Interrupt for the gpio device
+ * @irq_base: Base of irq number for interrupt
+ */
+struct tng_gpio {
+	struct gpio_chip chip;
+	void __iomem *reg_base;
+	raw_spinlock_t lock;
+	struct device *dev;
+	struct tng_gpio_context *ctx;
+	struct tng_wake_regs reg;
+	struct tng_gpio_pin_info pin_info;
+	int irq;
+	int irq_base;
+};
+
+int tng_gpio_probe(struct tng_gpio *gpio);
+int tng_gpio_suspend(struct device *dev);
+int tng_gpio_resume(struct device *dev);
+
+#endif /* _GPIO_TANGIER_H_ */
-- 
2.17.1

