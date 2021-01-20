Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F382FD1DC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 14:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbhATNlN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 08:41:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:54882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389698AbhATNVx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 08:21:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 483D82245C;
        Wed, 20 Jan 2021 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611148852;
        bh=UtigMLM4aPy6vib5ZJLfoCwByKUtzjTF+theM0hqreQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oJYcoKUePfrHPyGEp88qKoIn5csiBG5KjENxyOgUqzYtWzLxFR2GiGiNrWORmQv7T
         98m7aKwY7yKoth8WJfjUEKbhXRAhlrRNc26ZX1kYb1um5k2aVcsvI0fd99yBz57oUu
         U+klrebwVB2xZEoZKvFnjQkx+UL9N8qjsCcuixoLhUjoq0RTKUVS2Agyw7bT/unMwu
         J/T+WEi4EQU3HkgsEdgrH3Bi8WXB75h4ewD0HOMmWty0Kz6fN17R+CwA/jz+I1Czp1
         kJhTFnQ9DTnSW8PP0DMzIEkmj82t7m2a3+zTh1auiYovp83J98WzQJFCa/EWWyqoyQ
         3ckcPIzxaT2Ww==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH 1/5] gpio: remove zte zx driver
Date:   Wed, 20 Jan 2021 14:20:41 +0100
Message-Id: <20210120132045.2127659-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120132045.2127659-1-arnd@kernel.org>
References: <20210120132045.2127659-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The zte zx platform is getting removed, so this driver is no
longer needed.

Cc: Jun Nie <jun.nie@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../bindings/gpio/zx296702-gpio.txt           |  24 --
 drivers/gpio/Kconfig                          |   7 -
 drivers/gpio/Makefile                         |   1 -
 drivers/gpio/gpio-zx.c                        | 289 ------------------
 4 files changed, 321 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
 delete mode 100644 drivers/gpio/gpio-zx.c

diff --git a/Documentation/devicetree/bindings/gpio/zx296702-gpio.txt b/Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
deleted file mode 100644
index 0dab156fcf41..000000000000
--- a/Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-ZTE ZX296702 GPIO controller
-
-Required properties:
-- compatible : "zte,zx296702-gpio"
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-  - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- gpio-controller : Marks the device node as a GPIO controller.
-- interrupts : Interrupt mapping for GPIO IRQ.
-- gpio-ranges : Interaction with the PINCTRL subsystem.
-
-gpio1: gpio@b008040 {
-	compatible = "zte,zx296702-gpio";
-	reg = <0xb008040 0x40>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	gpio-ranges = < &pmx0 0 54 2 &pmx0 2 59 14>;
-	interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-parent = <&intc>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	clock-names = "gpio_pclk";
-	clocks = <&lsp0clk ZX296702_GPIO_CLK>;
-};
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..e4f6dfefa9df 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -727,13 +727,6 @@ config GPIO_ZYNQ
 	help
 	  Say yes here to support Xilinx Zynq GPIO controller.
 
-config GPIO_ZX
-	bool "ZTE ZX GPIO support"
-	depends on ARCH_ZX || COMPILE_TEST
-	select GPIOLIB_IRQCHIP
-	help
-	  Say yes here to support the GPIO device on ZTE ZX SoCs.
-
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
 	depends on MACH_LOONGSON32
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 35e3b6026665..db72ebc7b387 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -180,5 +180,4 @@ obj-$(CONFIG_GPIO_XLP)			+= gpio-xlp.o
 obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
