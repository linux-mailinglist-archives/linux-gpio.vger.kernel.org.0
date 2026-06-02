Return-Path: <linux-gpio+bounces-37821-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9xykEEPqHmokZAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37821-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 16:35:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84662F553
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 16:35:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GJ4ZSDSz;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37821-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37821-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C0A312D511
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 14:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52FD3F0773;
	Tue,  2 Jun 2026 14:25:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2429311C32
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 14:25:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410320; cv=none; b=DrsZfB3jPRzdE8TrTk14NBicEGowEdJ4ZYf8HolEgHXF99WXnBrh1jbAMAql2C2SQ+MwKDDPxSsIjh/w7SpAStl//PMr4c8sPfhPXwNnTVKhrJ5+sATspwmFDIP6ZOTM48XUYMg71UR1qq5SZUl/aoHj8sMh9MhETSmIuI1FR9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410320; c=relaxed/simple;
	bh=hOKYG7hWXa81OqPyRtFrp75me0hBVPzmq9QU2I43+SI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Duzc2KSxRSe/ituRAyDbQ3U+6vr67RYGodYlDZ/6PkJ4NOg/ar1vZKsWlH1CSjqtDiQbc8v/LqjFTuVccpXl+bKx42ddWvtZBe6abrWQLJYFMEi5Jdmwdka5SgxXxMDfNHdx9F//wEP4jMURCp5e6Prz8KDzNkNSPwfqLmKEghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ4ZSDSz; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so87214085e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780410317; x=1781015117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+PxFt6TenvIiBvvlX6ydCTb944jXwb42NxW5IDMC8=;
        b=GJ4ZSDSz5A9PGreps2nPaKjBgRshh/EWnN4sNlk/H+/waRRAIJibpPOIsayJF0ZeYw
         4rG5H9vxn+npG9M5vUMksDzYUOJeQvq/97RMIRex95gN7xt4hpy+8vXSIMnlt/5NnP0g
         eiLGEN3IJaVSxnHN3DQWOhQyUkD5qerCx3QUEz7jwMHDCPQbBBKBYdP9q7esFkdW3nPc
         SrCCXzpyioT8kSN9hoFQ3KsjJCpGhDfZQ6z7wZRaEBvlFb1sA6VaRopVfT/NPNPU5FF0
         vc5O+zeCaLxong4tlHDdFtXogEM7fSYxKH9Ax8D0Fjesd96z/8EwuyHd1rWIWT4dZq0q
         CLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410317; x=1781015117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+PxFt6TenvIiBvvlX6ydCTb944jXwb42NxW5IDMC8=;
        b=MFyGMJS5090okyevnZ3AjSP6mu8RU3nnezW6iXSLN6DHXn9iIpNO9Ec1gBxaexmnaw
         geXpQaUPzZoZwWJzaNhNgK03w0j5rYbzrHVuv/sCoqymcx7szOVhcymH+zG2+MnI3nKl
         UAjUlecRXuiBTCgVfUUF3UfavZD48NS071zoj/SsVKtT1xF+96tMn4Ss3fHhxni/JRs3
         ovTdj/O6NMD8RyIpPEf05WVpPKwpsfqVBEwCOfxWmClTGzUu0LHR/HNDEP7ZVnYCAa8C
         k4+SXrtQT65tVDBsl1+5G75jpFYR63u0BBTJ9x2eeVH7lfou+xxg7GRGGcBbxLQBgMxl
         4xrg==
X-Gm-Message-State: AOJu0YzpbF33ubXFtsubhWnishtbVohpwmkhfVmLAT2XzQvSE7gwRf2z
	h99VbcI7whSh0wYdAJVUFr9AATk/UmVw3BNJDVWjjtRXOdJs/FjbYE4Lh9v28w==
X-Gm-Gg: Acq92OHieW+FDem535/OrWDq8p73HusQURW5RWHYznfThM1S3pY8S3xbNfvGq1GWdxw
	FR36o32g5rG0fQEtKhlCp6Y56XRr8HjbxcOCpgIj0BIYD+Y6IEhv3MpZsNcgA5T4eakFa7RK7Db
	qPhF/TkgiBvI1GXL6Re5+3/2TX99BnEhYsXH7RmbAEUuaLjkFWn7IsWmRQRHnK7iIZkRbjdZj4x
	ujRM6VJotrD5GWIBrQJrHDW0E8h5u0K/XfO7azkJX6TSC1UZiLxRqfZ9K4KfsF6M2clvzr9yp6A
	qj6/qu5I1+JfW/cpvkleZPWxgNKWc6+Vw5SKxE1TmsKgQ+sjkuYIDL8TkLOcoBI+J3q/LCPvWy1
	b1IlA5+CNQWd4KrXscNprHS3Slv8HhD9xpWfqrGHStX8oi+00f7HCMElLwiVPDHAYtIQgmotD7Y
	G8H4h+BcEcOSz/kkB0v08wXPatckMxcJkpTj/G0HCZLbTrG6FkAgZXdsNM/4RtBjNbuvrT311KY
	sdXz+4x
