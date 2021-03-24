Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B73A34838D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 22:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238288AbhCXVXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 17:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238290AbhCXVXm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 17:23:42 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5CCEC0613DE
        for <linux-gpio@vger.kernel.org>; Wed, 24 Mar 2021 14:23:41 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9f01:9a93:b6b:1adc:3da7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 11D091E4FF8;
        Wed, 24 Mar 2021 22:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1616621020;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J9HJlcT1IYzACBj0XMtdrbhDch3wyhyTjZ9rtiSs8Ig=;
        b=hs20cb5ykuEA6bj71d/1fnqMyqJopSLHcNrKQPLT1eaVB/I2ZXljnNj8Licez+CXAEL2c3
        YxavwDVI9PHykl8o/deaOz1LmqHm5cIdkCOnZdbbJRevzPkByBrvwfzKFoXOyaR/sbeoYy
        7Pymb3o35pPnCwd+MSs9fARkeprjBd6a6PTGC4eDsJQBsrn6ArcPdlQ7uxv9z1DpVOTVHd
        zrondyBtUbDDKE7RJkyfDZ2kmmOkEVpxWwHX09ykvxO6pTLWyMpGdg+gD+JpeIvihIK/ct
        fLK9P8F4GNsdQBBDPLKkjNL0YMgO8LRnmN3HIohEKoHObqIw1jEOYjLbPfcckA==
From:   Sander Vanheule <sander@svanheule.net>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     bert@biot.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, maz@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v3 2/2] gpio: Add Realtek Otto GPIO support
Date:   Wed, 24 Mar 2021 22:22:41 +0100
Message-Id: <ffdd72259a5314549cf48a934085ae8efe7c0fc6.1616620884.git.sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616620884.git.sander@svanheule.net>
References: <cover.1616620884.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Realtek MIPS SoCs (platform name Otto) have GPIO controllers with up to
64 GPIOs, divided over two banks. Each bank has a set of registers for
32 GPIOs, with support for edge-triggered interrupts.

Each GPIO bank consists of four 8-bit GPIO ports (ABCD and EFGH). Most
registers pack one bit per GPIO, except for the IMR register, which
packs two bits per GPIO (AB-CD).

Although the byte order is currently assumed to have port A..D at offset
0x0..0x3, this has been observed to be reversed on other, Lexra-based,
SoCs (e.g. RTL8196E/97D/97F).

Interrupt support is disabled for the fallback devicetree-compatible
'realtek,otto-gpio'. This allows for quick support of GPIO banks in
which the byte order would be unknown. In this case, the port ordering
in the IMR registers may not match the reversed order in the other
registers (DCBA, and BA-DC or DC-BA).

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig             |  11 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-realtek-otto.c | 335 +++++++++++++++++++++++++++++++
 3 files changed, 347 insertions(+)
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..d3be17812f94 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -502,6 +502,17 @@ config GPIO_RDA
 	help
 	  Say Y here to support RDA Micro GPIO controller.
 
+config GPIO_REALTEK_OTTO
+	bool "Realtek Otto GPIO support"
+	depends on MACH_REALTEK_RTL
+	default MACH_REALTEK_RTL
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  The GPIO controller on the Otto MIPS platform supports up to two
+	  banks of 32 GPIOs, with edge triggered interrupts. The 32 GPIOs
+	  are grouped in four 8-bit wide ports.
+
 config GPIO_REG
 	bool
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c58a90a3c3b1..8ace5934e3c3 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
 obj-$(CONFIG_GPIO_RDA)			+= gpio-rda.o
 obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
+obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
 obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
