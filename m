Return-Path: <linux-gpio+bounces-33162-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPlEH9KHsWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33162-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:18:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1492664B0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FB843014F7C
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51B63DEFF4;
	Wed, 11 Mar 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgIWTC+k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E1A3DB63C;
	Wed, 11 Mar 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242275; cv=none; b=C0Fb7tO0zKpJHs4rlFpaOxqi6ew53UECspPAgZJYzqW7tdn7VaSTo4UT2OdVC9xZ0TD0hxnS4ecKkFbj15KPwUEMpVL3cImzzFwRQsfv02mh6GDCBjCzaz2tncoeNJ5mutf02qV0Q+I3BEzb2u/Uhs8NrUZWFm/ia12BH9RVTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242275; c=relaxed/simple;
	bh=XnBr/Pa9pCsJNH/DLGqHVg8IGm5p35+wH/kjo0aCQG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwd9ew8itq/mD58ARfCCREagJezU4UPpdvbPFemlzLuJej3DnXQK0HUmf8+N8JIohBQZ68zmbCgRb23xm2Mti8vOkqlErKHz3vKgCAxw7aIZd0KTGyajEhJQExAAn3mYGe52QUX2TZeXSrqLuBU++sDy5CY0YuDPkZy3LfOE2ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgIWTC+k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDEBC19425;
	Wed, 11 Mar 2026 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773242275;
	bh=XnBr/Pa9pCsJNH/DLGqHVg8IGm5p35+wH/kjo0aCQG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AgIWTC+ktR5Xqs1oEZRf9AzzWpwu10P5aw7vS57T7ivGJmHqQs0GwPSfqTW3AUIJn
	 l6QA/zgjZVzBe4VKemOm0qt8I7A3h9uBv2A1MGtpSww942eZIWj9BxMJRwpfi8eMeB
	 ktXYmk8reSkC8g2GizzpnWlvhR1uhXeqLNaOp+uCOutyPwZ6DwAk5XsrAzXYRo6DYG
	 t0DZMgKj9TwOkk9kMS7jMIsPnX4ry+zR3kO2Nov30T2lij5Ap8DKm6hBcMOAUHau22
	 DYCfP4DpgW+ENJjxYFjIvamuGoMLOr0M7GbwsgvL1JSfAjZ2XrwqM8s8/X24efKZ0T
	 wvJbGyO2ZL0Uw==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 1/4] gpio: mpfs: Add interrupt support
Date: Wed, 11 Mar 2026 15:17:38 +0000
Message-ID: <20260311-mandolin-sprang-9b9bee9f5a04@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311-tasting-friend-eae39148fb96@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6297; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SW0NQMIPNrJC2tahHXMpad7fckvgFs9dSDepowJfIRU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkb26evlTGesf0N4+y5eREXPbrubbkmdCplU+W9PU3Hf y0QYpkp0lHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJbJBm+J/n8ZMnzjx5ZsIP iYma899uPbU1NsAx1Oqq9hkeq/KzHwUZ/vvH3lml7fW+7LVlem3+xC+pk+/eMnM+vsz04cU519w ObOABAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33162-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 3C1492664B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
has an independent interrupt that is wired to an interrupt mux that sits
between the controllers and the PLIC. The SoC has more GPIO lines than
connections from the mux to the PLIC, so some GPIOs must share PLIC
interrupts. The configuration is not static and is set at runtime,
conventionally by the platform's firmware. CoreGPIO, the version
intended for use in the FPGA fabric has two interrupt output ports, one
is IO_NUM bits wide, as is used in the hardened cores, and the other is
a single bit with all lines ORed together.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/gpio/Kconfig     |   1 +
 drivers/gpio/gpio-mpfs.c | 122 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 120 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c1..1d1239323f615 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -572,6 +572,7 @@ config GPIO_PL061
 config GPIO_POLARFIRE_SOC
 	bool "Microchip FPGA GPIO support"
 	select REGMAP_MMIO
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the GPIO controllers on Microchip FPGAs.
 
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 9468795b96348..1a4cf213c723c 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -9,8 +9,9 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -18,7 +19,7 @@
 
 #define MPFS_GPIO_CTRL(i)		(0x4 * (i))
 #define MPFS_MAX_NUM_GPIO		32
-#define MPFS_GPIO_EN_INT		3
+#define MPFS_GPIO_EN_INT		BIT(3)
 #define MPFS_GPIO_EN_OUT_BUF		BIT(2)
 #define MPFS_GPIO_EN_IN			BIT(1)
 #define MPFS_GPIO_EN_OUT		BIT(0)
@@ -52,6 +53,7 @@ static const struct regmap_config mpfs_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
@@ -114,13 +116,98 @@ static int mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int valu
 	return ret;
 }
 
+static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % 32;
+	u32 interrupt_type;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
+		break;
+	}
+
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			   MPFS_GPIO_TYPE_INT_MASK, interrupt_type);
+
+	return 0;
+}
+
+static void mpfs_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % 32;
+
+	gpiochip_enable_irq(gc, gpio_index);
+	mpfs_gpio_direction_input(gc, gpio_index);
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, MPFS_GPIO_EN_INT);
+}
+
+static void mpfs_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % 32;
+
+	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
+			   MPFS_GPIO_EN_INT, 0);
+	gpiochip_disable_irq(gc, gpio_index);
+}
+
+static const struct irq_chip mpfs_gpio_irqchip = {
+	.name = "MPFS GPIO",
+	.irq_set_type = mpfs_gpio_irq_set_type,
+	.irq_mask = mpfs_gpio_irq_mask,
+	.irq_unmask = mpfs_gpio_irq_unmask,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void mpfs_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct mpfs_gpio_chip *mpfs_gpio = irq_desc_get_handler_data(desc);
+	unsigned long status;
+	u32 val;
+	int i;
+
+	chained_irq_enter(irqchip, desc);
+
+	regmap_read(mpfs_gpio->regs, MPFS_IRQ_REG, &val);
+	status = val;
+	for_each_set_bit(i, &status, MPFS_MAX_NUM_GPIO) {
+		regmap_write(mpfs_gpio->regs, MPFS_IRQ_REG, BIT(i));
+		generic_handle_domain_irq(mpfs_gpio->gc.irq.domain, i);
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
 static int mpfs_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
 	struct mpfs_gpio_chip *mpfs_gpio;
+	struct gpio_irq_chip *girq;
 	struct clk *clk;
 	void __iomem *base;
-	int ngpios;
+	int ngpios, nirqs, ret;
 
 	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
 	if (!mpfs_gpio)
@@ -157,6 +244,35 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	mpfs_gpio->gc.parent = dev;
 	mpfs_gpio->gc.owner = THIS_MODULE;
 
+	nirqs = of_irq_count(node);
+	if (nirqs > MPFS_MAX_NUM_GPIO)
+		return -ENXIO;
+
+	if (nirqs) {
+		girq = &mpfs_gpio->gc.irq;
+
+		gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+
+		girq->num_parents = nirqs;
+		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+					     sizeof(*girq->parents), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+
+		for (int i = 0; i < nirqs; i++) {
+			ret = platform_get_irq(pdev, i);
+			if (ret < 0)
+				return ret;
+
+			girq->parents[i] = ret;
+			girq->parent_handler_data = mpfs_gpio;
+			girq->parent_handler = mpfs_gpio_irq_handler;
+		}
+
+		girq->handler = handle_level_irq;
+		girq->default_type = IRQ_TYPE_NONE;
+	}
+
 	return devm_gpiochip_add_data(dev, &mpfs_gpio->gc, mpfs_gpio);
 }
 
-- 
2.51.0


