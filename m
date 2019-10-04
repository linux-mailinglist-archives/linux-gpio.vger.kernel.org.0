Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68535CB303
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 03:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730426AbfJDBZk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 21:25:40 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57895 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730712AbfJDBZk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 21:25:40 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 255E7891A9;
        Fri,  4 Oct 2019 14:25:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1570152336;
        bh=atqQxJE5NbubHYBO6PmKlZFAaDH0JWNnyjXzi2XmMTs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=he3dpH0d3AqQ2mzgBh3C9INNSr0eAYyiqj2v3LUjf4sipm/FNqa/8O24FRcfyNhXt
         PhnEvQ60CJEgKpT5oDlmdXtdWrTfTzS+1Q1sTYb6hne8c0kn1bYNlndSZxPJhJkRBz
         +VciDtJtxCpqAMgewHsxit0YymQ4qKDkz/ZoJAZJAY0Z/wsNeyhj5in4unf2w7suTH
         zM7p/EDwgdbBBh6AmOxAtmjIP4vix54xN0SIj8dsuAB2kXCFJsCsuwgy1gB/M2Z3Yo
         cWUpYCOU1zTaPLRLX6SMc6P/Uf/KmoiwBD+K+6YC6dxBmjvEP0svX8lUDO13KrSa38
         K/l17VAviGBsw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5d969f8b0002>; Fri, 04 Oct 2019 14:25:36 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id A0C9013EF6D;
        Fri,  4 Oct 2019 14:25:34 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id C101428003E; Fri,  4 Oct 2019 14:25:30 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, richard.laing@alliedtelesis.co.nz
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/2] gpio: Add xgs-iproc driver
Date:   Fri,  4 Oct 2019 14:25:25 +1300
Message-Id: <20191004012525.26647-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
References: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver supports the Chip Common A GPIO controller present on a
number of Broadcom switch ASICs with integrated SoCs. The controller is
similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
different enough that a separate driver is required.

This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
support (pinctrl-iproc-gpio covers CCB).

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/gpio/Kconfig          |   9 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-xgs-iproc.c | 422 ++++++++++++++++++++++++++++++++++
 3 files changed, 432 insertions(+)
 create mode 100644 drivers/gpio/gpio-xgs-iproc.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925f..4b3c0f8397d7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -156,6 +156,15 @@ config GPIO_BRCMSTB
 	help
 	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
=20
+config GPIO_XGS_IPROC
+	tristate "BRCM XGS iProc GPIO support"
+	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	default ARCH_BCM_IPROC
+	help
+	  Say yes here to enable GPIO support for Broadcom XGS iProc SoCs.
+
 config GPIO_CADENCE
 	tristate "Cadence GPIO support"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c15bae..3783c3d43fbe 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_GPIO_BCM_KONA)		+=3D gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BD70528)		+=3D gpio-bd70528.o
 obj-$(CONFIG_GPIO_BD9571MWV)		+=3D gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+=3D gpio-brcmstb.o
+obj-$(CONFIG_GPIO_XGS_IPROC)		+=3D gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BT8XX)		+=3D gpio-bt8xx.o
 obj-$(CONFIG_GPIO_CADENCE)		+=3D gpio-cadence.o
 obj-$(CONFIG_GPIO_CLPS711X)		+=3D gpio-clps711x.o
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.=
c
new file mode 100644
index 000000000000..12656ca7b9d4
--- /dev/null
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -0,0 +1,422 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 Broadcom Corporation
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
+
+#define CCA_INT_F_GPIOINT		BIT(0)
+#define CCA_INT_STS			0x20
+#define CCA_INT_MASK			0x24
+
+#define GPIO_CCA_DIN			0x0
+#define GPIO_CCA_DOUT			0x4
+#define GPIO_CCA_OUT_EN			0x8
+#define GPIO_CCA_INT_LEVEL		0x10
+#define GPIO_CCA_INT_LEVEL_MASK		0x14
+#define GPIO_CCA_INT_EVENT		0x18
+#define GPIO_CCA_INT_EVENT_MASK		0x1C
+#define GPIO_CCA_INT_EDGE		0x24
+
+struct iproc_gpio_chip {
+	struct device *dev;
+	void __iomem *base;
+	void __iomem *intr;
+	struct gpio_chip gc;
+	struct irq_chip irqchip;
+	spinlock_t lock;
+	struct irq_domain *irq_domain;
+};
+
+static u32 iproc_gpio_readl(struct iproc_gpio_chip *chip, int reg)
+{
+	return readl(chip->base + reg);
+}
+
+static void iproc_gpio_writel(struct iproc_gpio_chip *chip, u32 val, int=
 reg)
