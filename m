Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293763B8B2B
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 02:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238161AbhGAAYz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 20:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236997AbhGAAYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 20:24:54 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F7BC0613A2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 17:22:25 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id w22so651913pff.5
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 17:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VGH9vnhc/WVW5WJdgtx+tH0iUwGzVHOjaIYJMiSC7+o=;
        b=C2FgR1lmepMz3AVFvYabaJ3OWBFHWX4JK3xMojc9TFqJGdLqTyqLs5HPpxakTVfX9S
         ym5xniPqQY6fI25gO2/KtSWwjSjp9pFXc3D366suHGRHCcmnFNZOmnfSfZqTUufyVhCq
         6BSvRue3HViJW5mA1MLhEHcIxb9YnsG0tkUx7D/UvcRWSBsSytR/ezwgL/toQgUqkXxE
         4yvuRLZbu5CopDz78ekyZTWhfG/xmuTmF7lkdTre1qStS3xckCN0bVseN7OAek4jXBbN
         HuSYwOrvCsW9Pmqic3sN+bPGhXcHHkwRAXsSqDHTjWm7g5KOHer1JnTxY6ASSppVGnZ0
         FYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGH9vnhc/WVW5WJdgtx+tH0iUwGzVHOjaIYJMiSC7+o=;
        b=Utr+w34T6qEOaxVNppXNVANfFWP3Xf8aivKc8/C1Lnt3g5vuI93N4eSS+ektIB7ulE
         fMHsf35bH7YnC0p3UpX7ZkoiQ7yEw0rmNSGsA6hgJf+Xd9nXurwYl7wcrEjNJSD6Ii1/
         YB6u+fWnVQRcg9Ctwx2hHOTuvuI/mQVwh5HF9CEi1KG5GueFRhzoRkkMjKY+WiNaKwl3
         d5oZkSc49Mhyt2uYV6ze3th094fsu/kB2EvPQNugG/SX0C7J1ZvTcQ4JRP5gdK/kIm8j
         zu/bpJ1mL3BZz+W1mUt4l149WJYm4jhyKioaqDyn9jS98sS9r7z+yFgQhnl0lW8mt3pO
         cfWA==
X-Gm-Message-State: AOAM533blie742JnFO1Mfr68rpE2BL05xjwPrQLZAqa18IllEanouHpr
        j19DOC87P9bcMAWDLSWCKWRcGg==
X-Google-Smtp-Source: ABdhPJzmmtM1Ya9yLuMf/utAc+e+7ArBCGgPHqhc6MkTB+02NTZs4F1KNfCLTExlfbI0zNxhgaGYLA==
X-Received: by 2002:a62:1657:0:b029:301:af69:5ae3 with SMTP id 84-20020a6216570000b0290301af695ae3mr38093701pfw.57.1625098944530;
        Wed, 30 Jun 2021 17:22:24 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:8687:fcbc:6b3d:c844])
        by smtp.gmail.com with ESMTPSA id v6sm25117495pgk.33.2021.06.30.17.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 17:22:23 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO driver
Date:   Wed, 30 Jun 2021 17:20:39 -0700
Message-Id: <20210701002037.912625-3-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210701002037.912625-1-drew@beagleboard.org>
References: <20210701002037.912625-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPIO driver for the StarFive JH7100 SoC [1] used on the
BeagleV Starlight JH7100 board [2].

[1] https://github.com/starfive-tech/beaglev_doc/
[2] https://github.com/beagleboard/beaglev-starlight

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 MAINTAINERS                         |   8 +
 drivers/gpio/Kconfig                |   8 +
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-starfive-jh7100.c | 425 ++++++++++++++++++++++++++++
 4 files changed, 442 insertions(+)
 create mode 100644 drivers/gpio/gpio-starfive-jh7100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bc0ceef87b73..04fccc2ceffa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17423,6 +17423,14 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	drivers/staging/
 
+SIFVE JH7100 SOC GPIO DRIVER
+M:	Drew Fustini <drew@beagleboard.org>
+M:	Huan Feng <huan.feng@starfivetech.com>
+L:	linux-riscv@lists.infradead.org
+L:	linux-gpio@vger.kernel.org
+F:	Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
+F:	drivers/gpio/gpio-starfive-jh7100.c
+
 STARFIRE/DURALAN NETWORK DRIVER
 M:	Ion Badulescu <ionut@badula.org>
 S:	Odd Fixes
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 1dd0ec6727fd..26630e4852c0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -542,6 +542,14 @@ config GPIO_SIFIVE
 	help
 	  Say yes here to support the GPIO device on SiFive SoCs.
 
