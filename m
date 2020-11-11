Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1B52AEC1B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 09:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgKKIeC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 03:34:02 -0500
Received: from mo-csw-fb1516.securemx.jp ([210.130.202.172]:41870 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgKKIeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 03:34:01 -0500
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1516) id 0AB8RLMw029490; Wed, 11 Nov 2020 17:27:21 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 0AB8RAf8029352; Wed, 11 Nov 2020 17:27:10 +0900
X-Iguazu-Qid: 34ts1bXBCWNx5lGpLG
X-Iguazu-QSIG: v=2; s=0; t=1605083230; q=34ts1bXBCWNx5lGpLG; m=sg7wuxs2jsQQBFDTvCm9P547QkMobmb9beTKpiAmDUg=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1513) id 0AB8R9Ii025832;
        Wed, 11 Nov 2020 17:27:09 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0AB8R96o007010;
        Wed, 11 Nov 2020 17:27:09 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0AB8R8sD032536;
        Wed, 11 Nov 2020 17:27:09 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 2/4] gpio: visoconti: Add Toshiba Visconti GPIO support
Date:   Thu, 12 Nov 2020 02:25:51 +0900
X-TSB-HOP: ON
Message-Id: <20201111172553.1369282-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201111172553.1369282-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIO driver for Toshiba Visconti ARM SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/gpio/Kconfig                      |   8 +
 drivers/gpio/Makefile                     |   1 +
 drivers/gpio/gpio-visconti.c              | 287 ++++++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c |  23 ++
 4 files changed, 319 insertions(+)
 create mode 100644 drivers/gpio/gpio-visconti.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..fd8bd229b0c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -631,6 +631,14 @@ config GPIO_VF610
 	help
 	  Say yes here to support Vybrid vf610 GPIOs.
 
+config GPIO_VISCONTI
+	tristate "Toshiba Visconti GPIO support"
+	depends on ARCH_VISCONTI || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support GPIO on Tohisba Visconti.
+
 config GPIO_VR41XX
 	tristate "NEC VR4100 series General-purpose I/O Uint support"
 	depends on CPU_VR41XX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 09dada80ac34..02c9d8d83a54 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -162,6 +162,7 @@ obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
+obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
diff --git a/drivers/gpio/gpio-visconti.c b/drivers/gpio/gpio-visconti.c
new file mode 100644
index 000000000000..e12f53ad1a0b
--- /dev/null
+++ b/drivers/gpio/gpio-visconti.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Toshiba Visconti GPIO Support
+ *
+ * (C) Copyright 2020 Toshiba Electronic Devices & Storage Corporation
+ * (C) Copyright 2020 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/gpio/driver.h>
+#include <linux/of.h>
+#include <linux/bitops.h>
+
+/* register offset */
+#define GPIO_DIR	0x00
+#define GPIO_IDATA	0x08
+#define GPIO_ODATA	0x10
+#define GPIO_OSET	0x18
+#define GPIO_OCLR	0x20
+#define GPIO_INTMODE	0x30
+
+#define VISCONTI_GPIO_NR	32
+
+struct visconti_gpio {
+	void __iomem *base;
+	int *irq;
+	spinlock_t lock; /* protect gpio register */
+	struct device *dev;
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+};
+
+static void visconti_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct visconti_gpio *priv = gpiochip_get_data(gc);
+
+	disable_irq_nosync(priv->irq[irqd_to_hwirq(d)]);
+}
+
+static void visconti_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct visconti_gpio *priv = gpiochip_get_data(gc);
+
+	enable_irq(priv->irq[irqd_to_hwirq(d)]);
+}
+
+static int visconti_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct visconti_gpio *priv = gpiochip_get_data(gc);
+	u32 offset = irqd_to_hwirq(d);
+	u32 bit = BIT(offset);
+	u32 intc_type = IRQ_TYPE_EDGE_RISING;
+	u32 intmode, odata;
+	int ret = 0;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	odata = readl(priv->base + GPIO_ODATA);
+	intmode = readl(priv->base + GPIO_INTMODE);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		odata &= ~bit;
+		intmode &= ~bit;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		odata |= bit;
+		intmode &= ~bit;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		intmode |= bit;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		intc_type = IRQ_TYPE_LEVEL_HIGH;
+		odata &= ~bit;
+		intmode &= ~bit;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		intc_type = IRQ_TYPE_LEVEL_HIGH;
+		odata |= bit;
+		intmode &= ~bit;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err;
+	}
+
+	writel(odata, priv->base + GPIO_ODATA);
+	writel(intmode, priv->base + GPIO_INTMODE);
+	irq_set_irq_type(priv->irq[offset], intc_type);
+err:
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return ret;
+}
+
+static irqreturn_t visconti_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct visconti_gpio *priv = dev_id;
+	u32 offset = irq - priv->irq[0];
+
+	generic_handle_irq(irq_find_mapping(priv->gpio_chip.irq.domain, offset));
+
+	return IRQ_HANDLED;
+}
+
+static int visconti_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct visconti_gpio *priv = gpiochip_get_data(chip);
+
+	return !!(readl(priv->base + GPIO_IDATA) & BIT(offset));
+}
+
+static void visconti_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct visconti_gpio *priv = gpiochip_get_data(chip);
+	u32 bit = BIT(offset);
+
+	if (value)
+		writel(bit, priv->base + GPIO_OSET);
+	else
+		writel(bit, priv->base + GPIO_OCLR);
+}
+
+static int visconti_gpio_get_dir(struct gpio_chip *chip, unsigned int offset)
+{
+	struct visconti_gpio *priv = gpiochip_get_data(chip);
+
+	return !(readl(priv->base + GPIO_DIR) & BIT(offset));
+}
+
+static int visconti_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
+{
+	struct visconti_gpio *priv = gpiochip_get_data(chip);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + GPIO_DIR);
+	val &= ~BIT(offset);
+	writel(val, priv->base + GPIO_DIR);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static int visconti_gpio_dir_out(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct visconti_gpio *priv = gpiochip_get_data(chip);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	visconti_gpio_set(chip, offset, value);
+	val = readl(priv->base + GPIO_DIR);
+	val |= BIT(offset);
+	writel(val, priv->base + GPIO_DIR);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
+static void visconti_init_irq_valid_mask(struct gpio_chip *chip, unsigned long *valid_mask,
+					 unsigned int ngpios)
+{
+	int i;
+
+	/* Exclude GPIO pins 16-31 from irq */
+	for (i = 16; i < ngpios; i++)
+		clear_bit(i, valid_mask);
+}
+
+static int visconti_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct visconti_gpio *priv;
+	struct gpio_chip *gpio_chip;
+	struct irq_chip *irq_chip;
+	struct irq_desc *desc;
+	const char *name = dev_name(dev);
+	int i, ret, num_irq;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	spin_lock_init(&priv->lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	ret = platform_irq_count(pdev);
+	if (!ret) {
+		dev_err(dev, "Couldn't determine # GPIO banks\n");
+		return -ENOENT;
+	}
+	num_irq = ret;
+
+	priv->irq = devm_kcalloc(dev, num_irq, sizeof(priv->irq), GFP_KERNEL);
+	if (!priv->irq)
+		return -ENOMEM;
+
+	for (i = 0; i < num_irq; i++) {
+		priv->irq[i] = platform_get_irq(pdev, i);
+		if (priv->irq[i] < 0) {
+			dev_err(dev, "invalid IRQ[%d]\n", i);
+			return priv->irq[i];
+		}
+	}
+
+	gpio_chip = &priv->gpio_chip;
+	gpio_chip->label = name;
+	gpio_chip->owner = THIS_MODULE;
+	gpio_chip->parent = dev;
+	gpio_chip->request = gpiochip_generic_request;
+	gpio_chip->free = gpiochip_generic_free;
+	gpio_chip->get = visconti_gpio_get;
+	gpio_chip->set = visconti_gpio_set;
+	gpio_chip->get_direction = visconti_gpio_get_dir;
+	gpio_chip->direction_input = visconti_gpio_dir_in;
+	gpio_chip->direction_output = visconti_gpio_dir_out;
+	gpio_chip->base = 0;
+	gpio_chip->ngpio = VISCONTI_GPIO_NR;
+	gpio_chip->irq.init_valid_mask = visconti_init_irq_valid_mask;
+
+	irq_chip = &priv->irq_chip;
+	irq_chip->name = "gpio-visconti";
+	irq_chip->irq_mask = visconti_gpio_irq_mask;
+	irq_chip->irq_unmask = visconti_gpio_irq_unmask;
+	irq_chip->irq_set_type = visconti_gpio_irq_set_type;
+	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+
+	ret = devm_gpiochip_add_data(dev, gpio_chip, priv);
+	if (ret) {
+		dev_err(dev, "failed to add GPIO chip\n");
+		return ret;
+	}
+
+	ret = gpiochip_irqchip_add(gpio_chip, irq_chip, 0, handle_level_irq,
+				   IRQ_TYPE_NONE);
+	if (ret) {
+		dev_err(dev, "cannot add IRQ chip\n");
+		return ret;
+	}
+
+	for (i = 0; i < num_irq; i++) {
+		desc = irq_to_desc(priv->irq[i]);
+		desc->status_use_accessors |= IRQ_NOAUTOEN;
+		if (devm_request_irq(dev, priv->irq[i],
+				     visconti_gpio_irq_handler, 0, name, priv)) {
+			dev_err(dev, "failed to request IRQ[%d]\n", i);
+			return -ENOENT;
+		}
+	}
+
+	return ret;
+}
+
+static const struct of_device_id visconti_gpio_of_match[] = {
+	{ .compatible = "toshiba,gpio-tmpv7708", },
+	{ /* end of table */ }
+};
+MODULE_DEVICE_TABLE(of, visconti_gpio_of_match);
+
+static struct platform_driver visconti_gpio_driver = {
+	.probe		= visconti_gpio_probe,
+	.driver		= {
+		.name	= "visconti_gpio",
+		.of_match_table = of_match_ptr(visconti_gpio_of_match),
+	}
+};
+module_platform_driver(visconti_gpio_driver);
+
+MODULE_AUTHOR("Toshiba Electronic Devices & Storage Corporation");
+MODULE_AUTHOR("Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti GPIO Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/visconti/pinctrl-common.c b/drivers/pinctrl/visconti/pinctrl-common.c
index 0cb10b7b4430..21c7e0d18fea 100644
--- a/drivers/pinctrl/visconti/pinctrl-common.c
+++ b/drivers/pinctrl/visconti/pinctrl-common.c
@@ -245,11 +245,34 @@ static int visconti_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int visconti_gpio_request_enable(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int pin)
+{
+	struct visconti_pinctrl *priv = pinctrl_dev_get_drvdata(pctldev);
+	const struct visconti_mux *gpio_mux = &priv->devdata->gpio_mux[pin];
+	unsigned long flags;
+	unsigned int val;
+
+	dev_dbg(priv->dev, "%s: pin = %d\n", __func__, pin);
+
+	/* update mux */
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + gpio_mux->offset);
+	val &= ~gpio_mux->mask;
+	val |= gpio_mux->val;
+	writel(val, priv->base + gpio_mux->offset);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+
 static const struct pinmux_ops visconti_pinmux_ops = {
 	.get_functions_count	= visconti_get_functions_count,
 	.get_function_name	= visconti_get_function_name,
 	.get_function_groups	= visconti_get_function_groups,
 	.set_mux		= visconti_set_mux,
+	.gpio_request_enable	= visconti_gpio_request_enable,
 	.strict			= true,
 };
 
-- 
2.29.2

