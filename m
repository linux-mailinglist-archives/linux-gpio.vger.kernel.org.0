Return-Path: <linux-gpio+bounces-33406-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPHqH4uUtGmBqgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33406-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 23:49:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC628A8A8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 23:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24F4230C5B48
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 22:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B423E38D681;
	Fri, 13 Mar 2026 22:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0CtncVx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78288374E57
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 22:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773442184; cv=none; b=O5DfztXFZX6XAWh/797FktARJ9/OizEc8TCPofXE8+taHkuw/6SBqDHlF3Q5Jg0qavZMPEWm2IHFOIKOKLmDxCbrrxxaUlhD2WveBvzO+o8oCr/JLfP9hqsB0/JGjxMH070HJVq5NDpY1yQueAHgs/OoyrTRi9RL3GbKmk84jcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773442184; c=relaxed/simple;
	bh=uf4a7WInU7U/0zreeRR6YEUmAe/LJ9dLa/4rXZVc1vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvpSyAKg1WNtHJmEDSOFHv9WhVm5PY70jw/SXIjLUfU9RF9JSi+VGW4UbMJDqtbWc/5YXR6P9oY2fLAZaNczePRqihK8119rGVosjNFGrCMuGXzqfltKzIkUyLEBqzEyt5dZwxbw8zBGYoXm4ZMJTuXmV2s9pRwdzgGW3KAI5bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0CtncVx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D41FC19423;
	Fri, 13 Mar 2026 22:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773442184;
	bh=uf4a7WInU7U/0zreeRR6YEUmAe/LJ9dLa/4rXZVc1vY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q0CtncVxDZhTU+Qpab0wt3mjcsXvP/bxjX2hhLw//oQYwCfwblfrecF8tgqPw2z7P
	 +wXe0K6kb9ZNSegLpAYnY2G1lZVTDh/xn3T7AgfIN7JMWWyFB4nJ5O64LPCiTtpVs3
	 LA/sKAKJ28O4ZedsA9meq0w+odUXy2zXnRz44s6k1obodTT+gC8L5+7bVq4YVlf6WY
	 sIrQIz+Dp+Lxz+2wAbGPDdwVHLwkd7rugaD/as2SMDwtdW5Q+Nz9Fj68I4gN4zk6xM
	 tmTbTyLSkJiaMTPHOQpx3I+7YOdq4oDq6/O1uL3PB/nfD6tsn/9Xujw4OiQbFMtJix
	 AeA+8u0jCR+6w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Mar 2026 23:49:39 +0100
Subject: [PATCH v2 3/3] gpio: altera: Use generic MMIO GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-gpio-mmio-more-v2-3-0f777b63105a@kernel.org>
References: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
In-Reply-To: <20260313-gpio-mmio-more-v2-0-0f777b63105a@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33406-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 2CBC628A8A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If we use the generic GPIO lib for MMIO in the Altera driver
we do not only cut down on the code, we also get get/set_multiple
for free.

Keep the local raw spinlock instead of reusing the bgpio spinlock
because it makes the gpiochip and irqchip nicely orthogonal.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig       |   1 +
 drivers/gpio/gpio-altera.c | 109 +++++++++++----------------------------------
 2 files changed, 28 insertions(+), 82 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..7d69fb39b9cd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -159,6 +159,7 @@ config GPIO_74XX_MMIO
 
 config GPIO_ALTERA
 	tristate "Altera GPIO"
+	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y or M here to build support for the Altera PIO device.
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index cb04700c8ccd..fe144360a88d 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 
 #define ALTERA_GPIO_MAX_NGPIO		32
 #define ALTERA_GPIO_DATA		0x0
@@ -26,7 +27,7 @@
 
 /**
 * struct altera_gpio_chip
-* @gc			: GPIO chip structure.
+* @chip			: Generic GPIO chip structure.
 * @regs			: memory mapped IO address for the controller registers.
 * @gpio_lock		: synchronization lock so that new irq/set/get requests
 *			  will be blocked until the current one completes.
@@ -34,7 +35,7 @@
 *			  (rising, falling, both, high)
 */
 struct altera_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *regs;
 	raw_spinlock_t gpio_lock;
 	int interrupt_trigger;
@@ -106,72 +107,6 @@ static unsigned int altera_gpio_irq_startup(struct irq_data *d)
 	return 0;
 }
 
