Return-Path: <linux-gpio+bounces-33731-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHBbOsGIumnSXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33731-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:13:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCDE2BA986
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66B1D323B5B6
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 11:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC073C1995;
	Wed, 18 Mar 2026 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQKnFWuh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6936BCE7;
	Wed, 18 Mar 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831892; cv=none; b=jzFjjQBvrGtY3VUP30cJiEaHCv7fSgS5gdTr6Qg/2kd2ePFXKCCW2Z2njW1XNvu68H65DBo3/SwbS5BQbHZeV8POWTbZodYxXPTRC1bvCU/lS68S00yRyoAJPkCFfjhEB5Azdpuz6dXeOIlLhDmeuoERPvf3U+ldKetsTsQCihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831892; c=relaxed/simple;
	bh=w/TqdJ1/e8z6rDle+tXTjAYr3suHi59fEhhlrloGrFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T06xLm9skqxLkhC0vhELVa7lr1EYJBpB55O+j7/W8r29mg4xAy5PeDT53BnLQelErs5aJCFKqrS027JIl497CquD2z9js1hgXne9JKaS83wX95QJgq6ZaNaI/bAfQYIsGE5R3MVMMNVHy8NQBpUGF5vFyzkihYnPSh8ualDT4U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQKnFWuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44017C19424;
	Wed, 18 Mar 2026 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831891;
	bh=w/TqdJ1/e8z6rDle+tXTjAYr3suHi59fEhhlrloGrFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQKnFWuh9UnmhLyeTrExtfzSyxRSpHsXJ19zfTRSdwpbs1ONFoYYw0/+0wTe0L3Mu
	 8uAkikK8y689EEg/Bn1eurLNbomn2hI/YL9b/Oghj4+0lkT9shyqH6EFeLAJmzKPZE
	 n2+xgOIPy8mjaBPFWv2d2YJctmWmR4ajYEn/PnXALLTBWsnuMkIDUeNOF2ycKHKdPk
	 96v6xT4oTVnqCUSV2P6YHklnhTn3Nu9wa6TPXo+Ann1oJaHy11pwDR75go0VIowEAl
	 U0KUAhm0egBxSy6+2+k2DkJE+oytE7dtg3FuvBCA/JbAQth0LXWMQTD53psTroz3lQ
	 gGVrSHIlaCU0Q==
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
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 2/5] gpio: mpfs: Add interrupt support
Date: Wed, 18 Mar 2026 11:04:33 +0000
Message-ID: <20260318-siamese-twirl-ba045ad446f9@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6415; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qZAxon0cLWKPAGU5V9eYU2gifbxZBOUs+2bM9g63Uso=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm72o6E/KhMu9YioWc2b9KflzLCESWuby9rJ209nrX46 6o1Pz91d5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiWqKMDK8O3t9h/aOgu0JZ LUlfPO5TSO+LwwGmuVYhhwotpjQudmL47xL3x8+9T7LA/si7b3zx0TLRL778vrR5RdulH3388mU unAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33731-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 8CCDE2BA986
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

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


