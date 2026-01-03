Return-Path: <linux-gpio+bounces-30097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD5CF0683
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 22:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 724D330351D2
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 21:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06B32C026C;
	Sat,  3 Jan 2026 21:34:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0120299B;
	Sat,  3 Jan 2026 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767476047; cv=none; b=ac4myr90CHpgeaM2nfj9ibqUnLLyaO06YNftaBx6MXT5BHXlMtRPj7tK3JdD3AhYySHf+K0TSJEj2XMHxP/a+z3iRi5zxU0MRX8ouPCLpU2hbJXvEwvMpkoJS5bA3UtjTlM2qUylJGnCW3EEw/kWuQsbIxHM1QT7ubqm48YZp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767476047; c=relaxed/simple;
	bh=rB3xu6YCmoNgQC9dZPhSiztVmLq50xLVPrim4MbHH7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2Hddr1ZogB4EoFjjoWtZ8S85m8Et7SReG976zSnc4AfsNYzhBOsHR9S9XPiUnH6x9icOsfp27dXqrWSc9eloMew6idro8oj6BAD5C3alJEWa3zUxTr6kX7tBj9PeZ2H80H/co5I3KqlLRTy5Sx02SDOC5pupyJCm43i0wZF754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2CE18340B46;
	Sat, 03 Jan 2026 21:34:01 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 04 Jan 2026 05:33:39 +0800
Subject: [PATCH v2 2/2] gpio: spacemit: Add GPIO support for K3 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260104-02-k3-gpio-v2-2-07377739581a@gentoo.org>
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
In-Reply-To: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10229; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=rB3xu6YCmoNgQC9dZPhSiztVmLq50xLVPrim4MbHH7U=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWYs+uH2aQfWmMAuZaFcOG9OgzaPTwiFbGCHCP
 4T6a2ly3muJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVmLPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+23HQ//bNM8PGA1+6arXJnuzHaayxtfbuuhca9itR/pfrmLm9jeNrhAHS7aN
 tRqQKk931sAUi15Da2OGNVVe7g5UPb6WuDEiERLtBawTQOjmzkFLdnrbZFMIO4ULC4vlN/IEZ9g
 hMHiwsXELJaqhH+H4K2do1lK+40f1/sX97eFdwFrlbI1VnmK5dsyHnG9De6ihMZulDf1EYRhXz0
 ZGyjlClGheDxI1lOURruaw3l86h0aZgs7/ju5AOXUjjKWr8nD921/D0BER8HOr8mMaE/+Xc+9UZ
 6CgM0QzFPozj0FbCexEs5h1E7S09ZMcfNx4LM7Sdcdu61azlsIDyoLf8JkndSVWJ3b8W6SOh+Hs
 njBjjdm4QaUo3SDhVNn1sySICVdKDhGrdIJA/nr1gDdN+TgufxcyPPITx7MeUhyryMTHipZW/g7
 xB1RmdbaQ8bNLXdGwp3LiNI5dMQzsa7E1wfylU3d9MwVx7rKvwIWeCbyOIccYyVYG/RlpWv2JMT
 ZxcXbq39MPAroXi3sawd7JVLGt1vWzgKDMy8lj+6BD9pPQ7Eaj6Q6jfwSM1mvrGIP5xv3Z2SPc3
 EkBugCN2RBfzEe5In6blgLjik4dR79zW3sa1+EU2H3eKnc2uNZ25HJi2+/QsS33IzpEzgw8P4UT
 LKsg2n0fkv3Xttn08g7MYfo1WiE4/Y=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

