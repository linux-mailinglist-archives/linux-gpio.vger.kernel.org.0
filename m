Return-Path: <linux-gpio+bounces-29980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C0CE6C6E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 13:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB970300F306
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Dec 2025 12:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552DF313E25;
	Mon, 29 Dec 2025 12:47:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF3313E23;
	Mon, 29 Dec 2025 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012450; cv=none; b=ijCJGg/hN1mjgZ+YILUAHMNF2xvn0d53ZejIH0ABsrYQ2ZatJoj/+pF8+zN33i6ZZ6JnwL7a06lOlgqdb1whoAMp07UNBpMPKTLQF0xji2p1XzYQw6M1bevdiSuM7z/rVtuOdjyt9Z9uZ7q495q4qaKoeLOVqzTeMGmnBU3D/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012450; c=relaxed/simple;
	bh=cUG+351/SqJFzMLi6ntkQtD1YOdIRvw1GHtqppBmLbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmnPZmUKUvI7hFBNNvVALPiT6LS5faEvxyVlqRGl/KKenqmoxKnS+Uy3SX8vIXdzEc44AnC1e3Zvvg/UN4dwJdqkxcU2Bq6YRZeqzy7u/kkjR0tDDuTGoNPq7HUp1bI8OPqA2ILdQToZcPkX117hOyw19lFWNRVV1xp1GVg2UHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 93FD5340E0F;
	Mon, 29 Dec 2025 12:47:24 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 29 Dec 2025 20:46:39 +0800
Subject: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
In-Reply-To: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10389; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=cUG+351/SqJFzMLi6ntkQtD1YOdIRvw1GHtqppBmLbw=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpUnhPRx8jW8+ltNgtvnOauDuKzzW2Mj5AGNLZd
 xqAFKcLZW2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVJ4TxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1g4g//Yz/70gPbLjO5xOTgTVaFaIhL/Suw2P6HrfZJhAcoVLBkMpEsqzbRn
 FAMnX8jREtRpbnh2zhK1Kw4bNNULyDHWLTdWQZtX5+BKFU/rYFLq2EalgRTgaoQnFc0zIPfOSEI
 3TW7qfK5ORK02WfFr4y7IFNtxzd9lhIaKvjmgtE/sx5NOpX9uYQvh+27xMzltMWpkPN859WUYuR
 qJbko9RSOuIMMrG7zlw9IhVGzCHHk0gknHeLqNm4rQx8VnR6IO86TFoBWM05TsP0c0zaUhLP/VT
 4cqTSod8YDtOS45truD332hwfXDJYwFDHLftQYaiVzW3uWyw8gOgra3xQVzPJWbQsg3mzuDbpd0
 ENFuSNJ0H4VdLEDE0p08yHIJE/WPfFutkJ75RPmhqIl064c+8Q0eNIN4hqIwahhDMy/p2iqvUFc
 A0yqRFvQopfizmh+PXHPDUnKOM/d04CUk+T8CXlFZfXIw4qeX9mtz4fozJ7xkPJpvVKHRv22K+L
 918JF1L/0zro68FM/1pN9JqeebRNLVxC0SwJltI8BkcRShlt/uzNXQX0/O1HhF0gUIgyUhU1dVA
 YPpxCmzOS7U+MzXZubSyJXNKGuKVD6Dj50b199d9mDNRjyPNabTwSBQWHIqyP+7VTC566HHdnoe
 MJHYY+tllmC2MMXWaBucnZC2zn92KA=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K3 SoC has changed gpio register layout while comparing
with previous generation, the register offset and bank offset
need to be adjusted, introduce a compatible data to extend the
driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 150 ++++++++++++++++++++++++++++------------
 1 file changed, 106 insertions(+), 44 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index eb66a15c002f..02cc5c11b617 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -15,28 +15,19 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 
-/* register offset */
-#define SPACEMIT_GPLR		0x00 /* port level - R */
-#define SPACEMIT_GPDR		0x0c /* port direction - R/W */
-#define SPACEMIT_GPSR		0x18 /* port set - W */
-#define SPACEMIT_GPCR		0x24 /* port clear - W */
-#define SPACEMIT_GRER		0x30 /* port rising edge R/W */
-#define SPACEMIT_GFER		0x3c /* port falling edge R/W */
-#define SPACEMIT_GEDR		0x48 /* edge detect status - R/W1C */
-#define SPACEMIT_GSDR		0x54 /* (set) direction - W */
-#define SPACEMIT_GCDR		0x60 /* (clear) direction - W */
-#define SPACEMIT_GSRER		0x6c /* (set) rising edge detect enable - W */
-#define SPACEMIT_GCRER		0x78 /* (clear) rising edge detect enable - W */
-#define SPACEMIT_GSFER		0x84 /* (set) falling edge detect enable - W */
-#define SPACEMIT_GCFER		0x90 /* (clear) falling edge detect enable - W */
-#define SPACEMIT_GAPMASK	0x9c /* interrupt mask , 0 disable, 1 enable - R/W */
-
 #define SPACEMIT_NR_BANKS		4
 #define SPACEMIT_NR_GPIOS_PER_BANK	32
 
 #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
