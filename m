Return-Path: <linux-gpio+bounces-35543-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIHfIuUi72lV7gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35543-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:48:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD346F5DE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD6B53007214
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 08:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8745D39901A;
	Mon, 27 Apr 2026 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwOKvHKW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487373A0E80
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279685; cv=none; b=G+VMupU09uN1sAW581Knv3dMuz66uIl4RvnuaPW1U9QcRLwiRnChhNV5kANzRPcjVif4Oce4NSjHJkdRsac3qQ01T+A5JHtd3fEmnlbGywFt2q/JDOZ67Ouqjjt7g9tk1Jt9STL5k73txvC8+VbgA5ON0//KwVwnFXcOZKEz0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279685; c=relaxed/simple;
	bh=vYzKUz2+NwrtujqUJ8eP37nR2g5rrP5ruXmxekhH8fA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iHBX4uodoemml/AR6Q1pq9Mlx5HkUM9tp9Qpm0BpCC5uD0hOE1uQpN00X7j9q0xYJTlOuikUwGD55Xm4CFTdl3UwwoO8biZE5csmgwyRJRefFNJmBrPg/iAq+ng8jvXkexBjKl/C7m2mFdxS1lq3BWnch6A1iyDhk1ZaoLmelhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwOKvHKW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE72C19425;
	Mon, 27 Apr 2026 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777279685;
	bh=vYzKUz2+NwrtujqUJ8eP37nR2g5rrP5ruXmxekhH8fA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mwOKvHKWzj4M13RbXaJ8Cz21OImyIGz+B9wV7EnA2CFvSx87w4xxXWl6rHDwMfze9
	 zAgOws/KyA200si1rex1wMwjkSnJAruZ5bHnTBM+Zz2qNVrRIDQHIa7f4NPaydmYz6
	 5VnIICItGjVtlaCSR1Gy2Lyc4g5io+n4Lvko2qR8d4X9p7eHI+weDSa5mAt0PbiAkn
	 dNypyfQJG/tskNitIfo4cLz80BVXCqXlHZrIU82MAYMcww8L8Osg4r8A+CaijGJgYC
	 i234PawkLh7Q30WEjYCslSEaJk1ol1pDM2cuT2yuCymHbuiNvKTnWRfCWCHEoz7V/h
	 i6sBP29KN2cCQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 10:47:59 +0200
Subject: [PATCH v3 3/3] gpio: altera: Use generic MMIO GPIO
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-gpio-mmio-more-v3-3-fe1882351424@kernel.org>
References: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
In-Reply-To: <20260427-gpio-mmio-more-v3-0-fe1882351424@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mun Yew Tham <mun.yew.tham@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: DCAD346F5DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35543-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]

From: Linus Walleij <linus.walleij@linaro.org>

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
index 020e51e30317..0e8aad3d4b8f 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -156,6 +156,7 @@ config GPIO_74XX_MMIO
 
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