SpacemiT K3 SoC has changed gpio register layout while comparing
with previous generation, the register offset and bank offset
need to be adjusted, introduce a compatible data to extend the
driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 163 ++++++++++++++++++++++++++++------------
 1 file changed, 117 insertions(+), 46 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index eb66a15c002f..bca5c3dc13ca 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -15,29 +15,37 @@
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
+#define to_spacemit_gpio_regs(gb) ((gb)->sg->data->offsets)
+
+enum spacemit_gpio_registers {
+	SPACEMIT_GPLR = 0,	/* port level - R */
+	SPACEMIT_GPDR,		/* port direction - R/W */
+	SPACEMIT_GPSR,		/* port set - W */
+	SPACEMIT_GPCR,		/* port clear - W */
+	SPACEMIT_GRER,		/* port rising edge R/W */
+	SPACEMIT_GFER,		/* port falling edge R/W */
+	SPACEMIT_GEDR,		/* edge detect status - R/W1C */
+	SPACEMIT_GSDR,		/* (set) direction - W */
+	SPACEMIT_GCDR,		/* (clear) direction - W */
+	SPACEMIT_GSRER,		/* (set) rising edge detect enable - W */
+	SPACEMIT_GCRER,		/* (clear) rising edge detect enable - W */
+	SPACEMIT_GSFER,		/* (set) falling edge detect enable - W */
+	SPACEMIT_GCFER,		/* (clear) falling edge detect enable - W */
+	SPACEMIT_GAPMASK,	/* interrupt mask , 0 disable, 1 enable - R/W */
+	SPACEMIT_GCPMASK,	/* interrupt mask for K3 */
+};
 
 struct spacemit_gpio;
 
+struct spacemit_gpio_data {
+	const unsigned int *offsets;
+	u32 bank_offsets[SPACEMIT_NR_BANKS];
+};
+
 struct spacemit_gpio_bank {
 	struct gpio_generic_chip chip;
 	struct spacemit_gpio *sg;
@@ -49,9 +57,22 @@ struct spacemit_gpio_bank {
 
 struct spacemit_gpio {
 	struct device *dev;
+	const struct spacemit_gpio_data *data;
 	struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
 };
 
+static u32 spacemit_gpio_read(struct spacemit_gpio_bank *gb,
+			      enum spacemit_gpio_registers reg)
+{
+	return readl(gb->base + to_spacemit_gpio_regs(gb)[reg]);
+}
+
+static void spacemit_gpio_write(struct spacemit_gpio_bank *gb,
+				enum spacemit_gpio_registers reg, u32 val)
+{
+	writel(val, gb->base + to_spacemit_gpio_regs(gb)[reg]);
+}
+
 static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
 {
 	return (u32)(gb - gb->sg->sgb);
@@ -63,10 +84,10 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 	unsigned long pending;
 	u32 n, gedr;
 
-	gedr = readl(gb->base + SPACEMIT_GEDR);
+	gedr = spacemit_gpio_read(gb, SPACEMIT_GEDR);
 	if (!gedr)
 		return IRQ_NONE;
-	writel(gedr, gb->base + SPACEMIT_GEDR);
+	spacemit_gpio_write(gb, SPACEMIT_GEDR, gedr);
 
 	pending = gedr & gb->irq_mask;
 	if (!pending)
@@ -82,7 +103,7 @@ static void spacemit_gpio_irq_ack(struct irq_data *d)
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
 
-	writel(BIT(irqd_to_hwirq(d)), gb->base + SPACEMIT_GEDR);
+	spacemit_gpio_write(gb, SPACEMIT_GEDR, BIT(irqd_to_hwirq(d)));
 }
 
 static void spacemit_gpio_irq_mask(struct irq_data *d)
@@ -91,13 +112,13 @@ static void spacemit_gpio_irq_mask(struct irq_data *d)
 	u32 bit = BIT(irqd_to_hwirq(d));
 
 	gb->irq_mask &= ~bit;
-	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
 
 	if (bit & gb->irq_rising_edge)
-		writel(bit, gb->base + SPACEMIT_GCRER);
+		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
 
 	if (bit & gb->irq_falling_edge)
-		writel(bit, gb->base + SPACEMIT_GCFER);
+		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
 }
 
 static void spacemit_gpio_irq_unmask(struct irq_data *d)
@@ -108,12 +129,12 @@ static void spacemit_gpio_irq_unmask(struct irq_data *d)
 	gb->irq_mask |= bit;
 
 	if (bit & gb->irq_rising_edge)
-		writel(bit, gb->base + SPACEMIT_GSRER);
+		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
 
 	if (bit & gb->irq_falling_edge)
-		writel(bit, gb->base + SPACEMIT_GSFER);
+		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
 
-	writel(gb->irq_mask, gb->base + SPACEMIT_GAPMASK);
+	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, gb->irq_mask);
 }
 
 static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -123,18 +144,18 @@ static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (type & IRQ_TYPE_EDGE_RISING) {
 		gb->irq_rising_edge |= bit;
-		writel(bit, gb->base + SPACEMIT_GSRER);
+		spacemit_gpio_write(gb, SPACEMIT_GSRER, bit);
 	} else {
 		gb->irq_rising_edge &= ~bit;
-		writel(bit, gb->base + SPACEMIT_GCRER);
+		spacemit_gpio_write(gb, SPACEMIT_GCRER, bit);
 	}
 
 	if (type & IRQ_TYPE_EDGE_FALLING) {
 		gb->irq_falling_edge |= bit;
-		writel(bit, gb->base + SPACEMIT_GSFER);
+		spacemit_gpio_write(gb, SPACEMIT_GSFER, bit);
 	} else {
 		gb->irq_falling_edge &= ~bit;
-		writel(bit, gb->base + SPACEMIT_GCFER);
+		spacemit_gpio_write(gb, SPACEMIT_GCFER, bit);
 	}
 
 	return 0;
