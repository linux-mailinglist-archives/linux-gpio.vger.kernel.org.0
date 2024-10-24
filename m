Return-Path: <linux-gpio+bounces-11923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B69AE078
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 11:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F16D21F24112
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611B01B392E;
	Thu, 24 Oct 2024 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp63lQjx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB11B219E
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761672; cv=none; b=U0cImPuOlPVoln1DF1yyc5RTsvbK3Gr5JDw0BbDLS+STKrBQj0gpvwJiOYV6DR4EQ1TRZVxqUOfQRrQTcoQQ+1BbjrsWB9Ic4MenkcrMEd0H1l46IRlHsi5zEdsI+e0SB2j+KlQXuuzFtDS+ufAO8n5Wbdxie2kU2+zbgWyhjHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761672; c=relaxed/simple;
	bh=zPR2TeYyimdSUnjvaeqC0R1IRabUqpTFGVI2/hoVWxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fywRyP1AW3wYWpiRmFKmegbSUPtL4xdc9MG3tDVGuG0TPeqBRk8v6KohNmG7ic3429YbW1Y2pktm2odx//QfWumsC8dzAUwVa9Hr0ssVXjTECeaRh9vc1k7RXHrBR2dTBmkgcne8bXv0QUpMNLJoVvSPK2QFH49HIXVAEkjDnPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp63lQjx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B57BC4CEC7;
	Thu, 24 Oct 2024 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729761671;
	bh=zPR2TeYyimdSUnjvaeqC0R1IRabUqpTFGVI2/hoVWxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tp63lQjxQikm4bWH65zWo5H9FkamI2EZ8Cp6ctaGAnoIS93T9tXpglJ9gvR7yqx12
	 VUeE9aT/LZaVf809xQ5hlQ5dZCXNDmfzisn2uISsqqRT97UJWWwUYyKMK3jYbBTFIm
	 RrH4JqQp+yORsG7IUc6tzs5WmJ2r5669x1eahCWPRJV5po+Dv2kGxEzkFvvhCT63X1
	 FpQ2LY70K5vUE2wY503exeZ+DLlC+f/1BPmiQYqljS+6A4CgFKqFH82rIHfB4qe/+y
	 q4f9TdvCAeLyVlKjyeStTBzwKjDuFEhg8siQRN69+pFizUq5b7GLQr7mylg323Mrvo
	 IaHlrYv5iN+cw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: [PATCH v8 1/1] gpio: mpfs: add polarfire soc gpio support
Date: Thu, 24 Oct 2024 10:20:32 +0100
Message-ID: <20241024-dragster-research-0713e1733600@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-tipping-browse-c0d582b16a47@spud>
References: <20241024-tipping-browse-c0d582b16a47@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7396; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=L4iERC+5MpReXu/uO6lX7e6HlVYz6t3yTG4ID800XfY=; b=kA0DAAgWeLQxh6CCYtIByyZiAGcaEV/I/laHhp7wPIpmnKSgTQm9T7KG3KV/lbrs2c/4NPZAb Ih1BAAWCAAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmcaEV8ACgkQeLQxh6CCYtLp7AEArJXn +KJci0YnxfYVIptGaMiS99jvFrzn6z3lQT5hCNoA/1Qof+b3fU30BlONLpN3Z+LpdyQ4osDOKnN 54LGX9YoF
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller. Interrupt
controller support is unavailable for now and will be added at a later
date.

Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v8:
- drop interrupt support
- replace regular mmio acesses with regmap (nice complexity reduction)
- change mpfs_gpio_get() so that it can report non-zero when the line
  direction is output.
