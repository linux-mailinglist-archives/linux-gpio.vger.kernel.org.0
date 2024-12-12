Return-Path: <linux-gpio+bounces-13815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7529EE872
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF6C8167855
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F134D216E2D;
	Thu, 12 Dec 2024 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hf1SeDLS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="L3gfY8e4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22BE215F48;
	Thu, 12 Dec 2024 14:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012534; cv=none; b=dkayq5qbyDzC1zXZJfiIZNQl9V3+8AtaJQ3krzg5pV2Qv4U1XJOiMjKU6jp+ymgP3y9BuOXRX6rEe3b2U6m4xuUa2ST6RqtekvfGpzRHsabKtBIo99XZZ0Hiap0pCgILqZIEyYO7+q3w2RB/bKWBFChr/ZZq/G43SdQxp49caW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012534; c=relaxed/simple;
	bh=M9OvK9pJTjjZhdpPeV+QzbIhGVgsOBgNIwossuFS2oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sh/Z+IwQusWoob7KNRvhkDs1QmK1doQEy9ZWDfaIxN5+J3QC+59B9WFqh8UITpXFjcAKEhX/cOTHm5Nd2jXWpfdyJp58+Qdq6WtiY/szY/VhCZ/Qohq4aaZ07aPx04dAJ7sTUyFWxez+9ZoT2eXiOPng4mFE+0HnY9oe2b44ywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=hf1SeDLS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=L3gfY8e4 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1734012532; x=1765548532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=meyObhqkPdWcsr2UzETU8DO1Fi7GmAJr3YpipHAnlhA=;
  b=hf1SeDLSh8u8zuAYJ3OXiLlUurEY9YAfpsRL7ZQZSCBU7Jm5B9KZ7WdN
   dMZWJslbc2ZZAEBAbjgb1M2UA/HWlwchCURdWerLlwl77zRCZhPZ7IHWs
   3pQxEKJePcbqd/CGpid2RIq4Pe682k6P9Soi+UgVgCjnv0qQv7Ws8JBw5
   q5IxsQwao6bG6N1N9o5MG/EBEh1w2w8OLqcPjGE+atpggqCnXqZx9tCU0
   0vfp/qI1x0v7p3PStMfffd9Lm5icfOqInjYHlWRAYE9Tl7OsoWAAQNRlD
   FY38UsPEqb83dzt7xU7BroFf/7F6lOMHsk0L8uAPAuYtJ6E88W98KqBcA
   g==;
X-CSE-ConnectionGUID: gf/F6PC1ScazR38c5iHxQw==
X-CSE-MsgGUID: IBpy8f3oTvOHPC0u68/eBQ==
X-IronPort-AV: E=Sophos;i="6.12,228,1728943200"; 
   d="scan'208";a="40566528"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Dec 2024 15:08:51 +0100
X-CheckPoint: {675AEE73-C-4B00A2D7-FB71B4CE}
X-MAIL-CPID: 1C610659653579568AE90FEC259FAF27_0
X-Control-Analysis: str=0001.0A682F24.675AEE73.0067,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A73AF16B95F;
	Thu, 12 Dec 2024 15:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1734012526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=meyObhqkPdWcsr2UzETU8DO1Fi7GmAJr3YpipHAnlhA=;
	b=L3gfY8e4EqtQX+jgAaLXIIF4157vzuau2KVoh5IXnSUEeLgkqRc/D4Kv2LVJEsuGnfAmEV
	jrxObrdnXuglHlEAZ2m31Q009cJuhn79/sAy4agXaOMBYM7IOoyWds0b+HywxO/gVSS0hX
	xrZwidqKoUMEVPmMP3IfjWDGCnCuEVHwqDwOmVgEffDY6IKEWEDs963x1hJK4unMtyDV34
	AHPTUIBToY9AxxFZbP8Q2cWonhY4oW8/C7xTTn/LBv5PyM2h0ZrprRNpd7G9zHc4FTXnfW
	qMlBJjXnSso3K8xD5nHX0DJMYE+jm6iWV9A9WVuaG7s+CIT7UoMbd0zJhNZArg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux@ew.tq-group.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 3/5] gpio: tqmx86: use cleanup guards for spinlock
Date: Thu, 12 Dec 2024 15:08:07 +0100
Message-ID: <c89e7814ce5705e516116d0b86146d8455aaeddc.1734001247.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1734001247.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

As we're touching this code anyways, go all the way and fully replace
lock/unlock with guard and scoped_guard.

No functional change intended.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: new patch

 drivers/gpio/gpio-tqmx86.c | 84 +++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 38208a7dc1e62..e55ce4503e70b 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -77,12 +77,11 @@ static void tqmx86_gpio_set(struct gpio_chip *chip, unsigned int offset,
 			    int value)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->spinlock);
+
 	__assign_bit(offset, gpio->output, value);
 	tqmx86_gpio_write(gpio, bitmap_get_value8(gpio->output, 0), TQMX86_GPIOD);
