Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE067F2177
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 23:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732687AbfKFWPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 17:15:44 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53687 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfKFWPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 17:15:43 -0500
Received: by mail-wm1-f67.google.com with SMTP id x4so5900956wmi.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 14:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from:cc;
        bh=UJA8WLNvHF2SOQyoAUNEJnqpP8T7iPhqxJV3li4veHI=;
        b=di92SvI3LMsnBt6xF2BmlXVE1w1cdJnhOlG5G8hJlFqKA7/8sOmHtlK8hxGva3wmL1
         vcjEp4LQkBCoI0RIe42kv+5AaPMQxo/tKmnRlqCH1XrBZRa8xhpnDAB2K2qFI+MTK6tV
         ny+h+IVPe3VEeMyGTKWKXjNuox7GhpqCsM0C39Q6a6Z3QMheUhpLJeEMKZidxRxeqN+M
         6D/gwmzBHtwsQ/fHqCEa+wI2w2LnaOTgghI4WcBN6gJRwQA0NZ5/C+WpkdEAmXwHpAJM
         aFAH40G8uRir6Qb99akHSfNiajDuITSQU9CNFe30ljV8Y02spI6N/MkZjekzOx1/h5C0
         3JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from:cc;
        bh=UJA8WLNvHF2SOQyoAUNEJnqpP8T7iPhqxJV3li4veHI=;
        b=ZtZmlHPpnWcNFr/i9XwX9ZYgqZjb/0dfJpavvD0jf0c0VE1unslb+35te2tXGGKpHL
         phzYnjQQAa8P+dtnGkIjNqrMkUBYuwfu/bv2KlJApzQT7vBSq9Bk4X/sJLY1A95W6BtR
         sjKvTJpmenZqLhY9p3dp8vVQ8fxyKy+vQ8dOP/Utq7aXEq8sYJ0lON6mFGPK/Pvccio+
         FlDdpsFFD5q3gmjVt3duLbJ1dkkm+dehqxCVWExR054cz6xUTXHSz8A+luwE7/RKei1R
         AFLS2DD0nQIES0l/Y8P/UMnLQILgsaG3FnQr4CK062CHEMutf7XUlUqsvSM7hZTGx3Ts
         8tcA==
X-Gm-Message-State: APjAAAUqcVmAgKNqRTGX+akJWjUjejAwqP8OyI5Q95l4c4zVupPsMEQ7
        K3MtHFCkFRplYffWubcApXjEWw==
X-Google-Smtp-Source: APXvYqyECvVmmIIC5UbODcf22HZ3p6bEl9Vc4Wq7qeDGxU86K6w55cauMs/ByiLViyMrUVZAc6zQzg==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr4853909wmb.142.1573078539057;
        Wed, 06 Nov 2019 14:15:39 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j63sm4667484wmj.46.2019.11.06.14.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 14:15:38 -0800 (PST)
Message-ID: <5dc3460a.1c69fb81.bfae4.adf1@mx.google.com>
Date:   Wed, 06 Nov 2019 14:15:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Tree: next
X-Kernelci-Report-Type: bisect
X-Kernelci-Kernel: next-20191106
Subject: next/master boot bisection: next-20191106 on r8a7795-salvator-x
To:     Linus Walleij <linus.walleij@linaro.org>,
        tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
        mgalka@collabora.com, broonie@kernel.org, matthew.hart@linaro.org,
        Scott Branden <scott.branden@broadcom.com>,
        khilman@baylibre.com, enric.balletbo@collabora.com,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
From:   "kernelci.org bot" <bot@kernelci.org>
Cc:     Scott Branden <sbranden@broadcom.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-kernel@lists.infradead.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

next/master boot bisection: next-20191106 on r8a7795-salvator-x

Summary:
  Start:      dcd34bd23418 Add linux-next specific files for 20191106
  Details:    https://kernelci.org/boot/id/5dc298b459b514acf8138e34
  Plain log:  https://storage.kernelci.org//next/master/next-20191106/arm64=
/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/boot-r8a7795-salvat=
or-x.txt
  HTML log:   https://storage.kernelci.org//next/master/next-20191106/arm64=
/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/boot-r8a7795-salvat=
or-x.html
  Result:     6a41b6c5fc20 gpio: Add xgs-iproc driver

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       next
  URL:        git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  Branch:     master
  Target:     r8a7795-salvator-x
  CPU arch:   arm64
  Lab:        lab-baylibre
  Compiler:   gcc-8
  Config:     defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Test suite: boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit 6a41b6c5fc20abced88fa0eed42ae5e5cb70b280
Author: Chris Packham <chris.packham@alliedtelesis.co.nz>
Date:   Fri Oct 25 09:27:03 2019 +1300

    gpio: Add xgs-iproc driver
    =

    This driver supports the Chip Common A GPIO controller present on a
    number of Broadcom switch ASICs with integrated SoCs. The controller is
    similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
    different enough that a separate driver is required.
    =

    This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
    support (pinctrl-iproc-gpio covers CCB).
    =

    Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
    Link: https://lore.kernel.org/r/20191024202703.8017-3-chris.packham@all=
