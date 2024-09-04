Return-Path: <linux-gpio+bounces-9735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7396AD4B
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 02:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38403284BAA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 00:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D247E6;
	Wed,  4 Sep 2024 00:28:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1ED945A;
	Wed,  4 Sep 2024 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725409683; cv=none; b=aI+zP+Xp2Lp1zPk/ikYV+41ND5xfcL44bc9bvTzM5tHxT87ykZ8Brcen7wT1usjRazpBl5FjRf/+wobEusNLYdZa5zbSHKw4h4m3vvdlBYwC4PPO20GzbUcJErK2O1DmLbEghGetlqFwpDPGt/aG8snWdx1ICjaufVDbL+afMSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725409683; c=relaxed/simple;
	bh=oeVxoxAEValTDMcJuX8oovSDwVwFx356lm6RW0Tb/Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3JaXwf1YIrBVbS6MNcvZoas0sbY2VOWQgLs4zVfvleGWQbjYkF44WbGCDihHk2/FiP0jSbnsXnHglyQJqbHBIlRy5yuSLaB0Bs6BJ7yAs9EPU5huw8DKVkj1gKo5KNh6epNFlkSelj7Qz2ImKYDs/iMKwGKODHMMXNCHmEALF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 04 Sep 2024 00:27:24 +0000
Subject: [PATCH 2/3] gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240904-03-k1-gpio-v1-2-6072ebeecae0@gentoo.org>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
In-Reply-To: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, 
 Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=13940; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=oeVxoxAEValTDMcJuX8oovSDwVwFx356lm6RW0Tb/Dc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBm16l8Gf+Tb/lpJiWkRRSmk9upstvTqGlFn05Sa
 eCokFk6LS6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZtepfF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TszD/9PMX62U09S4kQpBB
 HKukVjX/Np3aVCzHD9R/yJ5u4QyQs/FID/5ItE84AtxR1aqRFxf7UG+K9+dnKHY2txnSURluD1e
 j8OyXvjApycD+VljiGpZJQ4/Lx829XH/yQCRzuojtPqwXEfKOY3I1vPToA8jwC0rcFJHKT/sow1
 oM4owK2cZrU4j5PSf8OaOoN6J1VLlJpX4L0snrE8J54XcJMmEgAv1drAV2QknFsH7GGxaZliI3l
 ytE85oum9/dIeBv8rEdRMXuchTXxXOdxDCRnR14sRYES9YlxBw2WWkstj2KWz2JAkHohwNR/CUc
 A//GVxnRIwk/g/8fCuLfKQD65h9i8ELgX+B7qL1D7EQgabVtbU0Y+494LVsv2iCitM/q6i7oo2V
 +rytIBxitJxfgmBqMW3cFkuytPP/A059scNnz53ijcLhl9bSvqoFaXTt5ErbZ8TlxmAh18r3DaE
 Z/z1P4sN2v3XvGHVuEWRZmZ487GXuoqH8XdHh1VD7YIP0TMZUeapmAfz/88Ji5QQOQsm5o19CnO
 HHOKr1IKc/00HkcMzsqD3n6vF0cVx2TJ3sUPlSMpU34Ur5t2dKp6IiwK22ScwIvhUJrvFBzpjui
 k8lNNUTWNEg3NFJJ+YZ2l+/5fBdn5Bd107qrc6LLpkF/o/BDCbdtraXARmEHjF4YIttg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Implement GPIO functionality which capable of setting pin as
input, output. Also, each pin can be used as interrupt which
support rising/failing edge type trigger, or both.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/Kconfig            |   7 +
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-spacemit-k1.c | 454 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 462 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c1..a97356371a84f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -653,6 +653,13 @@ config GPIO_SNPS_CREG
 	  where only several fields in register belong to GPIO lines and
 	  each GPIO line owns a field with different length and on/off value.
 
