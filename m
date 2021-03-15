Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A1E33C674
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 20:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhCOTIn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 15:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhCOTIc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 15:08:32 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816ADC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 12:08:32 -0700 (PDT)
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eaff:9701:b4db:50a7:6f83:328f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id E7D1E1DE337;
        Mon, 15 Mar 2021 20:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1615835311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rTeRILAoKer2aYQZDl7gpwugXXKR4STsoWbLF7knGe8=;
        b=owLHbvzN93AZODzkyriEdI+RPR7Q1NPtBfaT0uWPOuYk4JOO3Gk0NgbE4KVviJKwNG0QgL
        4FX9LkieS6Cwspp5bpqMDiProGVxTx42caNDkOW9ksc9bvQOqi1xzH0MlQFKD31VPl4gP4
        OO3RVA0vXi0ak0bVKbhfXEVPJ0535E3n21lll8D/sstEAuuahGrCYVzhCQj38TS+gKi4ng
        XqytDVEk4YuQyt1mjWBgY8Yvzy4epV2q1yzhwAAr6Ep10ihl2lzwCGinmMzkWX/0HyZ24I
        gWtEg39VKs1ssBKebGqFu/Bkt27QdfuvN3oHxNUPFDiuXeKbLJobRnC1Psw/pg==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>, bert@biot.com
Subject: [PATCH v2 2/2] gpio: Add Realtek Otto GPIO support
Date:   Mon, 15 Mar 2021 20:08:06 +0100
Message-Id: <20210315190806.66762-3-sander@svanheule.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210315190806.66762-1-sander@svanheule.net>
References: <20210315082339.9787-1-sander@svanheule.net>
 <20210315190806.66762-1-sander@svanheule.net>
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
 drivers/gpio/Kconfig             |  12 ++
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-realtek-otto.c | 331 +++++++++++++++++++++++++++++++
 3 files changed, 344 insertions(+)
 create mode 100644 drivers/gpio/gpio-realtek-otto.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..fedf1e49469e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -502,6 +502,18 @@ config GPIO_RDA
 	help
 	  Say Y here to support RDA Micro GPIO controller.
 