-obj-$(CONFIG_GPIO_ZX)			+= gpio-zx.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
deleted file mode 100644
index 64bfb722756a..000000000000
--- a/drivers/gpio/gpio-zx.c
+++ /dev/null
@@ -1,289 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ZTE ZX296702 GPIO driver
- *
- * Author: Jun Nie <jun.nie@linaro.org>
- *
- * Copyright (C) 2015 Linaro Ltd.
- */
-#include <linux/bitops.h>
-#include <linux/device.h>
-#include <linux/errno.h>
-#include <linux/gpio/driver.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/init.h>
-#include <linux/of.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-
-#define ZX_GPIO_DIR	0x00
-#define ZX_GPIO_IVE	0x04
-#define ZX_GPIO_IV	0x08
-#define ZX_GPIO_IEP	0x0C
-#define ZX_GPIO_IEN	0x10
-#define ZX_GPIO_DI	0x14
-#define ZX_GPIO_DO1	0x18
-#define ZX_GPIO_DO0	0x1C
-#define ZX_GPIO_DO	0x20
-
-#define ZX_GPIO_IM	0x28
-#define ZX_GPIO_IE	0x2C
-
-#define ZX_GPIO_MIS	0x30
-#define ZX_GPIO_IC	0x34
-
-#define ZX_GPIO_NR	16
-
-struct zx_gpio {
-	raw_spinlock_t		lock;
-
-	void __iomem		*base;
-	struct gpio_chip	gc;
-};
-
-static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
-{
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-	unsigned long flags;
-	u16 gpiodir;
-
-	if (offset >= gc->ngpio)
-		return -EINVAL;
-
-	raw_spin_lock_irqsave(&chip->lock, flags);
-	gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
-	gpiodir &= ~BIT(offset);
-	writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&chip->lock, flags);
-
-	return 0;
-}
-
-static int zx_direction_output(struct gpio_chip *gc, unsigned offset,
-		int value)
-{
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-	unsigned long flags;
-	u16 gpiodir;
-
-	if (offset >= gc->ngpio)
-		return -EINVAL;
-
-	raw_spin_lock_irqsave(&chip->lock, flags);
-	gpiodir = readw_relaxed(chip->base + ZX_GPIO_DIR);
-	gpiodir |= BIT(offset);
-	writew_relaxed(gpiodir, chip->base + ZX_GPIO_DIR);
-
-	if (value)
-		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
-	else
-		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
-	raw_spin_unlock_irqrestore(&chip->lock, flags);
-
-	return 0;
-}
-
-static int zx_get_value(struct gpio_chip *gc, unsigned offset)
-{
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-
-	return !!(readw_relaxed(chip->base + ZX_GPIO_DI) & BIT(offset));
-}
-
-static void zx_set_value(struct gpio_chip *gc, unsigned offset, int value)
-{
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-
-	if (value)
-		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO1);
-	else
-		writew_relaxed(BIT(offset), chip->base + ZX_GPIO_DO0);
-}
-
-static int zx_irq_type(struct irq_data *d, unsigned trigger)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-	int offset = irqd_to_hwirq(d);
-	unsigned long flags;
-	u16 gpiois, gpioi_epos, gpioi_eneg, gpioiev;
-	u16 bit = BIT(offset);
-
-	if (offset < 0 || offset >= ZX_GPIO_NR)
-		return -EINVAL;
-
-	raw_spin_lock_irqsave(&chip->lock, flags);
-
-	gpioiev = readw_relaxed(chip->base + ZX_GPIO_IV);
-	gpiois = readw_relaxed(chip->base + ZX_GPIO_IVE);
-	gpioi_epos = readw_relaxed(chip->base + ZX_GPIO_IEP);
-	gpioi_eneg = readw_relaxed(chip->base + ZX_GPIO_IEN);
-
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
-		gpiois |= bit;
-		if (trigger & IRQ_TYPE_LEVEL_HIGH)
-			gpioiev |= bit;
-		else
-			gpioiev &= ~bit;
-	} else
-		gpiois &= ~bit;
-
-	if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
-		gpioi_epos |= bit;
-		gpioi_eneg |= bit;
-	} else {
-		if (trigger & IRQ_TYPE_EDGE_RISING) {
-			gpioi_epos |= bit;
-			gpioi_eneg &= ~bit;
-		} else if (trigger & IRQ_TYPE_EDGE_FALLING) {
-			gpioi_eneg |= bit;
-			gpioi_epos &= ~bit;
-		}
-	}
-
-	writew_relaxed(gpiois, chip->base + ZX_GPIO_IVE);
-	writew_relaxed(gpioi_epos, chip->base + ZX_GPIO_IEP);
-	writew_relaxed(gpioi_eneg, chip->base + ZX_GPIO_IEN);
-	writew_relaxed(gpioiev, chip->base + ZX_GPIO_IV);
-	raw_spin_unlock_irqrestore(&chip->lock, flags);
-
-	return 0;
-}
-
-static void zx_irq_handler(struct irq_desc *desc)
-{
-	unsigned long pending;
-	int offset;
-	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
-
-	chained_irq_enter(irqchip, desc);
-
-	pending = readw_relaxed(chip->base + ZX_GPIO_MIS);
-	writew_relaxed(pending, chip->base + ZX_GPIO_IC);
-	if (pending) {
-		for_each_set_bit(offset, &pending, ZX_GPIO_NR)
-			generic_handle_irq(irq_find_mapping(gc->irq.domain,
-							    offset));
-	}
-
-	chained_irq_exit(irqchip, desc);
-}
-
-static void zx_irq_mask(struct irq_data *d)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-	u16 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
-	u16 gpioie;
-
-	raw_spin_lock(&chip->lock);
-	gpioie = readw_relaxed(chip->base + ZX_GPIO_IM) | mask;
-	writew_relaxed(gpioie, chip->base + ZX_GPIO_IM);
-	gpioie = readw_relaxed(chip->base + ZX_GPIO_IE) & ~mask;
-	writew_relaxed(gpioie, chip->base + ZX_GPIO_IE);
-	raw_spin_unlock(&chip->lock);
-}
-
-static void zx_irq_unmask(struct irq_data *d)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct zx_gpio *chip = gpiochip_get_data(gc);
-	u16 mask = BIT(irqd_to_hwirq(d) % ZX_GPIO_NR);
-	u16 gpioie;
-
-	raw_spin_lock(&chip->lock);
-	gpioie = readw_relaxed(chip->base + ZX_GPIO_IM) & ~mask;
-	writew_relaxed(gpioie, chip->base + ZX_GPIO_IM);
-	gpioie = readw_relaxed(chip->base + ZX_GPIO_IE) | mask;
-	writew_relaxed(gpioie, chip->base + ZX_GPIO_IE);
-	raw_spin_unlock(&chip->lock);
-}
-
-static struct irq_chip zx_irqchip = {
-	.name		= "zx-gpio",
-	.irq_mask	= zx_irq_mask,
-	.irq_unmask	= zx_irq_unmask,
-	.irq_set_type	= zx_irq_type,
-};
-
-static int zx_gpio_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct zx_gpio *chip;
-	struct gpio_irq_chip *girq;
-	int irq, id, ret;
-
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	chip->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(chip->base))
-		return PTR_ERR(chip->base);
-
-	id = of_alias_get_id(dev->of_node, "gpio");
-
-	raw_spin_lock_init(&chip->lock);
-	chip->gc.request = gpiochip_generic_request;
-	chip->gc.free = gpiochip_generic_free;
-	chip->gc.direction_input = zx_direction_input;
-	chip->gc.direction_output = zx_direction_output;
-	chip->gc.get = zx_get_value;
-	chip->gc.set = zx_set_value;
-	chip->gc.base = ZX_GPIO_NR * id;
-	chip->gc.ngpio = ZX_GPIO_NR;
-	chip->gc.label = dev_name(dev);
-	chip->gc.parent = dev;
-	chip->gc.owner = THIS_MODULE;
-
-	/*
-	 * irq_chip support
-	 */
-	writew_relaxed(0xffff, chip->base + ZX_GPIO_IM);
-	writew_relaxed(0, chip->base + ZX_GPIO_IE);
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-	girq = &chip->gc.irq;
-	girq->chip = &zx_irqchip;
-	girq->parent_handler = zx_irq_handler;
-	girq->num_parents = 1;
-	girq->parents = devm_kcalloc(&pdev->dev, 1,
-				     sizeof(*girq->parents),
-				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
-	girq->parents[0] = irq;
-	girq->default_type = IRQ_TYPE_NONE;
-	girq->handler = handle_simple_irq;
-
-	ret = gpiochip_add_data(&chip->gc, chip);
-	if (ret)
-		return ret;
-
-	platform_set_drvdata(pdev, chip);
-	dev_info(dev, "ZX GPIO chip registered\n");
-
-	return 0;
-}
-
-static const struct of_device_id zx_gpio_match[] = {
-	{
-		.compatible = "zte,zx296702-gpio",
-	},
-	{ },
-};
-
-static struct platform_driver zx_gpio_driver = {
-	.probe		= zx_gpio_probe,
-	.driver = {
-		.name	= "zx_gpio",
-		.of_match_table = of_match_ptr(zx_gpio_match),
-	},
-};
-builtin_platform_driver(zx_gpio_driver)
-- 
2.29.2

