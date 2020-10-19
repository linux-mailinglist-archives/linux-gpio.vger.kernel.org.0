Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CB6292901
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 16:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgJSOK0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 10:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729329AbgJSOKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 10:10:25 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7045FC0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:24 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 1so5051368ple.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5rPKt1LwXecMgA/aUeoArPTkPYIqvjmfoxEeqlJkKk=;
        b=r8kovHa3T7+YriOL07aafDoKEIOmgG5TYVIaUGzmSM5b7dCR3rGWZ2LojYPO4q5Ttl
         dM/W4wmdfY6ArFSDE+X0Nk6IXPI6fSSV1TwqLr6oDi/7YwiJxXTC/onPSJ7kSGWTL5gv
         5sZJ+7ztNq/HiWkYtzQ0d3Al8YJ7FKEsSMfLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5rPKt1LwXecMgA/aUeoArPTkPYIqvjmfoxEeqlJkKk=;
        b=dFmKEnClne6V9MEvGKjP72gVV8e2Z450vv/61jjB7qbXyuBFwuBItoG9yONl0EINV1
         IwwkGjOg1ha9nogUUMkPyed9E/0GwRjpsBnoWIchIdiCz8BzE2+9jF5bSsgWN7JIlgqz
         2+vDQA679SDBY03RzJ/8I2M1wlmJ2m+c3C8iaRPSaarO5x7bJ7KlDcIAen/wn3m4xgc0
         dL4JQyaZmT5tbMZN0kCgkQwJeMoMp6/5S0q7OAujWhtGjmA7DgnNHzad6b8sFUverGzy
         DN6fKV7volAUzrtkoooOeH8cquP+13jaa4IdZG2/FB3Gjgvwee6k7lQDujvnGo7smHgZ
         tr+g==
X-Gm-Message-State: AOAM533pcBjBdrlNo5LVkGol2Nh6FqnlFk1A6QJJ8PA6Hz2pLLi88den
        Uc+f34wn6ufbrGfNbKXL/m/pg3FL7pFSYw==
X-Google-Smtp-Source: ABdhPJx2kuN89wNsZVVMc+QW6hWY8xLrzX1QED9mfciOIoiTmcAY73n1lOm6+A5TGQP/9Hdzp0Vh6A==
X-Received: by 2002:a17:90a:668e:: with SMTP id m14mr17237707pjj.61.1603116623430;
        Mon, 19 Oct 2020 07:10:23 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 131sm78999pfy.5.2020.10.19.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:10:22 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 3/5] gpio: msc313: MStar MSC313 GPIO driver
Date:   Mon, 19 Oct 2020 23:10:06 +0900
Message-Id: <20201019141008.871177-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019141008.871177-1-daniel@0x0f.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds a driver that supports the GPIO block found in
MStar/SigmaStar ARMv7 SoCs.

The controller seems to support 128 lines but where they
are wired up differs between chips and no currently known
chip uses anywhere near 128 lines so there needs to be some
per-chip data to collect together what lines actually have
physical pins attached and map the right names to them.

The core peripherals seem to use the same lines on the
currently known chips but the lines used for the sensor
interface, lcd controller etc pins seem to be totally
different between the infinity and mercury chips

The code tries to collect all of the re-usable names,
offsets etc together so that it's easy to build the extra
per-chip data for other chips in the future.

So far this only supports the MSC313 and MSC313E chips.

Support for the SSC8336N (mercury5) is trivial to add once
all of the lines have been mapped out.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                |   1 +
 drivers/gpio/Kconfig       |   9 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-msc313.c | 406 +++++++++++++++++++++++++++++++++++++
 4 files changed, 417 insertions(+)
 create mode 100644 drivers/gpio/gpio-msc313.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 102aedca81dc..86b16452c505 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2133,6 +2133,7 @@ F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
+F:	drivers/gpio/gpio-msc313.c
 F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..64160cc0a477 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -737,6 +737,15 @@ config GPIO_AMD_FCH
 	  Note: This driver doesn't registers itself automatically, as it
 	  needs to be provided with platform specific configuration.
 	  (See eg. CONFIG_PCENGINES_APU2.)
+
+config GPIO_MSC313
+	bool "MStar MSC313 GPIO support"
+	default y if ARCH_MSTARV7
+	depends on ARCH_MSTARV7
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support GPIO on MStar MSC313 and later SoCs.
+
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 09dada80ac34..b6c116a7c785 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_GPIO_MOCKUP)		+= gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXTET)		+= gpio-moxtet.o
 obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
+obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
 obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