new file mode 100644
index 000000000000..0714d54e08d1
--- /dev/null
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/swab.h>
+
+/*
+ * Total register block size is 0x1C for four ports.
+ * On the RTL8380/RLT8390 platforms port A, B, and C are implemented.
+ * RTL8389 and RTL8328 implement a second bank with ports E, F, G, and H.
+ *
+ * Port information is stored with the first port at offset 0, followed by the
+ * second, etc. Most registers store one bit per GPIO and should be read out in
+ * reversed endian order. The two interrupt mask registers store two bits per
+ * GPIO, and should be manipulated with swahw32, if required.
+ */
+
+/*
+ * Pin select: (0) "normal", (1) "dedicate peripheral"
+ * Not used on RTL8380/RTL8390, peripheral selection is managed by control bits
+ * in the peripheral registers.
+ */
+#define REALTEK_GPIO_REG_CNR		0x00
+/* Clear bit (0) for input, set bit (1) for output */
+#define REALTEK_GPIO_REG_DIR		0x08
+#define REALTEK_GPIO_REG_DATA		0x0C
+/* Read bit for IRQ status, write 1 to clear IRQ */
+#define REALTEK_GPIO_REG_ISR		0x10
+/* Two bits per GPIO in IMR registers */
+#define REALTEK_GPIO_REG_IMR		0x14
+#define REALTEK_GPIO_REG_IMR_AB		0x14
+#define REALTEK_GPIO_REG_IMR_CD		0x18
+#define REALTEK_GPIO_IMR_LINE_MASK	GENMASK(1, 0)
+#define REALTEK_GPIO_IRQ_EDGE_FALLING	1
+#define REALTEK_GPIO_IRQ_EDGE_RISING	2
+#define REALTEK_GPIO_IRQ_EDGE_BOTH	3
+
+#define REALTEK_GPIO_MAX		32
+#define REALTEK_GPIO_PORTS_PER_BANK	4
+
+/*
+ * Realtek GPIO driver data
+ * Because the interrupt mask register (IMR) combines the function of
+ * IRQ type selection and masking, two extra values are stored.
+ * intr_mask is used to mask/unmask the interrupts for certain GPIO,
+ * and intr_type is used to store the selected interrupt types. The
+ * logical AND of these values is written to IMR on changes.
+ *
+ * @gc Associated gpio_chip instance
+ * @base Base address of the register block
+ * @lock Lock for accessing the IRQ registers and values
+ * @intr_mask Mask for GPIO interrupts
+ * @intr_type GPIO interrupt type selection
+ */
+struct realtek_gpio_ctrl {
+	struct gpio_chip gc;
+	void __iomem *base;
+	raw_spinlock_t lock;
+	u16 intr_mask[REALTEK_GPIO_PORTS_PER_BANK];
+	u16 intr_type[REALTEK_GPIO_PORTS_PER_BANK];
+};
+
+enum realtek_gpio_flags {
+	GPIO_INTERRUPTS = BIT(0),
+};
+
+static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	return container_of(gc, struct realtek_gpio_ctrl, gc);
+}
+
+static inline unsigned int line_to_port(unsigned int line)
+{
+	return line / 8;
+}
+
+static inline unsigned int line_to_port_pin(unsigned int line)
+{
+	return line % 8;
+}
+
+static inline u8 read_u8_reg(void __iomem* reg, unsigned int port)
+{
+	return ioread8(reg + port);
+}
+
+static inline void write_u8_reg(void __iomem* reg, unsigned int port, u8 value)
+{
+	iowrite8(value, reg + port);
+}
+
+static inline u16 read_u16_reg(void __iomem* reg, unsigned int port)
+{
+	return ioread16(reg + 2 * port);
+}
+
+static inline void write_u16_reg(void __iomem* reg, unsigned int port, u16 value)
+{
+	iowrite16(value, reg + 2 * port);
+}
+
+/*
+ * Since the IMRs contain two bits per GPIO, only 16 GPIO lines fit in a 32-bit
+ * register. Use realtek_gpio_imr_bits() to put the GPIO line's new value in
+ * the right place.
+ */
+static inline u16 realtek_gpio_imr_bits(unsigned int pin, u16 value)
+{
+	return (value & REALTEK_GPIO_IMR_LINE_MASK) << 2 * pin;
+}
+
+static inline void realtek_gpio_write_imr(struct realtek_gpio_ctrl *ctrl,
+	unsigned int port, u16 irq_type, u16 irq_mask)
+{
+	write_u16_reg(ctrl->base + REALTEK_GPIO_REG_IMR, port,
+		   irq_type & irq_mask);
+}
+
+static void realtek_gpio_irq_ack(struct irq_data *data)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	irq_hw_number_t line = irqd_to_hwirq(data);
+
+	write_u8_reg(ctrl->base + REALTEK_GPIO_REG_ISR, line_to_port(line),
+		BIT(line_to_port_pin(line)));
+}
+
+static void realtek_gpio_irq_unmask(struct irq_data *data)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	unsigned int line = irqd_to_hwirq(data);
+	unsigned int port = line_to_port(line);
+	unsigned int pin = line_to_port_pin(line);
+	unsigned long flags;
+	u16 m;
+
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	m = ctrl->intr_mask[port];
+	m |= realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
+	ctrl->intr_mask[port] = m;
+	realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static void realtek_gpio_irq_mask(struct irq_data *data)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	unsigned int line = irqd_to_hwirq(data);
+	unsigned int port = line_to_port(line);
+	unsigned int pin = line_to_port_pin(line);
+	unsigned long flags;
+	u16 m;
+
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	m = ctrl->intr_mask[port];
+	m &= ~realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
+	ctrl->intr_mask[port] = m;
+	realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static int realtek_gpio_irq_set_type(struct irq_data *data,
+	unsigned int flow_type)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	unsigned int line = irqd_to_hwirq(data);
+	unsigned int port = line_to_port(line);
+	unsigned int pin = line_to_port_pin(line);
+	unsigned long flags;
+	u16 type, t;
+
+	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_FALLING:
+		type = REALTEK_GPIO_IRQ_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		type = REALTEK_GPIO_IRQ_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = REALTEK_GPIO_IRQ_EDGE_BOTH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	irq_set_handler_locked(data, handle_edge_irq);
+
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	t = ctrl->intr_type[port];
+	t &= ~realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
+	t |= realtek_gpio_imr_bits(pin, type);
+	ctrl->intr_type[port] = t;
+	realtek_gpio_write_imr(ctrl, port, t, ctrl->intr_mask[port]);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	return 0;
+}
+
+static void realtek_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	void __iomem *reg_isr = ctrl->base + REALTEK_GPIO_REG_ISR;
+	unsigned int lines_done;
+	unsigned int port_pin_count;
+	unsigned int port;
+	unsigned int irq;
+	int offset;
+	unsigned long status;
+
+	chained_irq_enter(irq_chip, desc);
+
+	for (lines_done = 0; lines_done < gc->ngpio; lines_done += 8) {
+		port = line_to_port(lines_done);
+		status = read_u8_reg(reg_isr, port);
+		port_pin_count = min(gc->ngpio - lines_done, (unsigned int) 8);
+		for_each_set_bit(offset, &status, port_pin_count) {
+			irq = irq_find_mapping(gc->irq.domain, offset);
+			generic_handle_irq(irq);
+			write_u8_reg(reg_isr, port, BIT(offset));
+		}
+	}
+
+	chained_irq_exit(irq_chip, desc);
+}
+
+static struct irq_chip realtek_gpio_irq_chip = {
+	.name = "realtek-otto-gpio",
+	.irq_ack = realtek_gpio_irq_ack,
+	.irq_mask = realtek_gpio_irq_mask,
+	.irq_unmask = realtek_gpio_irq_unmask,
+	.irq_set_type = realtek_gpio_irq_set_type,
+};
+
+static const struct of_device_id realtek_gpio_of_match[] = {
+	{ .compatible = "realtek,otto-gpio" },
+	{
+		.compatible = "realtek,rtl8380-gpio",
+		.data = (void *)GPIO_INTERRUPTS
+	},
+	{
+		.compatible = "realtek,rtl8390-gpio",
+		.data = (void *)GPIO_INTERRUPTS
+	},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
+
+static int realtek_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int dev_flags;
+	struct gpio_irq_chip *girq;
+	struct realtek_gpio_ctrl *ctrl;
+	u32 ngpios;
+	int err, irq;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	dev_flags = (unsigned int) device_get_match_data(dev);
+
+	if (device_property_read_u32(dev, "ngpios", &ngpios))
+		ngpios = REALTEK_GPIO_MAX;
+
+	if (ngpios > REALTEK_GPIO_MAX) {
+		dev_err(&pdev->dev, "invalid ngpios (max. %d)\n",
+			REALTEK_GPIO_MAX);
+		return -EINVAL;
+	}
+
+	ctrl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctrl->base))
+		return PTR_ERR(ctrl->base);
+
+	raw_spin_lock_init(&ctrl->lock);
+
+	err = bgpio_init(&ctrl->gc, dev, 4,
+		ctrl->base + REALTEK_GPIO_REG_DATA, NULL, NULL,
+		ctrl->base + REALTEK_GPIO_REG_DIR, NULL,
+		BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	if (err) {
+		dev_err(dev, "unable to init generic GPIO");
+		return err;
+	}
+
+	ctrl->gc.ngpio = ngpios;
+	ctrl->gc.owner = THIS_MODULE;
+
+	irq = platform_get_irq_optional(pdev, 0);
+	if ((dev_flags & GPIO_INTERRUPTS) && irq > 0) {
+		girq = &ctrl->gc.irq;
+		girq->chip = &realtek_gpio_irq_chip;
+		girq->parent_handler = realtek_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, girq->num_parents,
+					sizeof(*girq->parents),	GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+		girq->parents[0] = irq;
+
+		/* Disable and clear all interrupts */
+		iowrite32(0, ctrl->base + REALTEK_GPIO_REG_IMR_AB);
+		iowrite32(0, ctrl->base + REALTEK_GPIO_REG_IMR_CD);
+		iowrite32(GENMASK(31, 0), ctrl->base + REALTEK_GPIO_REG_ISR);
+	}
+
+	return gpiochip_add_data(&ctrl->gc, ctrl);
+}
+
+static struct platform_driver realtek_gpio_driver = {
+	.driver = {
+		.name = "realtek-otto-gpio",
+		.of_match_table	= realtek_gpio_of_match,
+	},
+	.probe = realtek_gpio_probe,
+};
+
+builtin_platform_driver(realtek_gpio_driver);
+
+MODULE_DESCRIPTION("Realtek Otto GPIO support");
+MODULE_AUTHOR("Sander Vanheule <sander@svanheule.net>");
+MODULE_LICENSE("GPL v2");
-- 
2.30.2