+{
+	writel(val, chip->base + reg);
+}
+
+/* returns the corresponding gpio register bit */
+static int iproc_irq_to_gpio(struct iproc_gpio_chip *chip, u32 irq)
+{
+	struct irq_data *data =3D irq_domain_get_irq_data(chip->irq_domain, irq=
);
+
+	return data->hwirq;
+}
+
+static void iproc_gpio_irq_ack(struct irq_data *d)
+{
+	u32 irq =3D d->irq;
+	struct iproc_gpio_chip *chip =3D irq_get_chip_data(irq);
+	int pin;
+	u32 irq_type, event_status =3D 0;
+
+	pin =3D iproc_irq_to_gpio(chip, d->irq);
+	irq_type =3D irq_get_trigger_type(irq);
+	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
+		event_status |=3D BIT(pin);
+		iproc_gpio_writel(chip, event_status, GPIO_CCA_INT_EVENT);
+	}
+}
+
+static void iproc_gpio_irq_unmask(struct irq_data *d)
+{
+	u32 irq =3D d->irq;
+	struct iproc_gpio_chip *chip =3D irq_get_chip_data(irq);
+	int pin;
+	u32 int_mask, irq_type, event_mask;
+
+	pin =3D iproc_irq_to_gpio(chip, irq);
+	irq_type =3D irq_get_trigger_type(irq);
+	event_mask =3D iproc_gpio_readl(chip, GPIO_CCA_INT_EVENT_MASK);
+	int_mask =3D iproc_gpio_readl(chip, GPIO_CCA_INT_LEVEL_MASK);
+
+	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
+		event_mask |=3D 1 << pin;
+		iproc_gpio_writel(chip, event_mask, GPIO_CCA_INT_EVENT_MASK);
+	} else {
+		int_mask |=3D 1 << pin;
+		iproc_gpio_writel(chip, int_mask, GPIO_CCA_INT_LEVEL_MASK);
+	}
+}
+
+static void iproc_gpio_irq_mask(struct irq_data *d)
+{
+	u32 irq =3D d->irq;
+	struct iproc_gpio_chip *chip =3D irq_get_chip_data(irq);
+	int pin;
+	u32 irq_type, int_mask, event_mask;
+
+	pin =3D iproc_irq_to_gpio(chip, irq);
+	irq_type =3D irq_get_trigger_type(irq);
+	event_mask =3D iproc_gpio_readl(chip, GPIO_CCA_INT_EVENT_MASK);
+	int_mask =3D iproc_gpio_readl(chip, GPIO_CCA_INT_LEVEL_MASK);
+
+	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
+		event_mask &=3D ~BIT(pin);
+		iproc_gpio_writel(chip, event_mask, GPIO_CCA_INT_EVENT_MASK);
+	} else {
+		int_mask &=3D ~BIT(pin);
+		iproc_gpio_writel(chip, int_mask, GPIO_CCA_INT_LEVEL_MASK);
+	}
+}
+
+
+static int iproc_gpio_irq_set_type(struct irq_data *d, u32 type)
+{
+	u32 irq =3D d->irq;
+	struct iproc_gpio_chip *chip =3D irq_get_chip_data(irq);
+	int pin;
+	u32 event_pol, int_pol;
+
+	pin =3D iproc_irq_to_gpio(chip, irq);
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		event_pol =3D iproc_gpio_readl(chip, GPIO_CCA_INT_EDGE);
+		event_pol &=3D ~BIT(pin);
+		iproc_gpio_writel(chip, event_pol, GPIO_CCA_INT_EDGE);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		event_pol =3D iproc_gpio_readl(chip, GPIO_CCA_INT_EDGE);
+		event_pol |=3D BIT(pin);
+		iproc_gpio_writel(chip, event_pol, GPIO_CCA_INT_EDGE);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		int_pol =3D iproc_gpio_readl(chip, GPIO_CCA_INT_LEVEL);
+		int_pol &=3D ~BIT(pin);
+		iproc_gpio_writel(chip, int_pol, GPIO_CCA_INT_LEVEL);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		int_pol =3D iproc_gpio_readl(chip, GPIO_CCA_INT_LEVEL);
+		int_pol |=3D BIT(pin);
+		iproc_gpio_writel(chip, int_pol, GPIO_CCA_INT_LEVEL);
+		break;
+	default:
+		/* should not come here */
+		return -EINVAL;
+	}
+
+	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+		irq_set_handler_locked(irq_get_irq_data(irq), handle_level_irq);
+	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+		irq_set_handler_locked(irq_get_irq_data(irq), handle_edge_irq);
+
+	return 0;
+}
+
+static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
+{
+	struct iproc_gpio_chip *chip =3D (struct iproc_gpio_chip *)data;
+	struct gpio_chip gc =3D chip->gc;
+	int bit;
+	unsigned long int_bits =3D 0;
+	u32 int_status;
+
+	/* go through the entire GPIOs and handle all interrupts */
+	int_status =3D readl(chip->intr + CCA_INT_STS);
+	if (int_status & CCA_INT_F_GPIOINT) {
+		u32 event, level;
+
+		/* Get level and edge interrupts */
+		event =3D readl(chip->base + GPIO_CCA_INT_EVENT_MASK);
+		event &=3D readl(chip->base + GPIO_CCA_INT_EVENT);
+		level =3D readl(chip->base + GPIO_CCA_DIN);
+		level ^=3D readl(chip->base + GPIO_CCA_INT_LEVEL);
+		level &=3D readl(chip->base + GPIO_CCA_INT_LEVEL_MASK);
+		int_bits =3D level | event;
+
+		for_each_set_bit(bit, &int_bits, gc.ngpio)
+			generic_handle_irq(
+				irq_linear_revmap(chip->irq_domain, bit));
+	}
+
+	return  int_bits ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static int iproc_gpiolib_input(struct gpio_chip *gc, u32 gpio)
+{
+	struct iproc_gpio_chip *chip =3D gpiochip_get_data(gc);
+	unsigned long flags;
+	u32  val;
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	val =3D iproc_gpio_readl(chip, GPIO_CCA_OUT_EN);
+	val &=3D ~BIT(gpio);
+	iproc_gpio_writel(chip, val, GPIO_CCA_OUT_EN);
+
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int iproc_gpiolib_output(struct gpio_chip *gc, u32 gpio, int valu=
e)
+{
+	struct iproc_gpio_chip *chip =3D gpiochip_get_data(gc);
+	unsigned long flags, val;
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	val =3D iproc_gpio_readl(chip, GPIO_CCA_OUT_EN);
+	val |=3D BIT(gpio);
+	iproc_gpio_writel(chip, val, GPIO_CCA_OUT_EN);
+
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static void iproc_gpiolib_set(struct gpio_chip *gc, u32 gpio, int value)
+{
+	struct iproc_gpio_chip *chip =3D gpiochip_get_data(gc);
+	unsigned long flags, val;
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	val =3D iproc_gpio_readl(chip, GPIO_CCA_OUT_EN);
+	val &=3D BIT(gpio);
+
+	/* this function only applies to output pin */
+	if (!val)
+		return;
+
+	val =3D iproc_gpio_readl(chip, GPIO_CCA_DOUT);
+	if (value =3D=3D 0)
+		/* Set the pin to zero */
+		val &=3D ~BIT(gpio);
+	else
+		/* Set the pin to 1 */
+		val |=3D BIT(gpio);
+
+	iproc_gpio_writel(chip, val, GPIO_CCA_DOUT);
+
+	spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static int iproc_gpiolib_get(struct gpio_chip *gc, u32 gpio)
+{
+	struct iproc_gpio_chip *chip =3D gpiochip_get_data(gc);
+	unsigned long flags;
+	u32 val, is_out;
+	/* GPIO register bit */
+
+	spin_lock_irqsave(&chip->lock, flags);
+
+	/* determine the GPIO pin direction */
+	is_out =3D iproc_gpio_readl(chip, GPIO_CCA_OUT_EN);
+	is_out &=3D BIT(gpio);
+
+	if (is_out)
+		val =3D iproc_gpio_readl(chip, GPIO_CCA_DOUT);
+	else
+		val =3D iproc_gpio_readl(chip, GPIO_CCA_DIN);
+
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return !!(val & BIT(gpio));
+}
+
+static int iproc_gpiolib_to_irq(struct gpio_chip *gc, u32 offset)
+{
+	struct iproc_gpio_chip *chip =3D gpiochip_get_data(gc);
+
+	return irq_linear_revmap(chip->irq_domain, offset);
+}
+
+static int iproc_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *dn =3D pdev->dev.of_node;
+	struct iproc_gpio_chip *chip;
+	u32 num_gpios;
+	int irq, ret;
+
+	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev =3D dev;
+	platform_set_drvdata(pdev, chip);
+
+	chip->gc.label =3D dev_name(dev);
+
+	chip->base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->base))
+		return PTR_ERR(chip->base);
+
+	/* Get number of GPIO pin */
+	if (of_property_read_u32(dn, "ngpios", &num_gpios)) {
+		dev_err(dev, "missing ngpios DT property\n");
+		return -EINVAL;
+	}
+	chip->gc.ngpio =3D num_gpios;
+	chip->gc.parent =3D dev;
+	chip->gc.of_node =3D dn;
+	chip->gc.direction_input =3D iproc_gpiolib_input;
+	chip->gc.direction_output =3D iproc_gpiolib_output;
+	chip->gc.set =3D iproc_gpiolib_set;
+	chip->gc.get =3D iproc_gpiolib_get;
+	chip->gc.to_irq =3D iproc_gpiolib_to_irq;
+
+	ret =3D gpiochip_add_data(&chip->gc, chip);
+	if (ret) {
+		dev_err(dev, "unable to add GPIO chip\n");
+		return ret;
+	}
+
+	irq =3D platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		u32 val, count;
+		struct irq_chip *irqc;
+
+		irqc =3D &chip->irqchip;
+		irqc->name =3D dev_name(dev);
+		irqc->irq_ack =3D iproc_gpio_irq_ack;
+		irqc->irq_mask =3D iproc_gpio_irq_mask;
+		irqc->irq_unmask =3D iproc_gpio_irq_unmask;
+		irqc->irq_set_type =3D iproc_gpio_irq_set_type;
+		irqc->irq_enable =3D iproc_gpio_irq_unmask;
+		irqc->irq_disable =3D iproc_gpio_irq_mask;
+
+		chip->intr =3D devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(chip->intr))
+			return PTR_ERR(chip->intr);
+
+		/* Create irq domain */
+		chip->irq_domain =3D irq_domain_add_linear(dn, num_gpios,
+				&irq_domain_simple_ops, chip);
+
+		if (!chip->irq_domain) {
+			dev_err(dev, "Couldn't allocate IRQ domain\n");
+			ret =3D -ENODEV;
+			goto err_irq_domain;
+		}
+
+		/* Map each gpio pin to an IRQ and set the handler */
+		for (count =3D 0; count < num_gpios; count++) {
+			int irq;
+
+			irq =3D irq_create_mapping(chip->irq_domain, count);
+			irq_set_chip_and_handler(irq, irqc, handle_simple_irq);
+			irq_set_chip_data(irq, chip);
+		}
+
+		/* Enable GPIO interrupts for CCA GPIO */
+		val =3D readl(chip->intr + CCA_INT_MASK);
+		val |=3D CCA_INT_F_GPIOINT;
+		writel(val, chip->intr + CCA_INT_MASK);
+
+		/* Install ISR for this GPIO controller */
+		ret =3D devm_request_irq(dev, irq, iproc_gpio_irq_handler,
+				       IRQF_SHARED, chip->gc.label, chip);
+		if (ret) {
+			dev_err(dev, "Fail to request IRQ%d: %d\n", irq, ret);
+			goto err_irq_request;
+		}
+	}
+
+	return 0;
+
+err_irq_request:
+	irq_domain_remove(chip->irq_domain);
+	chip->irq_domain =3D NULL;
+
+err_irq_domain:
+	gpiochip_remove(&chip->gc);
+
+	return ret;
+}
+
+static int __exit iproc_gpio_remove(struct platform_device *pdev)
+{
+	struct iproc_gpio_chip *chip;
+
+	chip =3D platform_get_drvdata(pdev);
+	if (!chip)
+		return -ENODEV;
+
+	if (chip->intr) {
+		u32 val;
+
+		val =3D readl(chip->intr + CCA_INT_MASK);
+		val &=3D ~CCA_INT_F_GPIOINT;
+		writel(val, chip->intr + CCA_INT_MASK);
+	}
+
+	gpiochip_remove(&chip->gc);
+
+	return 0;
+}
+
+static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst =3D=
 {
+	{ .compatible =3D "brcm,iproc-gpio-cca" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);
+
+static struct platform_driver bcm_iproc_gpio_driver =3D {
+	.driver =3D {
+		.name =3D "iproc-xgs-gpio",
+		.owner =3D THIS_MODULE,
+		.of_match_table =3D bcm_iproc_gpio_of_match,
+	},
+	.probe =3D iproc_gpio_probe,
+	.remove =3D iproc_gpio_remove,
+};
+
+module_platform_driver(bcm_iproc_gpio_driver);
+
+MODULE_DESCRIPTION("XGS IPROC GPIO driver");
+MODULE_LICENSE("GPL v2");
--=20
2.23.0

