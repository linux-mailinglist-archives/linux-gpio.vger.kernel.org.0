Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8454DE2779
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 02:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405717AbfJXAs0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 20:48:26 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:58350 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405952AbfJXAsV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 20:48:21 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 62085891A9;
        Thu, 24 Oct 2019 13:48:18 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1571878098;
        bh=6O36gs4UCkjCKJH4/gfFwy+kAq6vVxTELtA8VKQcdHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Cn6N8V0jN2dKr/3mDxaczz78X56OmrkNz4yeaZqcejV2ezzGp5PUcCvwFC9AQivGc
         bdL/uw8zhN5yD1WUJGt1ZuFAPvrIoEcbDguBJzXvMNM1ulKNMCH+XQNmeuGQnvVmIn
         Oc8djERv7O+O5/Jw4VQ2jDQxmylyIKK0AKGuXfa01et67EM6BHQo0XcxDgcdOIda0B
         vo0kV+Xz0Q0wiSIdlaLIDWUXQP55c+xBRw4Mbhs5mRk7hCrhYbo07fTl3rJR2LEyj5
         OrYSIv7lAOmIR9L7Zzd3bfiAvA/Wuzb846RMeKW4IOmMTDxRoMH5NoNKJEeatFvlr6
         q08BX+LKZaEXg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5db0f4d10002>; Thu, 24 Oct 2019 13:48:17 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 42DE013ED56;
        Thu, 24 Oct 2019 13:48:22 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1125228005C; Thu, 24 Oct 2019 13:48:18 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 2/2] gpio: Add xgs-iproc driver
Date:   Thu, 24 Oct 2019 13:48:15 +1300
Message-Id: <20191024004816.5539-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024004816.5539-1-chris.packham@alliedtelesis.co.nz>
References: <20191024004816.5539-1-chris.packham@alliedtelesis.co.nz>
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

Notes:
    Changes in v3:
    - prefix local #defines with 'IPROC'
    - use {readl,writel}_relaxed
    - remove unnecessary headers
    - actually use spinlock to guard hardware accesses
   =20
    Changes in v2:
    - use more of the generic infrastructure for gpio chips
    - handling the root interrupt is still done manually due to sharing w=