@@ -179,15 +200,16 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
-	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
+	int ret;
 
-	gb->base = regs + bank_base[index];
+	gb->base = regs + sg->data->bank_offsets[index];
+	gb->sg = sg;
 
-	dat	= gb->base + SPACEMIT_GPLR;
-	set	= gb->base + SPACEMIT_GPSR;
-	clr	= gb->base + SPACEMIT_GPCR;
-	dirin	= gb->base + SPACEMIT_GCDR;
-	dirout	= gb->base + SPACEMIT_GSDR;
+	dat	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPLR];
+	set	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPSR];
+	clr	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GPCR];
+	dirin	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GCDR];
+	dirout	= gb->base + to_spacemit_gpio_regs(gb)[SPACEMIT_GSDR];
 
 	config = (struct gpio_generic_chip_config) {
 		.dev = dev,
@@ -206,8 +228,6 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
 
-	gb->sg = sg;
-
 	gc->label		= dev_name(dev);
 	gc->request		= gpiochip_generic_request;
 	gc->free		= gpiochip_generic_free;
@@ -223,13 +243,13 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
 
 	/* Disable Interrupt */
-	writel(0, gb->base + SPACEMIT_GAPMASK);
+	spacemit_gpio_write(gb, SPACEMIT_GAPMASK, 0);
 	/* Disable Edge Detection Settings */
-	writel(0x0, gb->base + SPACEMIT_GRER);
-	writel(0x0, gb->base + SPACEMIT_GFER);
+	spacemit_gpio_write(gb, SPACEMIT_GRER, 0x0);
+	spacemit_gpio_write(gb, SPACEMIT_GFER, 0x0);
 	/* Clear Interrupt */
-	writel(0xffffffff, gb->base + SPACEMIT_GCRER);
-	writel(0xffffffff, gb->base + SPACEMIT_GCFER);
+	spacemit_gpio_write(gb, SPACEMIT_GCRER, 0xffffffff);
+	spacemit_gpio_write(gb, SPACEMIT_GCFER, 0xffffffff);
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
@@ -260,6 +280,10 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
 	if (!sg)
 		return -ENOMEM;
 
+	sg->data = of_device_get_match_data(dev);
+	if (!sg->data)
+		return dev_err_probe(dev, -EINVAL, "No available compatible data.");
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -287,8 +311,55 @@ static int spacemit_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const unsigned int spacemit_gpio_k1_offsets[] = {
+	0x00,
+	0x0c,
+	0x18,
+	0x24,
+	0x30,
+	0x3c,
+	0x48,
+	0x54,
+	0x60,
+	0x6c,
+	0x78,
+	0x84,
+	0x90,
+	0x9c,
+	0xA8,
+};
+
+static const unsigned int spacemit_gpio_k3_offsets[] = {
+	0x0,
+	0x4,
+	0x8,
+	0xc,
+	0x10,
+	0x14,
+	0x18,
+	0x1c,
+	0x20,
+	0x24,
+	0x28,
+	0x2c,
+	0x30,
+	0x34,
+	0x38,
+};
+
+static const struct spacemit_gpio_data k1_gpio_data = {
+	.offsets = spacemit_gpio_k1_offsets,
+	.bank_offsets = { 0x0, 0x4, 0x8, 0x100 },
+};
+
+static const struct spacemit_gpio_data k3_gpio_data = {
+	.offsets = spacemit_gpio_k3_offsets,
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
@@ -296,12 +367,12 @@ MODULE_DEVICE_TABLE(of, spacemit_gpio_dt_ids);
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


