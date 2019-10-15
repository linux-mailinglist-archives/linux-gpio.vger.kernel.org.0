Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 416FBD7DD0
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 19:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbfJORa5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 13:30:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38238 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388809AbfJORa5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 13:30:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id w3so5640080pgt.5
        for <linux-gpio@vger.kernel.org>; Tue, 15 Oct 2019 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XS2R4FunLivDfSHsnShzXwsYoiKZ56RWG4w8jiOliI8=;
        b=WpUrKf+HJMcjNG2jW8yMEmlE0gt018p1xtNM7tYgBR4qvjURPid0Y0w/zgY9ara1hx
         nIrMFwJiF65WrJYzTLmYKvBHgoOfJAdnuNoWC9q2yNwN31YebWgAS1SNyTyIJ3ZJDh76
         Xv8DwSIbaLPhmZ0HOmGnefb5Ng3117twEfYrXI8IRMBJi3PXNMba0rhb4BHyAM5N/TW3
         rmnNHXkMVKjZRhbTFKNaCGkSdTmAqS1YWgeAKTp6TVkgUXuughEmeYgaArLcvqISl4x4
         BS9DjFy23F6+rjyny2zmryjEHNtDE+my7LHmihfjVXshUh7GVojfCkHxrky6ybOcfJFE
         cIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XS2R4FunLivDfSHsnShzXwsYoiKZ56RWG4w8jiOliI8=;
        b=Gp4B4KofLyKI6LfeFyY4/4AgLibEM7JEHMZi3yZq30X7RTLv0oMdLLzpmrB5wIrVN4
         CUUf8BZNT+3/4VgP5PS4NzQslFqZ9uNegIEprovrX+ngvtoVW+2Ej3wdbRuzuXMWiCec
         +Ju3NuWmNEwHBLR1WKBRzjDjCsSU4O/KOtoueIRYRdoTWAh/iM5rO4oFQTlG0DgouCJi
         ZefOY4XyIpmVKrVGi0laFYRjV7tAz2sBIzIw1Cw+ZZbCNeL7U2PBp2vyu13qt90yxPLN
         xRPD4HLZopMNkB/+xVEQpV9TU+AlLWNc8lLscAr/K+wA/zZaYUa91lwbgQSDIF4uIlql
         goaQ==
X-Gm-Message-State: APjAAAUrj3lYuiWHy8dnAC9nRq0zWa/1/Tw2NN4MVt8f9EAfE+zGyZ/q
        Nf5x61uI5QLbp4fjfSLqaO/c
X-Google-Smtp-Source: APXvYqwy4EK2BMi+H6Ofq3pk8JyBdWm29CW9vPw5Znqhj4TT8HXLls0mloJfT0VIefkmrCdX+3jwwg==
X-Received: by 2002:a63:ff56:: with SMTP id s22mr2141428pgk.44.1571160654729;
        Tue, 15 Oct 2019 10:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6003:7cb8:25e8:2c45:fab2:b0c7])
        by smtp.gmail.com with ESMTPSA id w11sm28033563pfd.116.2019.10.15.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:30:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/4] gpio: Add RDA Micro GPIO controller support
Date:   Tue, 15 Oct 2019 23:00:25 +0530
Message-Id: <20191015173026.9962-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
References: <20191015173026.9962-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIO controller from RDA Micro.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/gpio/Kconfig    |   8 +
 drivers/gpio/Makefile   |   1 +
 drivers/gpio/gpio-rda.c | 315 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 324 insertions(+)
 create mode 100644 drivers/gpio/gpio-rda.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925f..71826e61fdb3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -435,6 +435,14 @@ config GPIO_RCAR
 	help
 	  Say yes here to support GPIO on Renesas R-Car SoCs.
 
+config GPIO_RDA
+	bool "RDA Micro GPIO controller support"
+	depends on ARCH_RDA || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support RDA Micro GPIO controller.
+
 config GPIO_REG
 	bool
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c15bae..5c68c9a48fa3 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -115,6 +115,7 @@ obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
+obj-$(CONFIG_GPIO_RDA)			+= gpio-rda.o
 obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