+#define to_spacemit_gpio_regs(sg) ((sg)->data->reg_offsets)
 
 struct spacemit_gpio;
+struct spacemit_gpio_reg_offsets;
+
+struct spacemit_gpio_data {
+	struct spacemit_gpio_reg_offsets *reg_offsets;
+	u32 bank_offsets[4];
+};
 
 struct spacemit_gpio_bank {
 	struct gpio_generic_chip chip;
@@ -49,9 +40,28 @@ struct spacemit_gpio_bank {
 
 struct spacemit_gpio {
 	struct device *dev;
+	const struct spacemit_gpio_data *data;
 	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
 };
 
+struct spacemit_gpio_reg_offsets {
+	u32 gplr;      /* port level - R */
+	u32 gpdr;      /* port direction - R/W */
+	u32 gpsr;      /* port set - W */
+	u32 gpcr;      /* port clear - W */
+	u32 grer;      /* port rising edge R/W */
+	u32 gfer;      /* port falling edge R/W */
+	u32 gedr;      /* edge detect status - R/W1C */
+	u32 gsdr;      /* (set) direction - W */
+	u32 gcdr;      /* (clear) direction - W */
+	u32 gsrer;     /* (set) rising edge detect enable - W */
+	u32 gcrer;     /* (clear) rising edge detect enable - W */
+	u32 gsfer;     /* (set) falling edge detect enable - W */
+	u32 gcfer;     /* (clear) falling edge detect enable - W */
+	u32 gapmask;   /* interrupt mask , 0 disable, 1 enable - R/W */
+	u32 gcpmask;   /* interrupt mask for K3 */
+};
+
 static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
 {
 	return (u32)(gb - gb->sg->sgb);
@@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
 static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 {
 	struct spacemit_gpio_bank *gb = dev_id;
+	struct spacemit_gpio *sg = gb->sg;
 	unsigned long pending;
 	u32 n, gedr;
 
-	gedr = readl(gb->base + SPACEMIT_GEDR);
+	gedr = readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);
 	if (!gedr)
 		return IRQ_NONE;
-	writel(gedr, gb->base + SPACEMIT_GEDR);
+	writel(gedr, gb->base + to_spacemit_gpio_regs(sg)->gedr);
 
 	pending = gedr & gb->irq_mask;
 	if (!pending)
@@ -81,60 +92,64 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 static void spacemit_gpio_irq_ack(struct irq_data *d)
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	struct spacemit_gpio *sg = gb->sg;
 
-	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
+	writel(BIT(irqd_to_hwirq(d)), gb->base + to_spacemit_gpio_regs(sg)->gedr);
 }
 
 static void spacemit_gpio_irq_mask(struct irq_data *d)
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	struct spacemit_gpio *sg = gb->sg;
 	u32 bit = BIT(irqd_to_hwirq(d));
 
 	gb->irq_mask &= ~bit;
-	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+	writel(gb->irq_mask, gb->base + to_spacemit_gpio_regs(sg)->gapmask);
 
 	if (bit & gb->irq_rising_edge)
-		writel(bit, gb->base + SPACEMIT_GCRER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gcrer);
 
 	if (bit & gb->irq_falling_edge)
-		writel(bit, gb->base + SPACEMIT_GCFER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gcfer);
 }
 
 static void spacemit_gpio_irq_unmask(struct irq_data *d)
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	struct spacemit_gpio *sg = gb->sg;
 	u32 bit = BIT(irqd_to_hwirq(d));
 
 	gb->irq_mask |= bit;
 
 	if (bit & gb->irq_rising_edge)
-		writel(bit, gb->base + SPACEMIT_GSRER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gsrer);
 
 	if (bit & gb->irq_falling_edge)
-		writel(bit, gb->base + SPACEMIT_GSFER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gsfer);
 
-	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+	writel(gb->irq_mask, gb->base + to_spacemit_gpio_regs(sg)->gapmask);
 }
 
 static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
+	struct spacemit_gpio *sg = gb->sg;
 	u32 bit = BIT(irqd_to_hwirq(d));
 
 	if (type & IRQ_TYPE_EDGE_RISING) {
 		gb->irq_rising_edge |= bit;
-		writel(bit, gb->base + SPACEMIT_GSRER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gsrer);
 	} else {
 		gb->irq_rising_edge &= ~bit;
-		writel(bit, gb->base + SPACEMIT_GCRER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gcrer);
 	}
 
 	if (type & IRQ_TYPE_EDGE_FALLING) {
 		gb->irq_falling_edge |= bit;
-		writel(bit, gb->base + SPACEMIT_GSFER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gsfer);
 	} else {
 		gb->irq_falling_edge &= ~bit;
-		writel(bit, gb->base + SPACEMIT_GCFER);
+		writel(bit, gb->base + to_spacemit_gpio_regs(sg)->gcfer);
 	}
 
 	return 0;
