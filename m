Return-Path: <linux-gpio+bounces-8905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614495955C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 09:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6AFECB24428
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 07:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D1A192D7E;
	Wed, 21 Aug 2024 07:07:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEE4192D78;
	Wed, 21 Aug 2024 07:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724224076; cv=none; b=rErDz2PPCF2GFZdnNouFJjIosST1oHQPYtocukcbXcFRA92G4R0Xp+suNMbYCAiwXxC2hYg/h+f8Bl751OWBbuWvVcWAZ2wWLBqA3U8hfOnD3AzU3WTOZeNhZdzI2BYItMmeOwGAlQryYiJDEC6ziWX9do+DPtVnb/rbqk+9Bjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724224076; c=relaxed/simple;
	bh=MlUwP+IVJ/lV1+tn/Mqo2Mp1mW15yCCKxXBxdVILlwQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LyJE12nbJsPfiYmPT7b/XuikMkJcVGPOO5UbkfmBHiaBtM6LGSt45wSF8emimRe3Ie1+51XhCMjnymv2NhHjoSLim1P3W6cHumYzTGz1cOsjpNmk5EqUUkiytYrY6MboCW7S/xEnwxlolZDsrQGpPSOQ3wN0y7a7ojSCUumyBUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 21 Aug
 2024 15:07:40 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 21 Aug 2024 15:07:40 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
Date: Wed, 21 Aug 2024 15:07:40 +0800
Message-ID: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In the 7th generation of the SoC from Aspeed, the control logic of the
GPIO controller has been updated to support per-pin control. Each pin now
has its own 32-bit register, allowing for individual control of the pin’s
value, direction, interrupt type, and other settings.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/Kconfig          |   7 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-aspeed-g7.c | 831 ++++++++++++++++++++++++++++++++++
 3 files changed, 839 insertions(+)
 create mode 100644 drivers/gpio/gpio-aspeed-g7.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 58f43bcced7c..93f237429b92 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -172,6 +172,13 @@ config GPIO_ASPEED
 	help
 	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
 
+config GPIO_ASPEED_G7
+	tristate "Aspeed G7 GPIO support"
+	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y here to support Aspeed AST2700 GPIO controllers.
+
 config GPIO_ASPEED_SGPIO
 	bool "Aspeed SGPIO support"
 	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 64dd6d9d730d..e830291761ee 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
 obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
 obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+obj-$(CONFIG_GPIO_ASPEED_G7)		+= gpio-aspeed-g7.o
 obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
 obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