---
 drivers/gpio/Kconfig     |   7 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 178 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 186 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b40..fab9c4f73f62b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -549,6 +549,13 @@ config GPIO_PL061
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
+config GPIO_POLARFIRE_SOC
+	bool "Microchip FPGA GPIO support"
+	depends on OF_GPIO
+	select REGMAP_MMIO
+	help
+	  Say yes here to support the GPIO controllers on Microchip FPGAs.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1429e8c0229b9..fc66e6388c76c 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -133,6 +133,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
+obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
new file mode 100644
index 0000000000000..eaf65ddb6ad73
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * Microchip PolarFire SoC (MPFS) GPIO controller driver
+ *
+ * Copyright (c) 2018-2024 Microchip Technology Inc. and its subsidiaries
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define MPFS_GPIO_CTRL(i)		(0x4 * (i))
+#define MAX_NUM_GPIO			32
+#define MPFS_GPIO_EN_INT		3
+#define MPFS_GPIO_EN_OUT_BUF		BIT(2)
+#define MPFS_GPIO_EN_IN			BIT(1)
+#define MPFS_GPIO_EN_OUT		BIT(0)
+#define MPFS_GPIO_DIR_MASK		GENMASK(2, 0)
+
+#define MPFS_GPIO_TYPE_INT_EDGE_BOTH	0x80
+#define MPFS_GPIO_TYPE_INT_EDGE_NEG	0x60
+#define MPFS_GPIO_TYPE_INT_EDGE_POS	0x40
+#define MPFS_GPIO_TYPE_INT_LEVEL_LOW	0x20
+#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
+#define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
+#define MPFS_IRQ_REG			0x80
+#define MPFS_INP_REG			0x84
+#define MPFS_OUTP_REG			0x88
+
+struct mpfs_gpio_chip {
+	struct clk *clk;
+	struct regmap *regs;
+	struct gpio_chip gc;
+};
+
+static const struct regmap_config mpfs_gpio_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+};
+
+static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
+
+	return 0;
+}
+
+static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
+	regmap_update_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index),
+			   value << gpio_index);
+
+	return 0;
+}
+
+static int mpfs_gpio_get_direction(struct gpio_chip *gc,
+				   unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	unsigned int gpio_cfg;
+
+	regmap_read(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index), &gpio_cfg);
+	if (gpio_cfg & MPFS_GPIO_EN_IN)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int mpfs_gpio_get(struct gpio_chip *gc, unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	if (mpfs_gpio_get_direction(gc, gpio_index) == GPIO_LINE_DIRECTION_OUT)
+		return regmap_test_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index));
+	else
+		return regmap_test_bits(mpfs_gpio->regs, MPFS_INP_REG, BIT(gpio_index));
+}
+
+static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	mpfs_gpio_get(gc, gpio_index);
+
+	regmap_update_bits(mpfs_gpio->regs, MPFS_OUTP_REG, BIT(gpio_index),
+			   value << gpio_index);
+
+	mpfs_gpio_get(gc, gpio_index);
+}
+
+static int mpfs_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_gpio_chip *mpfs_gpio;
+	struct clk *clk;
+	void __iomem *base;
+	int ret, ngpios;
+
+	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
+	if (!mpfs_gpio)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base), "failed to ioremap memory resource\n");
+
+	mpfs_gpio->regs = devm_regmap_init_mmio(dev, base, &mpfs_gpio_regmap_config);
+	if (IS_ERR(mpfs_gpio->regs))
+		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->regs),
+				     "failed to initialise regmap\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to get and enable clock\n");
+
+	mpfs_gpio->clk = clk;
+
+	ngpios = MAX_NUM_GPIO;
+	device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ngpios > MAX_NUM_GPIO)
+		ngpios = MAX_NUM_GPIO;
+
+	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
+	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
+	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
+	mpfs_gpio->gc.get = mpfs_gpio_get;
+	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.base = -1;
+	mpfs_gpio->gc.ngpio = ngpios;
+	mpfs_gpio->gc.label = dev_name(dev);
+	mpfs_gpio->gc.parent = dev;
+	mpfs_gpio->gc.owner = THIS_MODULE;
+
+	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, mpfs_gpio);
+
+	return 0;
+}
+
+static void mpfs_gpio_remove(struct platform_device *pdev)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&mpfs_gpio->gc);
+}
+
+static const struct of_device_id mpfs_gpio_of_ids[] = {
+	{ .compatible = "microchip,mpfs-gpio", },
+	{ /* end of list */ }
+};
+
+static struct platform_driver mpfs_gpio_driver = {
+	.probe = mpfs_gpio_probe,
+	.driver = {
+		.name = "microchip,mpfs-gpio",
+		.of_match_table = mpfs_gpio_of_ids,
+	},
+	.remove = mpfs_gpio_remove,
+};
+builtin_platform_driver(mpfs_gpio_driver);
-- 
2.45.2