X-Received: by 2002:a05:600c:1988:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-490a2950c9emr284065255e9.26.1780410316890;
        Tue, 02 Jun 2026 07:25:16 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e37851sm74750405e9.13.2026.06.02.07.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:25:16 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	tglx@kernel.org,
	grant.likely@secretlab.ca,
	anna-maria@linutronix.de,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: mt7621: fix interrupt banks mapping on gpio chips
Date: Tue,  2 Jun 2026 16:25:13 +0200
Message-ID: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37821-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB84662F553

The GPIO controller's registers are organized as sets of eight 32-bit
registers with each set controlling a bank of up to 32 pins. A single
interrupt is shared for all of the banks handled by the controller.
The driver implements this using three gpio chip instances every one
with its own irq chip. Every single pin can generate interrupts having
a total of 96 possible interrupts here. It looks like there is a problem
with interrupts being properly mapped to the gpio bank using this solution.
This problem report is in the following lore's link [0].

Device tree is using two cells for this, so only the interrupt pin and the
interrupt type are described there. Changing to have three cells to setup
also the bank and implement 'of_node_instance_match()' would also work but
this would be an ABI breakage and also a bit incoherent since gpios itself
are also using two cells and properly mapped in desired bank using through
its pin number on 'of_xlate()'.

That said, register a linear IRQ domain of the total of 96 interrupts shared
with the three gpio chip instances so the bank and the interrupt is properly
decoded and devices using gpio IRQs properly work.