+config GPIO_STARFIVE_JH7100
+	bool "StarFive JH7100 GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	default y if SOC_STARFIVE_VIC7100
+	help
+	  Say yes here to support the GPIO device on StarFive JH7100 SoC.
+
 config GPIO_SIOX
 	tristate "SIOX GPIO support"
 	depends on SIOX
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d7c81e1611a4..939922eaf5f3 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -132,6 +132,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
+obj-$(CONFIG_GPIO_STARFIVE_JH7100)	+= gpio-starfive-jh7100.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-starfive-jh7100.c b/drivers/gpio/gpio-starfive-jh7100.c
new file mode 100644
index 000000000000..b94ebfe9eaf7
--- /dev/null
+++ b/drivers/gpio/gpio-starfive-jh7100.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GPIO driver for StarFive JH7100 SoC
+ *
+ * Copyright (C) 2020 Shanghai StarFive Technology Co., Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+/*
+ * refer to Section 12. GPIO Registers in JH7100 datasheet:
+ * https://github.com/starfive-tech/beaglev_doc
+ */
+
+/* global enable */
+#define GPIO_EN		0x0
+
+/* interrupt type */
+#define GPIO_IS_LOW	0x10
+#define GPIO_IS_HIGH	0x14
+
+/* edge trigger interrupt type */
+#define GPIO_IBE_LOW	0x18
+#define GPIO_IBE_HIGH	0x1c
+
+/* edge trigger interrupt polarity */
+#define GPIO_IEV_LOW	0x20
+#define GPIO_IEV_HIGH	0x24
+
+/* interrupt max */
+#define GPIO_IE_LOW	0x28
+#define GPIO_IE_HIGH	0x2c
+
+/* clear edge-triggered interrupt */
+#define GPIO_IC_LOW	0x30
+#define GPIO_IC_HIGH	0x34
+
+/* edge-triggered interrupt status (read-only) */
+#define GPIO_RIS_LOW	0x38
+#define GPIO_RIS_HIGH	0x3c
+
+/* interrupt status after masking (read-only) */
+#define GPIO_MIS_LOW	0x40
+#define GPIO_MIS_HIGH	0x44
+
+/* data value of gpio */
+#define GPIO_DIN_LOW	0x48
+#define GPIO_DIN_HIGH	0x4c
+
+/* GPIO0_DOUT_CFG is 0x50, GPIOn_DOUT_CFG is 0x50+(n*8) */
+#define GPIO_DOUT_X_REG	0x50
+
+/* GPIO0_DOEN_CFG is 0x54, GPIOn_DOEN_CFG is 0x54+(n*8) */
+#define GPIO_DOEN_X_REG	0x54
+
+#define MAX_GPIO	 64
+
+struct starfive_gpio {
+	raw_spinlock_t		lock;
+	void __iomem		*base;
+	struct gpio_chip	gc;
+	unsigned long		enabled;
+	unsigned int		trigger[MAX_GPIO];
+	unsigned int		irq_parent[MAX_GPIO];
+};
+
+static int starfive_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	writel_relaxed(0x1, chip->base + GPIO_DOEN_X_REG + offset * 8);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int starfive_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	writel_relaxed(0x0, chip->base + GPIO_DOEN_X_REG + offset * 8);
+	writel_relaxed(value, chip->base + GPIO_DOUT_X_REG + offset * 8);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+
+	return 0;
+}
+
+static int starfive_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	return readl_relaxed(chip->base + GPIO_DOEN_X_REG + offset * 8) & 0x1;
+}
+
+static int starfive_get_value(struct gpio_chip *gc, unsigned int offset)
+{
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	int value;
+
+	if (offset >= gc->ngpio)
+		return -EINVAL;
+
+	if (offset < 32) {
+		value = readl_relaxed(chip->base + GPIO_DIN_LOW);
+		value = (value >> offset) & 0x1;
+	} else {
+		value = readl_relaxed(chip->base + GPIO_DIN_HIGH);
+		value = (value >> (offset - 32)) & 0x1;
+	}
+
+	return value;
+}
+
+static void starfive_set_value(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (offset >= gc->ngpio)
+		return;
+
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	writel_relaxed(value, chip->base + GPIO_DOUT_X_REG + offset * 8);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static void starfive_set_ie(struct starfive_gpio *chip, int offset)
+{
+	unsigned long flags;
+	int old_value, new_value;
+	int reg_offset, index;
+
+	if (offset < 32) {
+		reg_offset = 0;
+		index = offset;
+	} else {
+		reg_offset = 4;
+		index = offset - 32;
+	}
+	raw_spin_lock_irqsave(&chip->lock, flags);
+	old_value = readl_relaxed(chip->base + GPIO_IE_LOW + reg_offset);
+	new_value = old_value | (1 << index);
+	writel_relaxed(new_value, chip->base + GPIO_IE_LOW + reg_offset);
+	raw_spin_unlock_irqrestore(&chip->lock, flags);
+}
+
+static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d);
+	unsigned int reg_is, reg_ibe, reg_iev;
+	int reg_offset, index;
+
+	if (offset < 0 || offset >= gc->ngpio)
+		return -EINVAL;
+
+	if (offset < 32) {
+		reg_offset = 0;
+		index = offset;
+	} else {
+		reg_offset = 4;
+		index = offset - 32;
+	}
+
+	reg_is = readl_relaxed(chip->base + GPIO_IS_LOW + reg_offset);
+	reg_ibe = readl_relaxed(chip->base + GPIO_IBE_LOW + reg_offset);
+	reg_iev = readl_relaxed(chip->base + GPIO_IEV_LOW + reg_offset);
+
+	switch (trigger) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		reg_is  &= ~(1 << index);
+		reg_ibe &= ~(1 << index);
+		reg_iev |= (1 << index);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		reg_is  &= ~(1 << index);
+		reg_ibe &= ~(1 << index);
+		reg_iev &= (1 << index);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		reg_is  |= ~(1 << index);
+		reg_ibe |= ~(1 << index);
+		// no need to set edge type when both
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		reg_is  |= ~(1 << index);
+		reg_ibe &= ~(1 << index);
+		reg_iev |= (1 << index);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		reg_is  |= ~(1 << index);
+		reg_ibe &= ~(1 << index);
+		reg_iev &= (1 << index);
+		break;
+	}
+
+	writel_relaxed(reg_is, chip->base + GPIO_IS_LOW + reg_offset);
+	writel_relaxed(reg_ibe, chip->base + GPIO_IBE_LOW + reg_offset);
+	writel_relaxed(reg_iev, chip->base + GPIO_IEV_LOW + reg_offset);
+	chip->trigger[offset] = trigger;
+	starfive_set_ie(chip, offset);
+	return 0;
+}
+
+/* chained_irq_{enter,exit} already mask the parent */
+static void starfive_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	unsigned int value;
+	int offset = irqd_to_hwirq(d);
+	int reg_offset, index;
+
+	if (offset < 0 || offset >= gc->ngpio)
+		return;
+
+	if (offset < 32) {
+		reg_offset = 0;
+		index = offset;
+	} else {
+		reg_offset = 4;
+		index = offset - 32;
+	}
+
+	value = readl_relaxed(chip->base + GPIO_IE_LOW + reg_offset);
+	value &= ~(0x1 << index);
+	writel_relaxed(value, chip->base + GPIO_IE_LOW + reg_offset);
+}
+
+static void starfive_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	unsigned int value;
+	int offset = irqd_to_hwirq(d);
+	int reg_offset, index;
+
+	if (offset < 0 || offset >= gc->ngpio)
+		return;
+
+	if (offset < 32) {
+		reg_offset = 0;
+		index = offset;
+	} else {
+		reg_offset = 4;
+		index = offset - 32;
+	}
+
+	value = readl_relaxed(chip->base + GPIO_IE_LOW + reg_offset);
+	value |= (0x1 << index);
+	writel_relaxed(value, chip->base + GPIO_IE_LOW + reg_offset);
+}
+
+static void starfive_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d);
+
+	starfive_irq_unmask(d);
+	assign_bit(offset, &chip->enabled, 1);
+}
+
+static void starfive_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct starfive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % MAX_GPIO; // must not fail
+
+	assign_bit(offset, &chip->enabled, 0);
+	starfive_set_ie(chip, offset);
+}
+
+static struct irq_chip starfive_irqchip = {
+	.name		= "starfive-jh7100-gpio",
+	.irq_set_type	= starfive_irq_set_type,
+	.irq_mask	= starfive_irq_mask,
+	.irq_unmask	= starfive_irq_unmask,
+	.irq_enable	= starfive_irq_enable,
+	.irq_disable	= starfive_irq_disable,
+};
+
+static irqreturn_t starfive_irq_handler(int irq, void *gc)
+{
+	int offset;
+	int reg_offset, index;
+	unsigned int value;
+	unsigned long flags;
+	struct starfive_gpio *chip = gc;
+
+	for (offset = 0; offset < MAX_GPIO; offset++) {
+		if (offset < 32) {
+			reg_offset = 0;
+			index = offset;
+		} else {
+			reg_offset = 4;
+			index = offset - 32;
+		}
+
+		raw_spin_lock_irqsave(&chip->lock, flags);
+		value = readl_relaxed(chip->base + GPIO_MIS_LOW + reg_offset);
+		if (value & BIT(index))
+			writel_relaxed(BIT(index), chip->base + GPIO_IC_LOW +
+					reg_offset);
+		raw_spin_unlock_irqrestore(&chip->lock, flags);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int starfive_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct starfive_gpio *chip;
+	struct gpio_irq_chip *girq;
+	struct resource *res;
+	int irq, ret, ngpio;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	chip->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(chip->base)) {
+		dev_err(dev, "failed to allocate device memory\n");
+		return PTR_ERR(chip->base);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "Cannot get IRQ resource\n");
+		return irq;
+	}
+
+	raw_spin_lock_init(&chip->lock);
+	chip->gc.direction_input = starfive_direction_input;
+	chip->gc.direction_output = starfive_direction_output;
+	chip->gc.get_direction = starfive_get_direction;
+	chip->gc.get = starfive_get_value;
+	chip->gc.set = starfive_set_value;
+	chip->gc.base = 0;
+	chip->gc.ngpio = MAX_GPIO;
+	chip->gc.label = dev_name(dev);
+	chip->gc.parent = dev;
+	chip->gc.owner = THIS_MODULE;
+
+	girq = &chip->gc.irq;
+	girq->chip = &starfive_irqchip;
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_simple_irq;
+
+	ret = gpiochip_add_data(&chip->gc, chip);
+	if (ret) {
+		dev_err(dev, "gpiochip_add_data ret=%d!\n", ret);
+		return ret;
+	}
+
+	/* Disable all GPIO interrupts before enabling parent interrupts */
+	iowrite32(0, chip->base + GPIO_IE_HIGH);
+	iowrite32(0, chip->base + GPIO_IE_LOW);
+	chip->enabled = 0;
+
+	ret = devm_request_irq(dev, irq, starfive_irq_handler, IRQF_SHARED,
+			       dev_name(dev), chip);
+	if (ret) {
+		dev_err(dev, "IRQ handler registering failed (%d)\n", ret);
+		return ret;
+	}
+
+	writel_relaxed(1, chip->base + GPIO_EN);
+
+	dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n", ngpio);
+
+	return 0;
+}
+
+static const struct of_device_id starfive_gpio_match[] = {
+	{ .compatible = "starfive,jh7100-gpio", },
+	{ },
+};
+
+static struct platform_driver starfive_gpio_driver = {
+	.probe	= starfive_gpio_probe,
+	.driver	= {
+		.name = "gpio_starfive_jh7100",
+		.of_match_table = of_match_ptr(starfive_gpio_match),
+	},
+};
+
+static int __init starfive_gpio_init(void)
+{
+	return platform_driver_register(&starfive_gpio_driver);
+}
+subsys_initcall(starfive_gpio_init);
+
+static void __exit starfive_gpio_exit(void)
+{
+	platform_driver_unregister(&starfive_gpio_driver);
+}
+module_exit(starfive_gpio_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Huan Feng <huan.feng@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7100 GPIO driver");
-- 
2.27.0