-	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
 static int tqmx86_gpio_direction_input(struct gpio_chip *chip,
@@ -141,12 +140,11 @@ static void tqmx86_gpio_irq_mask(struct irq_data *data)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	gpio->irq_type[data->hwirq] &= ~TQMX86_INT_UNMASKED;
-	tqmx86_gpio_irq_config(gpio, data->hwirq);
-	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
+	scoped_guard(raw_spinlock_irqsave, &gpio->spinlock) {
+		gpio->irq_type[data->hwirq] &= ~TQMX86_INT_UNMASKED;
+		tqmx86_gpio_irq_config(gpio, data->hwirq);
+	}
 
 	gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(data));
 }
@@ -155,14 +153,13 @@ static void tqmx86_gpio_irq_unmask(struct irq_data *data)
 {
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 
 	gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(data));
 
-	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->spinlock);
+
 	gpio->irq_type[data->hwirq] |= TQMX86_INT_UNMASKED;
 	tqmx86_gpio_irq_config(gpio, data->hwirq);
-	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 }
 
 static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
@@ -170,7 +167,6 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(
 		irq_data_get_irq_chip_data(data));
 	unsigned int edge_type = type & IRQF_TRIGGER_MASK;
-	unsigned long flags;
 	u8 new_type;
 
 	switch (edge_type) {
@@ -187,11 +183,11 @@ static int tqmx86_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 		return -EINVAL; /* not supported */
 	}
 
-	raw_spin_lock_irqsave(&gpio->spinlock, flags);
+	guard(raw_spinlock_irqsave)(&gpio->spinlock);
+
 	gpio->irq_type[data->hwirq] &= ~TQMX86_INT_TRIG_MASK;
 	gpio->irq_type[data->hwirq] |= new_type;
 	tqmx86_gpio_irq_config(gpio, data->hwirq);
-	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	return 0;
 }
@@ -201,7 +197,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
 	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
-	unsigned long irq_bits, flags;
+	unsigned long irq_bits;
 	int i, hwirq;
 	u8 irq_status;
 
@@ -212,34 +208,38 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 
 	irq_bits = irq_status;
 
-	raw_spin_lock_irqsave(&gpio->spinlock, flags);
-	for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
-		hwirq = i + TQMX86_NGPO;
-
-		/*
-		 * Edge-both triggers are implemented by flipping the edge
-		 * trigger after each interrupt, as the controller only supports
-		 * either rising or falling edge triggers, but not both.
-		 *
-		 * Internally, the TQMx86 GPIO controller has separate status
-		 * registers for rising and falling edge interrupts. GPIIC
-		 * configures which bits from which register are visible in the
-		 * interrupt status register GPIIS and defines what triggers the
-		 * parent IRQ line. Writing to GPIIS always clears both rising
-		 * and falling interrupt flags internally, regardless of the
-		 * currently configured trigger.
-		 *
-		 * In consequence, we can cleanly implement the edge-both
-		 * trigger in software by first clearing the interrupt and then
-		 * setting the new trigger based on the current GPIO input in
-		 * tqmx86_gpio_irq_config() - even if an edge arrives between
-		 * reading the input and setting the trigger, we will have a new
-		 * interrupt pending.
-		 */
-		if ((gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK) == TQMX86_INT_TRIG_BOTH)
-			tqmx86_gpio_irq_config(gpio, hwirq);
+	scoped_guard(raw_spinlock_irqsave, &gpio->spinlock) {
+		for_each_set_bit(i, &irq_bits, TQMX86_NGPI) {
+			hwirq = i + TQMX86_NGPO;
+
+			/*
+			 * Edge-both triggers are implemented by flipping the
+			 * edge trigger after each interrupt, as the controller
+			 * only supports either rising or falling edge triggers,
+			 * but not both.
+			 *
+			 * Internally, the TQMx86 GPIO controller has separate
+			 * status registers for rising and falling edge
+			 * interrupts. GPIIC configures which bits from which
+			 * register are visible in the interrupt status register
+			 * GPIIS and defines what triggers the parent IRQ line.
+			 * Writing to GPIIS always clears both rising and
+			 * falling interrupt flags internally, regardless of the
+			 * currently configured trigger.
+			 *
+			 * In consequence, we can cleanly implement the
+			 * edge-both trigger in software by first clearing the
+			 * interrupt and then setting the new trigger based on
+			 * the current GPIO input in tqmx86_gpio_irq_config() -
+			 * even if an edge arrives between reading the input and
+			 * setting the trigger, we will have a new interrupt
+			 * pending.
+			 */
+			if ((gpio->irq_type[hwirq] & TQMX86_INT_TRIG_MASK) ==
+			    TQMX86_INT_TRIG_BOTH)
+				tqmx86_gpio_irq_config(gpio, hwirq);
+		}
 	}
-	raw_spin_unlock_irqrestore(&gpio->spinlock, flags);
 
 	for_each_set_bit(i, &irq_bits, TQMX86_NGPI)
 		generic_handle_domain_irq(gpio->chip.irq.domain,
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


