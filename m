Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9732A2C9C6E
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 10:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390519AbgLAJSJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 04:18:09 -0500
Received: from mo-csw1515.securemx.jp ([210.130.202.154]:33684 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390462AbgLAJSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 04:18:05 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1515) id 0B19FweL027229; Tue, 1 Dec 2020 18:15:58 +0900
X-Iguazu-Qid: 34tr8pqEJXpSBw1Z38
X-Iguazu-QSIG: v=2; s=0; t=1606814158; q=34tr8pqEJXpSBw1Z38; m=hrxPHi/biTjSmwnseIipsoUYnxsYVaP6cC0xxVsf+FA=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1512) id 0B19FvL5040955;
        Tue, 1 Dec 2020 18:15:58 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0B19FvIe024697;
        Tue, 1 Dec 2020 18:15:57 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0B19FvOh031160;
        Tue, 1 Dec 2020 18:15:57 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v3 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
Date:   Wed,  2 Dec 2020 03:14:04 +0900
X-TSB-HOP: ON
Message-Id: <20201201181406.2371881-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIO driver for Toshiba Visconti ARM SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/gpio/Kconfig                      |   9 +
 drivers/gpio/Makefile                     |   1 +
 drivers/gpio/gpio-visconti.c              | 232 ++++++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c |  23 +++
 4 files changed, 265 insertions(+)
 create mode 100644 drivers/gpio/gpio-visconti.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..85d0f4499d63 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -631,6 +631,15 @@ config GPIO_VF610
 	help
 	  Say yes here to support Vybrid vf610 GPIOs.
 
+config GPIO_VISCONTI
+	tristate "Toshiba Visconti GPIO support"
+	depends on ARCH_VISCONTI || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	select GPIO_GENERIC
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
index 000000000000..17e6da161f48
--- /dev/null
+++ b/drivers/gpio/gpio-visconti.c
@@ -0,0 +1,232 @@
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
+	struct irq_chip *irq_chip;
+	struct irq_desc *desc;
+	struct gpio_irq_chip *girq;
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
+	ret = bgpio_init(&priv->gpio_chip, dev, 4,
+			 priv->base + GPIO_IDATA,
+			 priv->base + GPIO_OSET,
+			 priv->base + GPIO_OCLR,
+			 priv->base + GPIO_DIR,
+			 NULL,
+			 0);
+	if (ret) {
+		dev_err(dev, "unable to init generic GPIO\n");
+		return ret;
+	}
+
+	priv->gpio_chip.irq.init_valid_mask = visconti_init_irq_valid_mask;
+
+	irq_chip = &priv->irq_chip;
+	irq_chip->name = "gpio-visconti";
+	irq_chip->irq_mask = visconti_gpio_irq_mask;
+	irq_chip->irq_unmask = visconti_gpio_irq_unmask;
+	irq_chip->irq_set_type = visconti_gpio_irq_set_type;
+	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+
+	girq = &priv->gpio_chip.irq;
+	girq->chip = irq_chip;
+	/* This will let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+	ret = devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
+	if (ret) {
+		dev_err(dev, "failed to add GPIO chip\n");
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

