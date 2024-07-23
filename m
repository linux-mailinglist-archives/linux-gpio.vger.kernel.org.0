Return-Path: <linux-gpio+bounces-8360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFF1939FEF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B38AB226C1
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3740E155301;
	Tue, 23 Jul 2024 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Caqxeobl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B4154448;
	Tue, 23 Jul 2024 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734121; cv=none; b=fwBqa+KioVj70nHTwSO0JakxWThIdyDA3UUAsIF3TrP4dQuNsWOnqBjWhO/tJGoMqlQ2/yikAvyTDax45WRb6FTz+CXqiiclpG+8xEA+GeazyrblfcZuNZHomxMIjP7fz2ZOob5tcQYpg02GIYoJLzV+D0q+dTWR84mmsHz6Gz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734121; c=relaxed/simple;
	bh=Ucm8XGSvUldvd/bc2uyFIRcCiSr1Ximdbh0xRa+hE+Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fR2073eH7lrTyMIBhFRNYjH4PbrEjvy2rXH81TKbid8acuX59JhVTXDvKOIJpp33rWdLZnBnNxH8GR4ednOsYj3uPsf2g8uk7G2DX88vQ3aE0Ze0UWzjXSiOG4e0xxehUlehtjsY48j1kHbW8iTNj/wgt5ygD1CxA/f6hFaWWXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Caqxeobl; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734119; x=1753270119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ucm8XGSvUldvd/bc2uyFIRcCiSr1Ximdbh0xRa+hE+Q=;
  b=CaqxeoblB1PLyj4ZQFtKRWqPLCL7QJPaPHi56kV8iy5JeUoRfL9grNxw
   9tmKM55GuFZVm2MCYolc0SPMo4VDqnTn7hnY5Wcc8t3z7/+KOHCAjBCj/
   HFbhdgN7wpkG+gVuB+SMcEivSomd0uJ7aVZaAH1D5Go7mBkFcXlS2LkoD
   0sUd0hOZQ/av0Mcbvj0K6X054nrZ9Ul8KQ3wBo4IrtrcJe5YLJOFY5uU/
   q3dzlrz4s2InqbBo3nZSuTBZ9bYvwc8M7zXX7laUswD4QLA9WiEgcdazs
   uyxNXcvdk1kIaAP/rnNsO2BZRd2gXsI/1SOcbSmoaj2DbfrJ+lwhPRG2v
   g==;
X-CSE-ConnectionGUID: urgFf+kjT1Coy3E8dV+nGA==
X-CSE-MsgGUID: NdOsJdXTT0q1UVuWrE8VRg==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="32335706"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:20 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:17 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [RFC v7 5/6] gpio: mpfs: pass gpio line number as irq data
Date: Tue, 23 Jul 2024 12:27:14 +0100
Message-ID: <20240723-handoff-race-33160609553f@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6470; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Ucm8XGSvUldvd/bc2uyFIRcCiSr1Ximdbh0xRa+hE+Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ0+YukcmPfZuz4P/5Vu65G/3V+9aXPHx6unjGh/ebMs0 1V1a11HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJGHMxMtzhkZ83zzDnwR3pvaeZvs m+uhDCftMndUVD27G855Gyhc8Z/kepmi0xObLx8d1Fa9ZX7bx0OF1W7SbfD3+PqXa1Jzo7TfkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since the interrupt mux is going to provide us a 1:1 mapping for
interrupts, and it is no longer correct to hit all of the set bits in
the interrupt handler, store the GPIO that "owns" an interrupt in its
data pointer, so that we can determine which bit to clear.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This patch will need to be squashed, I've kept it apart for illustrative
purposes.
---
 drivers/gpio/gpio-mpfs.c | 85 +++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 1ac0526ba1029..b92f094964822 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -43,6 +43,7 @@ struct mpfs_gpio_chip {
 	struct clk *clk;
 	raw_spinlock_t	lock;
 	struct gpio_chip gc;
+	u8 irq_data[MAX_NUM_GPIO];
 };
 
 static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, bool value)
@@ -129,7 +130,7 @@ static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data);
+	int gpio_index = irqd_to_hwirq(data) % 32;
 	u32 interrupt_type;
 	u32 gpio_cfg;
 	unsigned long flags;
@@ -168,11 +169,10 @@ static void mpfs_gpio_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data);
+	int gpio_index = irqd_to_hwirq(data) % 32;
 
 	gpiochip_enable_irq(gc, gpio_index);
 	mpfs_gpio_direction_input(gc, gpio_index);
