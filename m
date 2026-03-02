Return-Path: <linux-gpio+bounces-32377-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MDwAMpdpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32377-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:52:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 961DA1D5C7F
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 832DD3016AE5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38DE38F640;
	Mon,  2 Mar 2026 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="W6+msNUD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4E38F654;
	Mon,  2 Mar 2026 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445120; cv=none; b=lz8A+Z/NDDAgqU+R9eDd9Ifl7mkMvXZfoVXHPBsR4Bt6xYpgWjMbafHo1oomhZ0htLGKD0h3XgvAFtEY8fMvpVZujpVBX38Lpby7Bq5yNDq2XY2FQ47In0IawW/daXVdfQuP76PvLgTOLRJ2ID/26Jrzqvyi8KC6VypzyeEDbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445120; c=relaxed/simple;
	bh=lZd3UgVwTQQhZj2f/VUmKnheJpLxC9ZwCUjz9+rMU9s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=trwy4pGd1QlU/Pqq+knWhmd6ZrIB8Y5XnjnRe44npMedv1qF2FCJbulHtuiaZEqY4c2zREpiv6i0+FLonP8OrID6NYdDZgDWTZkTsVnp5azIMatae44bi+Y+EMlIkGIKnV0cAg/86pLNJEzN0NmOr1xQ6Oe/k+RTkk1QxDVMTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=W6+msNUD; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772445113; bh=i1nj4LnG4ybdlKF3jmjA79TDsMsEAynR/NVLQBiRedE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W6+msNUD2Bd8+nfeeNngG/nljkbG7rLlaRiQPx7oK39VkrmJ5VEkT+oK7Mlsq9G5P
	 SFJXGEzcQLdipuh7z+lpwCWvkpgeO1rib8RHVDXeehDAKzovxMgENa6AnmBl8TyWjp
	 BZvd1MY2dguxT6+7kZ1MmdL0oSodSa4ZjVqI1qi8=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id CEF2F43C; Mon, 02 Mar 2026 17:51:47 +0800
X-QQ-mid: xmsmtpt1772445110tsi0ihejy
Message-ID: <tencent_C88C86C89249067BA4D394FC9CCC1AB62406@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Ju6jyb7osYHEdCV8NiFMKJMc+i9BekwuwU+YvDxcHCMJDSpKTzl0
	 RFvcT0Zh/42RG8cE9yju5A5P5kjYC6IPpo2/sU/04jy3sQPyTtuU1Q1QrWYY8AOtDXMdpi0ld8rJ
	 C9esr7MiEQpHlXKb+8xAagM8m9H2xPCPuxWrB4zWyvHP+l1RVKLKLtPvmesyQ0eNXb5Fi/LPFD+B
	 /ebuOFJPaGEzOjfzraROrRgamKFY/FVQU7Pccn27UtxYrN/xlJYZw+l4NHKVno4vzUAY15kW+U+a
	 NSB3H+yqg0r5W//xM06QqzO7tqnmOFnjKXvhyMmlL+CGZbBmM+g6d1ibApawv/JbNhkLWBId1urB
	 wLvnmMhM4lCn+l4wggCpjdUaagKq36PG8jez1b8kQUt3Rqz6Cfmb/n23kMag5kD0+R956hFwGrLJ
	 NQEIMSVZU39X9F0/qYPOlqVHG2EzYwlmkG1Z6f5rTlF09WhFwTw1dsh9UCpk972QxvJLooN/dkFQ
	 KrG3Y1CEOftMZ7MmWVNqgmiF0WJr5HGQKUxuHsjL/hPCbkieb7X21ycWCVW7u6DeH3O77lSGU0oH
	 WjdJ8zVOGfkGNvrogCvqwsPuPWs89zRz/RP1tTqxKsa+BVn7fvxOBoNLy7egxwAx71EzeMBbj13h
	 41WNDpi9wgEwP5KRLY3GncX3NgQ3luc10/RnEgP2ik/sUWTvz6u2M4ZoJEjuiqFK6bOMI3riB4im
	 5sIG90wZgDDTF44V3m0QfU4WzjbyeywjoxFYjSUjAt+7+TNQs/D2m2UuwuLKkHNqkHv9+et3IoW9
	 ZFThd3AR0F2PrzFpz4kM8NyCovOuxhhF3bsmyrQl7hmlc3GnOvHwhDN0Y+NSLl1d0t71RXpOPn/y
	 ec8rs6XuECjBDsSy3GYTTozP5P0ChZjTsJCgmSbsh7e4Y9Dr4ydA5mKcGeuAeK2WUzmriWlKOlIe
	 K5X3Gn89q6kiFblxiSxv/qJfjfcC3ipnKskiCNG8CisQwjQul0aWC4LC2LFLPVsckD0F3350pHfD
	 G7fabrfLkmByChuSGQRY2+PDilY/p3sVlaCWN8FA==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 2/3] gpio: add support for Phytium platform GPIO controller
