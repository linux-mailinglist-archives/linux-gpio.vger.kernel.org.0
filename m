Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957302DCC24
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 06:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgLQFrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 00:47:52 -0500
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:37880 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgLQFrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 00:47:52 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 0BH5jgIG015125; Thu, 17 Dec 2020 14:45:42 +0900
X-Iguazu-Qid: 2wGrT5MSNgHV6wvH5n
X-Iguazu-QSIG: v=2; s=0; t=1608183941; q=2wGrT5MSNgHV6wvH5n; m=MimRrR2h2SWQSb+Q/J3Dy6IyLoRU1XKJaGk30+qMC9o=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
        by relay.securemx.jp (mx-mr1111) id 0BH5jfNQ020385;
        Thu, 17 Dec 2020 14:45:41 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
        by imx12.toshiba.co.jp  with ESMTP id 0BH5jf6D028761;
        Thu, 17 Dec 2020 14:45:41 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 0BH5jexo027847;
        Thu, 17 Dec 2020 14:45:40 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH v5 2/4] gpio: visconti: Add Toshiba Visconti GPIO support
Date:   Thu, 17 Dec 2020 23:43:36 +0900
X-TSB-HOP: ON
Message-Id: <20201217144338.3129140-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the GPIO driver for Toshiba Visconti ARM SoCs.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
 drivers/gpio/Kconfig                      |  10 +
 drivers/gpio/Makefile                     |   1 +
 drivers/gpio/gpio-visconti.c              | 218 ++++++++++++++++++++++
 drivers/pinctrl/visconti/pinctrl-common.c |  23 +++
 4 files changed, 252 insertions(+)
 create mode 100644 drivers/gpio/gpio-visconti.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..14151d67f0cc 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -631,6 +631,16 @@ config GPIO_VF610
 	help
 	  Say yes here to support Vybrid vf610 GPIOs.
 
+config GPIO_VISCONTI
+	tristate "Toshiba Visconti GPIO support"
+	depends on ARCH_VISCONTI || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	select GPIO_GENERIC
+	select IRQ_DOMAIN_HIERARCHY
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
index 000000000000..0e3d19828eb1
--- /dev/null
+++ b/drivers/gpio/gpio-visconti.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Toshiba Visconti GPIO Support
+ *
+ * (C) Copyright 2020 Toshiba Electronic Devices & Storage Corporation
+ * (C) Copyright 2020 TOSHIBA CORPORATION
+ *
+ * Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
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
+#define BASE_HW_IRQ 24
+
+struct visconti_gpio {
+	void __iomem *base;
+	spinlock_t lock; /* protect gpio register */
+	struct gpio_chip gpio_chip;
+	struct irq_chip irq_chip;
+};
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
+	irq_set_irq_type(offset, intc_type);
+
+	ret = irq_chip_set_type_parent(d, type);
+err:
+	spin_unlock_irqrestore(&priv->lock, flags);
+	return ret;
+}
+
+static int visconti_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					       unsigned int child,
+					       unsigned int child_type,
+					       unsigned int *parent,
+					       unsigned int *parent_type)
+{
+	/* Interrupts 0..15 mapped to interrupts 24..39 on the GIC */
+	if (child < 16) {
+		/* All these interrupts are level high in the CPU */
+		*parent_type = IRQ_TYPE_LEVEL_HIGH;
+		*parent = child + BASE_HW_IRQ;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static void *visconti_gpio_populate_parent_fwspec(struct gpio_chip *chip,
+						  unsigned int parent_hwirq,
+						  unsigned int parent_type)
+{
+	struct irq_fwspec *fwspec;
+
+	fwspec = kmalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
+	fwspec->param_count = 3;
+	fwspec->param[0] = 0;
+	fwspec->param[1] = parent_hwirq;
+	fwspec->param[2] = parent_type;
+
+	return fwspec;
+}
+
+static int visconti_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct visconti_gpio *priv;
+	struct irq_chip *irq_chip;
+	struct gpio_irq_chip *girq;
+	struct irq_domain *parent;
+	struct device_node *irq_parent;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	irq_parent = of_irq_find_parent(dev->of_node);
+	if (!irq_parent) {
+		dev_err(dev, "No IRQ parent node\n");
+		return -ENODEV;
+	}
+
+	parent = irq_find_host(irq_parent);
+	if (!parent) {
+		dev_err(dev, "No IRQ parent domain\n");
+		return -ENODEV;
+	}
+
+	fwnode = of_node_to_fwnode(irq_parent);
+	of_node_put(irq_parent);
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
+	irq_chip = &priv->irq_chip;
+	irq_chip->name = dev_name(dev);
+	irq_chip->irq_mask = irq_chip_mask_parent;
+	irq_chip->irq_unmask = irq_chip_unmask_parent;
+	irq_chip->irq_eoi = irq_chip_eoi_parent;
+	irq_chip->irq_set_type = visconti_gpio_irq_set_type;
+	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+
+	girq = &priv->gpio_chip.irq;
+	girq->chip = irq_chip;
+	girq->fwnode = fwnode;
+	girq->parent_domain = parent;
+	girq->child_to_parent_hwirq = visconti_gpio_child_to_parent_hwirq;
+	girq->populate_parent_alloc_arg = visconti_gpio_populate_parent_fwspec;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+	ret = devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
+	if (ret) {
+		dev_err(dev, "failed to add GPIO chip\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, priv);
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

