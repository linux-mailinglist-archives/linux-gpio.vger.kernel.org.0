Return-Path: <linux-gpio+bounces-25551-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA35B42EE7
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 03:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4C35E6A90
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 01:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF78E1F2C45;
	Thu,  4 Sep 2025 01:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="lG9qAuei"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1CE1B4231;
	Thu,  4 Sep 2025 01:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949719; cv=none; b=QWp2JZ7OEqqnHZNK+PfIA+5VcoeIOQcilgkJgC6KO0vtFIjJnZeeKERK+v36Ny31ze5FULPcCsVQB7fSqVuRHr0+xdfETxRl9vbLG0MSPjvompmMz7HWmRzgKaU1OT/vBKL4wDLwN5J1QhOms8Len9wehZyNiQwnSklJ8ondiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949719; c=relaxed/simple;
	bh=U7lUJQoVaQULHPf2hCMw+aPmeHh6eYTIuJF64fKrbME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VL9TglhgnFX528v//bxFVV3SItQlWf2baHZYDFXNB7AtuwB4C/mkBVf2zmr8Agwaf6YcIcgYZzW0kh0HYgJLtIEeJnJLNEzSYIIZApwyPLMWZvuNyjjQoYPoM2t+pIVKo9vWIji+xecYrO5tCnyqSntA1eZWzFB7qE2rq8zJ4nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=lG9qAuei; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9B1A020B30;
	Thu,  4 Sep 2025 03:35:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXmj01bP-rYT; Thu,  4 Sep 2025 03:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756949714; bh=U7lUJQoVaQULHPf2hCMw+aPmeHh6eYTIuJF64fKrbME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lG9qAuei6th5BYD1/TqR7tt7lbHgI09oxRbZ7t/myIrrC4jlwVz8y6N1A3W2F2Zxi
	 SzBUmFJU972nt8K854Z3U5BPnMgsknjRh2EgA0sDK9v1P5XwmislLclJZAZATWrYdD
	 4GjRc7t6oYds5YqYKsFWcJ0KZAdcUjsr9P1WVlXJfAPoIff7qWQ7oYefEei4OKwxj/
	 idkNUESJbh7xokeXUdBM/p10rBQbRmSC2Haaq2iYJ9dctGBuRsNArPoGhP4SxkZ1NR
	 7ZyW9Fx/frMRu/rapYTgbI64h40cdP4bwGhyP8yGQ9h2fWEFsiXDs+XcW+HtXVtgiT
	 9VPTmSHGweskA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v3 2/3] gpio: loongson-64bit: Add support for Loongson-2K0300 SoC
Date: Thu,  4 Sep 2025 01:34:37 +0000
Message-ID: <20250904013438.2405-3-ziyao@disroot.org>
In-Reply-To: <20250904013438.2405-1-ziyao@disroot.org>
References: <20250904013438.2405-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This controller's input and output logic is similar to previous
generations of SoCs. Additionally, it's capable of interrupt masking,
and could be configured to detect levels and edges, and is supplied with
a distinct reset signal.

The interrupt functionality is implemented through an irqchip, whose
operations are written with previous generation SoCs in mind and could
be reused. Since all Loongson SoCs with similar interrupt capability
(LS2K1500, LS2K2000) support byte-control mode, these operations are for
byte-control mode only for simplicity.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpio/Kconfig               |   1 +
 drivers/gpio/gpio-loongson-64bit.c | 189 +++++++++++++++++++++++++++--
 2 files changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a437fe652dbc..c55173643eb4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -437,6 +437,7 @@ config GPIO_LOONGSON_64BIT
 	depends on LOONGARCH || COMPILE_TEST
 	depends on OF_GPIO
 	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO functionality of a number of
 	  Loongson series of chips. The Loongson GPIO controller supports
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 482e64ba9b42..f84f8c537249 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -7,6 +7,8 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/err.h>
@@ -14,6 +16,7 @@
 #include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
