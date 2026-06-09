Return-Path: <linux-gpio+bounces-38141-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UNI+MXmEJ2rkyQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38141-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 05:11:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832F65BFE2
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 05:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eGfRI6w5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38141-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38141-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38AD33088152
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 03:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAFD3644CB;
	Tue,  9 Jun 2026 03:11:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D63655CC
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 03:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974687; cv=none; b=o3SYeBqqVaQCv+0NiYbweVxv0OAb5+LTjl7EwEYPXm93bIdtp4y3XCWZWLeGeFmjvKhji666mejas8nnQ8cybck/MwdHFYohvPuWL2Y62p07Y1y3YNmVPegiLbaB97sR9hM/7AYjLsDQ0TOUGtnp5/jnFPO/lAWdYgARBivH7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974687; c=relaxed/simple;
	bh=g7+DUKM5vFWgzlOgHYZieR2S5TbIS8cALypXSkx7Ibw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fwLagwsLTfEMyznFiAHLY4OllxGeJQ0BSUccizQct+OLcgTTMo+r8XVryFZfXMrYzzaFHk/b0/oNoX3NFZwGWV2fPN3+MtMhQbM10rbuTxIsqdfSvS7DnJ+UqJpzac4QTvvep7mqYG4hlF9quTeR0nnqX+UHgSWyuPvWWBEwauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGfRI6w5; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490be03d47bso42398355e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 20:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780974684; x=1781579484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+IbEKoGgDdXtr7lt/KFupAQeSXicrVyIOdVx6P9Yrg=;
        b=eGfRI6w5SPYaOZLEQxHYi3jjs9Si2d8EDo0BSHlGdnZmqs8rDPg5Z64MupQXw4wBDX
         hNF2nSnydzcFA2og50QgrzCqdV4I+1E4hCH9raiBnZmqwX5WfswHkdTs9sMYfhUI9GFU
         rUCi+Y31mp9UFvRNcRSXr2jiA+Br/d82vm8+iqfbaCLk10adpfpUP/zyf6UFq8amBPoa
         7GJXuZsqHXQOwnYrh/YfGYDllEA+HbYdhczd3td6KSImjU3u6LjEVmZES1b00CsjxJb7
         Dpkj308MRV9PWpfgqAW9vCOhc0pudvPW9ci/qQrG+AZFNfpFSBo59oU74voddIzhJa8u
         0RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780974684; x=1781579484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+IbEKoGgDdXtr7lt/KFupAQeSXicrVyIOdVx6P9Yrg=;
        b=cVd3ZJl0pa4IpcODvwIve77UFcSsTRNNfs5ebOwKaGilcE30D6zOys2n9rN/a7KmRi
         mnarZyflfpQhAupb7AAnc3v4kVGpozLFZ8YQGP9r01SkJHi9J5zB1sHrHG+Hyf5Tqhsf
         qKWPHUofjL8CyUS72K9FC1Fh9BqiisY3GfzxYuhbFovjtkm037zDd2+sWDTuDRabEqkN
         i8F3935ZpA0GkzA+DxpS13QjNC6RPcyI3WgVV/6D8i4FraKHRGGMDoUUHLqK5FHYl9Ls
         VExiqOjJzqRPZCINn2S98dXkEcLVIe3fCn7/1tm2eg3KmeeY9XLq1drxHZ/tc6EY3EeA
         rPpQ==
X-Gm-Message-State: AOJu0Yx54gWNWooJUZkzZNTXaIY+pafGO6xuEvcT+ezQqVnDmVDd+dd9
	gXSNV52XGv2m+X3IJF3jce2ySVSpKy6FEnvFPAUfS8Doq0Alds+HUUGAZTu9HQ==