new file mode 100644
index 000000000000..1e6ffe27897f
--- /dev/null
+++ b/drivers/gpio/gpio-rda.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RDA Micro GPIO driver
+ *
+ * Copyright (C) 2012 RDA Micro Inc.
+ * Copyright (C) 2019 Manivannan Sadhasivam
+ */
+
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define RDA_GPIO_OEN_VAL		0x00
+#define RDA_GPIO_OEN_SET_OUT		0x04
+#define RDA_GPIO_OEN_SET_IN		0x08
+#define RDA_GPIO_VAL			0x0c
+#define RDA_GPIO_SET			0x10
+#define RDA_GPIO_CLR			0x14
+#define RDA_GPIO_INT_CTRL_SET		0x18
+#define RDA_GPIO_INT_CTRL_CLR		0x1c
+#define RDA_GPIO_INT_CLR		0x20
+#define RDA_GPIO_INT_STATUS		0x24
+
+#define RDA_GPIO_IRQ_RISE_SHIFT		0
+#define RDA_GPIO_IRQ_FALL_SHIFT		8
+#define RDA_GPIO_DEBOUCE_SHIFT		16
+#define RDA_GPIO_LEVEL_SHIFT		24
+
+#define RDA_GPIO_IRQ_MASK		0xff
+
+/* Each bank consists of 32 GPIOs */
+#define RDA_GPIO_BANK_NR	32
+
+struct rda_gpio {
+	struct gpio_chip chip;
+	void __iomem *base;
+	spinlock_t lock;
+	struct irq_chip irq_chip;
+	int irq;
+};
+
+static void rda_gpio_update(struct gpio_chip *chip, unsigned int offset,
+			    u16 reg, int val)
+{
+	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
+	void __iomem *base = rda_gpio->base;
+	unsigned long flags;
+	u32 tmp;
+
+	spin_lock_irqsave(&rda_gpio->lock, flags);
+	tmp = readl_relaxed(base + reg);
+
+	if (val)
+		tmp |= BIT(offset);
+	else
+		tmp &= ~BIT(offset);
+
+	writel_relaxed(tmp, base + reg);
+	spin_unlock_irqrestore(&rda_gpio->lock, flags);
+}
+
+static int rda_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	rda_gpio_update(chip, offset, RDA_GPIO_OEN_SET_IN, 1);
+
+	return 0;
+}
+
+static int rda_gpio_direction_output(struct gpio_chip *chip,
+				     unsigned int offset, int value)
+{
+	rda_gpio_update(chip, offset, RDA_GPIO_OEN_SET_OUT, 1);
+
+	return 0;
+}
+
+static int rda_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
+	void __iomem *base = rda_gpio->base;
+
+	if (readl_relaxed(base + RDA_GPIO_OEN_VAL) & BIT(offset))
+		return !!(readl_relaxed(base + RDA_GPIO_VAL) & BIT(offset));
+	else
+		return !!(readl_relaxed(base + RDA_GPIO_SET) & BIT(offset));
+}
+
+static void rda_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	if (value)
+		rda_gpio_update(chip, offset, RDA_GPIO_SET, 1);
+	else
+		rda_gpio_update(chip, offset, RDA_GPIO_CLR, 1);
+}
+
+static void rda_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
+	void __iomem *base = rda_gpio->base;
+	u32 offset = irqd_to_hwirq(data);
+	u32 value;
+
+	value = BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
+	value |= BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
+
+	writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
+}
+
+static void rda_gpio_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	u32 offset = irqd_to_hwirq(data);
+
+	rda_gpio_update(chip, offset, RDA_GPIO_INT_CLR, 1);
+}
+
+static int rda_gpio_set_irq(struct gpio_chip *chip, u32 offset,
+			    unsigned int flow_type)
+{
+	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
+	void __iomem *base = rda_gpio->base;
+	u32 value;
+
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_RISING:
+		/* Set rising edge trigger */
+		value = BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
+
+		/* Switch to edge trigger interrupt */
+		value = BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		/* Set falling edge trigger */
+		value = BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
+
+		/* Switch to edge trigger interrupt */
+		value = BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		/* Set both edge trigger */
+		value = BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
+		value |= BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
+
+		/* Switch to edge trigger interrupt */
+		value = BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_CLR);
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		/* Set high level trigger */
+		value = BIT(offset) << RDA_GPIO_IRQ_RISE_SHIFT;
+
+		/* Switch to level trigger interrupt */
+		value |= BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		/* Set low level trigger */
+		value = BIT(offset) << RDA_GPIO_IRQ_FALL_SHIFT;
+
+		/* Switch to level trigger interrupt */
+		value |= BIT(offset) << RDA_GPIO_LEVEL_SHIFT;
+		writel_relaxed(value, base + RDA_GPIO_INT_CTRL_SET);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void rda_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	u32 offset = irqd_to_hwirq(data);
+	u32 trigger = irqd_get_trigger_type(data);
+
+	rda_gpio_set_irq(chip, offset, trigger);
+}
+
+static int rda_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	u32 offset = irqd_to_hwirq(data);
+	int ret;
+
+	ret = rda_gpio_set_irq(chip, offset, flow_type);
+	if (ret)
+		return ret;
+
+	if (flow_type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+		irq_set_handler_locked(data, handle_level_irq);
+	else if (flow_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+		irq_set_handler_locked(data, handle_edge_irq);
+
+	return 0;
+}
+
+static void rda_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
+	unsigned long status;
+	u32 n, girq;
+
+	chained_irq_enter(ic, desc);
+
+	status = readl_relaxed(rda_gpio->base + RDA_GPIO_INT_STATUS);
+	/* Only lower 8 bits are capable of generating interrupts */
+	status &= RDA_GPIO_IRQ_MASK;
+
+	for_each_set_bit(n, &status, RDA_GPIO_BANK_NR) {
+		girq = irq_find_mapping(chip->irq.domain, n);
+		generic_handle_irq(girq);
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static int rda_gpio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct gpio_irq_chip *irq_chip;
+	struct rda_gpio *rda_gpio;
+	u32 ngpios;
+	int ret;
+
+	rda_gpio = devm_kzalloc(&pdev->dev, sizeof(*rda_gpio), GFP_KERNEL);
+	if (!rda_gpio)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(&pdev->dev, "ngpios", &ngpios);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Not all ports have interrupt capability. For instance, on
+	 * RDA8810PL, GPIOC doesn't support interrupt. So we must handle
+	 * those also.
+	 */
+	rda_gpio->irq = platform_get_irq(pdev, 0);
+
+	rda_gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rda_gpio->base))
+		return PTR_ERR(rda_gpio->base);
+
+	spin_lock_init(&rda_gpio->lock);
+
+	rda_gpio->chip.label = dev_name(&pdev->dev);
+	rda_gpio->chip.ngpio = ngpios;
+	rda_gpio->chip.base = -1;
+	rda_gpio->chip.parent = &pdev->dev;
+	rda_gpio->chip.of_node = np;
+	rda_gpio->chip.get = rda_gpio_get;
+	rda_gpio->chip.set = rda_gpio_set;
+	rda_gpio->chip.direction_input = rda_gpio_direction_input;
+	rda_gpio->chip.direction_output = rda_gpio_direction_output;
+
+	if (rda_gpio->irq >= 0) {
+		rda_gpio->irq_chip.name = "rda-gpio",
+		rda_gpio->irq_chip.irq_ack = rda_gpio_irq_ack,
+		rda_gpio->irq_chip.irq_mask = rda_gpio_irq_mask,
+		rda_gpio->irq_chip.irq_unmask = rda_gpio_irq_unmask,
+		rda_gpio->irq_chip.irq_set_type = rda_gpio_irq_set_type,
+		rda_gpio->irq_chip.flags = IRQCHIP_SKIP_SET_WAKE,
+
+		irq_chip = &rda_gpio->chip.irq;
+		irq_chip->chip = &rda_gpio->irq_chip;
+		irq_chip->handler = handle_bad_irq;
+		irq_chip->default_type = IRQ_TYPE_NONE;
+		irq_chip->parent_handler = rda_gpio_irq_handler;
+		irq_chip->parent_handler_data = rda_gpio;
+		irq_chip->num_parents = 1;
+		irq_chip->parents = &rda_gpio->irq;
+	}
+
+	platform_set_drvdata(pdev, rda_gpio);
+
+	return devm_gpiochip_add_data(&pdev->dev, &rda_gpio->chip, rda_gpio);
+}
+
+static const struct of_device_id rda_gpio_of_match[] = {
+	{ .compatible = "rda,8810pl-gpio", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rda_gpio_of_match);
+
+static struct platform_driver rda_gpio_driver = {
+	.probe = rda_gpio_probe,
+	.driver = {
+		.name = "rda-gpio",
+		.of_match_table	= rda_gpio_of_match,
+	},
+};
+
+module_platform_driver_probe(rda_gpio_driver, rda_gpio_probe);
+
+MODULE_DESCRIPTION("RDA Micro GPIO driver");
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