-static int altera_gpio_get(struct gpio_chip *gc, unsigned offset)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-
-	return !!(readl(altera_gc->regs + ALTERA_GPIO_DATA) & BIT(offset));
-}
-
-static int altera_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-	unsigned int data_reg;
-
-	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	data_reg = readl(altera_gc->regs + ALTERA_GPIO_DATA);
-	if (value)
-		data_reg |= BIT(offset);
-	else
-		data_reg &= ~BIT(offset);
-	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
-	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-
-	return 0;
-}
-
-static int altera_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-	unsigned int gpio_ddr;
-
-	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	/* Set pin as input, assumes software controlled IP */
-	gpio_ddr = readl(altera_gc->regs + ALTERA_GPIO_DIR);
-	gpio_ddr &= ~BIT(offset);
-	writel(gpio_ddr, altera_gc->regs + ALTERA_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-
-	return 0;
-}
-
-static int altera_gpio_direction_output(struct gpio_chip *gc,
-		unsigned offset, int value)
-{
-	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-	unsigned int data_reg, gpio_ddr;
-
-	raw_spin_lock_irqsave(&altera_gc->gpio_lock, flags);
-	/* Sets the GPIO value */
-	data_reg = readl(altera_gc->regs + ALTERA_GPIO_DATA);
-	if (value)
-		data_reg |= BIT(offset);
-	else
-		data_reg &= ~BIT(offset);
-	writel(data_reg, altera_gc->regs + ALTERA_GPIO_DATA);
-
-	/* Set pin as output, assumes software controlled IP */
-	gpio_ddr = readl(altera_gc->regs + ALTERA_GPIO_DIR);
-	gpio_ddr |= BIT(offset);
-	writel(gpio_ddr, altera_gc->regs + ALTERA_GPIO_DIR);
-	raw_spin_unlock_irqrestore(&altera_gc->gpio_lock, flags);
-
-	return 0;
-}
-
 static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
@@ -231,9 +166,11 @@ static const struct irq_chip altera_gpio_irq_chip = {
 
 static int altera_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	int reg, ret;
 	struct altera_gpio_chip *altera_gc;
+	struct gpio_generic_chip *chip;
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
 	int mapped_irq;
@@ -244,7 +181,26 @@ static int altera_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&altera_gc->gpio_lock);
 
-	gc = &altera_gc->gc;
+	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(altera_gc->regs))
+		return dev_err_probe(dev, PTR_ERR(altera_gc->regs),
+				     "failed to ioremap memory resource\n");
+
+	chip = &altera_gc->chip;
+
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = altera_gc->regs + ALTERA_GPIO_DATA,
+		.set = altera_gc->regs + ALTERA_GPIO_DATA,
+		.dirout = altera_gc->regs + ALTERA_GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(chip, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to init generic GPIO\n");
+
+	gc = &chip->gc;
 
 	if (device_property_read_u32(dev, "altr,ngpio", &reg))
 		/* By default assume maximum ngpio */
@@ -259,22 +215,11 @@ static int altera_gpio_probe(struct platform_device *pdev)
 		gc->ngpio = ALTERA_GPIO_MAX_NGPIO;
 	}
 
-	gc->direction_input	= altera_gpio_direction_input;
-	gc->direction_output	= altera_gpio_direction_output;
-	gc->get		= altera_gpio_get;
-	gc->set		= altera_gpio_set;
-	gc->owner		= THIS_MODULE;
-	gc->parent		= &pdev->dev;
-	gc->base		= -1;
-
+	gc->base = -1;
 	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", dev_fwnode(dev));
 	if (!gc->label)
 		return -ENOMEM;
 
-	altera_gc->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(altera_gc->regs))
-		return dev_err_probe(dev, PTR_ERR(altera_gc->regs), "failed to ioremap memory resource\n");
-
 	mapped_irq = platform_get_irq_optional(pdev, 0);
 	if (mapped_irq < 0)
 		goto skip_irq;
@@ -303,7 +248,7 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	girq->parents[0] = mapped_irq;
 
 skip_irq:
-	ret = devm_gpiochip_add_data(dev, &altera_gc->gc, altera_gc);
+	ret = devm_gpiochip_add_data(dev, gc, altera_gc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed adding memory mapped gpiochip\n");
 		return ret;

-- 
2.53.0