[0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u

Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
Co-developed-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes in v2:
- Use imperative tone on commit message when talking about solution.
- Add missing 'mt7621_gpio_remove()' call on driver's remove path.

 drivers/gpio/gpio-mt7621.c | 282 ++++++++++++++++++++++++++++---------
 1 file changed, 214 insertions(+), 68 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 91230be51587..c36aa0abd0c6 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -29,8 +29,8 @@
 #define GPIO_REG_EDGE		0xA0
 
 struct mtk_gc {
-	struct irq_chip irq_chip;
 	struct gpio_generic_chip chip;
+	struct mtk *parent_priv;
 	int bank;
 	u32 rising;
 	u32 falling;
@@ -41,20 +41,32 @@ struct mtk_gc {
 /**
  * struct mtk - state container for
  * data of the platform driver. It is 3
- * separate gpio-chip each one with its
- * own irq_chip.
- * @dev: device instance
+ * separate gpio-chip having an IRQ
+ * linear domain shared for all of them
+ * @pdev: platform device instance
  * @base: memory base address
+ * @irq_domain: IRQ linear domain shared across the three gpio chips
  * @gpio_irq: irq number from the device tree
+ * @num_gpios: total number of gpio pins on the three gpio chips
  * @gc_map: array of the gpio chips
  */
 struct mtk {
-	struct device *dev;
+	struct platform_device *pdev;
 	void __iomem *base;
+	struct irq_domain *irq_domain;
 	int gpio_irq;
+	int num_gpios;
 	struct mtk_gc gc_map[MTK_BANK_CNT];
 };
 
+static inline struct mtk *
+mt7621_gpio_gc_to_priv(struct gpio_chip *gc)
+{
+	struct mtk_gc *bank = gpiochip_get_data(gc);
+
+	return bank->parent_priv;
+}
+
 static inline struct mtk_gc *
 to_mediatek_gpio(struct gpio_chip *chip)
 {
@@ -67,7 +79,7 @@ static inline void
 mtk_gpio_w32(struct mtk_gc *rg, u32 offset, u32 val)
 {
 	struct gpio_chip *gc = &rg->chip.gc;
-	struct mtk *mtk = gpiochip_get_data(gc);
+	struct mtk *mtk = mt7621_gpio_gc_to_priv(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
 	gpio_generic_write_reg(&rg->chip, mtk->base + offset, val);
@@ -77,60 +89,79 @@ static inline u32
 mtk_gpio_r32(struct mtk_gc *rg, u32 offset)
 {
 	struct gpio_chip *gc = &rg->chip.gc;
-	struct mtk *mtk = gpiochip_get_data(gc);
+	struct mtk *mtk = mt7621_gpio_gc_to_priv(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
 	return gpio_generic_read_reg(&rg->chip, mtk->base + offset);
 }
 
-static irqreturn_t
-mediatek_gpio_irq_handler(int irq, void *data)
+static void
+mt7621_gpio_irq_bank_handler(struct mtk_gc *bank)
 {
-	struct gpio_chip *gc = data;
-	struct mtk_gc *rg = to_mediatek_gpio(gc);
-	irqreturn_t ret = IRQ_NONE;
+	struct mtk *priv = bank->parent_priv;
+	struct irq_domain *domain = priv->irq_domain;
+	int hwbase = bank->chip.gc.offset;
 	unsigned long pending;
-	int bit;
+	unsigned int offset;
+
+	pending = mtk_gpio_r32(bank, GPIO_REG_STAT);
+	if (!pending)
+		return;
+
+	mtk_gpio_w32(bank, GPIO_REG_STAT, pending);
+
+	for_each_set_bit(offset, &pending, MTK_BANK_WIDTH)
+		generic_handle_domain_irq(domain, hwbase + offset);
+}
+
+static void
+mt7621_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct mtk *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	int i;
 
-	pending = mtk_gpio_r32(rg, GPIO_REG_STAT);
+	chained_irq_enter(chip, desc);
+	for (i = 0; i < MTK_BANK_CNT; i++) {
+		struct mtk_gc *bank = &priv->gc_map[i];
 
-	for_each_set_bit(bit, &pending, MTK_BANK_WIDTH) {
-		generic_handle_domain_irq(gc->irq.domain, bit);
-		mtk_gpio_w32(rg, GPIO_REG_STAT, BIT(bit));
-		ret |= IRQ_HANDLED;
+		mt7621_gpio_irq_bank_handler(bank);
 	}
+	chained_irq_exit(chip, desc);
+}
 
-	return ret;
+static int
+mt7621_gpio_hwirq_to_offset(irq_hw_number_t hwirq, struct mtk_gc *bank)
+{
+	return hwirq - bank->chip.gc.offset;
 }
 
 static void
 mediatek_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct mtk_gc *rg = to_mediatek_gpio(gc);
-	int pin = d->hwirq;
+	struct mtk_gc *rg = gpiochip_get_data(gc);
+	u32 mask = mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
 	u32 rise, fall, high, low;
 
-	gpiochip_enable_irq(gc, d->hwirq);
-
 	guard(gpio_generic_lock_irqsave)(&rg->chip);
 
 	rise = mtk_gpio_r32(rg, GPIO_REG_REDGE);
 	fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
 	high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
 	low = mtk_gpio_r32(rg, GPIO_REG_LLVL);
-	mtk_gpio_w32(rg, GPIO_REG_REDGE, rise | (BIT(pin) & rg->rising));
-	mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall | (BIT(pin) & rg->falling));
-	mtk_gpio_w32(rg, GPIO_REG_HLVL, high | (BIT(pin) & rg->hlevel));
-	mtk_gpio_w32(rg, GPIO_REG_LLVL, low | (BIT(pin) & rg->llevel));
+	mtk_gpio_w32(rg, GPIO_REG_REDGE, rise | (BIT(mask) & rg->rising));
+	mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall | (BIT(mask) & rg->falling));
+	mtk_gpio_w32(rg, GPIO_REG_HLVL, high | (BIT(mask) & rg->hlevel));
+	mtk_gpio_w32(rg, GPIO_REG_LLVL, low | (BIT(mask) & rg->llevel));
 }
 
 static void
 mediatek_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct mtk_gc *rg = to_mediatek_gpio(gc);
-	int pin = d->hwirq;
+	struct mtk_gc *rg = gpiochip_get_data(gc);
+	u32 mask = mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
 	u32 rise, fall, high, low;
 
 	scoped_guard(gpio_generic_lock_irqsave, &rg->chip) {
@@ -138,22 +169,19 @@ mediatek_gpio_irq_mask(struct irq_data *d)
 		fall = mtk_gpio_r32(rg, GPIO_REG_FEDGE);
 		high = mtk_gpio_r32(rg, GPIO_REG_HLVL);
 		low = mtk_gpio_r32(rg, GPIO_REG_LLVL);
-		mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~BIT(pin));
-		mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~BIT(pin));
-		mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(pin));
-		mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(pin));
+		mtk_gpio_w32(rg, GPIO_REG_FEDGE, fall & ~BIT(mask));
+		mtk_gpio_w32(rg, GPIO_REG_REDGE, rise & ~BIT(mask));
+		mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(mask));
+		mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(mask));
 	}
