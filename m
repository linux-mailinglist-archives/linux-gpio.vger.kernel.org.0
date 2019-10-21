Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CBFDE4C2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfJUGom (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:44:42 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45800 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfJUGom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:44:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id r1so7136015pgj.12
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4ubLY45T5Za3kAnlNfoZFmM61Hil6OCulEjai2WXzcI=;
        b=CoQZrJE8pd3pseByZay8l41UPp056cB9kwODLSA3851K7XhTlPbCii7Xqi4X5bemX5
         PjGccbtJ/r5mwEFAwBvVQixcO0187YO2MiuZZXwkpU6l7o0B2VESceFCYyEajsZvuHX0
         xnfOVUD7djIR6syzfPAfN2V7Oj+pvHLVMG+PE/B8lpn7Fw8Os/pj74V4zZRqcDgVm0ZV
         MIUjFNlEPh9AF76/vx8QCRPI/ToAuDlQFrroGYjYAzCA6zevkxU/CZRwnE+q0GbzTAom
         KJsaJc4gHykvJpdR8aH/nXRceK/AsyFtCx3z3bAI1zmRn8alr4qFzYhNnn4qtW1zM8l9
         92UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4ubLY45T5Za3kAnlNfoZFmM61Hil6OCulEjai2WXzcI=;
        b=K5AdJH67Y2dyhSasdh7lg6SN7kqCwzLb2kO9oI1sIkY5P+R2DlScAaVby90WnXmuvJ
         SH3o6zRKRQdKG5IOknimlknpBM5joMzKYcK4vtP+Vqp5rSmsDoc9Qls2l9bv16VKWS6w
         STns4xYaQIG3yMZLpF5PjHoGMAn6ozFBNB8okOOutTPVbx22nTch4yjxDy4JPK9xfeeE
         aOxU56GX6dYK1BtPomKq51dAq9Y19sGpSNVN6LxaXmFF/Yqybhv7ocQcwJx0QFTDq/pm
         lEwfYAG5AKBD8Z4Qk3bqayrA0/gLJG5IjVNTsqB16QrS4gigqWb15mfhC3HrKmMJAWBt
         RPRA==
X-Gm-Message-State: APjAAAXBnPU0KzUGiqe4jAk4QXOQN1SlEKcAkr/yxgMCpD2hhchDk8vk
        O/HnGJy5yOa0ox1a85QXCZ0i
X-Google-Smtp-Source: APXvYqx/X34KDSYLxIQwk6IwNl3IygwXGrXlT6M/tzZUf6CEz+XvVwOPiU25I1YFy2gLGV51AY69Gw==
X-Received: by 2002:a62:6842:: with SMTP id d63mr20875931pfc.166.1571640281275;
        Sun, 20 Oct 2019 23:44:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id d4sm13156624pjs.9.2019.10.20.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 23:44:40 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/4] gpio: Add RDA Micro GPIO controller support
Date:   Mon, 21 Oct 2019 12:14:12 +0530
Message-Id: <20191021064413.19840-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for GPIO controller from RDA Micro. This GPIO controller
is an in house IP, developed by RDA Micro (now Unisoc) for the use in
RDA88* series of SoCs. There are multiple GPIO ports present in all SoCs,
each capable of addressing 32 GPIOs. But only first 8 pins have the
interrupt capability.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/gpio/Kconfig    |   9 ++
 drivers/gpio/Makefile   |   1 +
 drivers/gpio/gpio-rda.c | 294 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 304 insertions(+)
 create mode 100644 drivers/gpio/gpio-rda.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925f..a896f0820a21 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -435,6 +435,15 @@ config GPIO_RCAR
 	help
 	  Say yes here to support GPIO on Renesas R-Car SoCs.
 
+config GPIO_RDA
+	bool "RDA Micro GPIO controller support"
+	depends on ARCH_RDA || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIO_GENERIC
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
index 000000000000..28dcbb58b76b
--- /dev/null
+++ b/drivers/gpio/gpio-rda.c
@@ -0,0 +1,294 @@
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
+static inline void rda_gpio_update(struct gpio_chip *chip, unsigned int offset,
+				   u16 reg, int val)
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
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	struct rda_gpio *rda_gpio;
+	u32 ngpios;
+	int ret;
+
+	rda_gpio = devm_kzalloc(dev, sizeof(*rda_gpio), GFP_KERNEL);
+	if (!rda_gpio)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(dev, "ngpios", &ngpios);
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
+	ret = bgpio_init(&rda_gpio->chip, dev, 4,
+			 rda_gpio->base + RDA_GPIO_VAL,
+			 rda_gpio->base + RDA_GPIO_SET,
+			 rda_gpio->base + RDA_GPIO_CLR,
+			 rda_gpio->base + RDA_GPIO_OEN_SET_OUT,
+			 rda_gpio->base + RDA_GPIO_OEN_SET_IN,
+			 BGPIOF_READ_OUTPUT_REG_SET);
+	if (ret) {
+		dev_err(dev, "bgpio_init failed\n");
+		return ret;
+	}
+
+	rda_gpio->chip.label = dev_name(dev);
+	rda_gpio->chip.ngpio = ngpios;
+	rda_gpio->chip.base = -1;
+	rda_gpio->chip.parent = dev;
+	rda_gpio->chip.of_node = np;
+
+	if (rda_gpio->irq >= 0) {
+		rda_gpio->irq_chip.name = "rda-gpio",
+		rda_gpio->irq_chip.irq_ack = rda_gpio_irq_ack,
+		rda_gpio->irq_chip.irq_mask = rda_gpio_irq_mask,
+		rda_gpio->irq_chip.irq_unmask = rda_gpio_irq_unmask,
+		rda_gpio->irq_chip.irq_set_type = rda_gpio_irq_set_type,
+		rda_gpio->irq_chip.flags = IRQCHIP_SKIP_SET_WAKE,
+
+		girq = &rda_gpio->chip.irq;
+		girq->chip = &rda_gpio->irq_chip;
+		girq->handler = handle_bad_irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->parent_handler = rda_gpio_irq_handler;
+		girq->parent_handler_data = rda_gpio;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1,
+					     sizeof(*girq->parents),
+					     GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = rda_gpio->irq;
+	}
+
+	platform_set_drvdata(pdev, rda_gpio);
+
+	return devm_gpiochip_add_data(dev, &rda_gpio->chip, rda_gpio);
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