new file mode 100644
index 000000000000..2751ee520b86
--- /dev/null
+++ b/drivers/gpio/gpio-msc313.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Daniel Palmer<daniel@thingy.jp>
+ */
+
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/gpio/driver.h>
+
+#include <dt-bindings/gpio/msc313-gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#define DRIVER_NAME "gpio-msc313"
+
+#define MSC313_GPIO_IN  BIT(0)
+#define MSC313_GPIO_OUT BIT(4)
+#define MSC313_GPIO_OEN BIT(5)
+
+/* These bits need to be saved to correctly restore the
+ * gpio state when resuming from suspend to memory.
+ */
+#define MSC313_GPIO_BITSTOSAVE (MSC313_GPIO_OUT | MSC313_GPIO_OEN)
+
+#define FUART_NAMES			\
+	MSC313_PINNAME_FUART_RX,	\
+	MSC313_PINNAME_FUART_TX,	\
+	MSC313_PINNAME_FUART_CTS,	\
+	MSC313_PINNAME_FUART_RTS
+
+#define OFF_FUART_RX	0x50
+#define OFF_FUART_TX	0x54
+#define OFF_FUART_CTS	0x58
+#define OFF_FUART_RTS	0x5c
+
+#define FUART_OFFSETS	\
+	OFF_FUART_RX,	\
+	OFF_FUART_TX,	\
+	OFF_FUART_CTS,	\
+	OFF_FUART_RTS
+
+#define SR_NAMES		\
+	MSC313_PINNAME_SR_IO2,	\
+	MSC313_PINNAME_SR_IO3,	\
+	MSC313_PINNAME_SR_IO4,	\
+	MSC313_PINNAME_SR_IO5,	\
+	MSC313_PINNAME_SR_IO6,	\
+	MSC313_PINNAME_SR_IO7,	\
+	MSC313_PINNAME_SR_IO8,	\
+	MSC313_PINNAME_SR_IO9,	\
+	MSC313_PINNAME_SR_IO10,	\
+	MSC313_PINNAME_SR_IO11,	\
+	MSC313_PINNAME_SR_IO12,	\
+	MSC313_PINNAME_SR_IO13,	\
+	MSC313_PINNAME_SR_IO14,	\
+	MSC313_PINNAME_SR_IO15,	\
+	MSC313_PINNAME_SR_IO16,	\
+	MSC313_PINNAME_SR_IO17
+
+#define OFF_SR_IO2	0x88
+#define OFF_SR_IO3	0x8c
+#define OFF_SR_IO4	0x90
+#define OFF_SR_IO5	0x94
+#define OFF_SR_IO6	0x98
+#define OFF_SR_IO7	0x9c
+#define OFF_SR_IO8	0xa0
+#define OFF_SR_IO9	0xa4
+#define OFF_SR_IO10	0xa8
+#define OFF_SR_IO11	0xac
+#define OFF_SR_IO12	0xb0
+#define OFF_SR_IO13	0xb4
+#define OFF_SR_IO14	0xb8
+#define OFF_SR_IO15	0xbc
+#define OFF_SR_IO16	0xc0
+#define OFF_SR_IO17	0xc4
+
+#define SR_OFFSETS	\
+	OFF_SR_IO2,	\
+	OFF_SR_IO3,	\
+	OFF_SR_IO4,	\
+	OFF_SR_IO5,	\
+	OFF_SR_IO6,	\
+	OFF_SR_IO7,	\
+	OFF_SR_IO8,	\
+	OFF_SR_IO9,	\
+	OFF_SR_IO10,	\
+	OFF_SR_IO11,	\
+	OFF_SR_IO12,	\
+	OFF_SR_IO13,	\
+	OFF_SR_IO14,	\
+	OFF_SR_IO15,	\
+	OFF_SR_IO16,	\
+	OFF_SR_IO17
+
+#define SD_NAMES		\
+	MSC313_PINNAME_SD_CLK,	\
+	MSC313_PINNAME_SD_CMD,	\
+	MSC313_PINNAME_SD_D0,	\
+	MSC313_PINNAME_SD_D1,	\
+	MSC313_PINNAME_SD_D2,	\
+	MSC313_PINNAME_SD_D3
+
+#define OFF_SD_CLK	0x140
+#define OFF_SD_CMD	0x144
+#define OFF_SD_D0	0x148
+#define OFF_SD_D1	0x14c
+#define OFF_SD_D2	0x150
+#define OFF_SD_D3	0x154
+
+#define SD_OFFSETS	\
+	OFF_SD_CLK,	\
+	OFF_SD_CMD,	\
+	OFF_SD_D0,	\
+	OFF_SD_D1,	\
+	OFF_SD_D2,	\
+	OFF_SD_D3
+
+#define I2C1_NAMES			\
+	MSC313_PINNAME_I2C1_SCL,	\
+	MSC313_PINNAME_I2C1_SCA
+
+#define OFF_I2C1_SCL	0x188
+#define OFF_I2C1_SCA	0x18c
+
+#define I2C1_OFFSETS	\
+	OFF_I2C1_SCL,	\
+	OFF_I2C1_SCA
+
+#define SPI0_NAMES		\
+	MSC313_PINNAME_SPI0_CZ,	\
+	MSC313_PINNAME_SPI0_CK,	\
+	MSC313_PINNAME_SPI0_DI,	\
+	MSC313_PINNAME_SPI0_DO
+
+#define OFF_SPI0_CZ	0x1c0
+#define OFF_SPI0_CK	0x1c4
+#define OFF_SPI0_DI	0x1c8
+#define OFF_SPI0_DO	0x1cc
+
+#define SPI0_OFFSETS	\
+	OFF_SPI0_CZ,	\
+	OFF_SPI0_CK,	\
+	OFF_SPI0_DI,	\
+	OFF_SPI0_DO
+
+struct msc313_gpio_data {
+	const char * const *names;
+	const unsigned int *offsets;
+	const unsigned int num;
+};
+
+#define MSC313_GPIO_CHIPDATA(_chip) \
+static const struct msc313_gpio_data _chip##_data = { \
+	.names = _chip##_names, \
+	.offsets = _chip##_offsets, \
+	.num = ARRAY_SIZE(_chip##_offsets), \
+}
+
+#ifdef CONFIG_MACH_INFINITY
+static const char * const msc313_names[] = {
+	FUART_NAMES,
+	SR_NAMES,
+	SD_NAMES,
+	I2C1_NAMES,
+	SPI0_NAMES,
+};
+
+static const unsigned int msc313_offsets[] = {
+	FUART_OFFSETS,
+	SR_OFFSETS,
+	SD_OFFSETS,
+	I2C1_OFFSETS,
+	SPI0_OFFSETS,
+};
+
+MSC313_GPIO_CHIPDATA(msc313);
+#endif
+
+struct msc313_gpio {
+	void __iomem *base;
+	const struct msc313_gpio_data *gpio_data;
+	u8 *saved;
+};
+
+static void msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct msc313_gpio *gpio = gpiochip_get_data(chip);
+	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
+
+	if (value)
+		gpioreg |= MSC313_GPIO_OUT;
+	else
+		gpioreg &= ~MSC313_GPIO_OUT;
+
+	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+}
+
+static int msc313_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct msc313_gpio *gpio = gpiochip_get_data(chip);
+
+	return readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset])
+			& MSC313_GPIO_IN;
+}
+
+static int msc313_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct msc313_gpio *gpio = gpiochip_get_data(chip);
+	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
+
+	gpioreg |= MSC313_GPIO_OEN;
+	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+
+	return 0;
+}
+
+static int msc313_gpio_direction_output(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct msc313_gpio *gpio = gpiochip_get_data(chip);
+	u8 gpioreg = readb_relaxed(gpio->base + gpio->gpio_data->offsets[offset]);
+
+	gpioreg &= ~MSC313_GPIO_OEN;
+	if (value)
+		gpioreg |= MSC313_GPIO_OUT;
+	else
+		gpioreg &= ~MSC313_GPIO_OUT;
+	writeb_relaxed(gpioreg, gpio->base + gpio->gpio_data->offsets[offset]);
+
+	return 0;
+}
+
+/*
+ * The interrupt handling happens in the parent interrupt controller,
+ * we don't do anything here.
+ */
+static struct irq_chip msc313_gpio_irqchip = {
+	.name = "GPIO",
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_set_type = irq_chip_set_type_parent,
+};
+
+/* The parent interrupt controller needs the GIC interrupt type set to GIC_SPI
+ * so we need to provide the fwspec. Essentially gpiochip_populate_parent_fwspec_twocell
+ * that puts GIC_SPI into the first cell.
+ */
+static void *msc313_gpio_populate_parent_fwspec(struct gpio_chip *gc,
+					     unsigned int parent_hwirq,
+					     unsigned int parent_type)
+{
+	struct irq_fwspec *fwspec;
+
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = gc->irq.parent_domain->fwnode;
+	fwspec->param_count = 3;
+	fwspec->param[0] = GIC_SPI;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = parent_type;
+
+	return fwspec;
+}
+
+static int msc313e_gpio_child_to_parent_hwirq(struct gpio_chip *chip,
+					     unsigned int child,
+					     unsigned int child_type,
+					     unsigned int *parent,
+					     unsigned int *parent_type)
+{
+	struct msc313_gpio *priv = gpiochip_get_data(chip);
+	unsigned int offset = priv->gpio_data->offsets[child];
+	int ret = -EINVAL;
+
+	/* only the spi0 pins have interrupts on the parent
+	 * on all of the known chips and so far they are all
+	 * mapped to the same place
+	 */
+	if (offset >= OFF_SPI0_CZ && offset <= OFF_SPI0_DO) {
+		*parent_type = child_type;
+		*parent = ((offset - OFF_SPI0_CZ) >> 2) + 28;
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int msc313_gpio_probe(struct platform_device *pdev)
+{
+	const struct msc313_gpio_data *match_data;
+	struct msc313_gpio *gpio;
+	struct gpio_chip *gpiochip;
+	struct gpio_irq_chip *gpioirqchip;
+	struct resource *res;
+	struct irq_domain *parent_domain;
+	struct device_node *parent_node;
+	int ret;
+
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (!match_data)
+		return -EINVAL;
+
+	parent_node = of_irq_find_parent(pdev->dev.of_node);
+	if (!parent_node)
+		return -ENODEV;
+
+	parent_domain = irq_find_host(parent_node);
+	if (!parent_domain)
+		return -ENODEV;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->gpio_data = match_data;
+
+	gpio->saved = devm_kzalloc(&pdev->dev, gpio->gpio_data->num * sizeof(*gpio->saved), GFP_KERNEL);
+	if (!gpio->saved)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, gpio);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
+
+	gpiochip = devm_kzalloc(&pdev->dev, sizeof(*gpiochip), GFP_KERNEL);
+	if (!gpiochip)
+		return -ENOMEM;
+
+	gpiochip->label = DRIVER_NAME;
+	gpiochip->parent = &pdev->dev;
+	gpiochip->request = gpiochip_generic_request;
+	gpiochip->free = gpiochip_generic_free;
+	gpiochip->direction_input = msc313_gpio_direction_input;
+	gpiochip->direction_output = msc313_gpio_direction_output;
+	gpiochip->get = msc313_gpio_get;
+	gpiochip->set = msc313_gpio_set;
+	gpiochip->base = -1;
+	gpiochip->ngpio = gpio->gpio_data->num;
+	gpiochip->names = gpio->gpio_data->names;
+
+	gpioirqchip = &gpiochip->irq;
+	gpioirqchip->chip = &msc313_gpio_irqchip;
+	gpioirqchip->fwnode = of_node_to_fwnode(pdev->dev.of_node);
+	gpioirqchip->parent_domain = parent_domain;
+	gpioirqchip->child_to_parent_hwirq = msc313e_gpio_child_to_parent_hwirq;
+	gpioirqchip->populate_parent_alloc_arg = msc313_gpio_populate_parent_fwspec;
+	gpioirqchip->handler = handle_bad_irq;
+	gpioirqchip->default_type = IRQ_TYPE_NONE;
+
+	ret = gpiochip_add_data(gpiochip, gpio);
+	return ret;
+}
+
+static const struct of_device_id msc313_gpio_of_match[] = {
+#ifdef CONFIG_MACH_INFINITY
+	{
+		.compatible = "mstar,msc313-gpio",
+		.data = &msc313_data,
+	},
+#endif
+	{ }
+};
+
+/* The GPIO controller loses the state of the registers when the
+ * SoC goes into suspend to memory mode so we need to save some
+ * of the register bits before suspending and put it back when resuming
+ */
+
+static int __maybe_unused msc313_gpio_suspend(struct device *dev)
+{
+	struct msc313_gpio *gpio = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < gpio->gpio_data->num; i++)
+		gpio->saved[i] = readb_relaxed(gpio->base + gpio->gpio_data->offsets[i]) & MSC313_GPIO_BITSTOSAVE;
+
+	return 0;
+}
+
+static int __maybe_unused msc313_gpio_resume(struct device *dev)
+{
+	struct msc313_gpio *gpio = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < gpio->gpio_data->num; i++)
+		writeb_relaxed(gpio->saved[i], gpio->base + gpio->gpio_data->offsets[i]);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(msc313_gpio_ops, msc313_gpio_suspend, msc313_gpio_resume);
+
+static struct platform_driver msc313_gpio_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = msc313_gpio_of_match,
+		.pm = &msc313_gpio_ops,
+	},
+	.probe = msc313_gpio_probe,
+};
+
+builtin_platform_driver(msc313_gpio_driver);
-- 
2.28.0

