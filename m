Return-Path: <linux-gpio+bounces-12510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC169BB03F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 10:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63FCBB25C2A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2024 09:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747F11AF0BA;
	Mon,  4 Nov 2024 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QltZcFNf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC331ABEDC
	for <linux-gpio@vger.kernel.org>; Mon,  4 Nov 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730713790; cv=none; b=tQagbLH2YesiRj1D6V5ZBMWSknAw31zWbjNTQFwZfU9YzS5HyottINnLjbmlyq7Mejj/zLv8iwYkyxrVs9M4T4/9Ox1/y2x1UvHSSCqSkK+R67L8ekcm9tKkAD+c8AVSZNJ4gJW7BLyJzCndIybicVmTvRaB6/G42mBVFRZSdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730713790; c=relaxed/simple;
	bh=LorllmCqSrQZzEcqeOyW0BYWgBp5gKCeVg2WTy7Lci8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1CP+Dha/nBGdUnLPnf4BGzJ/9lNTKZ3XE71KDSrqjbvo5Drcc4HxMb/Gflc7CncbkDMszUOiFDu9zN4Yv5WO0BL64CiiBGNgnqDhCgqwIB6B+hSoYIo+gQzTa45sI85RR1V3dGzmWooc5lyePhYHEzcxwY3LKZ/b1z65KPn3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QltZcFNf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107CDC4CECE;
	Mon,  4 Nov 2024 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730713789;
	bh=LorllmCqSrQZzEcqeOyW0BYWgBp5gKCeVg2WTy7Lci8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QltZcFNfkmV6hviI738w5m515w/n8Mz8VO8UjlbakMshpSYz161k+Fq8KY8+NRsQs
	 k24K6ViIm5S2z9umoLD6JAlUWa+B95Y5XLQfCoRn0MsRiC2ZeiIZ+RWz6MAiW/ps59
	 OtKIAY6/Nv8WA7JK2cpFCDwLBB9SsoY+owMcNC6xvCkRXkOym8mhwo2PWwDNFTn669
	 zaCWyCcuvf/cBllr4a9cwxSaFQ+Dwxt2irReF/82FJLrgvnV8ziE1x1UcDpof4LiOQ
	 kwmyqyxO8fJBVxF+68S/2BMAYYTDJdEySu3+82nk7Pet54SCaJrH4SrjbdHQyDCtBZ
	 Aj5IE03uiHPBA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: [PATCH v10 1/1] gpio: mpfs: add polarfire soc gpio support
Date: Mon,  4 Nov 2024 09:49:33 +0000
Message-ID: <20241104-tiny-evaluate-9336020b4b6a@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104-obtain-grandly-1daad5ac36b9@spud>
References: <20241104-obtain-grandly-1daad5ac36b9@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7246; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VzKvqExFTlC04asSP3wp1ijdkCShi39kuCpNNFQ/bEs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkaMzaUFkXcVnGaEahTcebH5SkcdqYSeYeYFMqvS/mcj 69YVrero5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPZasjwz8hZLy1h11rTz48c +lf5NffoFEabfrUS19PsZmTYO6FkLsM/pcjTjy6cCin5cCvvaNbDFr5N1a/fuB2Lv3/nf3/8wUu hDAA=
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
v10:
- drop useless platform_get_drvdata() left dangling by v9
- don't include of.h
- stop storing a clk pointer in private data

v9:
- remove remove()
- drop OF_GPIO from kconfig
- add a prefix to MAX_NUM_GPIO

v8:
- drop interrupt support
- replace regular mmio acesses with regmap (nice complexity reduction)
- change mpfs_gpio_get() so that it can report non-zero when the line
  direction is output.
---
 drivers/gpio/Kconfig     |   6 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 160 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d93cd4f722b4..811263b033c8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -549,6 +549,12 @@ config GPIO_PL061
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
+config GPIO_POLARFIRE_SOC
+	bool "Microchip FPGA GPIO support"
+	select REGMAP_MMIO
+	help
+	  Say yes here to support the GPIO controllers on Microchip FPGAs.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1429e8c0229b..fc66e6388c76 100644
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
index 000000000000..3718121eb97a
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,160 @@
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
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define MPFS_GPIO_CTRL(i)		(0x4 * (i))
+#define MPFS_MAX_NUM_GPIO		32
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
+	int ngpios;
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
+	ngpios = MPFS_MAX_NUM_GPIO;
+	device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ngpios > MPFS_MAX_NUM_GPIO)
+		ngpios = MPFS_MAX_NUM_GPIO;
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
+	return devm_gpiochip_add_data(dev, &mpfs_gpio->gc, mpfs_gpio);
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
+};
+builtin_platform_driver(mpfs_gpio_driver);
-- 
2.45.2


