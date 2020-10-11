Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5D028A512
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Oct 2020 04:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730596AbgJKCsy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 10 Oct 2020 22:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730555AbgJKCsx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 10 Oct 2020 22:48:53 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F404C0613D2
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id o9so6560442plx.10
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2020 19:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rANiLqt/zQ4tvIOV7K+o0+9OvmPkqZO/G9+3k0DVVr8=;
        b=WDylSKKxX3GcxhV6fFoSS9CXEv/foEH9Ad8+mBRA47lTpvepbhTMO8lPKPDHk00QjO
         b7wVuz/nsiCaMZQgIenWztJhphKN5lEZ59rfmBCmu8xpLJaUvNa2TjKxhEox7P+mvYUL
         5u3QfHMGYWXLLyY5tN07QvIDENolYxwx2QrMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rANiLqt/zQ4tvIOV7K+o0+9OvmPkqZO/G9+3k0DVVr8=;
        b=r7qcmXkm+c6bRajSGLwZWAqhMXPtWygtd0qUG3qR1lFNElo7y0H16K4DOSriZr24sd
         hnSSOH7LKga44r3pWwrEf/RKMpq0j4G3tRQttMxft1CYjMbxlV/IuO1njVRxuBXt/UBU
         KdC4/q6Zc3S3NndT+FH2o4iHkG2pfMo71ZNRWiiE4tb0XdGfGAAAhBhvZygVpZSv6H7Z
         6ooMldSVJ+W7a/zuvuk/mmGmkMUPm/plOEcZe9DkKhkBgrM7qmennyeoeA32qN3mxGaM
         oqdJQhONdNjuecfrc/CgVA2oGcYf9HWkEsTEfaHkLgNJ12/mRlVXaqWcXSBT0YxfwJ+f
         VQhg==
X-Gm-Message-State: AOAM531PIAeffUkAbqbZtXC90jnD8U9gijkGXUeX/u5IgremC0dLcuss
        ScIY1Wup5u4fmYNRFJe/aLp8DntSbOIszQ==
X-Google-Smtp-Source: ABdhPJyuzQ85Ed+eQShEmPshYbvCzWButA16V4LNmDjl6v7JTCudtqxiDOzKhrCoSOV06zpOVemoiQ==
X-Received: by 2002:a17:902:7fcd:b029:d3:f037:d9dc with SMTP id t13-20020a1709027fcdb02900d3f037d9dcmr17775492plb.79.1602384530636;
        Sat, 10 Oct 2020 19:48:50 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id z25sm14832836pgl.6.2020.10.10.19.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 19:48:49 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/5] gpio: msc313: MStar MSC313 GPIO driver
Date:   Sun, 11 Oct 2020 11:48:29 +0900
Message-Id: <20201011024831.3868571-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201011024831.3868571-1-daniel@0x0f.com>
References: <20201011024831.3868571-1-daniel@0x0f.com>
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
 drivers/gpio/gpio-msc313.c | 341 +++++++++++++++++++++++++++++++++++++
 4 files changed, 352 insertions(+)
 create mode 100644 drivers/gpio/gpio-msc313.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ec5b49b9955f..d20e8935dd4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2158,6 +2158,7 @@ F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
+F:	drivers/gpio/gpio-msc313.c
 F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8030fd91a3cc..d85226cb2a07 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -712,6 +712,15 @@ config GPIO_AMD_FCH
 	  Note: This driver doesn't registers itself automatically, as it
 	  needs to be provided with platform specific configuration.
 	  (See eg. CONFIG_PCENGINES_APU2.)
+
+config GPIO_MSC313
+	bool "MStar MSC313 GPIO support"
+	default y if ARCH_MSTARV7
+	depends on ARCH_MSTARV7
+	select GPIO_GENERIC
+	help
+	  Say Y here to support GPIO on MStar MSC313 and later SoCs.
+
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 4f9abff4f2dc..7c675b502cc4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_GPIO_MOCKUP)		+= gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXTET)		+= gpio-moxtet.o
 obj-$(CONFIG_GPIO_MPC5200)		+= gpio-mpc5200.o
 obj-$(CONFIG_GPIO_MPC8XXX)		+= gpio-mpc8xxx.o
+obj-$(CONFIG_GPIO_MSC313)		+= gpio-msc313.o
 obj-$(CONFIG_GPIO_MSIC)			+= gpio-msic.o
 obj-$(CONFIG_GPIO_MT7621)		+= gpio-mt7621.o
 obj-$(CONFIG_GPIO_MVEBU)		+= gpio-mvebu.o
diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
new file mode 100644
index 000000000000..6bdab77674ae
--- /dev/null
+++ b/drivers/gpio/gpio-msc313.c
@@ -0,0 +1,341 @@
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
+
+#define DRIVER_NAME "gpio-msc313"
+
+#define MSC313_GPIO_IN  BIT(0)
+#define MSC313_GPIO_OUT BIT(4)
+#define MSC313_GPIO_OEN BIT(5)
+
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
+	int *irqs;
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
+static int msc313_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct msc313_gpio *gpio = gpiochip_get_data(chip);
+
+	return gpio->irqs[offset];
+}
+
+static int msc313_gpio_probe(struct platform_device *pdev)
+{
+	int i, ret;
+	const struct msc313_gpio_data *match_data;
+	struct msc313_gpio *gpio;
+	struct resource *res;
+	struct gpio_chip *gpiochip;
+
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (!match_data)
+		return -EINVAL;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->gpio_data = match_data;
+
+	gpio->irqs = devm_kzalloc(&pdev->dev, gpio->gpio_data->num * sizeof(*gpio->irqs), GFP_KERNEL);
+	if (!gpio->irqs)
+		return -ENOMEM;
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
+	gpiochip->to_irq = msc313_gpio_to_irq;
+	gpiochip->base = -1;
+	gpiochip->ngpio = gpio->gpio_data->num;
+	gpiochip->names = gpio->gpio_data->names;
+
+	for (i = 0; i < gpiochip->ngpio; i++)
+		gpio->irqs[i] = of_irq_get_byname(pdev->dev.of_node, gpio->gpio_data->names[i]);
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
+ * SoC goes into "DRAM self-refresh low power" mode so we need to
+ * save the direction and value before suspending and put it back
+ * when resuming.
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
2.27.0

