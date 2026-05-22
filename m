Return-Path: <linux-gpio+bounces-37317-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIlKOPsGEGqLSQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37317-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:34:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494315B0086
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBC74304D7F2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 07:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CAC390608;
	Fri, 22 May 2026 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/WHGuGo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FDC3905EF
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 07:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434953; cv=none; b=b6PFEP8jD4kpoPXqGSZaaOXQIDKOeo3WdYCvAG3N+smUZeWx/PviNPhBg5dZicjMBYnQsSqC5Ey3tT7AZMaabmBFBcdFGpIHibblGgvVp1eEdpeTIrb+wIacLmuPJbivUOoWtbTBW3365AxFrEstyk52fRBYIS7Eu+7Btq5e6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434953; c=relaxed/simple;
	bh=RGDVCkuX8L2jKRbDFlSgCZRa2aETj6u0TaeHrVW0G/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0qEcuBC3myq/GnHBHVjXPGMZDM5FlHMarAvzFMKBHYzRRK58wZYRrvc3Fnp9iJVZnGLeaebSZEUpmPbDMuV5/gmXVphnLriI+tLwpjI4F/1+7NKMcV7IFIqntlHv5QrUchnu7Rad8knH/vwNvi34C0ush2nPIzZrw/MVt2MlLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/WHGuGo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-449de065cb3so6572771f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779434950; x=1780039750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP5HGEG7RkqBfIWelZAQ4wNFPRPuiwlQ3GodP84F42g=;
        b=e/WHGuGoIdOE6tz4gpzYPxrmTWb8cVq3d2q/vqP1oaPsgzDPyDNpLulmV1CuvNScm2
         CBce2JoiCnUpq8B4bIChWjDCtQSt0o1wR4dbCOFnIe5l6gWDwoIqnxGqWt6ES6XkIlwt
         AjCuDrx/VfD3OJCIGi8mMRBWihcwy1H6suU51Bxwn2qdmVaW3SNfrE4PBle14zwtegvw
         3L42bg+Ley+IzHJBxJrqJCS3dvTgyHIpFm94VGLDP8lrhgl3ELyZCRs2lXNHsh557PsN
         2IC85As2mzDD6qbudu0rjkJKEuQeyLMW1OX8k2tGtDjixnN4rF5zcqyR6kpQxNChWikL
         nEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434950; x=1780039750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZP5HGEG7RkqBfIWelZAQ4wNFPRPuiwlQ3GodP84F42g=;
        b=UjKFj8bsFGs+OaeXbC9ruR8xOPbPfTohH3yVwP+m2bI/SqyxPlo9pGlX1l+IeVbPR5
         qJReExyPd5nG5xSJ7V0HTxcTKWjNsEEO3Mttu8UnsS3+4aOd1UXshIbXbkmvTh979Do9
         kxIlzUIQ9Uo7v9ybTVVF0PhBLKvHw1/XdaSmfNNj5aatAzkK5oImvt7/7ae6qUGsiR3V
         DTpSgdRgS2/HDyQBcDRDF0vaxao9aKRVh1a1wedpBP6xWqYi8rC0wk2/0DyuGf2DZvQb
         wCsL/1k+saMu8tBNTE0TUyOcXw4rZeWuTP9Vfm5GBthdY7ferMA4ED5OWCcGeX9pMc9q
         9mCg==
X-Gm-Message-State: AOJu0YyaPqZwP9bzvYNmBZlHkAHHDEcVrJaLaEJ4RmlhRxEn2ofJSrxO
	SncPmqGDoUtw2iYJpNS1XThegwfxba/NSBAJZ7Fo/KZGvIgqby2lWt1WEqTsCg==