X-Gm-Gg: Acq92OGK4jrcDyLOb/C9Il9UPaTdQTKGxQMbzUAcpk6vvDd7R2WqY8D0n531S7nUnQz
	xR0/8C/1XeC3PvKCETWPXqHyq50fcZKcdHzWF11T/phlVm5TwUWY4ZAPTARPQtJ9gB2CwhniW+C
	Q5tQNaxpQpjRv/SBvLELW7GkLkmYO9XJP39jDQl9CLhiY4gUqFwTQyNO/Ft16UBzsNfb61FEPgj
	nY8gfRVKqJjbSgeFLh65XGxO0Aiasst/kYlUgj0VORDMu5SwMPMq7GiDiXHlYrCYKh00jaZK4m+
	efSJZRVi9srXJuYyNrMLoD3BLIWhD51yZq6YuMnsz9t8B25XZ9yddeLu1KDiQ1tDGBGBlHDBfHH
	6msqRJe1ZnjUWkGphyvMdM0E0DZuU6M2cu6teAbzxSiHU6dYxKBLdWtRZgY0cfVA5f0CYabEUGC
	Dgrk+LYxTW8cIuD1T6X66v/LduWXfCBi+jGscUkLcXEZyYHrlDMCIfn7AoDR8N56ldNns6yOKBz
	igVgCez
X-Received: by 2002:a05:600c:8705:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-490c25898efmr359741905e9.5.1780974683993;
        Mon, 08 Jun 2026 20:11:23 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3918d7sm412152125e9.2.2026.06.08.20.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 20:11:23 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	tglx@kernel.org,
	grant.likely@secretlab.ca,
	anna-maria@linutronix.de,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpio: mt7621: fix interrupt banks mapping on gpio chips
Date: Tue,  9 Jun 2026 05:11:18 +0200
Message-ID: <20260609031118.2275735-1-sergio.paracuellos@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38141-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3832F65BFE2

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
Changes in v3:
 - sashiko complains about the removal of gpiochip_enable_irq() and
   gpiochip_disable_irq() calls on mask and unmask callbacks.
   The core gpiolib relies on the FLAG_IRQ_IS_ENABLED bit to prevent changing the
   direction of an actively unmasked IRQ line to output. Avoid the
   removal since sashiko is correct here.

Changes in v2:
 - Use imperative tone on commit message when talking about solution.
 - Add missing 'mt7621_gpio_remove()' call on driver's remove path.

 drivers/gpio/gpio-mt7621.c | 282 ++++++++++++++++++++++++++++---------
 1 file changed, 216 insertions(+), 66 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 91230be51587..a814885ccd5d 100644
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
@@ -77,41 +89,62 @@ static inline u32
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
+	gpiochip_enable_irq(gc, mask);
 
 	guard(gpio_generic_lock_irqsave)(&rg->chip);
 
@@ -119,18 +152,18 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
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
@@ -138,22 +171,21 @@ mediatek_gpio_irq_mask(struct irq_data *d)
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
 
-	gpiochip_disable_irq(gc, d->hwirq);
+	gpiochip_disable_irq(gc, mask);
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
@@ -190,6 +222,26 @@ mediatek_gpio_irq_type(struct irq_data *d, unsigned int type)
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
@@ -208,14 +260,123 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 
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
+};
+
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
 };
 
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
@@ -228,6 +389,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	rg = &mtk->gc_map[bank];
 	memset(rg, 0, sizeof(*rg));
 
+	rg->parent_priv = mtk;
 	rg->bank = bank;
 
 	dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
@@ -253,41 +415,17 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 
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
@@ -322,7 +460,8 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (mtk->gpio_irq < 0)
 		return mtk->gpio_irq;
 
-	mtk->dev = dev;
+	mtk->pdev = pdev;
+	mtk->num_gpios = MTK_BANK_WIDTH * MTK_BANK_CNT;
 	platform_set_drvdata(pdev, mtk);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
@@ -331,7 +470,17 @@ mediatek_gpio_probe(struct platform_device *pdev)
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
@@ -342,6 +491,7 @@ MODULE_DEVICE_TABLE(of, mediatek_gpio_match);
 
 static struct platform_driver mediatek_gpio_driver = {
 	.probe = mediatek_gpio_probe,
+	.remove = mt7621_gpio_remove,
 	.driver = {
 		.name = "mt7621_gpio",
 		.of_match_table = mediatek_gpio_match,
-- 
2.43.0


