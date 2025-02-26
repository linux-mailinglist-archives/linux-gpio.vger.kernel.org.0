Return-Path: <linux-gpio+bounces-16597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDDA451A5
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 01:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 918FE19C2957
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 00:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3380814B06C;
	Wed, 26 Feb 2025 00:42:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB9149E0E;
	Wed, 26 Feb 2025 00:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740530547; cv=none; b=YVlrJY4qLFseZPDQP+1TJP7wzZIGzVG6/tNXcvn0mp3nkkxNR5KAcM/vuLMvWCWJvzr+UQDBjoE5JI6Xa3+dOexiWmpdF6Wc4I6JytS94QrTyLeCEGDFG5YVM5jd3cu3PR6IqZv2lwWl+thkyAcMQpXD3HbeYKX9gM3+kjsXRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740530547; c=relaxed/simple;
	bh=t7TfzK7BJ2SmpytcMwQWzds4O+cqQoSAfNTnG0/n340=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPBjk4X3mHkdwtM84YXjYSiZgSF9EsMyQ4mk2xTQTn4ZyJefRhbHIlWaTS58q9jT9rDQ2lX3C07+ujoFLefq7lnb2hcX+zCCNr1jAc1Gfjs8BVCtL5EqK2HFH0q0VBxWp3YMoyGn2QuRgys5+FubDjE0RjGmVWREutEZ66PnaYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A83E33432A8;
	Wed, 26 Feb 2025 00:42:18 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Feb 2025 08:41:18 +0800
Subject: [PATCH v7 2/4] gpio: spacemit: add support for K1 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-03-k1-gpio-v7-2-be489c4a609b@gentoo.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alex Elder <elder@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10255; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=t7TfzK7BJ2SmpytcMwQWzds4O+cqQoSAfNTnG0/n340=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNTHUOwXU/irEHa1K+p6akGy3bapKG3GPzlm
 aqMRAuRKWmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jU18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TcGEACOP7groJr8IIH0v+
 teVshJiZXi9tFNCoyrsKKDdivYGzA+7d/fRpto4TtuYT/fWy2yP/dNIH77LF6LnSlH9qP1jiTPP
 923VKJVCsa0Wez7WfRwCWw8hGcs91UANsjD7n2CDmY3DOdIJHbuQtwBuCiGlwSZGmJsapn3kq5z
 mQswyAY/nWDz4GRnA5nv9Xo5j85lCXvMXvCfOK2ZPrn5KpLIHX9a0GhIptYxl0nqt+cx78mNAcv
 MCah9legt7+Ctvingb4jgXaOeo4jeyyAM00WQSMfgIg2jM/P4o3wgwWyBzEpUKjrgPDube8GN5G
 ltivktFD28rXrnjx9yPH0Z7eGTpL8z1uTUk8lecjflvz1ABC37n+kNVp2lcFnTwjQ3ZciVfpG5Y
 JgzsO2Ws8XeouO+bGGeQA2vsi8LANsFtvEI7WstDIjvZDXTwULklt42iUGfHF3PqNvieOboGJ+2
 r0ildO/OTA5Fd8MU5AymZcdiIGFKmQaN9BaZ7fUrMx+K+bWrLwb3eyk+XvoHGrsFjh6I3WzlCs9
 /AmHIfxWnGc2QQWEg5fTQ5fctexGzvIDFdmQVDAIsulw8OOkK2+tA/fkp2k4hUVuegORKCABec2
 44Ix+khJHZG4e0FsgUr/q93G2c2V/0rgbt2DK7OZ4X4gzJ4TbWVEedRtJ4Eo/jOO82Ag==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Implement GPIO functionality which capable of setting pin as
input, output. Also, each pin can be used as interrupt which
support rising, falling, or both edge type trigger.

Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/Kconfig            |   8 ++
 drivers/gpio/Makefile           |   1 +
 drivers/gpio/gpio-spacemit-k1.c | 277 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index add5ad29a673c09082a913cb2404073b2034af48..eaae729eec00a3d6d2b83769aed3e2b0ca9927e5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -655,6 +655,14 @@ config GPIO_SNPS_CREG
 	  where only several fields in register belong to GPIO lines and
 	  each GPIO line owns a field with different length and on/off value.
 