X-Gm-Gg: Acq92OFw7aKpOh4yI8i/7cR6J5Xd03ghyL8j9wnN6HB9YQTNIuVMFhrqBTFTJ5ZbZ8o
	+Vsx6KyTM5T1GW2E3KJhEZt14o3l3jOoVbiHHKahHuDTbAZc2o4FVGCnJRX+NbypycxveB7xDD4
	T3diWY5fFcO+Gr8pZGTWRWW3vxICkHEV/wJFT/aLuC+nEoDq7fyr1nsG9pW1Sguyz+NAPMjHs1h
	bc+bljeAApS1kDSHQ0R6RGkYcaw8quuPI2Em01IQJKgcvrpTR3Xy9xESE61ybT+tKGWF6yD+eJV
	lSklGgaMeKN5rBIqpam5o+8VfdPzhegdxdbjaLUE53RfhgtzMWk3imAaPTTa/vqCgU840xmykOk
	ZMALeLqLwDC7yoC5WA7qTtJCW5xSt7XZi3hIDLUnkGNvA3X++cLjqQfZI6qxcP2RJrgLmDLlzPU
	Xcckf9I6xu5rEoQh9cvCllWByD7ItLoZGPfynTQ7cqWzi6aiJBwZvnvwGULkNvFUtxrcq8cQ==
X-Received: by 2002:a5d:64c2:0:b0:43d:7868:21f0 with SMTP id ffacd0b85a97d-45eb3670591mr2944276f8f.9.1779434949527;
        Fri, 22 May 2026 00:29:09 -0700 (PDT)
Received: from camaron.. (147.red-88-9-50.dynamicip.rima-tde.net. [88.9.50.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm1699970f8f.25.2026.05.22.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:29:07 -0700 (PDT)
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	brgl@kernel.org,
	tglx@kernel.org,
	grant.likely@secretlab.ca,
	anna-maria@linutronix.de,
	vicencb@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] gpio: mt7621: fix interrupt banks mapping on gpio chips
Date: Fri, 22 May 2026 09:29:04 +0200
Message-ID: <20260522072904.2028774-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAMhs-H-dHfQeMxmQYOpVS-tnj++nX5_mNKcu1xot3SQETyh4Xg@mail.gmail.com>
References: <CAMhs-H-dHfQeMxmQYOpVS-tnj++nX5_mNKcu1xot3SQETyh4Xg@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37317-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 494315B0086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Regarding the issue reported by Vicente[0], we have been trying different
things and we are still having issues to make this work. I have noticed
that the gpio-brcmstb is similar to our use case sharing one interrupt
for all the banks and also using gpio chips instances with 32 pins each.
That said, I tried to setup mt7621 driver in the same way as you can see 
on the following proposed code. With these changes, we are able to make
properly working the previous problem with the touchscreen that was
registered on bank 2 instead of bank 0. Now it is properly registered
on bank 0 and interrupts works perfect and the device is properly
working. However, every single gpio-keys fail to claim the IRQ HW as
follows:

mt7621_gpio 10000600.gpio: Mapping irq 41 for gpio line 38 (bank 1)
gpio gpiochip1: (10000600.gpio-bank1): unable to lock HW IRQ 38 for IRQ
genirq: Failed to request resources for S3 (irq 41) on irqchip mt7621-gpio
gpio-keys keys: error -EINVAL: request_irq(41) gpio_keys_gpio_isr 0x0 S3
gpio-keys keys: Unable to claim irq 41; error -22
gpio-keys keys: probe with driver gpio-keys failed with error -22

So IIUC the kernel is saying that the gpio chip is not IRQ-capable somehow.

Once I touch the irq field just setting up the irq_chip_ops on gpio chip to bypass 
this issue: 

gpio_irq_chip_set_chip(&rg->chip.gc.irq, &mt7621_irq_chip);

the kernel stops calling our custom to_irq callback and calls gpiochip_to_irq
callback instead and also warning as follows:

gpio gpiochip0: (10000600.gpio-bank0): to_irq is redefined in
gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
gpio gpiochip1: (10000600.gpio-bank1): to_irq is redefined in
gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it
gpio gpiochip2: (10000600.gpio-bank2): to_irq is redefined in
gpiochip_irqchip_add_allocated_domain and you shouldn't rely on it

This register gpio-keys and now are shown on /proc/interrupts but they
are not working (touchscreen still works, don't really understand why):

$ cat /proc/interrupts
40: 10 mt7621-gpio  0  ft6236
41:  0 mt7621-gpio  6  S3
42:  0 mt7621-gpio  7  S2
43:  0 mt7621-gpio 22  S1

I have tried also to get rid of custom to_irq compiling kernel with
IRQ_DOMAIN_HIERARCHY and setting up the followings as replacement of
custom to_irq:

static int
mt7621_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
                                 unsigned int hwirq,
                                 unsigned int type,
                                 unsigned int *parent_hwirq,
                                 unsigned int *parent_type)
{
       *parent_hwirq = gc->irq.child_offset_to_irq(gc, hwirq);
       *parent_type = type;
    
       return 0;
}

static unsigned int
mt7621_gpio_child_offset_to_irq(struct gpio_chip *gc, unsigned int offset)
{
       return gc->offset + offset;
}

rg->chip.gc.irq.child_to_parent_hwirq = mt7621_gpio_child_to_parent_hwirq;
rg->chip.gc.irq.child_offset_to_irq = mt7621_gpio_child_offset_to_irq;

This return us to the original scenario where touchscreen is mapped in the
wrong bank 2 instead of bank 0...

Also tried to setup domain for every single gpio chip using Linus previous
suggestion gpiochip_irqchip_add_domain() but ended up in kernel complaning
also for IRQ HQ lock and getting a kernel panic:

kernel panic "Unhandled kernel unaligned access[#1]")