Date: Mon,  2 Mar 2026 17:51:46 +0800
X-OQ-MSGID: <20260302095147.2483-3-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302095147.2483-1-1536943441@qq.com>
References: <20260302095147.2483-1-1536943441@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32377-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,bgdev.pl,kernel.org,phytium.com.cn,qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qq.com:mid,qq.com:dkim,qq.com:email,phytium.com.cn:email]
X-Rspamd-Queue-Id: 961DA1D5C7F
X-Rspamd-Action: no action

Add support for the Phytium platform GPIO controller with:
- shared core helpers and irqchip implementation
- platform probe path for OF/ACPI
- Kconfig/Makefile integration

The driver supports GPIO direction and value configuration, plus
interrupt delivery for platform devices.

Signed-off-by: Zhu Ling <1536943441@qq.com>
---
 drivers/gpio/Kconfig                 |  16 +
 drivers/gpio/Makefile                |   2 +
 drivers/gpio/gpio-phytium-core.c     | 444 +++++++++++++++++++++++++++
 drivers/gpio/gpio-phytium-core.h     |  90 ++++++
 drivers/gpio/gpio-phytium-platform.c | 226 ++++++++++++++
 5 files changed, 778 insertions(+)
 create mode 100644 drivers/gpio/gpio-phytium-core.c
 create mode 100644 drivers/gpio/gpio-phytium-core.h
 create mode 100644 drivers/gpio/gpio-phytium-platform.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e..65643c78e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -128,6 +128,10 @@ config GPIO_SWNODE_UNDEFINED
 config GPIO_MAX730X
 	tristate
 
+# This symbol is selected by Phytium platform frontend
+config GPIO_PHYTIUM_CORE
+	tristate
+
 config GPIO_IDIO_16
 	tristate
 	select REGMAP_IRQ
@@ -561,6 +565,18 @@ config GPIO_OMAP
 	help
 	  Say yes here to enable GPIO support for TI OMAP SoCs.
 
+config GPIO_PHYTIUM_PLAT
+	tristate "Phytium GPIO platform support"
+	depends on (ARM64 || COMPILE_TEST) && (ACPI || OF_GPIO)
+	select GPIO_PHYTIUM_CORE
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the platform GPIO controller
+	  found in Phytium SoCs.
+
+	  This driver supports GPIO line configuration and
+	  interrupt delivery.
+
 config GPIO_PL061
 	tristate "PrimeCell PL061 GPIO support"
 	depends on ARM_AMBA || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795..fe8050529 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -144,6 +144,8 @@ obj-$(CONFIG_GPIO_PCF857X)		+= gpio-pcf857x.o
 obj-$(CONFIG_GPIO_PCH)			+= gpio-pch.o
 obj-$(CONFIG_GPIO_PCIE_IDIO_24)		+= gpio-pcie-idio-24.o
 obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
