Return-Path: <linux-gpio+bounces-37540-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPIVKBKfFWr9WgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37540-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 15:24:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FF95D6634
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 15:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9386930B2495
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 13:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0917B3FB06E;
	Tue, 26 May 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVInRglI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502F3D649F
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801170; cv=none; b=L40+K/vo2SlrOVQBymxq+506+h9VuYXuX4kjKaTFZQnGzlmvQLxZjgDn5tRLRWDFf8ibfHks+qTtNsKJqNKBYwlW8GqVihx153u2A05tjd3t7ez1mwrBm2ID+A6HlOttsx9NxzCQirf4pZ2s9VAQrgs+or1AJ7XxVQtWZnA/mRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801170; c=relaxed/simple;
	bh=PPzY0HEEEQfSuy9D2eZp/9Qr7WpXsOC4vkkICIm2PWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ALl1DPYk1OFIcYavf/6KVe1H9+WnFCXEql+bcgU8zgGQkVHw/6pnevbrg4mUXKClPfrZUUchYxqAp1JpUWOyvIW7gCskURRSYVJk1yHXcQtzNFFE4SYaDWmPB7n37dKVyZ3Hjo1fV6SZBv6d6pNSOYMqXZ2Ifu8adM9+7OBSG7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVInRglI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so111999845e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779801167; x=1780405967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8hGX3dpQh+KV9kQrv3tqoqAoq7bkj7LUvL0La9DGzQM=;
        b=KVInRglIIS9tANINZHzlQLWemX6wfeZkFSz87lWSfpH51D4DkUnEFsjsb54NpWsscb
         pPTM6QgxaRqzHl0pcvIQTA5UUMN4i8+z4ivQ3qwt1G1p1kkWo3kuWyAmGL4JJ2SSImma
         K071HOmqWoY1YucExTuPZa/iDsrM3Eidp+z0AaTAFNrOQddOKeedSGPTsZJVRpRClNRn
         axTu6qGuoyeIYs/tGpMS2ul0ZYXjcoxvpzdM6YWBK3A4D8Ldt+KdZmnQ/Z1vF3AXtKz+
         4aICkCi9f7YJSZz+o8j/reBoODPE5hiWPHvHq8puHwI0XONVZbIJGxK/jnSlnL+73rKD
         PXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801167; x=1780405967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hGX3dpQh+KV9kQrv3tqoqAoq7bkj7LUvL0La9DGzQM=;
        b=JHqGXOoExPRbF8sQUh+cLlhVFlUC7pRwFDKudal5dfAqSj2nOhpPo2/Y1daV5upLFw
         kDioQ0WK/nvRXHExSDdtZBUlO+qAHe5m1G0xawn7+V4qO4ktT7KbSdmiDrbwy/A7sTKF
         uzV6vlDHyihq+ObcmALvxBOrZyzn5bXvpTpEJ8FkjIfxDx+vuMBH0DhUuVdxWpx+CUKj
         TYH0NRZ+Jk32oO/ONmPGhtDTlOio3qtM9fWhrINPKe5jOqSsZjQYRTAfNbkfFFy7exEV
         Ttn9tKRF3Kv3orjI/0Fl9ZwXet5xwaD3+nAEPWL8MkJRZg5CEYGE6X50JePWmv145YE/
         FV9w==
X-Gm-Message-State: AOJu0YwC2QZLZbXSXZivOJZrbBu2qMeiR3enlHVcOZzI4ZKNwuVXSj2F
	ax///5AvfFf5mVD9VhCTT8m1eV5/a2Rnk5AHL/KvxeTsCKqeH2qSrmhwipKjpQ==
X-Gm-Gg: Acq92OEtaHvyi+QwFYGAOa2ZeIwXyrCrRpY4nIyryRaYMppoqQEypIGwBjqgLM5RoL4
	DVC8hD6U0emY4nLZjGqGpI/ElcBLVf6YIyB04TevVVbLbrJXvHFDY4pr0QZaPs6gX07lHvA1Jod
	53uD32r0r/gElOXO4+4ljwXD1t1oYAiz63pWfIZYAndw2wsF6mYIYh65EvWb09is/snT4lPa+OE
	hBCJDEtXWyr474J0X13r+ZOnLRd9b7KGCj8ojG/mIUm0nCtSCY7yz8PZ9XwgqPzV+KzKoBeG1R6
	3AxjdRcTVCvkWZ+9wigLzN2jEqJ0NJh3WmAjxbUWk/Gfic2x4vv2D+JCcaKaY81AxAKJcIx/VyN
	wb+43Um1/W12y27fSP3kEQqBYo8gDxHJpXd3gfNRXsHqzOZpED/mR801c3OqQ+K460X3fIIvDrv
	SYnhCunh1EY+kLZK4cvk0PBgCrBbUTdNJwo+ZbHkdFf+c+5m9tZ3vUHbAKGTTMBc8Cg3GUBw==
X-Received: by 2002:a05:600c:4591:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-49050c58215mr236241325e9.2.1779801166740;
        Tue, 26 May 2026 06:12:46 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm576780035e9.1.2026.05.26.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:12:46 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	tglx@kernel.org,
	grant.likely@secretlab.ca,
	anna-maria@linutronix.de,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: mt7621: fix interrupt banks mapping on gpio chips
Date: Tue, 26 May 2026 15:12:43 +0200
Message-ID: <20260526131243.2160348-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-37540-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 19FF95D6634
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

That said, the solution adopted here is registering register a linear IRQ
domain of the total of 96 interrupts shared with the three gpio chip instances
so the bank and the interrupt is properly decoded and devices using gpio
IRQs properly work.

[0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u

Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
Co-developed-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 281 ++++++++++++++++++++++++++++---------
 1 file changed, 213 insertions(+), 68 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 91230be51587..3ef10d6c4798 100644
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
-- 
2.43.0