I am totally lost now. Can you point me out in the right way to make everything
working?

Thanks a lot in advance.

Best regards,
    Sergio Paracuellos

[0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 91230be51587..353dc56411eb 100644
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
@@ -43,18 +43,27 @@ struct mtk_gc {
  * data of the platform driver. It is 3
  * separate gpio-chip each one with its
  * own irq_chip.
- * @dev: device instance
+ * @pdev: platform device instance
  * @base: memory base address
  * @gpio_irq: irq number from the device tree
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
+	return bank->parent_priv;
+}
+
 static inline struct mtk_gc *
 to_mediatek_gpio(struct gpio_chip *chip)
 {
@@ -67,7 +76,7 @@ static inline void
 mtk_gpio_w32(struct mtk_gc *rg, u32 offset, u32 val)
 {
 	struct gpio_chip *gc = &rg->chip.gc;
-	struct mtk *mtk = gpiochip_get_data(gc);
+	struct mtk *mtk = mt7621_gpio_gc_to_priv(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
 	gpio_generic_write_reg(&rg->chip, mtk->base + offset, val);
@@ -77,60 +86,79 @@ static inline u32
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
@@ -138,22 +166,19 @@ mediatek_gpio_irq_mask(struct irq_data *d)
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
@@ -216,10 +241,124 @@ static const struct irq_chip mt7621_irq_chip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static void mt7621_gpio_remove(struct platform_device *pdev)
+{
+	struct mtk *priv = platform_get_drvdata(pdev);
+	int i, offset, virq;
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
+
+	for (i = 0; i < MTK_BANK_CNT; i++) {
+		struct mtk_gc *bank = &priv->gc_map[i];
+
+		gpiochip_remove(&bank->chip.gc);
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
 static int
-mediatek_gpio_bank_probe(struct device *dev, int bank)
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
+static int
+mediatek_gpio_bank_probe(struct platform_device *pdev, int bank)
 {
 	struct gpio_generic_chip_config config;
+	struct device *dev = &pdev->dev;
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
 	void __iomem *dat, *set, *ctrl, *diro;
@@ -228,6 +367,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	rg = &mtk->gc_map[bank];
 	memset(rg, 0, sizeof(*rg));
 
+	rg->parent_priv = mtk;
 	rg->bank = bank;
 
 	dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
@@ -253,47 +393,25 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 
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
 		return ret;
 	}
 
+	mtk->num_gpios += rg->chip.gc.ngpio;
+
 	/* set polarity to low for all gpios */
 	mtk_gpio_w32(rg, GPIO_REG_POL, 0);
 
@@ -322,16 +440,26 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (mtk->gpio_irq < 0)
 		return mtk->gpio_irq;
 
-	mtk->dev = dev;
+	mtk->pdev = pdev;
 	platform_set_drvdata(pdev, mtk);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
-		ret = mediatek_gpio_bank_probe(dev, i);
+		ret = mediatek_gpio_bank_probe(pdev, i);
 		if (ret)
-			return ret;
+			goto fail;
+	}
+
+	if (mtk->gpio_irq > 0) {
+		ret = mt7621_gpio_irq_setup(pdev, mtk);
+		if (ret)
+			goto fail;
 	}
 
 	return 0;
+
+fail:
+	(void)mt7621_gpio_remove(pdev);
+	return ret;
 }
 
 static const struct of_device_id mediatek_gpio_match[] = {