+config GPIO_SPACEMIT_K1
+	bool "SPACEMIT K1 GPIO support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the SpacemiT's K1 GPIO device.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d5..6696a2f4360aa 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
+obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
new file mode 100644
index 0000000000000..01ccf229b911d
--- /dev/null
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2023-2024 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/irqdomain.h>
+
+/* register offset */
+#define GPLR		0x00
+#define GPDR		0x0c
+#define GPSR		0x18
+#define GPCR		0x24
+#define GRER		0x30
+#define GFER		0x3c
+#define GEDR		0x48
+#define GSDR		0x54
+#define GCDR		0x60
+#define GSRER		0x6c
+#define GCRER		0x78
+#define GSFER		0x84
+#define GCFER		0x90
+#define GAPMASK		0x9c
+#define GCPMASK		0xa8
+
+#define K1_BANK_GPIO_NUMBER	(32)
+#define BANK_GPIO_MASK		(K1_BANK_GPIO_NUMBER - 1)
+
+#define spacemit_gpio_to_bank_idx(gpio)		((gpio) / K1_BANK_GPIO_NUMBER)
+#define spacemit_gpio_to_bank_offset(gpio)	((gpio) & BANK_GPIO_MASK)
+#define spacemit_bank_to_gpio(idx, offset)	\
+	(((idx) * K1_BANK_GPIO_NUMBER) | ((offset) & BANK_GPIO_MASK))
+
+static u32 k1_gpio_bank_offset[] = { 0x0, 0x4, 0x8, 0x100 };
+
+struct spacemit_gpio_bank {
+	void __iomem			*reg_bank;
+	u32				irq_mask;
+	u32				irq_rising_edge;
+	u32				irq_falling_edge;
+};
+
+struct spacemit_gpio_chip {
+	struct gpio_chip		chip;
+	struct irq_domain		*domain;
+	struct spacemit_gpio_bank	*banks;
+	void __iomem			*reg_base;
+	unsigned int			ngpio;
+	unsigned int			nbank;
+	int				irq;
+};
+
+static struct spacemit_gpio_chip *to_spacemit_gpio_chip(struct gpio_chip *chip)
+{
+	return container_of(chip, struct spacemit_gpio_chip, chip);
+}
+
+static inline void spacemit_clear_edge_detection(struct spacemit_gpio_bank *bank,
+						 u32 bit)
+{
+	writel(bit, bank->reg_bank + GCRER);
+	writel(bit, bank->reg_bank + GCFER);
+}
+
+static inline void spacemit_set_edge_detection(struct spacemit_gpio_bank *bank,
+					       u32 bit)
+{
+	writel(bit & bank->irq_rising_edge, bank->reg_bank + GSRER);
+	writel(bit & bank->irq_falling_edge, bank->reg_bank + GSFER);
+}
+
+static void spacemit_reset_edge_detection(struct spacemit_gpio_chip *schip)
+{
+	struct spacemit_gpio_bank *bank;
+	unsigned int i;
+
+	for (i = 0; i < schip->nbank; i++) {
+		bank = &schip->banks[i];
+
+		writel(0xffffffff, bank->reg_bank + GCFER);
+		writel(0xffffffff, bank->reg_bank + GCRER);
+		writel(0xffffffff, bank->reg_bank + GAPMASK);
+	}
+}
+
+static int spacemit_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct spacemit_gpio_chip *schip = to_spacemit_gpio_chip(chip);
+
+	return irq_create_mapping(schip->domain, offset);
+}
+
+static struct spacemit_gpio_bank *
+spacemit_gpio_get_bank(struct spacemit_gpio_chip *schip,
+		       unsigned int offset)
+{
+	return &schip->banks[spacemit_gpio_to_bank_idx(offset)];
+}
+
+static int spacemit_gpio_direction_input(struct gpio_chip *chip,
+					 unsigned int offset)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	u32 bit;
+
+	schip =	to_spacemit_gpio_chip(chip);
+	bank = spacemit_gpio_get_bank(schip, offset);
+	bit = BIT(spacemit_gpio_to_bank_offset(offset));
+
+	writel(bit, bank->reg_bank + GCDR);
+
+	return 0;
+}
+
+static int spacemit_gpio_direction_output(struct gpio_chip *chip,
+					  unsigned int offset, int value)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	u32 bit;
+
+	schip =	to_spacemit_gpio_chip(chip);
+	bank = spacemit_gpio_get_bank(schip, offset);
+	bit = BIT(spacemit_gpio_to_bank_offset(offset));
+
+	writel(bit, bank->reg_bank + (value ? GPSR : GPCR));
+	writel(bit, bank->reg_bank + GSDR);
+
+	return 0;
+}
+
+static int spacemit_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	u32 bit, gplr;
+
+	schip =	to_spacemit_gpio_chip(chip);
+	bank = spacemit_gpio_get_bank(schip, offset);
+	bit = BIT(spacemit_gpio_to_bank_offset(offset));
+
+	gplr = readl(bank->reg_bank + GPLR);
+
+	return !!(gplr & bit);
+}
+
+static void spacemit_gpio_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	u32 bit, gpdr;
+
+	schip =	to_spacemit_gpio_chip(chip);
+	bank = spacemit_gpio_get_bank(schip, offset);
+	bit = BIT(spacemit_gpio_to_bank_offset(offset));
+	gpdr = readl(bank->reg_bank + GPDR);
+
+	/* Is it configured as output? */
+	if (gpdr & bit)
+		writel(bit, bank->reg_bank + (value ? GPSR : GPCR));
+}
+
+#ifdef CONFIG_OF_GPIO
+static int spacemit_gpio_of_xlate(struct gpio_chip *chip,
+				  const struct of_phandle_args *gpiospec,
+				  u32 *flags)
+{
+	struct spacemit_gpio_chip *schip;
+
+	schip =	to_spacemit_gpio_chip(chip);
+	/* GPIO index start from 0. */
+	if (gpiospec->args[0] >= schip->ngpio)
+		return -EINVAL;
+
+	if (flags)
+		*flags = gpiospec->args[1];
+
+	return gpiospec->args[0];
+}
+#endif
+
+static int spacemit_gpio_irq_type(struct irq_data *d, unsigned int type)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	int gpio = irqd_to_hwirq(d);
+	u32 bit;
+
+	schip = irq_data_get_irq_chip_data(d);
+	bank = spacemit_gpio_get_bank(schip, gpio);
+	bit = BIT(spacemit_gpio_to_bank_offset(gpio));
+
+	if (type & IRQ_TYPE_EDGE_RISING) {
+		bank->irq_rising_edge |= bit;
+		writel(bit, bank->reg_bank + GSRER);
+	} else {
+		bank->irq_rising_edge &= ~bit;
+		writel(bit, bank->reg_bank + GCRER);
+	}
+
+	if (type & IRQ_TYPE_EDGE_FALLING) {
+		bank->irq_falling_edge |= bit;
+		writel(bit, bank->reg_bank + GSFER);
+	} else {
+		bank->irq_falling_edge &= ~bit;
+		writel(bit, bank->reg_bank + GCFER);
+	}
+
+	return 0;
+}
+
+static irqreturn_t spacemit_gpio_irq_handler(int irq, void *data)
+{
+	struct spacemit_gpio_chip *schip = data;
+	struct spacemit_gpio_bank *bank;
+	unsigned int irqs_handled = 0;
+	unsigned long pending = 0;
+	int i, n;
+	u32 gedr, girq;
+
+	for (i = 0; i < schip->nbank; i++) {
+		bank = &schip->banks[i];
+
+		gedr = readl(bank->reg_bank + GEDR);
+		if (!gedr)
+			continue;
+
+		writel(gedr, bank->reg_bank + GEDR);
+		gedr = gedr & bank->irq_mask;
+
+		if (!gedr)
+			continue;
+
+		pending = gedr;
+		for_each_set_bit(n, &pending, BITS_PER_LONG) {
+			girq = irq_find_mapping(schip->domain,
+						spacemit_bank_to_gpio(i, n));
+			handle_nested_irq(girq);
+		}
+
+		irqs_handled++;
+	}
+
+	return irqs_handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static void spacemit_ack_muxed_gpio(struct irq_data *d)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	int gpio = irqd_to_hwirq(d);
+	u32 bit;
+
+	schip = irq_data_get_irq_chip_data(d);
+	bank = spacemit_gpio_get_bank(schip, gpio);
+	bit = BIT(spacemit_gpio_to_bank_offset(gpio));
+
+	writel(bit, bank->reg_bank + GEDR);
+}
+
+static void spacemit_mask_muxed_gpio(struct irq_data *d)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	int gpio = irqd_to_hwirq(d);
+	u32 bit;
+
+	schip = irq_data_get_irq_chip_data(d);
+	bank = spacemit_gpio_get_bank(schip, gpio);
+	bit = BIT(spacemit_gpio_to_bank_offset(gpio));
+
+	bank->irq_mask &= ~bit;
+
+	spacemit_clear_edge_detection(bank, bit);
+}
+
+static void spacemit_unmask_muxed_gpio(struct irq_data *d)
+{
+	struct spacemit_gpio_chip *schip;
+	struct spacemit_gpio_bank *bank;
+	int gpio = irqd_to_hwirq(d);
+	u32 bit;
+
+	schip = irq_data_get_irq_chip_data(d);
+	bank = spacemit_gpio_get_bank(schip, gpio);
+	bit = BIT(spacemit_gpio_to_bank_offset(gpio));
+
+	bank->irq_mask |= bit;
+
+	spacemit_set_edge_detection(bank, bit);
+}
+
+static struct irq_chip spacemit_muxed_gpio_chip = {
+	.name		= "k1-gpio-irqchip",
+	.irq_ack	= spacemit_ack_muxed_gpio,
+	.irq_mask	= spacemit_mask_muxed_gpio,
+	.irq_unmask	= spacemit_unmask_muxed_gpio,
+	.irq_set_type	= spacemit_gpio_irq_type,
+	.flags		= IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int spacemit_irq_domain_map(struct irq_domain *d, unsigned int irq,
+				   irq_hw_number_t hw)
+{
+	irq_set_chip_data(irq, d->host_data);
+	irq_set_chip_and_handler(irq, &spacemit_muxed_gpio_chip,
+				 handle_edge_irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops spacemit_gpio_irq_domain_ops = {
+	.map	= spacemit_irq_domain_map,
+	.xlate	= irq_domain_xlate_twocell,
+};
+
+static int spacemit_gpio_probe_dt(struct platform_device *pdev,
+				  struct spacemit_gpio_chip *schip)
+{
+	void __iomem *reg;
+	int i, nbank;
+
+	nbank = ARRAY_SIZE(k1_gpio_bank_offset);
+
+	schip->banks = devm_kzalloc(&pdev->dev,
+				    sizeof(*schip->banks) * nbank,
+				    GFP_KERNEL);
+	if (!schip->banks)
+		return -ENOMEM;
+
+	for (i = 0; i < nbank; i++) {
+		reg = schip->reg_base + k1_gpio_bank_offset[i];
+		schip->banks[i].reg_bank = reg;
+	}
+
+	schip->nbank = nbank;
+	schip->ngpio = nbank * K1_BANK_GPIO_NUMBER;
+
+	return 0;
+}
+
+static void spacemit_gpio_remove_irq_domain(void *data)
+{
+	struct irq_domain *domain = data;
+
+	irq_domain_remove(domain);
+}
+
+static int spacemit_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np;
+	struct spacemit_gpio_chip *schip;
+	struct irq_domain *domain;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	np = pdev->dev.of_node;
+	if (!np)
+		return -EINVAL;
+
+	schip = devm_kzalloc(dev, sizeof(*schip), GFP_KERNEL);
+	if (!schip)
+		return -ENOMEM;
+
+	schip->irq = platform_get_irq(pdev, 0);
+	if (schip->irq < 0)
+		return schip->irq;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	schip->reg_base = base;
+
+	ret = spacemit_gpio_probe_dt(pdev, schip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Fail to initialize gpio unit\n");
+
+	spacemit_reset_edge_detection(schip);
+
+	domain = irq_domain_add_linear(np, schip->ngpio,
+				       &spacemit_gpio_irq_domain_ops,
+				       schip);
+	if (domain == NULL)
+		return -EINVAL;
+
+	ret = devm_add_action_or_reset(dev, spacemit_gpio_remove_irq_domain,
+				       domain);
+	if (ret)
+		return ret;
+
+	schip->domain			= domain;
+	schip->chip.label		= "k1-gpio";
+	schip->chip.parent		= dev;
+	schip->chip.request		= gpiochip_generic_request;
+	schip->chip.free		= gpiochip_generic_free;
+	schip->chip.direction_input	= spacemit_gpio_direction_input;
+	schip->chip.direction_output	= spacemit_gpio_direction_output;
+	schip->chip.get			= spacemit_gpio_get;
+	schip->chip.set			= spacemit_gpio_set;
+	schip->chip.to_irq		= spacemit_gpio_to_irq;
+#ifdef CONFIG_OF_GPIO
+	schip->chip.of_xlate		= spacemit_gpio_of_xlate;
+	schip->chip.of_gpio_n_cells	= 2;
+#endif
+	schip->chip.ngpio		= schip->ngpio;
+	schip->chip.base		= -1;
+
+	ret = devm_request_threaded_irq(dev, schip->irq, NULL,
+					spacemit_gpio_irq_handler,
+					IRQF_ONESHOT,
+					schip->chip.label, schip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to request high IRQ\n");
+
+	ret = devm_gpiochip_add_data(dev, &schip->chip, schip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to add gpiochip\n");
+
+	return 0;
+}
+
+static const struct of_device_id spacemit_gpio_dt_ids[] = {
+	{ .compatible = "spacemit,k1-gpio" },
+	{ /* sentinel */ },
+};
+
+static struct platform_driver spacemit_gpio_driver = {
+	.probe		= spacemit_gpio_probe,
+	.driver		= {
+		.name	= "k1-gpio",
+		.of_match_table = spacemit_gpio_dt_ids,
+	},
+};
+module_platform_driver(spacemit_gpio_driver);
+
+MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
+MODULE_LICENSE("GPL");

-- 
2.45.2