+obj-$(CONFIG_GPIO_PHYTIUM_CORE)		+= gpio-phytium-core.o
+obj-$(CONFIG_GPIO_PHYTIUM_PLAT)		+= gpio-phytium-platform.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
diff --git a/drivers/gpio/gpio-phytium-core.c b/drivers/gpio/gpio-phytium-core.c
new file mode 100644
index 000000000..bff94adb4
--- /dev/null
+++ b/drivers/gpio/gpio-phytium-core.c
@@ -0,0 +1,444 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2023, Phytium Technology Co., Ltd.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/bitops.h>
+#include <linux/seq_file.h>
+#include <linux/interrupt.h>
+
+#include "gpio-phytium-core.h"
+
+static int get_pin_location(struct phytium_gpio *gpio, unsigned int offset,
+			    struct pin_loc *pl)
+{
+	int ret;
+
+	if (offset < gpio->ngpio[0]) {
+		pl->port = 0;
+		pl->offset = offset;
+		ret = 0;
+	} else if (offset < (gpio->ngpio[0] + gpio->ngpio[1])) {
+		pl->port = 1;
+		pl->offset = offset - gpio->ngpio[0];
+		ret = 0;
+	} else {
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static void phytium_gpio_toggle_trigger(struct phytium_gpio *gpio,
+					unsigned int offset)
+{
+	struct gpio_chip *gc;
+	u32 pol;
+	int val;
+
+	/* Only port A can provide interrupt source */
+	if (offset >= gpio->ngpio[0])
+		return;
+
+	gc = &gpio->gc;
+
+	pol = readl(gpio->regs + GPIO_INT_POLARITY);
+	/* Just read the current value right out of the data register */
+	val = gc->get(gc, offset);
+	if (val)
+		pol &= ~BIT(offset);
+	else
+		pol |= BIT(offset);
+
+	writel(pol, gpio->regs + GPIO_INT_POLARITY);
+}
+
+int phytium_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct pin_loc loc;
+	void __iomem *dat;
+
+	if (get_pin_location(gpio, offset, &loc))
+		return -EINVAL;
+
+	dat = gpio->regs + GPIO_EXT_PORTA + (loc.port * GPIO_PORT_STRIDE);
+
+	return !!(readl(dat) & BIT(loc.offset));
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_get);
+
+int phytium_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct pin_loc loc;
+	void __iomem *dr;
+	unsigned long flags;
+	u32 mask;
+
+	if (get_pin_location(gpio, offset, &loc))
+		return -EINVAL;
+	dr = gpio->regs + GPIO_SWPORTA_DR + (loc.port * GPIO_PORT_STRIDE);
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	if (value)
+		mask = readl(dr) | BIT(loc.offset);
+	else
+		mask = readl(dr) & ~BIT(loc.offset);
+
+	writel(mask, dr);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_set);
+
+int phytium_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct pin_loc loc;
+	unsigned long flags;
+	void __iomem *ddr;
+
+	if (get_pin_location(gpio, offset, &loc))
+		return -EINVAL;
+	ddr = gpio->regs + GPIO_SWPORTA_DDR + (loc.port * GPIO_PORT_STRIDE);
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	writel(readl(ddr) & ~(BIT(loc.offset)), ddr);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_direction_input);
+
+int phytium_gpio_direction_output(struct gpio_chip *gc, unsigned int offset,
+				  int value)
+{
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct pin_loc loc;
+	unsigned long flags;
+	void __iomem *ddr;
+
+	if (get_pin_location(gpio, offset, &loc))
+		return -EINVAL;
+	ddr = gpio->regs + GPIO_SWPORTA_DDR + (loc.port * GPIO_PORT_STRIDE);
+
+	phytium_gpio_set(gc, offset, value);
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	writel(readl(ddr) | BIT(loc.offset), ddr);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_direction_output);
+
+void phytium_gpio_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	u32 val = BIT(irqd_to_hwirq(d));
+
+	raw_spin_lock(&gpio->lock);
+
+	writel(val, gpio->regs + GPIO_PORTA_EOI);
+
+	raw_spin_unlock(&gpio->lock);
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_ack);
+
+void phytium_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	u32 val;
+
+	/* Only port A can provide interrupt source */
+	if (irqd_to_hwirq(d) >= gpio->ngpio[0])
+		return;
+
+	raw_spin_lock(&gpio->lock);
+
+	val = readl(gpio->regs + GPIO_INTMASK);
+	val |= BIT(irqd_to_hwirq(d));
+	writel(val, gpio->regs + GPIO_INTMASK);
+
+	raw_spin_unlock(&gpio->lock);
+
+	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_mask);
+
+void phytium_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	u32 val;
+
+	/* Only port A can provide interrupt source */
+	if (irqd_to_hwirq(d) >= gpio->ngpio[0])
+		return;
+
+	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
+
+	raw_spin_lock(&gpio->lock);
+
+	val = readl(gpio->regs + GPIO_INTMASK);
+	val &= ~BIT(irqd_to_hwirq(d));
+	writel(val, gpio->regs + GPIO_INTMASK);
+
+	raw_spin_unlock(&gpio->lock);
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_unmask);
+
+int phytium_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	int hwirq = irqd_to_hwirq(d);
+	unsigned long flags, lvl, pol;
+
+	if (hwirq < 0 || hwirq >= gpio->ngpio[0])
+		return -EINVAL;
+
+	if ((flow_type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
+	    (flow_type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))) {
+		dev_err(gc->parent,
+			"trying to configure line %d for both level and edge detection, choose one!\n",
+			hwirq);
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	lvl = readl(gpio->regs + GPIO_INTTYPE_LEVEL);
+	pol = readl(gpio->regs + GPIO_INT_POLARITY);
+
+	switch (flow_type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		lvl |= BIT(hwirq);
+		phytium_gpio_toggle_trigger(gpio, hwirq);
+		irq_set_handler_locked(d, handle_edge_irq);
+		dev_dbg(gc->parent, "line %d: IRQ on both edges\n", hwirq);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		lvl |= BIT(hwirq);
+		pol |= BIT(hwirq);
+		irq_set_handler_locked(d, handle_edge_irq);
+		dev_dbg(gc->parent, "line %d: IRQ on RISING edge\n", hwirq);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		lvl |= BIT(hwirq);
+		pol &= ~BIT(hwirq);
+		irq_set_handler_locked(d, handle_edge_irq);
+		dev_dbg(gc->parent, "line %d: IRQ on FALLING edge\n", hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		lvl &= ~BIT(hwirq);
+		pol |= BIT(hwirq);
+		irq_set_handler_locked(d, handle_level_irq);
+		dev_dbg(gc->parent, "line %d: IRQ on HIGH level\n", hwirq);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		lvl &= ~BIT(hwirq);
+		pol &= ~BIT(hwirq);
+		irq_set_handler_locked(d, handle_level_irq);
+		dev_dbg(gc->parent, "line %d: IRQ on LOW level\n", hwirq);
+		break;
+	}
+
+	writel(lvl, gpio->regs + GPIO_INTTYPE_LEVEL);
+	if (flow_type != IRQ_TYPE_EDGE_BOTH)
+		writel(pol, gpio->regs + GPIO_INT_POLARITY);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_type);
+
+void phytium_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+	u32 val;
+
+	if (gpio->is_resuming)
+		return;
+	/* Only port A can provide interrupt source */
+	if (irqd_to_hwirq(d) >= gpio->ngpio[0])
+		return;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	val = readl(gpio->regs + GPIO_INTEN);
+	val |= BIT(irqd_to_hwirq(d));
+	writel(val, gpio->regs + GPIO_INTEN);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_enable);
+
+void phytium_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+	u32 val;
+
+	/* Only port A can provide interrupt source */
+	if (irqd_to_hwirq(d) >= gpio->ngpio[0])
+		return;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	val = readl(gpio->regs + GPIO_INTEN);
+	val &= ~BIT(irqd_to_hwirq(d));
+	writel(val, gpio->regs + GPIO_INTEN);
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_disable);
+
+void phytium_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	seq_printf(p, dev_name(gc->parent));
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_print_chip);
+
+void phytium_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	unsigned long pending;
+	unsigned int parent_irq = irq_desc_get_irq(desc);
+	int offset;
+	int index = -1;
+	unsigned int index_found = 0;
+
+	chained_irq_enter(irqchip, desc);
+
+	pending = readl(gpio->regs + GPIO_INTSTATUS);
+
+	if (gc->irq.num_parents > 1) {
+		for (index = 0 ; index < gc->irq.num_parents; index++) {
+			if (gc->irq.parents[index] == parent_irq) {
+				index_found = 1;
+				break;
+			}
+		}
+		if (!index_found)
+			goto out;
+	}
+
+	if (pending) {
+		for_each_set_bit(offset, &pending, gpio->ngpio[0]) {
+			if (index == -1 || offset == index) {
+				int gpio_irq = irq_find_mapping(gc->irq.domain,
+						offset);
+
+				if (!gpio_irq)
+					continue;
+				generic_handle_irq(gpio_irq);
+				if ((irq_get_trigger_type(gpio_irq) &
+					IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
+					phytium_gpio_toggle_trigger(gpio, offset);
+			}
+		}
+	}
+
+out:
+	chained_irq_exit(irqchip, desc);
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_handler);
+
+int phytium_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	struct pin_loc loc;
+	void __iomem *ddr;
+
+	if (get_pin_location(gpio, offset, &loc))
+		return -EINVAL;
+	ddr = gpio->regs + GPIO_SWPORTA_DDR + (loc.port * GPIO_PORT_STRIDE);
+
+	return !(readl(ddr) & BIT(loc.offset));
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_get_direction);
+
+int phytium_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct phytium_gpio *gpio = gpiochip_get_data(gc);
+	irq_hw_number_t bit = irqd_to_hwirq(d);
+	int parent_irq;
+	unsigned long flags;
+	int ret;
+
+	if (bit >= ARRAY_SIZE(gpio->irq))
+		return -EINVAL;
+
+	parent_irq = gpio->irq[bit] > 0 ? gpio->irq[bit] : gpio->irq[0];
+	if (parent_irq <= 0)
+		return -EINVAL;
+
+	ret = irq_set_irq_wake(parent_irq, enable);
+
+	if (ret < 0)
+		return ret;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	if (enable) {
+		gpio->wake_en |= BIT(bit);
+		if (gpio->is_resuming == 1) {
+			writel(~gpio->wake_en, gpio->regs + GPIO_INTMASK);
+			writel(gpio->wake_en, gpio->regs + GPIO_INTEN);
+		}
+	} else {
+		gpio->wake_en &= ~BIT(bit);
+	}
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_wake);
+
+int phytium_gpio_irq_set_affinity(struct irq_data *d,
+				  const struct cpumask *mask_val, bool force)
+{
+	int hwirq = irqd_to_hwirq(d);
+	struct gpio_chip *chip_data = irq_data_get_irq_chip_data(d);
+	struct irq_chip *chip;
+	struct irq_data *data;
+
+	if (chip_data->irq.num_parents == 1)
+		hwirq = 0;
+
+	chip = irq_get_chip(chip_data->irq.parents[hwirq]);
+	data = irq_get_irq_data(chip_data->irq.parents[hwirq]);
+
+	if (chip && chip->irq_set_affinity)
+		return chip->irq_set_affinity(data, mask_val, force);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(phytium_gpio_irq_set_affinity);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Phytium GPIO Controller core");
diff --git a/drivers/gpio/gpio-phytium-core.h b/drivers/gpio/gpio-phytium-core.h
new file mode 100644
index 000000000..963aac511
--- /dev/null
+++ b/drivers/gpio/gpio-phytium-core.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021-2023, Phytium Technology Co., Ltd.
+ */
+
+#ifndef _GPIO_PHYTIUM_H
+#define _GPIO_PHYTIUM_H
+
+#include <linux/gpio/driver.h>
+#include <linux/spinlock.h>
+
+#include "gpiolib.h"
+
+#define GPIO_SWPORTA_DR		0x00 /* WR Port A Output Data Register */
+#define GPIO_SWPORTA_DDR	0x04 /* WR Port A Data Direction Register */
+#define GPIO_EXT_PORTA		0x08 /* RO Port A Input Data Register */
+#define GPIO_SWPORTB_DR		0x0c /* WR Port B Output Data Register */
+#define GPIO_SWPORTB_DDR	0x10 /* WR Port B Data Direction Register */
+#define GPIO_EXT_PORTB		0x14 /* RO Port B Input Data Register */
+
+#define GPIO_INTEN		0x18 /* WR Port A Interrput Enable Register */
+#define GPIO_INTMASK		0x1c /* WR Port A Interrupt Mask Register */
+#define GPIO_INTTYPE_LEVEL	0x20 /* WR Port A Interrupt Level Register */
+#define GPIO_INT_POLARITY	0x24 /* WR Port A Interrupt Polarity Register */
+#define GPIO_INTSTATUS		0x28 /* RO Port A Interrupt Status Register */
+#define GPIO_RAW_INTSTATUS	0x2c /* RO Port A Raw Interrupt Status Register */
+#define GPIO_LS_SYNC		0x30 /* WR Level-sensitive Synchronization Enable Register */
+#define GPIO_DEBOUNCE		0x34 /* WR Debounce Enable Register */
+#define GPIO_PORTA_EOI		0x38 /* WO Port A Clear Interrupt Register */
+
+#define MAX_NPORTS		2
+#define NGPIO_DEFAULT		8
+#define NGPIO_MAX		32
+#define GPIO_PORT_STRIDE	(GPIO_EXT_PORTB - GPIO_EXT_PORTA)
+#define GPIO_CLEAR_IRQ		0xffffffff
+
+struct pin_loc {
+	unsigned int port;
+	unsigned int offset;
+};
+
+#ifdef CONFIG_PM_SLEEP
+struct phytium_gpio_ctx {
+	u32 swporta_dr;
+	u32 swporta_ddr;
+	u32 swportb_dr;
+	u32 swportb_ddr;
+	u32 inten;
+	u32 intmask;
+	u32 inttype_level;
+	u32 int_polarity;
+	u32 intstatus;
+	u32 raw_intstatus;
+	u32 ls_sync;
+	u32 debounce;
+	u32 wake_en;
+};
+#endif
+
+struct phytium_gpio {
+	raw_spinlock_t		lock;
+	void __iomem		*regs;
+	struct gpio_chip	gc;
+	unsigned int		ngpio[2];
+	int			irq[32];
+	u32			wake_en;
+	int			is_resuming;
+#ifdef CONFIG_PM_SLEEP
+	struct phytium_gpio_ctx	ctx;
+#endif
+};
+
+int phytium_gpio_get(struct gpio_chip *gc, unsigned int offset);
+int phytium_gpio_set(struct gpio_chip *gc, unsigned int offset, int value);
+
+int phytium_gpio_get_direction(struct gpio_chip *gc, unsigned int offset);
+int phytium_gpio_direction_input(struct gpio_chip *gc, unsigned int offset);
+int phytium_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value);
+
+void phytium_gpio_irq_ack(struct irq_data *d);
+void phytium_gpio_irq_mask(struct irq_data *d);
+void phytium_gpio_irq_unmask(struct irq_data *d);
+int phytium_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type);
+void phytium_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p);
+void phytium_gpio_irq_enable(struct irq_data *d);
+void phytium_gpio_irq_disable(struct irq_data *d);
+void phytium_gpio_irq_handler(struct irq_desc *desc);
+int phytium_gpio_irq_set_wake(struct irq_data *d, unsigned int enable);
+int phytium_gpio_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val, bool force);
+#endif
diff --git a/drivers/gpio/gpio-phytium-platform.c b/drivers/gpio/gpio-phytium-platform.c
new file mode 100644
index 000000000..16fa520a4
--- /dev/null
+++ b/drivers/gpio/gpio-phytium-platform.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support functions for Phytium GPIO
+ *
+ * Copyright (c) 2019-2023, Phytium Technology Co., Ltd.
+ *
+ * Derived from drivers/gpio/gpio-pl061.c
+ *   Copyright (C) 2008, 2009 Provigent Ltd.
+ */
+
+#include <linux/acpi.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "gpio-phytium-core.h"
+
+static const struct of_device_id phytium_gpio_of_match[] = {
+	{ .compatible = "phytium,gpio", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, phytium_gpio_of_match);
+
+static const struct acpi_device_id phytium_gpio_acpi_match[] = {
+	{ "PHYT0001", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);
+
+static const struct irq_chip phytium_gpio_irq_chip = {
+	.irq_ack		= phytium_gpio_irq_ack,
+	.irq_mask		= phytium_gpio_irq_mask,
+	.irq_unmask		= phytium_gpio_irq_unmask,
+	.irq_set_type		= phytium_gpio_irq_set_type,
+	.irq_print_chip		= phytium_gpio_irq_print_chip,
+	.irq_enable		= phytium_gpio_irq_enable,
+	.irq_disable		= phytium_gpio_irq_disable,
+	.irq_set_wake		= phytium_gpio_irq_set_wake,
+	.irq_set_affinity	= phytium_gpio_irq_set_affinity,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int phytium_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct phytium_gpio *gpio;
+	struct gpio_irq_chip *girq;
+	struct fwnode_handle *fwnode;
+	int i;
+	int err, irq_count;
+
+	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	gpio->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(gpio->regs))
+		return PTR_ERR(gpio->regs);
+
+	if (!device_get_child_node_count(dev))
+		return -ENODEV;
+
+	device_for_each_child_node(dev, fwnode) {
+		int idx;
+
+		if (fwnode_property_read_u32(fwnode, "reg", &idx) ||
+		    idx >= MAX_NPORTS) {
+			dev_err(dev, "missing/invalid port index\n");
+			fwnode_handle_put(fwnode);
+			return -EINVAL;
+		}
+
+		if ((fwnode_property_read_u32(fwnode, "ngpios",
+					      &gpio->ngpio[idx])) &&
+		    (fwnode_property_read_u32(fwnode, "nr-gpios",
+					      &gpio->ngpio[idx]))) {
+			dev_info(dev,
+				 "failed to get number of gpios for Port%c\n",
+				 idx ? 'B' : 'A');
+			gpio->ngpio[idx] = NGPIO_DEFAULT;
+		}
+	}
+
+	/* irq_chip support */
+	raw_spin_lock_init(&gpio->lock);
+
+	writel(0, gpio->regs + GPIO_INTEN);
+	writel(GPIO_CLEAR_IRQ, gpio->regs + GPIO_PORTA_EOI);
+
+	gpio->gc.base = -1;
+	gpio->gc.get_direction = phytium_gpio_get_direction;
+	gpio->gc.direction_input = phytium_gpio_direction_input;
+	gpio->gc.direction_output = phytium_gpio_direction_output;
+	gpio->gc.get = phytium_gpio_get;
+	gpio->gc.set = phytium_gpio_set;
+	gpio->gc.ngpio = gpio->ngpio[0] + gpio->ngpio[1];
+	gpio->gc.label = dev_name(dev);
+	gpio->gc.parent = dev;
+	gpio->gc.owner = THIS_MODULE;
+
+	girq = &gpio->gc.irq;
+	girq->handler = handle_bad_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+
+	for (i = 0; i < ARRAY_SIZE(gpio->irq); i++)
+		gpio->irq[i] = -ENXIO;
+
+	irq_count = platform_irq_count(pdev);
+	if (irq_count < 0)
+		return irq_count;
+	if (irq_count > ARRAY_SIZE(gpio->irq))
+		return dev_err_probe(dev, -EINVAL,
+				     "too many parent IRQs: %d\n", irq_count);
+
+	for (i = 0; i < irq_count; i++) {
+		gpio->irq[i] = platform_get_irq(pdev, i);
+		if (gpio->irq[i] < 0)
+			return gpio->irq[i];
+	}
+
+	if (!i)
+		return dev_err_probe(dev, -EINVAL, "no parent IRQ is found\n");
+
+	irq_count = i;
+
+	girq->num_parents = irq_count;
+	girq->parents = gpio->irq;
+	girq->parent_handler = phytium_gpio_irq_handler;
+
+	gpio_irq_chip_set_chip(girq, &phytium_gpio_irq_chip);
+
+	err = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, gpio);
+	dev_info(dev, "Phytium GPIO controller @%pa registered\n",
+		 &res->start);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int phytium_gpio_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct phytium_gpio *gpio = platform_get_drvdata(pdev);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	gpio->ctx.swporta_dr = readl(gpio->regs + GPIO_SWPORTA_DR);
+	gpio->ctx.swporta_ddr = readl(gpio->regs + GPIO_SWPORTA_DDR);
+	gpio->ctx.swportb_dr = readl(gpio->regs + GPIO_SWPORTB_DR);
+	gpio->ctx.swportb_ddr = readl(gpio->regs + GPIO_SWPORTB_DDR);
+
+	gpio->ctx.inten = readl(gpio->regs + GPIO_INTEN);
+	gpio->is_resuming = 1;
+	gpio->ctx.intmask = readl(gpio->regs + GPIO_INTMASK);
+	gpio->ctx.inttype_level = readl(gpio->regs + GPIO_INTTYPE_LEVEL);
+	gpio->ctx.int_polarity = readl(gpio->regs + GPIO_INT_POLARITY);
+	gpio->ctx.debounce = readl(gpio->regs + GPIO_DEBOUNCE);
+
+	writel(~gpio->wake_en, gpio->regs + GPIO_INTMASK);
+	writel(gpio->wake_en, gpio->regs + GPIO_INTEN);
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+
+static int phytium_gpio_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct phytium_gpio *gpio = platform_get_drvdata(pdev);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&gpio->lock, flags);
+
+	writel(gpio->ctx.swporta_dr, gpio->regs + GPIO_SWPORTA_DR);
+	writel(gpio->ctx.swporta_ddr, gpio->regs + GPIO_SWPORTA_DDR);
+	writel(gpio->ctx.swportb_dr, gpio->regs + GPIO_SWPORTB_DR);
+	writel(gpio->ctx.swportb_ddr, gpio->regs + GPIO_SWPORTB_DDR);
+
+	writel(gpio->ctx.intmask, gpio->regs + GPIO_INTMASK);
+	writel(gpio->ctx.inttype_level, gpio->regs + GPIO_INTTYPE_LEVEL);
+	writel(gpio->ctx.int_polarity, gpio->regs + GPIO_INT_POLARITY);
+	writel(gpio->ctx.debounce, gpio->regs + GPIO_DEBOUNCE);
+
+	writel(GPIO_CLEAR_IRQ, gpio->regs + GPIO_PORTA_EOI);
+
+	writel(gpio->ctx.inten, gpio->regs + GPIO_INTEN);
+	gpio->is_resuming = 0;
+
+	raw_spin_unlock_irqrestore(&gpio->lock, flags);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(phytium_gpio_pm_ops, phytium_gpio_suspend,
+			 phytium_gpio_resume);
+
+static struct platform_driver phytium_gpio_driver = {
+	.driver		= {
+		.name	= "gpio-phytium-platform",
+		.pm	= &phytium_gpio_pm_ops,
+		.of_match_table = of_match_ptr(phytium_gpio_of_match),
+		.acpi_match_table = ACPI_PTR(phytium_gpio_acpi_match),
+	},
+	.probe		= phytium_gpio_probe,
+};
+
+module_platform_driver(phytium_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Chen Baozi <chenbaozi@phytium.com.cn>");
+MODULE_DESCRIPTION("Phytium GPIO driver");
-- 
2.34.1