-	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
 			     MPFS_GPIO_EN_INT, 1);
 }
@@ -181,19 +181,18 @@ static void mpfs_gpio_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
-	int gpio_index = irqd_to_hwirq(data);
+	int gpio_index = irqd_to_hwirq(data) % 32;
 
-	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
 			     MPFS_GPIO_EN_INT, 0);
 	gpiochip_disable_irq(gc, gpio_index);
 }
 
 static const struct irq_chip mpfs_gpio_irqchip = {
-	.name = "mpfs",
+	.name = "MPFS GPIO",
 	.irq_set_type = mpfs_gpio_irq_set_type,
-	.irq_mask	= mpfs_gpio_irq_mask,
-	.irq_unmask	= mpfs_gpio_irq_unmask,
+	.irq_mask = mpfs_gpio_irq_mask,
+	.irq_unmask = mpfs_gpio_irq_unmask,
 	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -201,18 +200,24 @@ static const struct irq_chip mpfs_gpio_irqchip = {
 static void mpfs_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
-	struct mpfs_gpio_chip *mpfs_gpio =
-		gpiochip_get_data(irq_desc_get_handler_data(desc));
+	void *handler_data = irq_desc_get_handler_data(desc);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(&desc->irq_data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u8 gpio_index = *((u8 *)handler_data);
 	unsigned long status;
-	int offset;
+
+	/*
+	 * Since the parent may be a muxed/"non-direct" interrupt, this
+	 * interrupt may not be for us.
+	 */
+	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
+	if (!(status & BIT(gpio_index)))
+		return;
 
 	chained_irq_enter(irqchip, desc);
 
-	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
-	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
-		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
-		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
-	}
+	generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, gpio_index));
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
 
 	chained_irq_exit(irqchip, desc);
 }
@@ -222,6 +227,7 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
+	void **irq_data = NULL;
 	struct mpfs_gpio_chip *mpfs_gpio;
 	struct gpio_irq_chip *girq;
 	int i, ret, ngpios, nirqs;
@@ -232,7 +238,8 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 
 	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mpfs_gpio->base))
-		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base), "failed to ioremap memory resource\n");
+		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base),
+				     "failed to ioremap memory resource\n");
 
 	clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(clk))
@@ -266,20 +273,42 @@ static int mpfs_gpio_probe(struct platform_device *pdev)
 		ret = -ENXIO;
 		goto cleanup_clock;
 	}
+
 	girq = &mpfs_gpio->gc.irq;
-	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
-	girq->handler = handle_simple_irq;
-	girq->parent_handler = mpfs_gpio_irq_handler;
-	girq->default_type = IRQ_TYPE_NONE;
 	girq->num_parents = nirqs;
-	girq->parents = devm_kcalloc(&pdev->dev, nirqs,
-				     sizeof(*girq->parents), GFP_KERNEL);
-	if (!girq->parents) {
-		ret = -ENOMEM;
-		goto cleanup_clock;
+
+	if (girq->num_parents) {
+		gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+		girq->parent_handler = mpfs_gpio_irq_handler;
+
+		girq->parents = devm_kcalloc(&pdev->dev, girq->num_parents,
+					     sizeof(*girq->parents), GFP_KERNEL);
+		irq_data = devm_kmalloc_array(&pdev->dev, girq->num_parents,
+					      sizeof(*irq_data), GFP_KERNEL);
+
+		if (!girq->parents || !irq_data) {
+			ret = -ENOMEM;
+			goto cleanup_clock;
+		}
+
+		for (i = 0; i < girq->num_parents; i++) {
+			ret = platform_get_irq(pdev, i);
+			if (ret < 0)
+				goto cleanup_clock;
+
+			girq->parents[i] = ret;
+			mpfs_gpio->irq_data[i] = i;
+			irq_data[i] = &mpfs_gpio->irq_data[i];
+
+			irq_set_chip_data(ret, &mpfs_gpio->gc);
+			irq_set_handler(ret, handle_simple_irq);
+		}
+
+		girq->parent_handler_data_array = irq_data;
+		girq->per_parent_data = true;
+		girq->handler = handle_simple_irq;
+		girq->default_type = IRQ_TYPE_NONE;
 	}
-	for (i = 0; i < nirqs; i++)
-		girq->parents[i] = platform_get_irq(pdev, i);
 
 	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
 	if (ret)
-- 
2.43.2