+config GPIO_REALTEK_OTTO
+	bool "Realtek Otto GPIO support"
+	depends on MACH_REALTEK_RTL
+	depends on OF_GPIO
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
index 000000000000..818412687346
--- /dev/null
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
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
+/* Two bits per GPIO */
+#define REALTEK_GPIO_REG_IMR_AB		0x14
+#define REALTEK_GPIO_REG_IMR_CD		0x18
+#define REALTEK_GPIO_IMR_LINE_MASK	3
+#define REALTEK_GPIO_IRQ_EDGE_FALLING	1
+#define REALTEK_GPIO_IRQ_EDGE_RISING	2
+#define REALTEK_GPIO_IRQ_EDGE_BOTH	3
+
+#define REALTEK_GPIO_MAX		32
+
+/*
+ * Realtek GPIO driver data
+ * Because the interrupt mask register (IMR) combines the function of
+ * IRQ type selection and masking, two extra values are stored.
+ * intr_mask is used to mask/unmask the interrupts for certain GPIO,
+ * and intr_type is used to store the selected interrupt types. The
+ * logical AND of these values is written to IMR on changes.
+ *
+ * @dev Parent device
+ * @gc Associated gpio_chip instance
+ * @base Base address of the register block
+ * @lock Lock for accessing the IRQ registers and values
+ * @intr_mask Mask for GPIO interrupts
+ * @intr_type GPIO interrupt type selection
+ */
+struct realtek_gpio_ctrl {
+	struct device *dev;
+	struct gpio_chip gc;
+	void __iomem *base;
+	raw_spinlock_t lock;
+	u32 intr_mask[2];
+	u32 intr_type[2];
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
+static inline u32 realtek_gpio_isr_read(struct realtek_gpio_ctrl *ctrl)
+{
+	return swab32(readl(ctrl->base + REALTEK_GPIO_REG_ISR));
+}
+
+static inline void realtek_gpio_isr_clear(struct realtek_gpio_ctrl *ctrl,
+	unsigned int pin_mask)
+{
+	writel(swab32(pin_mask), ctrl->base + REALTEK_GPIO_REG_ISR);
+}
+
+static inline void realtek_gpio_update_imr(struct realtek_gpio_ctrl *ctrl,
+	unsigned int imr_offset, u32 type, u32 mask)
+{
+	unsigned int reg;
+
+	if (imr_offset == 0)
+		reg = REALTEK_GPIO_REG_IMR_AB;
+	else
+		reg = REALTEK_GPIO_REG_IMR_CD;
+	writel(swahw32(type & mask), ctrl->base + reg);
+}
+
+/*
+ * Since the IMRs contain two bits per GPIO, only 16 GPIO lines fit in a 32-bit
+ * register.
+ * Use realtek_gpio_pin_to_imr_offset() to select the correct IMR offset, and
+ * realtek_gpio_imr_bits() to put the GPIO line's new value in the right place.
+ */
+static inline u32 realtek_gpio_pin_to_imr_offset(unsigned int pin)
+{
+	return pin/16;
+}
+
+static inline u32 realtek_gpio_imr_bits(unsigned int pin, u32 value)
+{
+	return ((value & REALTEK_GPIO_IMR_LINE_MASK) << 2*(pin % 16));
+}
+
+static void realtek_gpio_irq_ack(struct irq_data *data)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	u32 pin = irqd_to_hwirq(data);
+
+	realtek_gpio_isr_clear(ctrl, BIT(pin));
+}
+
+static void realtek_gpio_irq_unmask(struct irq_data *data)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	unsigned int pin = irqd_to_hwirq(data);
+	unsigned int imr_offset = realtek_gpio_pin_to_imr_offset(pin);
+	unsigned long flags;
+	u32 m;
+
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	m = ctrl->intr_mask[imr_offset];
+	m |= realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
+	ctrl->intr_mask[imr_offset] = m;
+	realtek_gpio_update_imr(ctrl, imr_offset, ctrl->intr_type[imr_offset], m);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static void realtek_gpio_irq_mask(struct irq_data *data)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	unsigned int pin = irqd_to_hwirq(data);
+	unsigned int imr_offset = realtek_gpio_pin_to_imr_offset(pin);
+	unsigned long flags;
+	u32 m;
+
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	m = ctrl->intr_mask[imr_offset];
+	m &= ~realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
+	ctrl->intr_mask[imr_offset] = m;
+	realtek_gpio_update_imr(ctrl, imr_offset, ctrl->intr_type[imr_offset], m);
+	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+}
+
+static int realtek_gpio_irq_set_type(struct irq_data *data,
+	unsigned int flow_type)
+{
+	struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
+	irq_flow_handler_t handler;
+	unsigned int pin = irqd_to_hwirq(data);
+	unsigned int imr_offset = realtek_gpio_pin_to_imr_offset(pin);
+	unsigned long flags;
+	u32 type, t;
+
+	switch (flow_type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_NONE:
+		type = 0;
+		handler = handle_bad_irq;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = REALTEK_GPIO_IRQ_EDGE_FALLING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		type = REALTEK_GPIO_IRQ_EDGE_RISING;
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = REALTEK_GPIO_IRQ_EDGE_BOTH;
+		handler = handle_edge_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	irq_set_handler_locked(data, handler);
+
+	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	t = ctrl->intr_type[imr_offset];
+	t &= ~realtek_gpio_imr_bits(pin, REALTEK_GPIO_IMR_LINE_MASK);
+	t |= realtek_gpio_imr_bits(pin, type);
+	ctrl->intr_type[imr_offset] = t;
+	realtek_gpio_update_imr(ctrl, imr_offset, t, ctrl->intr_mask[imr_offset]);
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
+	int offset;
+	unsigned long status;
+
+	chained_irq_enter(irq_chip, desc);
+
+	status = realtek_gpio_isr_read(ctrl);
+	for_each_set_bit(offset, &status, gc->ngpio) {
+		dev_dbg(ctrl->dev, "gpio irq %d\n", offset);
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, offset));
+		realtek_gpio_isr_clear(ctrl, BIT(offset));
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
+	.irq_set_type = realtek_gpio_irq_set_type
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
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, realtek_gpio_of_match);
+
+static int realtek_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct gpio_irq_chip *girq;
+	struct realtek_gpio_ctrl *ctrl;
+	const struct of_device_id *match;
+	unsigned int match_flags;
+	u32 ngpios;
+	int err, irq;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->dev = dev;
+
+	if (!np) {
+		dev_err(&pdev->dev, "no DT node found\n");
+		return -EINVAL;
+	}
+
+	match = of_match_node(realtek_gpio_of_match, np);
+	match_flags = (unsigned int) match->data;
+
+	if (of_property_read_u32(np, "ngpios", &ngpios) != 0)
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
+	irq = of_irq_get(np, 0);
+	if ((match_flags & GPIO_INTERRUPTS) && irq > 0) {
+		girq = &ctrl->gc.irq;
+		girq->chip = &realtek_gpio_irq_chip;
+		girq->parent_handler = realtek_gpio_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+					GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+		girq->parents[0] = irq;
+
+		/* Disable and clear all interrupts */
+		realtek_gpio_update_imr(ctrl, 0, 0, 0);
+		realtek_gpio_update_imr(ctrl, 1, 0, 0);
+		realtek_gpio_isr_clear(ctrl, BIT(ngpios)-1);
+	}
+
+	err = gpiochip_add_data(&ctrl->gc, ctrl);
+	return err;
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