iedtelesis.co.nz
    Acked-by: Scott Branden <scott.branden@broadcom.com>
    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8ec1f041c98d..e9516393c971 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -155,6 +155,15 @@ config GPIO_BCM_KONA
 	help
 	  Turn on GPIO support for Broadcom "Kona" chips.
 =

+config GPIO_BCM_XGS_IPROC
+	tristate "BRCM XGS iProc GPIO support"
+	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	default ARCH_BCM_IPROC
+	help
+	  Say yes here to enable GPIO support for Broadcom XGS iProc SoCs.
+
 config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 84e05701f500..34eb8b2b12dd 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_GPIO_ASPEED)		+=3D gpio-aspeed.o
 obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+=3D gpio-aspeed-sgpio.o
 obj-$(CONFIG_GPIO_ATH79)		+=3D gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+=3D gpio-bcm-kona.o
+obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+=3D gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BD70528)		+=3D gpio-bd70528.o
 obj-$(CONFIG_GPIO_BD9571MWV)		+=3D gpio-bd9571mwv.o
 obj-$(CONFIG_GPIO_BRCMSTB)		+=3D gpio-brcmstb.o
diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
new file mode 100644
index 000000000000..a3fdd95cc9e6
--- /dev/null
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2017 Broadcom
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
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
+	event_mask =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
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
+	event_mask =3D readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
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
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [26bc672134241a080a83b2ab9aa8abede8d30e1c] Merge tag 'for-linus-201=
9-11-05' of git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux
git bisect good 26bc672134241a080a83b2ab9aa8abede8d30e1c
# bad: [dcd34bd234181ec74f081c7d0025204afe6b213e] Add linux-next specific f=
iles for 20191106
git bisect bad dcd34bd234181ec74f081c7d0025204afe6b213e
# good: [8bb6f79f15d1a0f9471c06f68da0b4a270b575cf] Merge remote-tracking br=
anch 'crypto/master'
git bisect good 8bb6f79f15d1a0f9471c06f68da0b4a270b575cf
# good: [18a88f87d4eb404ac5cd4f208fa7228df183e64f] Merge remote-tracking br=
anch 'battery/for-next'
git bisect good 18a88f87d4eb404ac5cd4f208fa7228df183e64f
# good: [cfe4391e1d4ced7a82819919fe1afa458e2c33f1] Merge remote-tracking br=
anch 'thunderbolt/next'
git bisect good cfe4391e1d4ced7a82819919fe1afa458e2c33f1
# good: [6df9adf95b9d756bef44c3bf0c4410f7b72cfe61] Merge remote-tracking br=
anch 'rpmsg/for-next'
git bisect good 6df9adf95b9d756bef44c3bf0c4410f7b72cfe61
# bad: [9548912f77a91a1151b4988d214e005c892cf5f5] Merge remote-tracking bra=
nch 'pidfd/for-next'
git bisect bad 9548912f77a91a1151b4988d214e005c892cf5f5
# bad: [f93f33542dfed02f4fd0029e220dff1221f6d8ea] Merge remote-tracking bra=
nch 'y2038/y2038'
git bisect bad f93f33542dfed02f4fd0029e220dff1221f6d8ea
# bad: [175736ba4340069619b568081e810187bbee9f74] Merge remote-tracking bra=
nch 'pinctrl/for-next'
git bisect bad 175736ba4340069619b568081e810187bbee9f74
# good: [66ee1973603572e4258b08b8737490833f8172bc] Merge tag 'sh-pfc-for-v5=
.5-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers into devel
git bisect good 66ee1973603572e4258b08b8737490833f8172bc
# good: [fe12e94375da34d62f7d5556161ce7629212ff80] Merge tag 'gpio-v5.5-upd=
ates-for-linus-part-1' of git://git.kernel.org/pub/scm/linux/kernel/git/brg=
l/linux into devel
git bisect good fe12e94375da34d62f7d5556161ce7629212ff80
# bad: [4b3a4463c3f63ee2f8168953a8ac7a0aea05d37e] Merge remote-tracking bra=
nch 'gpio-brgl/gpio/for-next'
git bisect bad 4b3a4463c3f63ee2f8168953a8ac7a0aea05d37e
# bad: [6a41b6c5fc20abced88fa0eed42ae5e5cb70b280] gpio: Add xgs-iproc driver
git bisect bad 6a41b6c5fc20abced88fa0eed42ae5e5cb70b280
# good: [d57eb825e0dc6f0b5be78251d69cbf1bdd1db622] gpio: Add RDA Micro GPIO=
 controller support
git bisect good d57eb825e0dc6f0b5be78251d69cbf1bdd1db622
# good: [1dfc462a54386d8467ff427ef900f553e2e470e3] dt-bindings: gpio: brcm:=
 Add bindings for xgs-iproc
git bisect good 1dfc462a54386d8467ff427ef900f553e2e470e3
# first bad commit: [6a41b6c5fc20abced88fa0eed42ae5e5cb70b280] gpio: Add xg=
s-iproc driver
---------------------------------------------------------------------------=
----