diff --git a/drivers/gpio/gpio-aspeed-g7.c b/drivers/gpio/gpio-aspeed-g7.c
new file mode 100644
index 000000000000..dbca097de6ea
--- /dev/null
+++ b/drivers/gpio/gpio-aspeed-g7.c
@@ -0,0 +1,831 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 Aspeed Technology Inc.
+ *
+ * Billy Tsai <billy_tsai@aspeedtech.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/aspeed.h>
+#include <linux/gpio/driver.h>
+#include <linux/hashtable.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include <asm/div64.h>
+
+#define GPIO_G7_IRQ_STS_BASE 0x100
+#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
+#define GPIO_G7_CTRL_REG_BASE 0x180
+#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
+#define GPIO_G7_OUT_DATA BIT(0)
+#define GPIO_G7_DIR BIT(1)
+#define GPIO_G7_IRQ_EN BIT(2)
+#define GPIO_G7_IRQ_TYPE0 BIT(3)
+#define GPIO_G7_IRQ_TYPE1 BIT(4)
+#define GPIO_G7_IRQ_TYPE2 BIT(5)
+#define GPIO_G7_RST_TOLERANCE BIT(6)
+#define GPIO_G7_DEBOUNCE_SEL GENMASK(8, 7)
+#define GPIO_G7_INPUT_MASK BIT(9)
+#define GPIO_G7_IRQ_STS BIT(12)
+#define GPIO_G7_IN_DATA BIT(13)
+/*
+ * The configuration of the following registers should be determined
+ * outside of the GPIO driver.
+ */
+#define GPIO_G7_PRIVILEGE_W_REG_BASE 0x810
+#define GPIO_G7_PRIVILEGE_W_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_W_REG_BASE + ((x) >> 2) * 0x4)
+#define GPIO_G7_PRIVILEGE_R_REG_BASE 0x910
+#define GPIO_G7_PRIVILEGE_R_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_R_REG_BASE + ((x) >> 2) * 0x4)
+#define GPIO_G7_IRQ_TARGET_REG_BASE 0xA10
+#define GPIO_G7_IRQ_TARGET_REG_OFFSET(x) (GPIO_G7_IRQ_TARGET_REG_BASE + ((x) >> 2) * 0x4)
+#define GPIO_G7_IRQ_TO_INTC2_18 BIT(0)
+#define GPIO_G7_IRQ_TO_INTC2_19 BIT(1)
+#define GPIO_G7_IRQ_TO_INTC2_20 BIT(2)
+#define GPIO_G7_IRQ_TO_SIO BIT(3)
+#define GPIO_G7_IRQ_TARGET_RESET_TOLERANCE BIT(6)
+#define GPIO_G7_IRQ_TARGET_W_PROTECT BIT(7)
+
+static inline u32 field_get(u32 _mask, u32 _val)
+{
+	return (((_val) & (_mask)) >> (ffs(_mask) - 1));
+}
+
+static inline u32 field_prep(u32 _mask, u32 _val)
+{
+	return (((_val) << (ffs(_mask) - 1)) & (_mask));
+}
+
+static inline void ast_write_bits(void __iomem *addr, u32 mask, u32 val)
+{
+	iowrite32((ioread32(addr) & ~(mask)) | field_prep(mask, val), addr);
+}
+
+static inline void ast_clr_bits(void __iomem *addr, u32 mask)
+{
+	iowrite32((ioread32(addr) & ~(mask)), addr);
+}
+
+struct aspeed_bank_props {
+	unsigned int bank;
+	u32 input;
+	u32 output;
+};
+
+struct aspeed_gpio_g7_config {
+	unsigned int nr_gpios;
+	const struct aspeed_bank_props *props;
+};
+
+/*
+ * @offset_timer: Maps an offset to an @timer_users index, or zero if disabled
+ * @timer_users: Tracks the number of users for each timer
+ *
+ * The @timer_users has four elements but the first element is unused. This is
+ * to simplify accounting and indexing, as a zero value in @offset_timer
+ * represents disabled debouncing for the GPIO. Any other value for an element
+ * of @offset_timer is used as an index into @timer_users. This behaviour of
+ * the zero value aligns with the behaviour of zero built from the timer
+ * configuration registers (i.e. debouncing is disabled).
+ */
+struct aspeed_gpio_g7 {
+	struct gpio_chip chip;
+	struct device *dev;
+	raw_spinlock_t lock;
+	void __iomem *base;
+	int irq;
+	const struct aspeed_gpio_g7_config *config;
+
+	u8 *offset_timer;
+	unsigned int timer_users[4];
+	struct clk *clk;
+
+	u32 *dcache;
+};
+
+/*
+ * Note: The "value" register returns the input value sampled on the
+ *       line even when the GPIO is configured as an output. Since
+ *       that input goes through synchronizers, writing, then reading
+ *       back may not return the written value right away.
+ *
+ *       The "rdata" register returns the content of the write latch
+ *       and thus can be used to read back what was last written
+ *       reliably.
+ */
+
+static const int debounce_timers[4] = { 0x00, 0x04, 0x00, 0x08 };
+
+#define GPIO_BANK(x) ((x) >> 5)
+#define GPIO_OFFSET(x) ((x) & 0x1f)
+#define GPIO_BIT(x) BIT(GPIO_OFFSET(x))
+
+static inline bool is_bank_props_sentinel(const struct aspeed_bank_props *props)
+{
+	return !(props->input || props->output);
+}
+
+static inline const struct aspeed_bank_props *find_bank_props(struct aspeed_gpio_g7 *gpio,
+							      unsigned int offset)
+{
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		if (props->bank == GPIO_BANK(offset))
+			return props;
+		props++;
+	}
+
+	return NULL;
+}
+
+static inline bool have_gpio(struct aspeed_gpio_g7 *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	if (offset > gpio->chip.ngpio)
+		return false;
+
+	return (!props || ((props->input | props->output) & GPIO_BIT(offset)));
+}
+
+static inline bool have_input(struct aspeed_gpio_g7 *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->input & GPIO_BIT(offset));
+}
+
+#define have_irq(g, o) have_input((g), (o))
+#define have_debounce(g, o) have_input((g), (o))
+
+static inline bool have_output(struct aspeed_gpio_g7 *gpio, unsigned int offset)
+{
+	const struct aspeed_bank_props *props = find_bank_props(gpio, offset);
+
+	return !props || (props->output & GPIO_BIT(offset));
+}
+
+static int aspeed_gpio_g7_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+
+	return !!(field_get(GPIO_G7_IN_DATA, ioread32(addr)));
+}
+
+static void __aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	u32 reg;
+
+	reg = gpio->dcache[GPIO_BANK(offset)];
+
+	if (val)
+		reg |= GPIO_BIT(offset);
+	else
+		reg &= ~GPIO_BIT(offset);
+	gpio->dcache[GPIO_BANK(offset)] = reg;
+
+	ast_write_bits(addr, GPIO_G7_OUT_DATA, val);
+}
+
+static void aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	__aspeed_gpio_g7_set(gc, offset, val);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static int aspeed_gpio_g7_dir_in(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	unsigned long flags;
+
+	if (!have_input(gpio, offset))
+		return -EOPNOTSUPP;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	ast_clr_bits(addr, GPIO_G7_DIR);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_gpio_g7_dir_out(struct gpio_chip *gc, unsigned int offset, int val)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	unsigned long flags;
+
+	if (!have_output(gpio, offset))
+		return -EOPNOTSUPP;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	__aspeed_gpio_g7_set(gc, offset, val);
+	ast_write_bits(addr, GPIO_G7_DIR, 1);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_gpio_g7_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+	unsigned long flags;
+	u32 val;
+
+	if (!have_input(gpio, offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	if (!have_output(gpio, offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	val = ioread32(addr) & GPIO_G7_DIR;
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static inline int irqd_to_aspeed_gpio_g7_data(struct irq_data *d, struct aspeed_gpio_g7 **gpio,
+					      int *offset)
+{
+	struct aspeed_gpio_g7 *internal;
+
+	*offset = irqd_to_hwirq(d);
+
+	internal = irq_data_get_irq_chip_data(d);
+
+	/* This might be a bit of a questionable place to check */
+	if (!have_irq(internal, *offset))
+		return -EOPNOTSUPP;
+
+	*gpio = internal;
+
+	return 0;
+}
+
+static void aspeed_gpio_g7_irq_ack(struct irq_data *d)
+{
+	struct aspeed_gpio_g7 *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
+	if (rc)
+		return;
+
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	ast_write_bits(addr, GPIO_G7_IRQ_STS, 1);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+}
+
+static void aspeed_gpio_g7_irq_set_mask(struct irq_data *d, bool set)
+{
+	struct aspeed_gpio_g7 *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
+	if (rc)
+		return;
+
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+
+	/* Unmasking the IRQ */
+	if (set)
+		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	if (set)
+		ast_write_bits(addr, GPIO_G7_IRQ_EN, 1);
+	else
+		ast_clr_bits(addr, GPIO_G7_IRQ_EN);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	/* Masking the IRQ */
+	if (!set)
+		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
+}
+
+static void aspeed_gpio_g7_irq_mask(struct irq_data *d)
+{
+	aspeed_gpio_g7_irq_set_mask(d, false);
+}
+
+static void aspeed_gpio_g7_irq_unmask(struct irq_data *d)
+{
+	aspeed_gpio_g7_irq_set_mask(d, true);
+}
+
+static int aspeed_gpio_g7_set_type(struct irq_data *d, unsigned int type)
+{
+	u32 type0 = 0;
+	u32 type1 = 0;
+	u32 type2 = 0;
+	irq_flow_handler_t handler;
+	struct aspeed_gpio_g7 *gpio;
+	unsigned long flags;
+	void __iomem *addr;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
+	if (rc)
+		return -EINVAL;
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		type2 = 1;
+		fallthrough;
+	case IRQ_TYPE_EDGE_RISING:
+		type0 = 1;
+		fallthrough;
+	case IRQ_TYPE_EDGE_FALLING:
+		handler = handle_edge_irq;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type0 |= 1;
+		fallthrough;
+	case IRQ_TYPE_LEVEL_LOW:
+		type1 |= 1;
+		handler = handle_level_irq;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	ast_write_bits(addr, GPIO_G7_IRQ_TYPE2, type2);
+	ast_write_bits(addr, GPIO_G7_IRQ_TYPE1, type1);
+	ast_write_bits(addr, GPIO_G7_IRQ_TYPE0, type0);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	irq_set_handler_locked(d, handler);
+
+	return 0;
+}
+
+static void aspeed_gpio_g7_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct irq_chip *ic = irq_desc_get_chip(desc);
+	unsigned int i, p, banks;
+	unsigned long reg;
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	void __iomem *addr;
+
+	chained_irq_enter(ic, desc);
+
+	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
+	for (i = 0; i < banks; i++) {
+		addr = gpio->base + GPIO_G7_IRQ_STS_OFFSET(i);
+
+		reg = ioread32(addr);
+
+		for_each_set_bit(p, &reg, 32)
+			generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
+	}
+
+	chained_irq_exit(ic, desc);
+}
+
+static void aspeed_init_irq_valid_mask(struct gpio_chip *gc, unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(gc);
+	const struct aspeed_bank_props *props = gpio->config->props;
+
+	while (!is_bank_props_sentinel(props)) {
+		unsigned int offset;
+		const unsigned long input = props->input;
+
+		/* Pretty crummy approach, but similar to GPIO core */
+		for_each_clear_bit(offset, &input, 32) {
+			unsigned int i = props->bank * 32 + offset;
+
+			if (i >= gpio->chip.ngpio)
+				break;
+
+			clear_bit(i, valid_mask);
+		}
+
+		props++;
+	}
+}
+
+static int aspeed_gpio_g7_reset_tolerance(struct gpio_chip *chip, unsigned int offset, bool enable)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(chip);
+	unsigned long flags;
+	void __iomem *addr;
+
+	addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	if (enable)
+		ast_write_bits(addr, GPIO_G7_RST_TOLERANCE, 1);
+	else
+		ast_clr_bits(addr, GPIO_G7_RST_TOLERANCE);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int aspeed_gpio_g7_request(struct gpio_chip *chip, unsigned int offset)
+{
+	if (!have_gpio(gpiochip_get_data(chip), offset))
+		return -ENODEV;
+
+	return pinctrl_gpio_request(chip->base + offset);
+}
+
+static void aspeed_gpio_g7_free(struct gpio_chip *chip, unsigned int offset)
+{
+	pinctrl_gpio_free(chip->base + offset);
+}
+
+static int usecs_to_cycles(struct aspeed_gpio_g7 *gpio, unsigned long usecs, u32 *cycles)
+{
+	u64 rate;
+	u64 n;
+	u32 r;
+
+	rate = clk_get_rate(gpio->clk);
+	if (!rate)
+		return -EOPNOTSUPP;
+
+	n = rate * usecs;
+	r = do_div(n, 1000000);
+
+	if (n >= U32_MAX)
+		return -ERANGE;
+
+	/* At least as long as the requested time */
+	*cycles = n + (!!r);
+
+	return 0;
+}
+
+/* Call under gpio->lock */
+static int register_allocated_timer(struct aspeed_gpio_g7 *gpio, unsigned int offset,
+				    unsigned int timer)
+{
+	if (WARN(gpio->offset_timer[offset] != 0, "Offset %d already allocated timer %d\n", offset,
+		 gpio->offset_timer[offset]))
+		return -EINVAL;
+
+	if (WARN(gpio->timer_users[timer] == UINT_MAX, "Timer user count would overflow\n"))
+		return -EPERM;
+
+	gpio->offset_timer[offset] = timer;
+	gpio->timer_users[timer]++;
+
+	return 0;
+}
+
+/* Call under gpio->lock */
+static int unregister_allocated_timer(struct aspeed_gpio_g7 *gpio, unsigned int offset)
+{
+	if (WARN(gpio->offset_timer[offset] == 0, "No timer allocated to offset %d\n", offset))
+		return -EINVAL;
+
+	if (WARN(gpio->timer_users[gpio->offset_timer[offset]] == 0,
+		 "No users recorded for timer %d\n", gpio->offset_timer[offset]))
+		return -EINVAL;
+
+	gpio->timer_users[gpio->offset_timer[offset]]--;
+	gpio->offset_timer[offset] = 0;
+
+	return 0;
+}
+
+/* Call under gpio->lock */
+static inline bool timer_allocation_registered(struct aspeed_gpio_g7 *gpio, unsigned int offset)
+{
+	return gpio->offset_timer[offset] > 0;
+}
+
+static void configure_timer(struct aspeed_gpio_g7 *gpio, unsigned int offset, unsigned int timer)
+{
+	void __iomem *addr = gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
+
+	/* Note: Debounce timer isn't under control of the command
+	 * source registers, so no need to sync with the coprocessor
+	 */
+	ast_write_bits(addr, GPIO_G7_DEBOUNCE_SEL, timer);
+}
+
+static int enable_debounce(struct gpio_chip *chip, unsigned int offset, unsigned long usecs)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(chip);
+	u32 requested_cycles;
+	unsigned long flags;
+	int rc;
+	int i;
+
+	if (!gpio->clk)
+		return -EINVAL;
+
+	rc = usecs_to_cycles(gpio, usecs, &requested_cycles);
+	if (rc < 0) {
+		dev_warn(chip->parent, "Failed to convert %luus to cycles at %luHz: %d\n", usecs,
+			 clk_get_rate(gpio->clk), rc);
+		return rc;
+	}
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	if (timer_allocation_registered(gpio, offset)) {
+		rc = unregister_allocated_timer(gpio, offset);
+		if (rc < 0)
+			goto out;
+	}
+
+	/* Try to find a timer already configured for the debounce period */
+	for (i = 1; i < ARRAY_SIZE(debounce_timers); i++) {
+		u32 cycles;
+
+		cycles = ioread32(gpio->base + debounce_timers[i]);
+		if (requested_cycles == cycles)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(debounce_timers)) {
+		int j;
+
+		/*
+		 * As there are no timers configured for the requested debounce
+		 * period, find an unused timer instead
+		 */
+		for (j = 1; j < ARRAY_SIZE(gpio->timer_users); j++) {
+			if (gpio->timer_users[j] == 0)
+				break;
+		}
+
+		if (j == ARRAY_SIZE(gpio->timer_users)) {
+			dev_warn(chip->parent,
+				 "Debounce timers exhausted, cannot debounce for period %luus\n",
+				 usecs);
+
+			rc = -EPERM;
+
+			/*
+			 * We already adjusted the accounting to remove @offset
+			 * as a user of its previous timer, so also configure
+			 * the hardware so @offset has timers disabled for
+			 * consistency.
+			 */
+			configure_timer(gpio, offset, 0);
+			goto out;
+		}
+
+		i = j;
+
+		iowrite32(requested_cycles, gpio->base + debounce_timers[i]);
+	}
+
+	if (WARN(i == 0, "Cannot register index of disabled timer\n")) {
+		rc = -EINVAL;
+		goto out;
+	}
+
+	register_allocated_timer(gpio, offset, i);
+	configure_timer(gpio, offset, i);
+
+out:
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return rc;
+}
+
+static int disable_debounce(struct gpio_chip *chip, unsigned int offset)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(chip);
+	unsigned long flags;
+	int rc;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	rc = unregister_allocated_timer(gpio, offset);
+	if (!rc)
+		configure_timer(gpio, offset, 0);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return rc;
+}
+
+static int set_debounce(struct gpio_chip *chip, unsigned int offset, unsigned long usecs)
+{
+	struct aspeed_gpio_g7 *gpio = gpiochip_get_data(chip);
+
+	if (!have_debounce(gpio, offset))
+		return -EOPNOTSUPP;
+
+	if (usecs)
+		return enable_debounce(chip, offset, usecs);
+
+	return disable_debounce(chip, offset);
+}
+
+static int aspeed_gpio_g7_set_config(struct gpio_chip *chip, unsigned int offset,
+				     unsigned long config)
+{
+	unsigned long param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
+
+	if (param == PIN_CONFIG_INPUT_DEBOUNCE)
+		return set_debounce(chip, offset, arg);
+	else if (param == PIN_CONFIG_BIAS_DISABLE || param == PIN_CONFIG_BIAS_PULL_DOWN ||
+		 param == PIN_CONFIG_DRIVE_STRENGTH)
+		return pinctrl_gpio_set_config(offset, config);
+	else if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN || param == PIN_CONFIG_DRIVE_OPEN_SOURCE)
+		/* Return -EOPNOTSUPP to trigger emulation, as per datasheet */
+		return -EOPNOTSUPP;
+	else if (param == PIN_CONFIG_PERSIST_STATE)
+		return aspeed_gpio_g7_reset_tolerance(chip, offset, arg);
+
+	return -EOPNOTSUPP;
+}
+
+static void aspeed_gpio_g7_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct aspeed_gpio_g7 *gpio;
+	int rc, offset;
+
+	rc = irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
+	if (rc)
+		return;
+
+	seq_printf(p, dev_name(gpio->dev));
+}
+
+static const struct irq_chip aspeed_gpio_g7_irq_chip = {
+	.irq_ack = aspeed_gpio_g7_irq_ack,
+	.irq_mask = aspeed_gpio_g7_irq_mask,
+	.irq_unmask = aspeed_gpio_g7_irq_unmask,
+	.irq_set_type = aspeed_gpio_g7_set_type,
+	.irq_print_chip = aspeed_gpio_g7_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static const struct aspeed_bank_props ast2700_bank_props[] = {
+	/*     input	  output   */
+	{ 1, 0x0fffffff, 0x0fffffff }, /* E/F/G/H, 4-GPIO hole */
+	{ 6, 0x00ffffff, 0x00ffffff }, /* Y/Z/AA */
+	{},
+};
+
+static const struct aspeed_gpio_g7_config ast2700_config =
+	/*
+	 * ast2700 has two controllers one with 212 GPIOs and one with 16 GPIOs.
+	 * 216 for simplicity, actual number is 212 (4-GPIO hole in GPIOH)
+	 * We expect ngpio being set in the device tree and this is a fallback
+	 * option.
+	 */
+	{
+		.nr_gpios = 216,
+		.props = ast2700_bank_props,
+	};
+
+static const struct of_device_id aspeed_gpio_g7_of_table[] = {
+	{
+		.compatible = "aspeed,ast2700-gpio",
+		.data = &ast2700_config,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_gpio_g7_of_table);
+
+static int __init aspeed_gpio_g7_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *gpio_id;
+	struct aspeed_gpio_g7 *gpio;
+	int rc, banks, err;
+	u32 ngpio;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gpio->base))
+		return PTR_ERR(gpio->base);
+
+	gpio->dev = &pdev->dev;
+
+	raw_spin_lock_init(&gpio->lock);
+
+	gpio_id = of_match_node(aspeed_gpio_g7_of_table, pdev->dev.of_node);
+	if (!gpio_id)
+		return -EINVAL;
+
+	gpio->clk = of_clk_get(pdev->dev.of_node, 0);
+	if (IS_ERR(gpio->clk)) {
+		dev_warn(&pdev->dev, "Failed to get clock from devicetree, debouncing disabled\n");
+		gpio->clk = NULL;
+	}
+
+	gpio->config = gpio_id->data;
+
+	gpio->chip.parent = &pdev->dev;
+	err = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
+	gpio->chip.ngpio = (u16)ngpio;
+	if (err)
+		gpio->chip.ngpio = gpio->config->nr_gpios;
+	gpio->chip.direction_input = aspeed_gpio_g7_dir_in;
+	gpio->chip.direction_output = aspeed_gpio_g7_dir_out;
+	gpio->chip.get_direction = aspeed_gpio_g7_get_direction;
+	gpio->chip.request = aspeed_gpio_g7_request;
+	gpio->chip.free = aspeed_gpio_g7_free;
+	gpio->chip.get = aspeed_gpio_g7_get;
+	gpio->chip.set = aspeed_gpio_g7_set;
+	gpio->chip.set_config = aspeed_gpio_g7_set_config;
+	gpio->chip.label = dev_name(&pdev->dev);
+	gpio->chip.base = -1;
+
+	/* Allocate a cache of the output registers */
+	banks = DIV_ROUND_UP(gpio->chip.ngpio, 32);
+	gpio->dcache = devm_kcalloc(&pdev->dev, banks, sizeof(u32), GFP_KERNEL);
+	if (!gpio->dcache)
+		return -ENOMEM;
+
+	/* Optionally set up an irqchip if there is an IRQ */
+	rc = platform_get_irq(pdev, 0);
+	if (rc > 0) {
+		struct gpio_irq_chip *girq;
+
+		gpio->irq = rc;
+		girq = &gpio->chip.irq;
+		gpio_irq_chip_set_chip(girq, &aspeed_gpio_g7_irq_chip);
+		girq->chip->name = dev_name(&pdev->dev);
+
+		girq->parent_handler = aspeed_gpio_g7_irq_handler;
+		girq->num_parents = 1;
+		girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->parents[0] = gpio->irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		girq->handler = handle_bad_irq;
+		girq->init_valid_mask = aspeed_init_irq_valid_mask;
+	}
+
+	gpio->offset_timer = devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
+	if (!gpio->offset_timer)
+		return -ENOMEM;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &gpio->chip, gpio);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+
+static struct platform_driver aspeed_gpio_g7_driver = {
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = aspeed_gpio_g7_of_table,
+	},
+};
+
+module_platform_driver_probe(aspeed_gpio_g7_driver, aspeed_gpio_g7_probe);
+
+MODULE_DESCRIPTION("Aspeed G7 GPIO Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