+#include <linux/reset.h>
 #include <asm/types.h>
 
 enum loongson_gpio_mode {
@@ -28,6 +31,14 @@ struct loongson_gpio_chip_data {
 	unsigned int		out_offset;
 	unsigned int		in_offset;
 	unsigned int		inten_offset;
+	unsigned int		intpol_offset;
+	unsigned int		intedge_offset;
+	unsigned int		intclr_offset;
+	unsigned int		intsts_offset;
+	unsigned int		intdual_offset;
+	unsigned int		intr_num;
+	irq_flow_handler_t	irq_handler;
+	const struct irq_chip	*girqchip;
 };
 
 struct loongson_gpio_chip {
@@ -137,7 +148,140 @@ static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 	return platform_get_irq(pdev, offset);
 }
 
-static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgpio,
+static void loongson_gpio_irq_ack(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	writeb(0x1, lgpio->reg_base + lgpio->chip_data->intclr_offset + hwirq);
+}
+
+static void loongson_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	writeb(0x0, lgpio->reg_base + lgpio->chip_data->inten_offset + hwirq);
+}
+
+static void loongson_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	writeb(0x1, lgpio->reg_base + lgpio->chip_data->inten_offset + hwirq);
+}
+
+static int loongson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+	struct loongson_gpio_chip *lgpio = to_loongson_gpio_chip(chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+	u8 pol = 0, edge = 0, dual = 0;
+
+	if ((type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH) {
+		edge = 1;
+		dual = 1;
+		irq_set_handler_locked(data, handle_edge_irq);
+	} else {
+		switch (type) {
+		case IRQ_TYPE_LEVEL_HIGH:
+			pol = 1;
+			fallthrough;
+		case IRQ_TYPE_LEVEL_LOW:
+			irq_set_handler_locked(data, handle_level_irq);
+			break;
+
+		case IRQ_TYPE_EDGE_RISING:
+			pol = 1;
+			fallthrough;
+		case IRQ_TYPE_EDGE_FALLING:
+			edge = 1;
+			irq_set_handler_locked(data, handle_edge_irq);
+			break;
+
+		default:
+			return -EINVAL;
+		};
+	}
+
+	writeb(pol, lgpio->reg_base + lgpio->chip_data->intpol_offset + hwirq);
+	writeb(edge, lgpio->reg_base + lgpio->chip_data->intedge_offset + hwirq);
+	writeb(dual, lgpio->reg_base + lgpio->chip_data->intdual_offset + hwirq);
+
+	return 0;
+}
+
+static void loongson_gpio_ls2k0300_irq_handler(struct irq_desc *desc)
+{
+	struct loongson_gpio_chip *lgpio = irq_desc_get_handler_data(desc);
+	struct irq_chip *girqchip = irq_desc_get_chip(desc);
+	int i;
+
+	chained_irq_enter(girqchip, desc);
+
+	for (i = 0; i < lgpio->chip.gc.ngpio; i++) {
+		/*
+		 * For the GPIO controller of LS2K0300, interrupts status bits
+		 * may be wrongly set even if the corresponding interrupt is
+		 * disabled. Thus interrupt enable bits are checked along with
+		 * status bits to detect interrupts reliably.
+		 */
+		if (readb(lgpio->reg_base + lgpio->chip_data->intsts_offset + i) &&
+		    readb(lgpio->reg_base + lgpio->chip_data->inten_offset + i))
+			generic_handle_domain_irq(lgpio->chip.gc.irq.domain, i);
+	}
+
+	chained_irq_exit(girqchip, desc);
+}
+
+static const struct irq_chip loongson_gpio_ls2k0300_irqchip = {
+	.irq_ack	= loongson_gpio_irq_ack,
+	.irq_mask	= loongson_gpio_irq_mask,
+	.irq_unmask	= loongson_gpio_irq_unmask,
+	.irq_set_type	= loongson_gpio_irq_set_type,
+	.flags		= IRQCHIP_IMMUTABLE | IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int loongson_gpio_init_irqchip(struct platform_device *pdev,
+				      struct loongson_gpio_chip *lgpio)
+{
+	const struct loongson_gpio_chip_data *data = lgpio->chip_data;
+	struct gpio_chip *chip = &lgpio->chip.gc;
+	int i;
+
+	chip->irq.default_type = IRQ_TYPE_NONE;
+	chip->irq.handler = handle_bad_irq;
+	chip->irq.parent_handler = data->irq_handler;
+	chip->irq.parent_handler_data = lgpio;
+	gpio_irq_chip_set_chip(&chip->irq, data->girqchip);
+
+	chip->irq.num_parents = data->intr_num;
+	chip->irq.parents = devm_kcalloc(&pdev->dev, data->intr_num,
+					 sizeof(*chip->irq.parents), GFP_KERNEL);
+	if (!chip->parent)
+		return -ENOMEM;
+
+	for (i = 0; i < data->intr_num; i++) {
+		chip->irq.parents[i] = platform_get_irq(pdev, i);
+		if (chip->irq.parents[i] < 0)
+			return dev_err_probe(&pdev->dev, chip->irq.parents[i],
+					     "failed to get IRQ %d\n", i);
+	}
+
+	for (i = 0; i < data->intr_num; i++) {
+		writeb(0x0, lgpio->reg_base + data->inten_offset + i);
+		writeb(0x1, lgpio->reg_base + data->intclr_offset + i);
+	}
+
+	return 0;
+}
+
+static int loongson_gpio_init(struct platform_device *pdev, struct loongson_gpio_chip *lgpio,
 			      void __iomem *reg_base)
 {
 	struct gpio_generic_chip_config config;
@@ -146,7 +290,7 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 	lgpio->reg_base = reg_base;
 	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
 		config = (typeof(config)){
-			.dev = dev,
+			.dev = &pdev->dev,
 			.sz = 8,
 			.dat = lgpio->reg_base + lgpio->chip_data->in_offset,
 			.set = lgpio->reg_base + lgpio->chip_data->out_offset,
@@ -155,7 +299,7 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 
 		ret = gpio_generic_chip_init(&lgpio->chip, &config);
 		if (ret) {
-			dev_err(dev, "unable to init generic GPIO\n");
+			dev_err(&pdev->dev, "unable to init generic GPIO\n");
 			return ret;
 		}
 	} else {
@@ -164,16 +308,21 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 		lgpio->chip.gc.get_direction = loongson_gpio_get_direction;
 		lgpio->chip.gc.direction_output = loongson_gpio_direction_output;
 		lgpio->chip.gc.set = loongson_gpio_set;
-		lgpio->chip.gc.parent = dev;
+		lgpio->chip.gc.parent = &pdev->dev;
 		spin_lock_init(&lgpio->lock);
 	}
 
 	lgpio->chip.gc.label = lgpio->chip_data->label;
 	lgpio->chip.gc.can_sleep = false;
-	if (lgpio->chip_data->inten_offset)
+	if (lgpio->chip_data->girqchip) {
+		ret = loongson_gpio_init_irqchip(pdev, lgpio);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret, "failed to initialize irqchip\n");
+	} else if (lgpio->chip_data->inten_offset) {
 		lgpio->chip.gc.to_irq = loongson_gpio_to_irq;
+	}
 
-	return devm_gpiochip_add_data(dev, &lgpio->chip.gc, lgpio);
+	return devm_gpiochip_add_data(&pdev->dev, &lgpio->chip.gc, lgpio);
 }
 
 static int loongson_gpio_probe(struct platform_device *pdev)
@@ -181,6 +330,7 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	void __iomem *reg_base;
 	struct loongson_gpio_chip *lgpio;
 	struct device *dev = &pdev->dev;
+	struct reset_control *rst;
 
 	lgpio = devm_kzalloc(dev, sizeof(*lgpio), GFP_KERNEL);
 	if (!lgpio)
@@ -192,7 +342,11 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
-	return loongson_gpio_init(dev, lgpio, reg_base);
+	rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst), "failed to get reset control\n");
+
+	return loongson_gpio_init(pdev, lgpio, reg_base);
 }
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k_data = {
@@ -204,6 +358,23 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k_data = {
 	.inten_offset = 0x30,
 };
 
+static const struct loongson_gpio_chip_data loongson_gpio_ls2k0300_data = {
+	.label = "ls2k0300_gpio",
+	.mode = BYTE_CTRL_MODE,
+	.conf_offset = 0x800,
+	.in_offset = 0xa00,
+	.out_offset = 0x900,
+	.inten_offset = 0xb00,
+	.intpol_offset = 0xc00,
+	.intedge_offset = 0xd00,
+	.intclr_offset = 0xe00,
+	.intsts_offset = 0xf00,
+	.intdual_offset = 0xf80,
+	.intr_num = 7,
+	.irq_handler = loongson_gpio_ls2k0300_irq_handler,
+	.girqchip = &loongson_gpio_ls2k0300_irqchip,
+};
+
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k0500_data0 = {
 	.label = "ls2k0500_gpio",
 	.mode = BIT_CTRL_MODE,
@@ -300,6 +471,10 @@ static const struct of_device_id loongson_gpio_of_match[] = {
 		.compatible = "loongson,ls2k-gpio",
 		.data = &loongson_gpio_ls2k_data,
 	},
+	{
+		.compatible = "loongson,ls2k0300-gpio",
+		.data = &loongson_gpio_ls2k0300_data,
+	},
 	{
 		.compatible = "loongson,ls2k0500-gpio0",
 		.data = &loongson_gpio_ls2k0500_data0,
-- 
2.50.1