-
-	gpiochip_disable_irq(gc, d->hwirq);
 }
 
 static int
 mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct mtk_gc *rg = to_mediatek_gpio(gc);
-	int pin = d->hwirq;
-	u32 mask = BIT(pin);
+	struct mtk_gc *rg = gpiochip_get_data(gc);
+	u32 mask = BIT(mt7621_gpio_hwirq_to_offset(d->hwirq, rg));
 
 	if (type == IRQ_TYPE_PROBE) {
 		if ((rg->rising | rg->falling |
@@ -190,6 +218,26 @@ mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+static int
+mt7621_gpio_irq_reqres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct mtk_gc *rg = gpiochip_get_data(gc);
+	unsigned int irq = mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
+
+	return gpiochip_reqres_irq(gc, irq);
+}
+
+static void
+mt7621_gpio_irq_relres(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct mtk_gc *rg = gpiochip_get_data(gc);
+	unsigned int irq = mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
+
+	gpiochip_relres_irq(gc, irq);
+}
+
 static int
 mediatek_gpio_xlate(struct gpio_chip *chip,
 		    const struct of_phandle_args *spec, u32 *flags)
@@ -208,14 +256,123 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 
 static const struct irq_chip mt7621_irq_chip = {
 	.name		= "mt7621-gpio",
+	.irq_request_resources = mt7621_gpio_irq_reqres,
+	.irq_release_resources = mt7621_gpio_irq_relres,
 	.irq_mask_ack	= mediatek_gpio_irq_mask,
 	.irq_mask	= mediatek_gpio_irq_mask,
 	.irq_unmask	= mediatek_gpio_irq_unmask,
 	.irq_set_type	= mediatek_gpio_irq_type,
 	.flags		= IRQCHIP_IMMUTABLE,
-	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static void
+mt7621_gpio_remove(struct platform_device *pdev)
+{
+	struct mtk *priv = platform_get_drvdata(pdev);
+	int offset, virq;
+
+	if (priv->gpio_irq > 0)
+		irq_set_chained_handler_and_data(priv->gpio_irq, NULL, NULL);
+
+	/* Remove all IRQ mappings and delete the domain */
+	if (priv->irq_domain) {
+		for (offset = 0; offset < priv->num_gpios; offset++) {
+			virq = irq_find_mapping(priv->irq_domain, offset);
+			irq_dispose_mapping(virq);
+		}
+		irq_domain_remove(priv->irq_domain);
+	}
+}
+
+static struct mtk_gc *
+mt7621_gpio_hwirq_to_bank(struct mtk *priv, irq_hw_number_t hwirq)
+{
+	int i;
+
+	for (i = 0; i < MTK_BANK_CNT; i++) {
+		struct mtk_gc *bank = &priv->gc_map[i];
+
+		if (hwirq >= bank->chip.gc.offset &&
+		    hwirq < (bank->chip.gc.offset + bank->chip.gc.ngpio))
+			return bank;
+	}
+
+	return NULL;
+}
+
+static int
+mt7621_gpio_irq_map(struct irq_domain *d, unsigned int irq,
+		    irq_hw_number_t hwirq)
+{
+	struct mtk *priv = d->host_data;
+	struct mtk_gc *bank = mt7621_gpio_hwirq_to_bank(priv, hwirq);
+	struct platform_device *pdev = priv->pdev;
+	int ret;
+
+	if (!bank)
+		return -EINVAL;
+
+	dev_dbg(&pdev->dev, "Mapping irq %d for gpio line %d (bank %d)\n",
+		irq, (int)hwirq, bank->bank);
+
+	ret = irq_set_chip_data(irq, &bank->chip.gc);
+	if (ret < 0)
+		return ret;
+
+	irq_set_chip_and_handler(irq, &mt7621_irq_chip, handle_simple_irq);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static void
+mt7621_gpio_irq_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops mt7621_gpio_irq_domain_ops = {
+	.map = mt7621_gpio_irq_map,
+	.unmap = mt7621_gpio_irq_unmap,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static int
+mt7621_gpio_irq_setup(struct platform_device *pdev,
+		      struct mtk *priv)
+{
+	struct device *dev = &pdev->dev;
+
+	priv->irq_domain = irq_domain_create_linear(dev_fwnode(dev),
+						    priv->num_gpios,
+						    &mt7621_gpio_irq_domain_ops,
+						    priv);
+	if (!priv->irq_domain) {
+		dev_err(dev, "Couldn't allocate IRQ domain\n");
+		return -ENXIO;
+	}
+
+	irq_set_chained_handler_and_data(priv->gpio_irq,
+					 mt7621_gpio_irq_handler, priv);
+	irq_set_status_flags(priv->gpio_irq, IRQ_DISABLE_UNLAZY);
+
+	return 0;
+}
+
+static int
+mt7621_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct mtk *priv = mt7621_gpio_gc_to_priv(gc);
+	/* gc_offset is relative to this gpio_chip; want real offset */
+	int hwirq = offset + gc->offset;
+
+	if (hwirq >= priv->num_gpios)
+		return -ENXIO;
+
+	return irq_create_mapping(priv->irq_domain, hwirq);
+}
+
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
@@ -228,6 +385,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	rg = &mtk->gc_map[bank];
 	memset(rg, 0, sizeof(*rg));
 
+	rg->parent_priv = mtk;
 	rg->bank = bank;
 
 	dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
@@ -253,41 +411,17 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 
 	rg->chip.gc.of_gpio_n_cells = 2;
 	rg->chip.gc.of_xlate = mediatek_gpio_xlate;
+	rg->chip.gc.ngpio = MTK_BANK_WIDTH;
 	rg->chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
 					dev_name(dev), bank);
 	if (!rg->chip.gc.label)
 		return -ENOMEM;
 
 	rg->chip.gc.offset = bank * MTK_BANK_WIDTH;
+	if (mtk->gpio_irq > 0)
+		rg->chip.gc.to_irq = mt7621_gpio_to_irq;
 
-	if (mtk->gpio_irq) {
-		struct gpio_irq_chip *girq;
-
-		/*
-		 * Directly request the irq here instead of passing
-		 * a flow-handler because the irq is shared.
-		 */
-		ret = devm_request_irq(dev, mtk->gpio_irq,
-				       mediatek_gpio_irq_handler, IRQF_SHARED,
-				       rg->chip.gc.label, &rg->chip.gc);
-
-		if (ret) {
-			dev_err(dev, "Error requesting IRQ %d: %d\n",
-				mtk->gpio_irq, ret);
-			return ret;
-		}
-
-		girq = &rg->chip.gc.irq;
-		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
-		/* This will let us handle the parent IRQ in the driver */
-		girq->parent_handler = NULL;
-		girq->num_parents = 0;
-		girq->parents = NULL;
-		girq->default_type = IRQ_TYPE_NONE;
-		girq->handler = handle_simple_irq;
-	}
-
-	ret = devm_gpiochip_add_data(dev, &rg->chip.gc, mtk);
+	ret = devm_gpiochip_add_data(dev, &rg->chip.gc, rg);
 	if (ret < 0) {
 		dev_err(dev, "Could not register gpio %d, ret=%d\n",
 			rg->chip.gc.ngpio, ret);
@@ -322,7 +456,8 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (mtk->gpio_irq < 0)
 		return mtk->gpio_irq;
 
-	mtk->dev = dev;
+	mtk->pdev = pdev;
+	mtk->num_gpios = MTK_BANK_WIDTH * MTK_BANK_CNT;
 	platform_set_drvdata(pdev, mtk);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
@@ -331,7 +466,17 @@ mediatek_gpio_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (mtk->gpio_irq > 0) {
+		ret = mt7621_gpio_irq_setup(pdev, mtk);
+		if (ret)
+			goto fail;
+	}
+
 	return 0;
+
+fail:
+	mt7621_gpio_remove(pdev);
+	return ret;
 }
 
 static const struct of_device_id mediatek_gpio_match[] = {
@@ -342,6 +487,7 @@ MODULE_DEVICE_TABLE(of, mediatek_gpio_match);
 
 static struct platform_driver mediatek_gpio_driver = {
 	.probe = mediatek_gpio_probe,
+	.remove = mt7621_gpio_remove,
 	.driver = {
 		.name = "mt7621_gpio",
 		.of_match_table = mediatek_gpio_match,
-- 
2.43.0


