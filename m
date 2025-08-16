Return-Path: <linux-gpio+bounces-24455-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D7B28A59
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 05:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECF60AE532C
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 03:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8200E1DF73C;
	Sat, 16 Aug 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="K1TJHoyk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660671D9A5D;
	Sat, 16 Aug 2025 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755316269; cv=none; b=FgyT7seiEd6QhVQrDeHF6DwBDpIq/w4wyLP6IGVZEydxcfeoIK68lj1NnxtuB505j88jC6lW6uSIH0pHTVTe/ISUa5r431UFL7Q+GJD2rh+B+8OhCYaXyahkNvVKC8q9fmLtcKxD5mD8ouYcqbqeehTJ3abHKlRwL7IXrGjLjfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755316269; c=relaxed/simple;
	bh=7+Tis+bDAHWgPHqWy+FXrHzD6uC+idejIIoGOAxIm2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsMfxmpIvBScx9NrCCthbpc/GbqKYZRe240IPd5/8MEpDzdqrhHPNOFwPmCQRABxMrdGjGqeLx/DsIxPxoPvo2Df30zNjd3Bd+KHf6IeZLEBzDYGQ6xAdIYTNS0mEl9VDv3gi1TkcTkWE3DLuSa3Wu8eTDiyJ6cvNJPAJSbwnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=K1TJHoyk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 302F922C1F;
	Sat, 16 Aug 2025 05:51:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxlyoE-iDKzI; Sat, 16 Aug 2025 05:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755316265; bh=7+Tis+bDAHWgPHqWy+FXrHzD6uC+idejIIoGOAxIm2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K1TJHoykdh70EQgS227qTUqihzjzQKTo78qMURi4LbflV34sR2BCp8tuC8wRrzvOn
	 B59/iVEnb0+/1AJwu1znJLr9bpnsYYR0vXrYHi2mHhL9f5gqHrODw2oYB8WpU/3ygB
	 6EtszW2kQDuou/StcVkYvqoYNOggOvpKVWTWmCBgblAd/Obn+1NsxVfPhSQ4aU2ezG
	 HIKhFPeX6bSmfHquBIJuRnZAG3uvyUk47DTteHoE30POyzOkcZk/zfZuFyvj1sjbkv
	 UVqXuE/okCjtkX/vnRHE0fEi5THWvQ/b26CVsX4t2+MLMD9vpNGAyufBOV199li/c9
	 rFC5o0yYI8jLw==
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
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/3] gpio: loongson-64bit: Add support for Loongson 2K0300 SoC
Date: Sat, 16 Aug 2025 03:50:27 +0000
Message-ID: <20250816035027.11727-4-ziyao@disroot.org>
In-Reply-To: <20250816035027.11727-2-ziyao@disroot.org>
References: <20250816035027.11727-2-ziyao@disroot.org>
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
(2K1500, 2K2000) support byte-control mode, these operations are for
byte-control mode only for simplicity.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/gpio/Kconfig               |   1 +
 drivers/gpio/gpio-loongson-64bit.c | 191 +++++++++++++++++++++++++++--
 2 files changed, 185 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e43abb322fa6..f9329477d792 100644
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
index add09971d26a..d755dbd5fd08 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -7,12 +7,15 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
+#include <linux/reset.h>
 #include <asm/types.h>
 
 enum loongson_gpio_mode {
@@ -27,6 +30,14 @@ struct loongson_gpio_chip_data {
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
@@ -135,21 +146,154 @@ static int loongson_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
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
+	for (i = 0; i < lgpio->chip.ngpio; i++) {
+		/*
+		 * For the GPIO controller of 2K0300, interrupts status bits
+		 * may be wrongly set even if the corresponding interrupt is
+		 * disabled. Thus interrupt enable bits are checked along with
+		 * status bits to detect interrupts reliably.
+		 */
+		if (readb(lgpio->reg_base + lgpio->chip_data->intsts_offset + i) &&
+		    readb(lgpio->reg_base + lgpio->chip_data->inten_offset + i))
+			generic_handle_domain_irq(lgpio->chip.irq.domain, i);
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
+	struct gpio_chip *chip = &lgpio->chip;
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
 	int ret;
 
 	lgpio->reg_base = reg_base;
 	if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
-		ret = bgpio_init(&lgpio->chip, dev, 8,
+		ret = bgpio_init(&lgpio->chip, &pdev->dev, 8,
 				lgpio->reg_base + lgpio->chip_data->in_offset,
 				lgpio->reg_base + lgpio->chip_data->out_offset,
 				NULL, NULL,
 				lgpio->reg_base + lgpio->chip_data->conf_offset,
 				0);
 		if (ret) {
-			dev_err(dev, "unable to init generic GPIO\n");
+			dev_err(&pdev->dev, "unable to init generic GPIO\n");
 			return ret;
 		}
 	} else {
@@ -158,16 +302,22 @@ static int loongson_gpio_init(struct device *dev, struct loongson_gpio_chip *lgp
 		lgpio->chip.get_direction = loongson_gpio_get_direction;
 		lgpio->chip.direction_output = loongson_gpio_direction_output;
 		lgpio->chip.set_rv = loongson_gpio_set;
-		lgpio->chip.parent = dev;
+		lgpio->chip.parent = &pdev->dev;
 		spin_lock_init(&lgpio->lock);
 	}
 
 	lgpio->chip.label = lgpio->chip_data->label;
 	lgpio->chip.can_sleep = false;
-	if (lgpio->chip_data->inten_offset)
+	if (lgpio->chip_data->girqchip) {
+		ret = loongson_gpio_init_irqchip(pdev, lgpio);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "failed to initialize irqchip\n");
+	} else if (lgpio->chip_data->inten_offset) {
 		lgpio->chip.to_irq = loongson_gpio_to_irq;
+	}
 
-	return devm_gpiochip_add_data(dev, &lgpio->chip, lgpio);
+	return devm_gpiochip_add_data(&pdev->dev, &lgpio->chip, lgpio);
 }
 
 static int loongson_gpio_probe(struct platform_device *pdev)
@@ -175,6 +325,7 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	void __iomem *reg_base;
 	struct loongson_gpio_chip *lgpio;
 	struct device *dev = &pdev->dev;
+	struct reset_control *rst;
 
 	lgpio = devm_kzalloc(dev, sizeof(*lgpio), GFP_KERNEL);
 	if (!lgpio)
@@ -186,7 +337,12 @@ static int loongson_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
-	return loongson_gpio_init(dev, lgpio, reg_base);
+	rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rst),
+				     "failed to get reset control\n");
+
+	return loongson_gpio_init(pdev, lgpio, reg_base);
 }
 
 static const struct loongson_gpio_chip_data loongson_gpio_ls2k_data = {
@@ -198,6 +354,23 @@ static const struct loongson_gpio_chip_data loongson_gpio_ls2k_data = {
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
@@ -294,6 +467,10 @@ static const struct of_device_id loongson_gpio_of_match[] = {
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