@@ -179,15 +194,15 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
-	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
+	int ret;
 
-	gb->base = regs + bank_base[index];
+	gb->base = regs + sg->data->bank_offsets[index];
 
-	dat	= gb->base + SPACEMIT_GPLR;
-	set	= gb->base + SPACEMIT_GPSR;
-	clr	= gb->base + SPACEMIT_GPCR;
-	dirin	= gb->base + SPACEMIT_GCDR;
-	dirout	= gb->base + SPACEMIT_GSDR;
+	dat	= gb->base + to_spacemit_gpio_regs(sg)->gplr;
+	set	= gb->base + to_spacemit_gpio_regs(sg)->gpsr;
+	clr	= gb->base + to_spacemit_gpio_regs(sg)->gpcr;
+	dirin	= gb->base + to_spacemit_gpio_regs(sg)->gcdr;
+	dirout	= gb->base + to_spacemit_gpio_regs(sg)->gsdr;
 
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
@@ -223,13 +238,13 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
 
 	/* Disable Interrupt */
-	writel(0, gb->base + SPACEMIT_GAPMASK);
+	writel(0, gb->base + to_spacemit_gpio_regs(sg)->gapmask);
 	/* Disable Edge Detection Settings */
-	writel(0x0, gb->base + SPACEMIT_GRER);
-	writel(0x0, gb->base + SPACEMIT_GFER);
+	writel(0x0, gb->base + to_spacemit_gpio_regs(sg)->grer);
+	writel(0x0, gb->base + to_spacemit_gpio_regs(sg)->gfer);
 	/* Clear Interrupt */
-	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
-	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
+	writel(0xffffffff, gb->base + to_spacemit_gpio_regs(sg)->gcrer);
+	writel(0xffffffff, gb->base + to_spacemit_gpio_regs(sg)->gcfer);
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
@@ -260,6 +275,10 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
 	if (!sg)
 		return -ENOMEM;
 
+	sg->data = of_device_get_match_data(dev);
+	if (!sg->data)
+		return dev_err_probe(dev, -EINVAL, "No available compatible data.");
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -287,8 +306,51 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct spacemit_gpio_data k1_gpio_data = {
+	.reg_offsets = &(struct spacemit_gpio_reg_offsets) {
+		.gplr    = 0x00,
+		.gpdr    = 0x0c,
+		.gpsr    = 0x18,
+		.gpcr    = 0x24,
+		.grer    = 0x30,
+		.gfer    = 0x3c,
+		.gedr    = 0x48,
+		.gsdr    = 0x54,
+		.gcdr    = 0x60,
+		.gsrer   = 0x6c,
+		.gcrer   = 0x78,
+		.gsfer   = 0x84,
+		.gcfer   = 0x90,
+		.gapmask = 0x9c,
+		.gcpmask = 0xA8,
+	},
+	.bank_offsets = { 0x0, 0x4, 0x8, 0x100 },
+};
+
+static const struct spacemit_gpio_data k3_gpio_data = {
+	.reg_offsets = &(struct spacemit_gpio_reg_offsets) {
+		.gplr    = 0x0,
+		.gpdr    = 0x4,
+		.gpsr    = 0x8,
+		.gpcr    = 0xc,
+		.grer    = 0x10,
+		.gfer    = 0x14,
+		.gedr    = 0x18,
+		.gsdr    = 0x1c,
+		.gcdr    = 0x20,
+		.gsrer   = 0x24,
+		.gcrer   = 0x28,
+		.gsfer   = 0x2c,
+		.gcfer   = 0x30,
+		.gapmask = 0x34,
+		.gcpmask = 0x38,
+	},
+	.bank_offsets = { 0x0, 0x40, 0x80, 0x100 },
+};
+
 static const struct of_device_id spacemit_gpio_dt_ids[] = {
-	{ .compatible = "spacemit,k1-gpio" },
+	{ .compatible = "spacemit,k1-gpio", .data = &k1_gpio_data },
+	{ .compatible = "spacemit,k3-gpio", .data = &k3_gpio_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
@@ -296,12 +358,12 @@ MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
 static struct platform_driver spacemit_gpio_driver = {
 	.probe		= spacemit_gpio_probe,
 	.driver		= {
-		.name	= "k1-gpio",
+		.name	= "spacemit-gpio",
 		.of_match_table = spacemit_gpio_dt_ids,
 	},
 };
 module_platform_driver(spacemit_gpio_driver);
 
 MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
-MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
+MODULE_DESCRIPTION("GPIO driver for SpacemiT K1/K3 SoC");
 MODULE_LICENSE("GPL");

-- 
2.52.0


