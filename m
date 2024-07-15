Return-Path: <linux-gpio+bounces-8207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEF931024
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 10:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 121531F2228C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33167186E30;
	Mon, 15 Jul 2024 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ5NIhpD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D211862A0;
	Mon, 15 Jul 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721032804; cv=none; b=MyGqqLDHBThOau5UDCRQuY29n/zy+Nfw9KjR86C4syYq6FMbPx2Td5n0Bx5uUc5mzeYso1XSwzk1j574A4mXetcWfusf069qcNQCbMGsza/OHa12Iz1ep66AABMSZiM2zimD5Ppm5vhtLJea+52kg+2nCP4zcOdTgIxNl7G423k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721032804; c=relaxed/simple;
	bh=tpBb5gzOmG5ywIjVVdpHQ0mPmmXATJF1+bBKgyaj2zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mhbow6SU44yxDLz2TuO90B9f3KPfMyzjncOirc8v5FMW0L1tuFMuOah3OzzsahvgVkIa0nXO4iL6w/HEFeg4QwovEWhWZDg+ffKIyMPRM48emcu8I4djl+p8LVdfPqHHRFVWkT5Vb88rfmA38UMjIv4Qo+jqwRQUB3vZoxsbIDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ5NIhpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B573C4AF15;
	Mon, 15 Jul 2024 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721032804;
	bh=tpBb5gzOmG5ywIjVVdpHQ0mPmmXATJF1+bBKgyaj2zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MZ5NIhpDTOqSV3KSbieF8xJ/zuSk9OSY+99tIF3E5vEe67eE3B8YuRfGVuO1Datp2
	 gex5JR7SaMcLRiZS5TrWAwKvSN/Y51+IpHh7EJBmbO8azijKNgF5ImqB/O3tsshAQs
	 c1A0N4HeDYpTYn/xvEVcP3kKYtNOY0gAG1wRfivbWEFCBkFN456b/mkNvzRQ3wqq28
	 SvYXzQiKMHPXxz1g7/3ptk0mE/70kX66s01jVSCWMJx15YUp6LaKumCyTvX5IOmc1U
	 x4y9YK56t2TsWwzc2/RohPZtGceA51D6NbUdzI04WlcTkS1/1aHs6cJwU22DtNa6BN
	 j0wF1Lcw/t0aA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64462C2BD09;
	Mon, 15 Jul 2024 08:40:04 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 15 Jul 2024 11:38:29 +0300
Subject: [PATCH v11 25/38] gpio: ep93xx: add DT support for gpio-ep93xx
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-ep93xx-v11-25-4e924efda795@maquefel.me>
References: <20240715-ep93xx-v11-0-4e924efda795@maquefel.me>
In-Reply-To: <20240715-ep93xx-v11-0-4e924efda795@maquefel.me>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721032799; l=4650;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=b6Hs2Wne/sgWTtBW5GkGY2qFIl/1bEenUx4OuZqg2Gs=;
 b=qIcZQB7+g4B8Lx1/JBXDMGh/MgEpoxAJNLeqMknmRFLrM6x8euIdkzCEJLunaqdqlclpdxc/Az7w
 itoCfnjWBuJL/+1gN1xRp907hpq0XkgGRXKKi1W5/kntuPVzGM+O
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
Reply-To: nikita.shubin@maquefel.me

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add OF ID match table.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ep93xx.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index a55f635585f4..ab798c848215 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -12,13 +12,13 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/slab.h>
 #include <linux/gpio/driver.h>
 #include <linux/bitops.h>
 #include <linux/seq_file.h>
-#include <linux/interrupt.h>
 
 struct ep93xx_gpio_irq_chip {
 	void __iomem *base;
@@ -138,7 +138,8 @@ static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
-	int port_mask = BIT(irqd_to_hwirq(d));
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int port_mask = BIT(hwirq);
 
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_EDGE_BOTH)
 		eic->int_type2 ^= port_mask; /* switch edge direction */
@@ -147,26 +148,28 @@ static void ep93xx_gpio_irq_mask_ack(struct irq_data *d)
 	ep93xx_gpio_update_int_params(eic);
 
 	writeb(port_mask, eic->base + EP93XX_INT_EOI_OFFSET);
-	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void ep93xx_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	eic->int_unmasked &= ~BIT(irqd_to_hwirq(d));
+	eic->int_unmasked &= ~BIT(hwirq);
 	ep93xx_gpio_update_int_params(eic);
-	gpiochip_disable_irq(gc, irqd_to_hwirq(d));
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void ep93xx_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
-	eic->int_unmasked |= BIT(irqd_to_hwirq(d));
+	gpiochip_enable_irq(gc, hwirq);
+	eic->int_unmasked |= BIT(hwirq);
 	ep93xx_gpio_update_int_params(eic);
 }
 
@@ -179,11 +182,11 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct ep93xx_gpio_irq_chip *eic = to_ep93xx_gpio_irq_chip(gc);
-	irq_hw_number_t offset = irqd_to_hwirq(d);
-	int port_mask = BIT(offset);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	int port_mask = BIT(hwirq);
 	irq_flow_handler_t handler;
 
-	gc->direction_input(gc, offset);
+	gc->direction_input(gc, hwirq);
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
@@ -209,7 +212,7 @@ static int ep93xx_gpio_irq_type(struct irq_data *d, unsigned int type)
 	case IRQ_TYPE_EDGE_BOTH:
 		eic->int_type1 |= port_mask;
 		/* set initial polarity based on current input level */
-		if (gc->get(gc, offset))
+		if (gc->get(gc, hwirq))
 			eic->int_type2 &= ~port_mask; /* falling */
 		else
 			eic->int_type2 |= port_mask; /* rising */
@@ -285,9 +288,8 @@ static int ep93xx_setup_irqs(struct platform_device *pdev,
 	if (girq->num_parents == 0)
 		return -EINVAL;
 
-	girq->parents = devm_kcalloc(dev, girq->num_parents,
-				   sizeof(*girq->parents),
-				   GFP_KERNEL);
+	girq->parents = devm_kcalloc(dev, girq->num_parents, sizeof(*girq->parents),
+				     GFP_KERNEL);
 	if (!girq->parents)
 		return -ENOMEM;
 
@@ -306,7 +308,7 @@ static int ep93xx_setup_irqs(struct platform_device *pdev,
 		girq->parent_handler = ep93xx_gpio_f_irq_handler;
 
 		for (i = 0; i < girq->num_parents; i++) {
-			irq = platform_get_irq(pdev, i);
+			irq = platform_get_irq_optional(pdev, i);
 			if (irq < 0)
 				continue;
 
@@ -359,9 +361,15 @@ static int ep93xx_gpio_probe(struct platform_device *pdev)
 	return devm_gpiochip_add_data(&pdev->dev, gc, egc);
 }
 
+static const struct of_device_id ep93xx_gpio_match[] = {
+	{ .compatible = "cirrus,ep9301-gpio" },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver ep93xx_gpio_driver = {
 	.driver		= {
 		.name	= "gpio-ep93xx",
+		.of_match_table = ep93xx_gpio_match,
 	},
 	.probe		= ep93xx_gpio_probe,
 };

-- 
2.43.2