+config GPIO_SPACEMIT_K1
+	bool "SPACEMIT K1 GPIO support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the SpacemiT's K1 GPIO device.
+
 config GPIO_SPEAR_SPICS
 	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
 	depends on PLAT_SPEAR
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
+obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
 obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
new file mode 100644
index 0000000000000000000000000000000000000000..c64ed9628162c46dce7dda59a02ca305facc2917
--- /dev/null
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (C) 2025 Yixun Lan <dlan@gentoo.org>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+/* register offset */
+#define SPACEMIT_GPLR		0x00 /* port level - R */
+#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
+#define SPACEMIT_GPSR		0x18 /* port set - W */
+#define SPACEMIT_GPCR		0x24 /* port clear - W */
+#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
+#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
+#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
+#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
+#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
+#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
+#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
+#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
+#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
+#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
+
+#define SPACEMIT_NR_BANKS		4
+#define SPACEMIT_NR_GPIOS_PER_BANK	32
+
+#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
+
+struct spacemit_gpio;
+
+struct spacemit_gpio_bank {
+	struct gpio_chip gc;
+	struct spacemit_gpio *sg;
+	void __iomem *base;
+	u32 irq_mask;
+	u32 irq_rising_edge;
+	u32 irq_falling_edge;
+};
+
+struct spacemit_gpio {
+	struct device *dev;
+	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
+};
+
+static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
+{
+	return (u32)(gb - gb->sg->sgb);
+}
+
+static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct spacemit_gpio_bank *gb = dev_id;
+	unsigned long pending;
+	u32 n, gedr;
+
+	gedr = readl(gb->base + SPACEMIT_GEDR);
+	if (!gedr)
+		return IRQ_NONE;
+	writel(gedr, gb->base + SPACEMIT_GEDR);
+
+	pending = gedr & gb->irq_mask;
+	if (!pending)
+		return IRQ_NONE;
+
+	for_each_set_bit(n, &pending, BITS_PER_LONG)
+		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
+
+	return IRQ_HANDLED;
+}
+
+static void spacemit_gpio_irq_ack(struct irq_data *d)
+{
+	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+
+	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
+}
+
+static void spacemit_gpio_irq_mask(struct irq_data *d)
+{
+	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	u32 bit = BIT(irqd_to_hwirq(d));
+
+	gb->irq_mask &= ~bit;
+	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+
+	if (bit & gb->irq_rising_edge)
+		writel(bit, gb->base + SPACEMIT_GCRER);
+
+	if (bit & gb->irq_falling_edge)
+		writel(bit, gb->base + SPACEMIT_GCFER);
+}
+
+static void spacemit_gpio_irq_unmask(struct irq_data *d)
+{
+	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	u32 bit = BIT(irqd_to_hwirq(d));
+
+	gb->irq_mask |= bit;
+
+	if (bit & gb->irq_rising_edge)
+		writel(bit, gb->base + SPACEMIT_GSRER);
+
+	if (bit & gb->irq_falling_edge)
+		writel(bit, gb->base + SPACEMIT_GSFER);
+
+	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+}
+
+static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	u32 bit = BIT(irqd_to_hwirq(d));
+
+	if (type & IRQ_TYPE_EDGE_RISING) {
+		gb->irq_rising_edge |= bit;
+		writel(bit, gb->base + SPACEMIT_GSRER);
+	} else {
+		gb->irq_rising_edge &= ~bit;
+		writel(bit, gb->base + SPACEMIT_GCRER);
+	}
+
+	if (type & IRQ_TYPE_EDGE_FALLING) {
+		gb->irq_falling_edge |= bit;
+		writel(bit, gb->base + SPACEMIT_GSFER);
+	} else {
+		gb->irq_falling_edge &= ~bit;
+		writel(bit, gb->base + SPACEMIT_GCFER);
+	}
+
+	return 0;
+}
+
+static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
+
+	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
+}
+
+static struct irq_chip spacemit_gpio_chip = {
+	.name		= "k1-gpio-irqchip",
+	.irq_ack	= spacemit_gpio_irq_ack,
+	.irq_mask	= spacemit_gpio_irq_mask,
+	.irq_unmask	= spacemit_gpio_irq_unmask,
+	.irq_set_type	= spacemit_gpio_irq_set_type,
+	.irq_print_chip	= spacemit_gpio_irq_print_chip,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i)
+{
+	struct spacemit_gpio_bank *gb = gpiochip_get_data(gc);
+	struct spacemit_gpio *sg = gb->sg;
+
+	if (i >= SPACEMIT_NR_BANKS)
+		return false;
+
+	return (gc == &sg->sgb[i].gc);
+}
+
+static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
+				  void __iomem *regs,
+				  int index, int irq)
+{
+	struct spacemit_gpio_bank *gb = &sg->sgb[index];
+	struct gpio_chip *gc = &gb->gc;
+	struct device *dev = sg->dev;
+	struct gpio_irq_chip *girq;
+	void __iomem *dat, *set, *clr, *dirin, *dirout;
+	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
+
+	gb->base = regs + bank_base[index];
+
+	dat	= gb->base + SPACEMIT_GPLR;
+	set	= gb->base + SPACEMIT_GPSR;
+	clr	= gb->base + SPACEMIT_GPCR;
+	dirin	= gb->base + SPACEMIT_GCDR;
+	dirout	= gb->base + SPACEMIT_GSDR;
+
+	/* This registers 32 GPIO lines per bank */
+	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
+			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
+
+	gb->sg = sg;
+
+	gc->label		= dev_name(dev);
+	gc->request		= gpiochip_generic_request;
+	gc->free		= gpiochip_generic_free;
+	gc->ngpio		= SPACEMIT_NR_GPIOS_PER_BANK;
+	gc->base		= -1;
+	gc->of_gpio_n_cells	= 3;
+	gc->of_node_instance_match = spacemit_of_node_instance_match;
+
+	girq			= &gc->irq;
+	girq->threaded		= true;
+	girq->handler		= handle_simple_irq;
+
+	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
+
+	/* Disable Interrupt */
+	writel(0, gb->base + SPACEMIT_GAPMASK);
+	/* Disable Edge Detection Settings */
+	writel(0x0, gb->base + SPACEMIT_GRER);
+	writel(0x0, gb->base + SPACEMIT_GFER);
+	/* Clear Interrupt */
+	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
+	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
+
+	ret = devm_request_threaded_irq(dev, irq, NULL,
+					spacemit_gpio_irq_handler,
+					IRQF_ONESHOT | IRQF_SHARED,
+					gb->gc.label, gb);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to register IRQ\n");
+
+	return devm_gpiochip_add_data(dev, gc, gb);
+}
+
+static int spacemit_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spacemit_gpio *sg;
+	struct resource *res;
+	void __iomem *regs;
+	int i, irq, ret;
+
+	sg = devm_kzalloc(dev, sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return -ENOMEM;
+
+	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	sg->dev	= dev;
+
+	for (i = 0; i < SPACEMIT_NR_BANKS; i++) {
+		ret = spacemit_gpio_add_bank(sg, regs, i, irq);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id spacemit_gpio_dt_ids[] = {
+	{ .compatible = "spacemit,k1-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver spacemit_gpio_driver = {
+	.probe		= spacemit_gpio_probe,
+	.driver		= {
+		.name	= "k1-gpio",
+		.of_match_table = spacemit_gpio_dt_ids,
+	},
+};
+module_platform_driver(spacemit_gpio_driver);
+
+MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
+MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
+MODULE_LICENSE("GPL");

-- 
2.48.1


