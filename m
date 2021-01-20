Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853122FD1E3
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 14:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730755AbhATNm2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 08:42:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:54920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389717AbhATNVx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 08:21:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85C4023383;
        Wed, 20 Jan 2021 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611148859;
        bh=6PVVR8lOmgp+xTyYzJ8t4lSq0CLAxQi+ZzeOZ44EYXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T16QynaArig5NaVk/D3IW9/Wb3mzE7sVk18AcMeG46oT5Lz2/PAncjQWQWDPoNP7q
         cG7OjTGceOv9prHXxDkGEzZHuOIGyA8GhXmJ2xotLojxAqwNYWiPAIRVCG8NSevX2H
         WclHKSedcdvvudGY7BgXz0MBRwXws+PKeAyA7uRNGG8cZe1oth3Lg79j7IpdJu2GkO
         LSZAv+8cVnvohAdVNozoPECbQkgRNaYHOVJ6rT+LS0tJpUUnSVCb03fUmrWTQqz94B
         AX1cx8zPaAPxPd7qO3vC0RMNw+T8I8X7HEEnxWQ2M2fQNY9X1fhg0mt7OIEnLx0rsV
         3e4daOQrXnJyA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/5] pinctrl: remove coh901 driver
Date:   Wed, 20 Jan 2021 14:20:44 +0100
Message-Id: <20210120132045.2127659-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120132045.2127659-1-arnd@kernel.org>
References: <20210120132045.2127659-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The ST-Ericsson U300 platform is getting removed, so this driver is no
longer needed.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/gpio/gpio-stericsson-coh901.txt  |   7 -
 drivers/pinctrl/Kconfig                       |  10 -
 drivers/pinctrl/Makefile                      |   1 -
 drivers/pinctrl/pinctrl-coh901.c              | 774 ------------------
 drivers/pinctrl/pinctrl-coh901.h              |   6 -
 5 files changed, 798 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt
 delete mode 100644 drivers/pinctrl/pinctrl-coh901.c
 delete mode 100644 drivers/pinctrl/pinctrl-coh901.h

diff --git a/Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt b/Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt
deleted file mode 100644
index fd665b44d767..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-ST-Ericsson COH 901 571/3 GPIO controller
-
-Required properties:
-- compatible: Compatible property value should be "stericsson,gpio-coh901"
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-- interrupts: the 0...n interrupts assigned to the different GPIO ports/banks.
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index e176137dbf29..9ddbf14d9536 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -277,16 +277,6 @@ config PINCTRL_U300
 	select PINMUX
 	select GENERIC_PINCONF
 
-config PINCTRL_COH901
-	bool "ST-Ericsson U300 COH 901 335/571 GPIO"
-	depends on GPIOLIB && ARCH_U300 && PINCTRL_U300
-	select GPIOLIB_IRQCHIP
-	help
-	  Say yes here to support GPIO interface on ST-Ericsson U300.
-	  The names of the two IP block variants supported are
-	  COH 901 335 and COH 901 571/3. They contain 3, 5 or 7
-	  ports of 8 GPIO pins each.
-
 config PINCTRL_MAX77620
 	tristate "MAX77620/MAX20024 Pincontrol support"
 	depends on MFD_MAX77620 && OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f414846abe2d..10643440b467 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -34,7 +34,6 @@ obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-$(CONFIG_PINCTRL_U300)	+= pinctrl-u300.o
-obj-$(CONFIG_PINCTRL_COH901)	+= pinctrl-coh901.o
 obj-$(CONFIG_PINCTRL_XWAY)	+= pinctrl-xway.o
 obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
 obj-$(CONFIG_PINCTRL_LPC18XX)	+= pinctrl-lpc18xx.o
diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl-coh901.c
deleted file mode 100644
index 2905348ff430..000000000000
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ /dev/null
@@ -1,774 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * U300 GPIO module.
- *
- * Copyright (C) 2007-2012 ST-Ericsson AB
- * COH 901 571/3 - Used in DB3210 (U365 2.0) and DB3350 (U335 1.0)
- * Author: Linus Walleij <linus.walleij@linaro.org>
- * Author: Jonas Aaberg <jonas.aberg@stericsson.com>
- */
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/delay.h>
-#include <linux/errno.h>
-#include <linux/io.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/driver.h>
-#include <linux/slab.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include "pinctrl-coh901.h"
-
-#define U300_GPIO_PORT_STRIDE				(0x30)
-/*
- * Control Register 32bit (R/W)
- * bit 15-9 (mask 0x0000FE00) contains the number of cores. 8*cores
- * gives the number of GPIO pins.
- * bit 8-2  (mask 0x000001FC) contains the core version ID.
- */
-#define U300_GPIO_CR					(0x00)
-#define U300_GPIO_CR_SYNC_SEL_ENABLE			(0x00000002UL)
-#define U300_GPIO_CR_BLOCK_CLKRQ_ENABLE			(0x00000001UL)
-#define U300_GPIO_PXPDIR				(0x04)
-#define U300_GPIO_PXPDOR				(0x08)
-#define U300_GPIO_PXPCR					(0x0C)
-#define U300_GPIO_PXPCR_ALL_PINS_MODE_MASK		(0x0000FFFFUL)
-#define U300_GPIO_PXPCR_PIN_MODE_MASK			(0x00000003UL)
-#define U300_GPIO_PXPCR_PIN_MODE_SHIFT			(0x00000002UL)
-#define U300_GPIO_PXPCR_PIN_MODE_INPUT			(0x00000000UL)
-#define U300_GPIO_PXPCR_PIN_MODE_OUTPUT_PUSH_PULL	(0x00000001UL)
-#define U300_GPIO_PXPCR_PIN_MODE_OUTPUT_OPEN_DRAIN	(0x00000002UL)
-#define U300_GPIO_PXPCR_PIN_MODE_OUTPUT_OPEN_SOURCE	(0x00000003UL)
-#define U300_GPIO_PXPER					(0x10)
-#define U300_GPIO_PXPER_ALL_PULL_UP_DISABLE_MASK	(0x000000FFUL)
-#define U300_GPIO_PXPER_PULL_UP_DISABLE			(0x00000001UL)
-#define U300_GPIO_PXIEV					(0x14)
-#define U300_GPIO_PXIEN					(0x18)
-#define U300_GPIO_PXIFR					(0x1C)
-#define U300_GPIO_PXICR					(0x20)
-#define U300_GPIO_PXICR_ALL_IRQ_CONFIG_MASK		(0x000000FFUL)
-#define U300_GPIO_PXICR_IRQ_CONFIG_MASK			(0x00000001UL)
-#define U300_GPIO_PXICR_IRQ_CONFIG_FALLING_EDGE		(0x00000000UL)
-#define U300_GPIO_PXICR_IRQ_CONFIG_RISING_EDGE		(0x00000001UL)
-
-/* 8 bits per port, no version has more than 7 ports */
-#define U300_GPIO_NUM_PORTS 7
-#define U300_GPIO_PINS_PER_PORT 8
-#define U300_GPIO_MAX (U300_GPIO_PINS_PER_PORT * U300_GPIO_NUM_PORTS)
-
-struct u300_gpio_port {
-	struct u300_gpio *gpio;
-	char name[8];
-	int irq;
-	int number;
-	u8 toggle_edge_mode;
-};
-
-struct u300_gpio {
-	struct gpio_chip chip;
-	struct u300_gpio_port ports[U300_GPIO_NUM_PORTS];
-	struct clk *clk;
-	void __iomem *base;
-	struct device *dev;
-	u32 stride;
-	/* Register offsets */
-	u32 pcr;
-	u32 dor;
-	u32 dir;
-	u32 per;
-	u32 icr;
-	u32 ien;
-	u32 iev;
-};
-
-/*
- * Macro to expand to read a specific register found in the "gpio"
- * struct. It requires the struct u300_gpio *gpio variable to exist in
- * its context. It calculates the port offset from the given pin
- * offset, muliplies by the port stride and adds the register offset
- * so it provides a pointer to the desired register.
- */
-#define U300_PIN_REG(pin, reg) \
-	(gpio->base + (pin >> 3) * gpio->stride + gpio->reg)
-
-/*
- * Provides a bitmask for a specific gpio pin inside an 8-bit GPIO
- * register.
- */
-#define U300_PIN_BIT(pin) \
-	(1 << (pin & 0x07))
-
-struct u300_gpio_confdata {
-	u16 bias_mode;
-	bool output;
-	int outval;
-};
-
-#define U300_FLOATING_INPUT { \
-	.bias_mode = PIN_CONFIG_BIAS_HIGH_IMPEDANCE, \
-	.output = false, \
-}
-
-#define U300_PULL_UP_INPUT { \
-	.bias_mode = PIN_CONFIG_BIAS_PULL_UP, \
-	.output = false, \
-}
-
-#define U300_OUTPUT_LOW { \
-	.output = true, \
-	.outval = 0, \
-}
-
-#define U300_OUTPUT_HIGH { \
-	.output = true, \
-	.outval = 1, \
-}
-
-/* Initial configuration */
-static const struct u300_gpio_confdata __initconst
-bs335_gpio_config[U300_GPIO_NUM_PORTS][U300_GPIO_PINS_PER_PORT] = {
-	/* Port 0, pins 0-7 */
-	{
-		U300_FLOATING_INPUT,
-		U300_OUTPUT_HIGH,
-		U300_FLOATING_INPUT,
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-	},
-	/* Port 1, pins 0-7 */
-	{
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-		U300_PULL_UP_INPUT,
-		U300_FLOATING_INPUT,
-		U300_OUTPUT_HIGH,
-		U300_OUTPUT_LOW,
-		U300_OUTPUT_LOW,
-	},
-	/* Port 2, pins 0-7 */
-	{
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_OUTPUT_LOW,
-		U300_PULL_UP_INPUT,
-		U300_OUTPUT_LOW,
-		U300_PULL_UP_INPUT,
-	},
-	/* Port 3, pins 0-7 */
-	{
-		U300_PULL_UP_INPUT,
-		U300_OUTPUT_LOW,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-	},
-	/* Port 4, pins 0-7 */
-	{
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-	},
-	/* Port 5, pins 0-7 */
-	{
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-	},
-	/* Port 6, pind 0-7 */
-	{
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-		U300_FLOATING_INPUT,
-	}
-};
-
-static int u300_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-
-	return !!(readl(U300_PIN_REG(offset, dir)) & U300_PIN_BIT(offset));
-}
-
-static void u300_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-{
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
-	u32 val;
-
-	local_irq_save(flags);
-
-	val = readl(U300_PIN_REG(offset, dor));
-	if (value)
-		writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, dor));
-	else
-		writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, dor));
-
-	local_irq_restore(flags);
-}
-
-static int u300_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
-	u32 val;
-
-	local_irq_save(flags);
-	val = readl(U300_PIN_REG(offset, pcr));
-	/* Mask out this pin, note 2 bits per setting */
-	val &= ~(U300_GPIO_PXPCR_PIN_MODE_MASK << ((offset & 0x07) << 1));
-	writel(val, U300_PIN_REG(offset, pcr));
-	local_irq_restore(flags);
-	return 0;
-}
-
-static int u300_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
-				      int value)
-{
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
-	u32 oldmode;
-	u32 val;
-
-	local_irq_save(flags);
-	val = readl(U300_PIN_REG(offset, pcr));
-	/*
-	 * Drive mode must be set by the special mode set function, set
-	 * push/pull mode by default if no mode has been selected.
-	 */
-	oldmode = val & (U300_GPIO_PXPCR_PIN_MODE_MASK <<
-			 ((offset & 0x07) << 1));
-	/* mode = 0 means input, else some mode is already set */
-	if (oldmode == 0) {
-		val &= ~(U300_GPIO_PXPCR_PIN_MODE_MASK <<
-			 ((offset & 0x07) << 1));
-		val |= (U300_GPIO_PXPCR_PIN_MODE_OUTPUT_PUSH_PULL
-			<< ((offset & 0x07) << 1));
-		writel(val, U300_PIN_REG(offset, pcr));
-	}
-	u300_gpio_set(chip, offset, value);
-	local_irq_restore(flags);
-	return 0;
-}
-
-/* Returning -EINVAL means "supported but not available" */
-int u300_gpio_config_get(struct gpio_chip *chip,
-			 unsigned offset,
-			 unsigned long *config)
-{
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	enum pin_config_param param = (enum pin_config_param) *config;
-	bool biasmode;
-	u32 drmode;
-
-	/* One bit per pin, clamp to bool range */
-	biasmode = !!(readl(U300_PIN_REG(offset, per)) & U300_PIN_BIT(offset));
-
-	/* Mask out the two bits for this pin and shift to bits 0,1 */
-	drmode = readl(U300_PIN_REG(offset, pcr));
-	drmode &= (U300_GPIO_PXPCR_PIN_MODE_MASK << ((offset & 0x07) << 1));
-	drmode >>= ((offset & 0x07) << 1);
-
-	switch (param) {
-	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
-		*config = 0;
-		if (biasmode)
-			return 0;
-		else
-			return -EINVAL;
-		break;
-	case PIN_CONFIG_BIAS_PULL_UP:
-		*config = 0;
-		if (!biasmode)
-			return 0;
-		else
-			return -EINVAL;
-		break;
-	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		*config = 0;
-		if (drmode == U300_GPIO_PXPCR_PIN_MODE_OUTPUT_PUSH_PULL)
-			return 0;
-		else
-			return -EINVAL;
-		break;
-	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		*config = 0;
-		if (drmode == U300_GPIO_PXPCR_PIN_MODE_OUTPUT_OPEN_DRAIN)
-			return 0;
-		else
-			return -EINVAL;
-		break;
-	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
-		*config = 0;
-		if (drmode == U300_GPIO_PXPCR_PIN_MODE_OUTPUT_OPEN_SOURCE)
-			return 0;
-		else
-			return -EINVAL;
-		break;
-	default:
-		break;
-	}
-	return -ENOTSUPP;
-}
-
-int u300_gpio_config_set(struct gpio_chip *chip, unsigned offset,
-			 enum pin_config_param param)
-{
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
-	u32 val;
-
-	local_irq_save(flags);
-	switch (param) {
-	case PIN_CONFIG_BIAS_DISABLE:
-	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
-		val = readl(U300_PIN_REG(offset, per));
-		writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, per));
-		break;
-	case PIN_CONFIG_BIAS_PULL_UP:
-		val = readl(U300_PIN_REG(offset, per));
-		writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, per));
-		break;
-	case PIN_CONFIG_DRIVE_PUSH_PULL:
-		val = readl(U300_PIN_REG(offset, pcr));
-		val &= ~(U300_GPIO_PXPCR_PIN_MODE_MASK
-			 << ((offset & 0x07) << 1));
-		val |= (U300_GPIO_PXPCR_PIN_MODE_OUTPUT_PUSH_PULL
-			<< ((offset & 0x07) << 1));
-		writel(val, U300_PIN_REG(offset, pcr));
-		break;
-	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-		val = readl(U300_PIN_REG(offset, pcr));
-		val &= ~(U300_GPIO_PXPCR_PIN_MODE_MASK
-			 << ((offset & 0x07) << 1));
-		val |= (U300_GPIO_PXPCR_PIN_MODE_OUTPUT_OPEN_DRAIN
-			<< ((offset & 0x07) << 1));
-		writel(val, U300_PIN_REG(offset, pcr));
-		break;
-	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
-		val = readl(U300_PIN_REG(offset, pcr));
-		val &= ~(U300_GPIO_PXPCR_PIN_MODE_MASK
-			 << ((offset & 0x07) << 1));
-		val |= (U300_GPIO_PXPCR_PIN_MODE_OUTPUT_OPEN_SOURCE
-			<< ((offset & 0x07) << 1));
-		writel(val, U300_PIN_REG(offset, pcr));
-		break;
-	default:
-		local_irq_restore(flags);
-		dev_err(gpio->dev, "illegal configuration requested\n");
-		return -EINVAL;
-	}
-	local_irq_restore(flags);
-	return 0;
-}
-
-static const struct gpio_chip u300_gpio_chip = {
-	.label			= "u300-gpio-chip",
-	.owner			= THIS_MODULE,
-	.request		= gpiochip_generic_request,
-	.free			= gpiochip_generic_free,
-	.get			= u300_gpio_get,
-	.set			= u300_gpio_set,
-	.direction_input	= u300_gpio_direction_input,
-	.direction_output	= u300_gpio_direction_output,
-};
-
-static void u300_toggle_trigger(struct u300_gpio *gpio, unsigned offset)
-{
-	u32 val;
-
-	val = readl(U300_PIN_REG(offset, icr));
-	/* Set mode depending on state */
-	if (u300_gpio_get(&gpio->chip, offset)) {
-		/* High now, let's trigger on falling edge next then */
-		writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, icr));
-		dev_dbg(gpio->dev, "next IRQ on falling edge on pin %d\n",
-			offset);
-	} else {
-		/* Low now, let's trigger on rising edge next then */
-		writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, icr));
-		dev_dbg(gpio->dev, "next IRQ on rising edge on pin %d\n",
-			offset);
-	}
-}
-
-static int u300_gpio_irq_type(struct irq_data *d, unsigned trigger)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	struct u300_gpio_port *port = &gpio->ports[d->hwirq >> 3];
-	int offset = d->hwirq;
-	u32 val;
-
-	if ((trigger & IRQF_TRIGGER_RISING) &&
-	    (trigger & IRQF_TRIGGER_FALLING)) {
-		/*
-		 * The GPIO block can only trigger on falling OR rising edges,
-		 * not both. So we need to toggle the mode whenever the pin
-		 * goes from one state to the other with a special state flag
-		 */
-		dev_dbg(gpio->dev,
-			"trigger on both rising and falling edge on pin %d\n",
-			offset);
-		port->toggle_edge_mode |= U300_PIN_BIT(offset);
-		u300_toggle_trigger(gpio, offset);
-	} else if (trigger & IRQF_TRIGGER_RISING) {
-		dev_dbg(gpio->dev, "trigger on rising edge on pin %d\n",
-			offset);
-		val = readl(U300_PIN_REG(offset, icr));
-		writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, icr));
-		port->toggle_edge_mode &= ~U300_PIN_BIT(offset);
-	} else if (trigger & IRQF_TRIGGER_FALLING) {
-		dev_dbg(gpio->dev, "trigger on falling edge on pin %d\n",
-			offset);
-		val = readl(U300_PIN_REG(offset, icr));
-		writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, icr));
-		port->toggle_edge_mode &= ~U300_PIN_BIT(offset);
-	}
-
-	return 0;
-}
-
-static void u300_gpio_irq_enable(struct irq_data *d)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	struct u300_gpio_port *port = &gpio->ports[d->hwirq >> 3];
-	int offset = d->hwirq;
-	u32 val;
-	unsigned long flags;
-
-	dev_dbg(gpio->dev, "enable IRQ for hwirq %lu on port %s, offset %d\n",
-		 d->hwirq, port->name, offset);
-	local_irq_save(flags);
-	val = readl(U300_PIN_REG(offset, ien));
-	writel(val | U300_PIN_BIT(offset), U300_PIN_REG(offset, ien));
-	local_irq_restore(flags);
-}
-
-static void u300_gpio_irq_disable(struct irq_data *d)
-{
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	int offset = d->hwirq;
-	u32 val;
-	unsigned long flags;
-
-	local_irq_save(flags);
-	val = readl(U300_PIN_REG(offset, ien));
-	writel(val & ~U300_PIN_BIT(offset), U300_PIN_REG(offset, ien));
-	local_irq_restore(flags);
-}
-
-static struct irq_chip u300_gpio_irqchip = {
-	.name			= "u300-gpio-irqchip",
-	.irq_enable		= u300_gpio_irq_enable,
-	.irq_disable		= u300_gpio_irq_disable,
-	.irq_set_type		= u300_gpio_irq_type,
-};
-
-static void u300_gpio_irq_handler(struct irq_desc *desc)
-{
-	unsigned int irq = irq_desc_get_irq(desc);
-	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
-	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct u300_gpio *gpio = gpiochip_get_data(chip);
-	struct u300_gpio_port *port = &gpio->ports[irq - chip->base];
-	int pinoffset = port->number << 3; /* get the right stride */
-	unsigned long val;
-
-	chained_irq_enter(parent_chip, desc);
-
-	/* Read event register */
-	val = readl(U300_PIN_REG(pinoffset, iev));
-	/* Mask relevant bits */
-	val &= 0xFFU; /* 8 bits per port */
-	/* ACK IRQ (clear event) */
-	writel(val, U300_PIN_REG(pinoffset, iev));
-
-	/* Call IRQ handler */
-	if (val != 0) {
-		int irqoffset;
-
-		for_each_set_bit(irqoffset, &val, U300_GPIO_PINS_PER_PORT) {
-			int offset = pinoffset + irqoffset;
-			int pin_irq = irq_find_mapping(chip->irq.domain, offset);
-
-			dev_dbg(gpio->dev, "GPIO IRQ %d on pin %d\n",
-				pin_irq, offset);
-			generic_handle_irq(pin_irq);
-			/*
-			 * Triggering IRQ on both rising and falling edge
-			 * needs mockery
-			 */
-			if (port->toggle_edge_mode & U300_PIN_BIT(offset))
-				u300_toggle_trigger(gpio, offset);
-		}
-	}
-
-	chained_irq_exit(parent_chip, desc);
-}
-
-static void __init u300_gpio_init_pin(struct u300_gpio *gpio,
-				      int offset,
-				      const struct u300_gpio_confdata *conf)
-{
-	/* Set mode: input or output */
-	if (conf->output) {
-		u300_gpio_direction_output(&gpio->chip, offset, conf->outval);
-
-		/* Deactivate bias mode for output */
-		u300_gpio_config_set(&gpio->chip, offset,
-				     PIN_CONFIG_BIAS_HIGH_IMPEDANCE);
-
-		/* Set drive mode for output */
-		u300_gpio_config_set(&gpio->chip, offset,
-				     PIN_CONFIG_DRIVE_PUSH_PULL);
-
-		dev_dbg(gpio->dev, "set up pin %d as output, value: %d\n",
-			offset, conf->outval);
-	} else {
-		u300_gpio_direction_input(&gpio->chip, offset);
-
-		/* Always set output low on input pins */
-		u300_gpio_set(&gpio->chip, offset, 0);
-
-		/* Set bias mode for input */
-		u300_gpio_config_set(&gpio->chip, offset, conf->bias_mode);
-
-		dev_dbg(gpio->dev, "set up pin %d as input, bias: %04x\n",
-			offset, conf->bias_mode);
-	}
-}
-
-static void __init u300_gpio_init_coh901571(struct u300_gpio *gpio)
-{
-	int i, j;
-
-	/* Write default config and values to all pins */
-	for (i = 0; i < U300_GPIO_NUM_PORTS; i++) {
-		for (j = 0; j < 8; j++) {
-			const struct u300_gpio_confdata *conf;
-			int offset = (i*8) + j;
-
-			conf = &bs335_gpio_config[i][j];
-			u300_gpio_init_pin(gpio, offset, conf);
-		}
-	}
-}
-
-/*
- * Here we map a GPIO in the local gpio_chip pin space to a pin in
- * the local pinctrl pin space. The pin controller used is
- * pinctrl-u300.
- */
-struct coh901_pinpair {
-	unsigned int offset;
-	unsigned int pin_base;
-};
-
-#define COH901_PINRANGE(a, b) { .offset = a, .pin_base = b }
-
-static struct coh901_pinpair coh901_pintable[] = {
-	COH901_PINRANGE(10, 426),
-	COH901_PINRANGE(11, 180),
-	COH901_PINRANGE(12, 165), /* MS/MMC card insertion */
-	COH901_PINRANGE(13, 179),
-	COH901_PINRANGE(14, 178),
-	COH901_PINRANGE(16, 194),
-	COH901_PINRANGE(17, 193),
-	COH901_PINRANGE(18, 192),
-	COH901_PINRANGE(19, 191),
-	COH901_PINRANGE(20, 186),
-	COH901_PINRANGE(21, 185),
-	COH901_PINRANGE(22, 184),
-	COH901_PINRANGE(23, 183),
-	COH901_PINRANGE(24, 182),
-	COH901_PINRANGE(25, 181),
-};
-
-static int __init u300_gpio_probe(struct platform_device *pdev)
-{
-	struct u300_gpio *gpio;
-	struct gpio_irq_chip *girq;
-	int err = 0;
-	int portno;
-	u32 val;
-	u32 ifr;
-	int i;
-
-	gpio = devm_kzalloc(&pdev->dev, sizeof(struct u300_gpio), GFP_KERNEL);
-	if (gpio == NULL)
-		return -ENOMEM;
-
-	gpio->chip = u300_gpio_chip;
-	gpio->chip.ngpio = U300_GPIO_NUM_PORTS * U300_GPIO_PINS_PER_PORT;
-	gpio->chip.parent = &pdev->dev;
-	gpio->chip.base = 0;
-	gpio->dev = &pdev->dev;
-
-	gpio->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(gpio->base))
-		return PTR_ERR(gpio->base);
-
-	gpio->clk = devm_clk_get(gpio->dev, NULL);
-	if (IS_ERR(gpio->clk)) {
-		err = PTR_ERR(gpio->clk);
-		dev_err(gpio->dev, "could not get GPIO clock\n");
-		return err;
-	}
-
-	err = clk_prepare_enable(gpio->clk);
-	if (err) {
-		dev_err(gpio->dev, "could not enable GPIO clock\n");
-		return err;
-	}
-
-	dev_info(gpio->dev,
-		 "initializing GPIO Controller COH 901 571/3\n");
-	gpio->stride = U300_GPIO_PORT_STRIDE;
-	gpio->pcr = U300_GPIO_PXPCR;
-	gpio->dor = U300_GPIO_PXPDOR;
-	gpio->dir = U300_GPIO_PXPDIR;
-	gpio->per = U300_GPIO_PXPER;
-	gpio->icr = U300_GPIO_PXICR;
-	gpio->ien = U300_GPIO_PXIEN;
-	gpio->iev = U300_GPIO_PXIEV;
-	ifr = U300_GPIO_PXIFR;
-
-	val = readl(gpio->base + U300_GPIO_CR);
-	dev_info(gpio->dev, "COH901571/3 block version: %d, " \
-		 "number of cores: %d totalling %d pins\n",
-		 ((val & 0x000001FC) >> 2),
-		 ((val & 0x0000FE00) >> 9),
-		 ((val & 0x0000FE00) >> 9) * 8);
-	writel(U300_GPIO_CR_BLOCK_CLKRQ_ENABLE,
-	       gpio->base + U300_GPIO_CR);
-	u300_gpio_init_coh901571(gpio);
-
-	girq = &gpio->chip.irq;
-	girq->chip = &u300_gpio_irqchip;
-	girq->parent_handler = u300_gpio_irq_handler;
-	girq->num_parents = U300_GPIO_NUM_PORTS;
-	girq->parents = devm_kcalloc(gpio->dev, U300_GPIO_NUM_PORTS,
-				     sizeof(*girq->parents),
-				     GFP_KERNEL);
-	if (!girq->parents) {
-		err = -ENOMEM;
-		goto err_dis_clk;
-	}
-	for (portno = 0 ; portno < U300_GPIO_NUM_PORTS; portno++) {
-		struct u300_gpio_port *port = &gpio->ports[portno];
-
-		snprintf(port->name, 8, "gpio%d", portno);
-		port->number = portno;
-		port->gpio = gpio;
-
-		port->irq = platform_get_irq(pdev, portno);
-		girq->parents[portno] = port->irq;
-
-		/* Turns off irq force (test register) for this port */
-		writel(0x0, gpio->base + portno * gpio->stride + ifr);
-	}
-	girq->default_type = IRQ_TYPE_EDGE_FALLING;
-	girq->handler = handle_simple_irq;
-#ifdef CONFIG_OF_GPIO
-	gpio->chip.of_node = pdev->dev.of_node;
-#endif
-	err = gpiochip_add_data(&gpio->chip, gpio);
-	if (err) {
-		dev_err(gpio->dev, "unable to add gpiochip: %d\n", err);
-		goto err_dis_clk;
-	}
-
-	/*
-	 * Add pinctrl pin ranges, the pin controller must be registered
-	 * at this point
-	 */
-	for (i = 0; i < ARRAY_SIZE(coh901_pintable); i++) {
-		struct coh901_pinpair *p = &coh901_pintable[i];
-
-		err = gpiochip_add_pin_range(&gpio->chip, "pinctrl-u300",
-					     p->offset, p->pin_base, 1);
-		if (err)
-			goto err_no_range;
-	}
-
-	platform_set_drvdata(pdev, gpio);
-
-	return 0;
-
-err_no_range:
-	gpiochip_remove(&gpio->chip);
-err_dis_clk:
-	clk_disable_unprepare(gpio->clk);
-	dev_err(&pdev->dev, "module ERROR:%d\n", err);
-	return err;
-}
-
-static int __exit u300_gpio_remove(struct platform_device *pdev)
-{
-	struct u300_gpio *gpio = platform_get_drvdata(pdev);
-
-	/* Turn off the GPIO block */
-	writel(0x00000000U, gpio->base + U300_GPIO_CR);
-
-	gpiochip_remove(&gpio->chip);
-	clk_disable_unprepare(gpio->clk);
-	return 0;
-}
-
-static const struct of_device_id u300_gpio_match[] = {
-	{ .compatible = "stericsson,gpio-coh901" },
-	{},
-};
-
-static struct platform_driver u300_gpio_driver = {
-	.driver		= {
-		.name	= "u300-gpio",
-		.of_match_table = u300_gpio_match,
-	},
-	.remove		= __exit_p(u300_gpio_remove),
-};
-
-static int __init u300_gpio_init(void)
-{
-	return platform_driver_probe(&u300_gpio_driver, u300_gpio_probe);
-}
-
-static void __exit u300_gpio_exit(void)
-{
-	platform_driver_unregister(&u300_gpio_driver);
-}
-
-arch_initcall(u300_gpio_init);
-module_exit(u300_gpio_exit);
-
-MODULE_AUTHOR("Linus Walleij <linus.walleij@stericsson.com>");
-MODULE_DESCRIPTION("ST-Ericsson AB COH 901 335/COH 901 571/3 GPIO driver");
-MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-coh901.h b/drivers/pinctrl/pinctrl-coh901.h
deleted file mode 100644
index ba2678665168..000000000000
--- a/drivers/pinctrl/pinctrl-coh901.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-int u300_gpio_config_get(struct gpio_chip *chip,
-			 unsigned offset,
-			 unsigned long *config);
-int u300_gpio_config_set(struct gpio_chip *chip, unsigned offset,
-			 enum pin_config_param param);
-- 
2.29.2