ith uart0.

 drivers/gpio/Kconfig          |   9 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-xgs-iproc.c | 321 ++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)
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
index 000000000000..fcf41cf9efc3
--- /dev/null
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -0,0 +1,321 @@
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
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define IPROC_CCA_INT_F_GPIOINT		BIT(0)
+#define IPROC_CCA_INT_STS		0x20
+#define IPROC_CCA_INT_MASK		0x24
+
+#define IPROC_GPIO_CCA_DIN		0x0
+#define IPROC_GPIO_CCA_DOUT		0x4
+#define IPROC_GPIO_CCA_OUT_EN		0x8
+#define IPROC_GPIO_CCA_INT_LEVEL	0x10
+#define IPROC_GPIO_CCA_INT_LEVEL_MASK	0x14
+#define IPROC_GPIO_CCA_INT_EVENT	0x18
+#define IPROC_GPIO_CCA_INT_EVENT_MASK	0x1C
+#define IPROC_GPIO_CCA_INT_EDGE		0x24
+
+struct iproc_gpio_chip {
+	struct irq_chip irqchip;
+	struct gpio_chip gc;
+	spinlock_t lock;
+	struct device *dev;
+	void __iomem *base;
+	void __iomem *intr;
+};
+
+static inline struct iproc_gpio_chip *
+to_iproc_gpio(struct gpio_chip *gc)
+{
+	return container_of(gc, struct iproc_gpio_chip, gc);
+}
+
+static void iproc_gpio_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
+	int pin =3D d->hwirq;
+	unsigned long flags;
+	u32 irq =3D d->irq;
+	u32 irq_type, event_status =3D 0;
+
+	spin_lock_irqsave(&chip->lock, flags);
+	irq_type =3D irq_get_trigger_type(irq);
+	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
+		event_status |=3D BIT(pin);
+		writel_relaxed(event_status,
+			       chip->base + IPROC_GPIO_CCA_INT_EVENT);
+	}
+	spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static void iproc_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
+	int pin =3D d->hwirq;
+	unsigned long flags;
+	u32 irq =3D d->irq;
+	u32 int_mask, irq_type, event_mask;
+
+	spin_lock_irqsave(&chip->lock, flags);
+	irq_type =3D irq_get_trigger_type(irq);
+	event_mask =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK=
);
+	int_mask =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
+
+	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
+		event_mask |=3D 1 << pin;
+		writel_relaxed(event_mask,
+			       chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
+	} else {
+		int_mask |=3D 1 << pin;
+		writel_relaxed(int_mask,
+			       chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
+	}
+	spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static void iproc_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
+	int pin =3D d->hwirq;
+	unsigned long flags;
+	u32 irq =3D d->irq;
+	u32 irq_type, int_mask, event_mask;
+
+	spin_lock_irqsave(&chip->lock, flags);
+	irq_type =3D irq_get_trigger_type(irq);
+	event_mask =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK=
);
+	int_mask =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
+
+	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
+		event_mask &=3D ~BIT(pin);
+		writel_relaxed(event_mask,
+			       chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
+	} else {
+		int_mask &=3D ~BIT(pin);
+		writel_relaxed(int_mask,
+			       chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
+	}
+	spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static int iproc_gpio_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
+	struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
+	int pin =3D d->hwirq;
+	unsigned long flags;
+	u32 irq =3D d->irq;
+	u32 event_pol, int_pol;
+	int ret =3D 0;
+
+	spin_lock_irqsave(&chip->lock, flags);
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		event_pol =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EDGE);
+		event_pol &=3D ~BIT(pin);
+		writel_relaxed(event_pol, chip->base + IPROC_GPIO_CCA_INT_EDGE);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		event_pol =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EDGE);
+		event_pol |=3D BIT(pin);
+		writel_relaxed(event_pol, chip->base + IPROC_GPIO_CCA_INT_EDGE);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		int_pol =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL);
+		int_pol &=3D ~BIT(pin);
+		writel_relaxed(int_pol, chip->base + IPROC_GPIO_CCA_INT_LEVEL);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		int_pol =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL);
+		int_pol |=3D BIT(pin);
+		writel_relaxed(int_pol, chip->base + IPROC_GPIO_CCA_INT_LEVEL);
+		break;
+	default:
+		/* should not come here */
+		ret =3D -EINVAL;
+		goto out_unlock;
+	}
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(irq_get_irq_data(irq), handle_level_irq);
+	else if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(irq_get_irq_data(irq), handle_edge_irq);
+
+out_unlock:
+	spin_unlock_irqrestore(&chip->lock, flags);
+
+	return ret;
+}
+
+static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
+{
+	struct gpio_chip *gc =3D (struct gpio_chip *)data;
+	struct iproc_gpio_chip *chip =3D to_iproc_gpio(gc);
+	int bit;
+	unsigned long int_bits =3D 0;
+	u32 int_status;
+
+	/* go through the entire GPIOs and handle all interrupts */
+	int_status =3D readl_relaxed(chip->intr + IPROC_CCA_INT_STS);
+	if (int_status & IPROC_CCA_INT_F_GPIOINT) {
+		u32 event, level;
+
+		/* Get level and edge interrupts */
+		event =3D
+		    readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
+		event &=3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT);
+		level =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_DIN);
+		level ^=3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL);
+		level &=3D
+		    readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
+		int_bits =3D level | event;
+
+		for_each_set_bit(bit, &int_bits, gc->ngpio)
+			generic_handle_irq(irq_linear_revmap(gc->irq.domain, bit));
+	}
+
+	return int_bits ? IRQ_HANDLED : IRQ_NONE;
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
+	spin_lock_init(&chip->lock);
+
+	chip->base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(chip->base))
+		return PTR_ERR(chip->base);
+
+	ret =3D bgpio_init(&chip->gc, dev, 4,
+			 chip->base + IPROC_GPIO_CCA_DIN,
+			 chip->base + IPROC_GPIO_CCA_DOUT,
+			 NULL,
+			 chip->base + IPROC_GPIO_CCA_OUT_EN,
+			 NULL,
+			 0);
+	if (ret) {
+		dev_err(dev, "unable to init GPIO chip\n");
+		return ret;
+	}
+
+	chip->gc.label =3D dev_name(dev);
+	if (of_property_read_u32(dn, "ngpios", &num_gpios))
+		chip->gc.ngpio =3D num_gpios;
+
+	irq =3D platform_get_irq(pdev, 0);
+	if (irq > 0) {
+		struct gpio_irq_chip *girq;
+		struct irq_chip *irqc;
+		u32 val;
+
+		irqc =3D &chip->irqchip;
+		irqc->name =3D dev_name(dev);
+		irqc->irq_ack =3D iproc_gpio_irq_ack;
+		irqc->irq_mask =3D iproc_gpio_irq_mask;
+		irqc->irq_unmask =3D iproc_gpio_irq_unmask;
+		irqc->irq_set_type =3D iproc_gpio_irq_set_type;
+
+		chip->intr =3D devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(chip->intr))
+			return PTR_ERR(chip->intr);
+
+		/* Enable GPIO interrupts for CCA GPIO */
+		val =3D readl_relaxed(chip->intr + IPROC_CCA_INT_MASK);
+		val |=3D IPROC_CCA_INT_F_GPIOINT;
+		writel_relaxed(val, chip->intr + IPROC_CCA_INT_MASK);
+
+		/*
+		 * Directly request the irq here instead of passing
+		 * a flow-handler to gpiochip_set_chained_irqchip,
+		 * because the irq is shared.
+		 */
+		ret =3D devm_request_irq(dev, irq, iproc_gpio_irq_handler,
+				       IRQF_SHARED, chip->gc.label, &chip->gc);
+		if (ret) {
+			dev_err(dev, "Fail to request IRQ%d: %d\n", irq, ret);
+			return ret;
+		}
+
+		girq =3D &chip->gc.irq;
+		girq->chip =3D irqc;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->parent_handler =3D NULL;
+		girq->num_parents =3D 0;
+		girq->parents =3D NULL;
+		girq->default_type =3D IRQ_TYPE_NONE;
+		girq->handler =3D handle_simple_irq;
+	}
+
+	ret =3D devm_gpiochip_add_data(dev, &chip->gc, chip);
+	if (ret) {
+		dev_err(dev, "unable to add GPIO chip\n");
+		return ret;
+	}
+
+	return 0;
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
+		val =3D readl_relaxed(chip->intr + IPROC_CCA_INT_MASK);
+		val &=3D ~IPROC_CCA_INT_F_GPIOINT;
+		writel_relaxed(val, chip->intr + IPROC_CCA_INT_MASK);
+	}
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

